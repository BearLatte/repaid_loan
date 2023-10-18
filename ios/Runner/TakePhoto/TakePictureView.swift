//
//  TakePictureView.swift
//  Runner
//
//  Created by Tim Guo on 2023/10/17.
//

import UIKit
import AVFoundation

class TakePictureView: UIViewController {
    
    var didTakePhotoAction: ((_ selectedImage: UIImage?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0/255.0, green: 173/255.0, blue: 141/255.0, alpha: 1.000)
        view.addSubview(titleLabel)
        view.addSubview(backBtn)
        view.addSubview(contentView)
        contentView.addSubview(indicatorLabel)
        view.addSubview(previewBgView)
        view.addSubview(preview)
        
        view.addSubview(takeBtn)
        view.addSubview(bottomBar)
        bottomBar.addSubview(retryBtn)
        bottomBar.addSubview(submitBtn)
        setupCamera()
    }
    
    override func viewDidLayoutSubviews() {
        titleLabel.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: 44)
        backBtn.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 44, height: 44)
        contentView.frame = CGRect(x: 0, y: CGRectGetMaxY(titleLabel.frame) + 18, width: view.bounds.width, height: view.bounds.height - CGRectGetMaxY(titleLabel.frame) - 18)
        let bezierPath = UIBezierPath.init(roundedRect: contentView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30))
        let shapLayer = CAShapeLayer()
        shapLayer.path = bezierPath.cgPath
        contentView.layer.mask = shapLayer
        indicatorLabel.frame = CGRect(x: 32, y: 24, width: CGRectGetWidth(contentView.frame) - 2 * 32, height: 75)
        previewBgView.frame = CGRect(x: 0, y: 0, width: 318, height: 318)
        previewBgView.center = view.center
        preview.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        preview.center = view.center
        previewLayer.backgroundColor = UIColor.white.cgColor
        preview.layer.addSublayer(previewLayer);
        previewLayer.frame = preview.bounds
        
        takeBtn.frame = CGRect(x: 30, y: UIScreen.main.bounds.height - 35 - 54, width: UIScreen.main.bounds.width - 30 * 2, height: 54)
        
        bottomBar.frame = CGRect(x: 20, y: UIScreen.main.bounds.height - 35 - 54, width: UIScreen.main.bounds.width - 2 * 20, height: 54)
        
        retryBtn.frame = CGRect(x: 0, y: 0, width: (CGRectGetWidth(bottomBar.frame) - 7) * 0.5, height: 54)
        submitBtn.frame = CGRect(x: CGRectGetMaxX(retryBtn.frame) + 7, y: 0, width: retryBtn.bounds.width, height: 54)
    }
    
    
    private lazy var titleLabel = {
        let lb = UILabel()
        lb.text = "Detail"
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var backBtn = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back_btn"), for: .normal)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return btn
    }()
    
    private lazy var contentView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var indicatorLabel = {
        let lb = UILabel()
        lb.text = "Please keep all faces in the viewfinder and must upload clear photos."
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 18)
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.000)
        return lb
    }()
    
    private lazy var takeBtn = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Photograph", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.backgroundColor = UIColor(red: 0/255.0, green: 173/255.0, blue: 141/255.0, alpha: 1.000)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
        return btn
    }()
    
    private lazy var previewBgView = UIImageView(image: UIImage(named: "big_circle"))
    private lazy var preview = {
        let v = UIView()
        v.layer.cornerRadius = 100
        v.layer.masksToBounds = true
        return v
    }()
    
    private lazy var bottomBar = {
        let v = UIView()
        v.isHidden = true
        return v
    }()
    private lazy var retryBtn = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Retry", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red: 6/255.0, green: 195/255.0, blue: 113/255.0, alpha: 1.000)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.addTarget(self, action: #selector(retryAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var submitBtn = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0/255.0, green: 173/255.0, blue: 141/255.0, alpha: 1.000)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        return btn
    }()
    
    private var session : AVCaptureSession?
    private let output  : AVCapturePhotoOutput = AVCapturePhotoOutput()
    private let previewLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer()
    private var currentTakedImage: UIImage?
}

extension TakePictureView {
    func setupCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                DispatchQueue.global().async {
                    session.startRunning()
                }
                self.session = session
            } catch {
                ErrorAlertView.showAlert(with: "Take photo error") {
                    self.dismiss(animated: true)
                } confirmAction: {
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    
    @objc func takePicture() {
        indicatorLabel.isHidden = true
        takeBtn.isHidden = true
        bottomBar.isHidden = false
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
    
    @objc func retryAction() {
        indicatorLabel.isHidden = false
        takeBtn.isHidden = false
        bottomBar.isHidden = true
        DispatchQueue.global().async {
            self.session?.startRunning()
        }
    }
    
    @objc func submitAction() {
        didTakePhotoAction?(currentTakedImage)
        back()
    }
    
    @objc func back() {
        self.dismiss(animated: true)
    }
}


extension TakePictureView : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation(),
              let image = UIImage(data: data) else {
            ErrorAlertView.showAlert(with: error?.localizedDescription ?? "", cancelAction: back) {
                self.session?.startRunning()
            }
            
            return
        }
        session?.stopRunning()
        currentTakedImage = image
    }
}
