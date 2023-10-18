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
                let ossParams = OSSParameters(
                    token:credentials?["securityToken"] ?? "",
                    bucket: bucket ?? "",
                    imgPath: imgPath ?? "",
                    endpoint:endpoint ?? "",
                    accessKey:  credentials?["accessKeyId"] ?? "",
                    secretKey: credentials?["accessKeySecret"] ?? "",
                    expiration: credentials?["expiration"] ?? "",
                    destinationPath: destinationPath ?? ""
                )
                self.uploadImageWithOssParams(params: ossParams) { imgUrl in
                    result(["isSuccess": true])
                } uploadFailed: {
                    result(["isSuccess": false])
                }

            }

            if call.method == "go2takeFacePicture" {
                let takePhotoView = TakePictureView()
                takePhotoView.modalPresentationStyle = .fullScreen
                takePhotoView.didTakePhotoAction = { img in
                    let imgPath = self.saveImage(image: img)
                    result(["imgPath":imgPath])
                }
                self.currentController.present(takePhotoView, animated: true)
            }

            if call.method == "getDeviceInfo" {
                var deviceAllInfo : [String : Any] = [:]
                deviceAllInfo["isPhone"]  = !(UIDevice.current.model == "iPad")
                deviceAllInfo["isTablet"] = UIDevice.current.model == "iPad"
                deviceAllInfo["udid"]  = UIDevice.uuid
                deviceAllInfo["model"] = UIDevice.modelName
                deviceAllInfo["batteryStatus"] = UIDevice.batteryStatus
                deviceAllInfo["batteryLevel"] = UIDevice.deviceBatteryLevel
                deviceAllInfo["ipAddress"] = UIDevice.ipAdress
                deviceAllInfo["bootTime"]  = UIDevice.bootTime
                deviceAllInfo["time"]      = UIDevice.uptime
                deviceAllInfo["networkType"] = UIDevice.networkType
                deviceAllInfo["is4G"]      = UIDevice.cellularType == "NETWORK_4G"
                deviceAllInfo["is5G"]      = UIDevice.cellularType == "NETWORK_5G"
                deviceAllInfo["wifiConnected"] = UIDevice.networkType == "NETWORK_WIFI"
                deviceAllInfo["sdkVersionName"] = UIDevice.current.systemVersion
        
                let totalDistSize = UIDevice.totalDiskSpaceInGB.replacingOccurrences(of: " ", with: "")
                deviceAllInfo["externalTotalSize"] = totalDistSize
                deviceAllInfo["internalTotalSize"] = totalDistSize
                
                let availableDiskSize = UIDevice.freeDiskSpaceInGB.replacingOccurrences(of: " ", with: "")
                deviceAllInfo["internalAvailableSize"] = availableDiskSize
                deviceAllInfo["externalAvailableSize"] = availableDiskSize
                
                deviceAllInfo["availableMemory"] = UIDevice.freeDiskSpaceInBytes
                
                let usedDiskPercentage = Double(UIDevice.usedDiskSpaceInBytes) / Double(UIDevice.totalDiskSpaceInBytes) * 100
                deviceAllInfo["percentValue"] = Int(usedDiskPercentage)
                
                deviceAllInfo["language"] = UIDevice.language
                deviceAllInfo["brand"]    = "Apple"
                deviceAllInfo["mobileData"] = UIDevice.networkType != "NETWORK_WIFI" && UIDevice.networkType != "notReachable"
                deviceAllInfo["languageList"] = UserDefaults.standard.object(forKey: "AppleLanguages")
                deviceAllInfo["screenWidth"]  = "\(UIScreen.main.bounds.width)"
                deviceAllInfo["screenHeight"] = "\(UIScreen.main.bounds.height)"
                deviceAllInfo["brightness"] = String(format: "%.0f", UIScreen.main.brightness * 100)
                deviceAllInfo["timezone"] = TimeZone.current.identifier
                result(deviceAllInfo)
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
    
    func saveImage(image: UIImage?) -> String? {
        if let data = image?.jpegData(compressionQuality: 1) {
            let imgPath = NSTemporaryDirectory() + "temp.jpg"
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: imgPath) {
                // 删除文件
                guard (try? fileManager.removeItem(atPath: imgPath)) != nil else {
                    return nil
                }
            }
            
            // 写入文件
            let isSuccess = FileManager.default.createFile(atPath: imgPath, contents: data)
            
            if(isSuccess) {
                return imgPath
            }
        }
        return nil
    }
}



