import UIKit
import Flutter
import AliyunOSSiOS

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        currentController = window.rootViewController as? FlutterViewController
        methodChanel = FlutterMethodChannel(name: "repaidLoan.app.channel", binaryMessenger: currentController as! FlutterBinaryMessenger)
        methodChanel.setMethodCallHandler { call, result in
            if call.method == "uploadImage" {
                let params = call.arguments as? [String : Any]
                let imgPath = params?["image"] as? String
                let endpoint = params?["endpoint"] as? String
                let bucket = params?["bucket"] as? String
                let destinationPath = params?["destinationPath"] as? String
                let credentials = params?["credentials"] as? [String : String]
                let ossParsms = OSSParameters(
                    token:credentials?["securityToken"] ?? "",
                    bucket: bucket ?? "",
                    imgPath: imgPath ?? "",
                    endpoint:endpoint ?? "",
                    accessKey:  credentials?["accessKeyId"] ?? "",
                    secretKey: credentials?["accessKeySecret"] ?? "",
                    expiration: credentials?["expiration"] ?? "",
                    destinationPath: destinationPath ?? ""
                )
                self.uploadImageWithOssParams(params: ossParsms) { imgUrl in
                    result(["isSuccess": true])
                } uploadFailed: {
                    result(["isSuccess": false])
                }

            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private var currentController : FlutterViewController!
    private var methodChanel : FlutterMethodChannel!
}

extension AppDelegate {
    func uploadImageWithOssParams(params: OSSParameters, uploadSuccess: @escaping (_ imgUrl: String) -> Void, uploadFailed: @escaping () -> Void) {
        let credential = OSSFederationCredentialProvider {
            let token = OSSFederationToken()
            token.tAccessKey = params.accessKey
            token.tSecretKey = params.secretKey
            token.tToken     = params.token
            token.expirationTimeInGMTFormat = params.expiration
            return token
        }
        
        let client = OSSClient(endpoint: params.endpoint, credentialProvider: credential)
        let put = OSSPutObjectRequest()
        put.bucketName = params.bucket
        put.objectKey  = params.destinationPath
        
        let image = UIImage(contentsOfFile: params.imgPath);
        let imgData = image?.compressImage(maxLength: 1024 * 200)
        put.uploadingData = imgData ?? Data()
        let putTask = client.putObject(put)
        
        putTask.continue({ (task) -> Any? in
            if task.error != nil {
                DispatchQueue.main.async {
                    uploadFailed()
                }
            }
            uploadSuccess(params.destinationPath)
            return nil
        }).waitUntilFinished()
    }
}



