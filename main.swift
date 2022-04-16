import Foundation
import AVFoundation














open class ScreenRecorder: NSObject, AVCaptureFileOutputRecordingDelegate {
    

    let destinationUrl: URL
    let session: AVCaptureSession
    let movieFileOutput: AVCaptureMovieFileOutput

    public func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL,
                           from connections: [AVCaptureConnection], error: Error?) {

        print("fileOutput")

    }

    open var destination: URL {
        get {
            return self.destinationUrl
        }
    }

    public init(destination: URL) {
        
        print("init")

        destinationUrl = destination

        session = AVCaptureSession()
        session.sessionPreset = AVCaptureSession.Preset.high

//        let displayId: CGDirectDisplayID = CGDirectDisplayID(CGMainDisplayID())

        
        let input = AVCaptureScreenInput.init()

        
//        let input: AVCaptureScreenInput = AVCaptureScreenInput(displayID: displayId)


        if session.canAddInput(input) {
            session.addInput(input)
        }

        movieFileOutput = AVCaptureMovieFileOutput()

        if session.canAddOutput(movieFileOutput) {
            session.addOutput(movieFileOutput)
        }

    }

    open func start() {
        print("start")
        session.startRunning()
        movieFileOutput.startRecording(to: self.destinationUrl, recordingDelegate: self)
    }

    open func stop() {
        print("stop")
        movieFileOutput.stopRecording()
    }

    open func capture(
        _ captureOutput: AVCaptureFileOutput!,
        didFinishRecordingToOutputFileAt outputFileURL: URL!,
        fromConnections connections: [Any]!,
        error: Error!) {

            print("capture")
            session.stopRunning()
    }
}













print("starting")


let fileManager = FileManager.default
   
if fileManager.fileExists(atPath: "test.mov") {
    try fileManager.removeItem(atPath: "test.mov")
    print("deleted mov file")
}


let fileUrl = URL(fileURLWithPath: "test.mov")
let sr = ScreenRecorder(destination: fileUrl)





sr.start()

sleep(2)

sr.stop()

















//class Arf : NSObject, AVCaptureFileOutputRecordingDelegate {
//
//    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
//
//
//    }
//
//
//    public init(destination: URL) {
//
//    }
//
//    open func start() {
//    }
//
//    open func stop() {
//    }
//
//    open func capture(
//        _ captureOutput: AVCaptureFileOutput!,
//        didFinishRecordingToOutputFileAt outputFileURL: URL!,
//        fromConnections connections: [Any]!,
//        error: Error!) {
//
//        session.stopRunning()
//    }
//
//}




//let input = AVCaptureScreenInput.init()
//
//let origin = CGPoint(x:100, y:100)
//let size = CGSize(width:100, height:100)
//let cropRect = CGRect(origin:origin, size:size)
//
//print("cropRect", cropRect)
//
//input.cropRect = cropRect
//print("input", input)
//
//
//
//let session = AVCaptureSession()
//session.sessionPreset = AVCaptureSession.Preset.high
//
//
//if session.canAddInput(input) {
//    session.addInput(input)
//}
//
//let movieFileOutput = AVCaptureMovieFileOutput()
//
//if session.canAddOutput(movieFileOutput) {
//    session.addOutput(movieFileOutput)
//}
//
//let fileUrl = URL(fileURLWithPath: "file:///Users/frenkield/projets/ios_video_source/asdf/test.mov")
//let a = Arf(destination: fileUrl)
//
//session.startRunning()
//movieFileOutput.startRecording(to: fileUrl, recordingDelegate: a)
//
//sleep(5)
//
//movieFileOutput.stopRecording()
//
//
//






//public init(origin: CGPoint, size: CGSize)



//b.width = 100
//b.height = 100
//b.origin = {10, 10}

