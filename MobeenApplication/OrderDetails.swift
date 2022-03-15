//
//  ViewController.swift
//  Mobeen1
//
//  Created by Raghdah  on 27/02/2022.
//

import UIKit
import Speech

class OrderDetails: UITableViewController {
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet var requestTableView: UITableView!
//    @IBAction func buttonOneIsTapped() {
//        let VC = requestTableViewController()
//        navigationController?.pushViewController(VC, animated: true)
//
//    }

//    @IBAction func buttonTwoIsTapped() {
//        let VC = requestTableViewController()
//        navigationController?.pushViewController(VC, animated: true)
//    }
    
    
    @IBOutlet weak var lblTextDetails: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblServiceType: UILabel!
    
    @IBOutlet weak var outletTextTranslation: UIButton!
    
    @IBOutlet weak var outletTextConversion: UIButton!
    
    @IBOutlet weak var lblAdditionalNotes: UILabel!
    
    @IBOutlet weak var outletRequest: UIButton!
    
    @IBAction func btnRequest(_ sender: Any) {
        showAlertView()
    }
    func showAlertView(){
        let alert = UIAlertController (title: "Your Request was Sent Successfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            //print("Done")
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    static var selectedDate = ""
   
    @IBAction func textTranslationButton(_ sender: UIButton) {
      //  sender.setImage(UIImage(systemName:"circle.inset.filled"), for: .normal)
        textTranslation.tintColor = UIColor.systemBlue
        textConversion.tintColor = UIColor.black

        
        textTranslation.isSelected = !sender.isSelected
        textConversion.isSelected = false

       // textConversion.isEnabled = false
       // textTranslation.isEnabled = true

    }

    @IBAction func textConversionButton(_ sender: UIButton) {
      //  sender.setImage(UIImage(systemName:"circle.inset.filled"), for: .normal)
      //  sender.tintColor = UIColor.systemBlue
        
        textConversion.tintColor = UIColor.systemBlue
        textTranslation.tintColor = UIColor.black
        
        
        textConversion.isSelected = !sender.isSelected
        textTranslation.isSelected = false

       // textConversion.isEnabled = true


    }
    
    @IBOutlet weak var textTranslation: UIButton!
    @IBOutlet weak var textConversion: UIButton!
    
    
    
    
    @IBOutlet weak var additionalNotesUIView: UIView!
    @IBOutlet weak var additionalNotesTextView: UITextView!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textDetailsView: UIView!
    
    
    //SPEECH TO TEXT:
    //OUTLETS
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var lblText: UILabel!
  
    
    @IBOutlet weak var dpButton: UIButton!
    @IBOutlet weak var datepickertxt: UITextField!
 
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var additionalNotesLabel: UILabel!
    
    @IBAction func RequestButton(_ sender: Any) {
    }
    
    
    var datePicker2 :UIDatePicker!
   
    
    //VARIABLES
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask : SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    let speechRecognizerAddNotes = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    
    @IBOutlet weak var btnStartAddNotesRec: UIButton!
    @IBOutlet weak var lblStartAddNotesRec: UILabel!
    //ACTION METHODS
    @IBAction func btnStartSpeechToText(_ sender: UIButton) {
        
          if audioEngine.isRunning {
              self.audioEngine.stop()
              self.recognitionRequest?.endAudio()
              self.btnStart.isEnabled = false
              self.btnStart.setTitle("Start Recording", for: .normal)
          } else {
              self.startRecording()
              self.btnStart.setTitle("Stop Recording", for: .normal)
          }
      }
    
    //action methods for the additional notes recording button
    @IBAction func btnStartAdditionalNotes(_ sender: UIButton){
        if audioEngine.isRunning {
            self.audioEngine.stop()
            self.recognitionRequest?.endAudio()
            self.btnStartAddNotesRec.isEnabled = false
            self.btnStartAddNotesRec.setTitle("Start Recording", for: .normal)
        } else {
            self.startRecordingAddNotes()
            self.btnStartAddNotesRec.setTitle("Stop Recording", for: .normal)
        }
        
    }
    
    
    //CUSTOM METHODS/
    func setupSpeech() {

        self.btnStart.isEnabled = false
        self.speechRecognizer?.delegate = self

        SFSpeechRecognizer.requestAuthorization { (authStatus) in

            var isButtonEnabled = false

            switch authStatus {
            case .authorized:
                isButtonEnabled = true

            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")

            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")

            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            @unknown default:
                print("Fatal Error: Fix Option by UIKit")
            }

            OperationQueue.main.addOperation() {
                self.btnStart.isEnabled = isButtonEnabled
            }
        }
    }
    
    //custom methods for the additional notes recording button
    func setupSpeechAddNotes() {

        self.btnStartAddNotesRec.isEnabled = false
        self.speechRecognizerAddNotes?.delegate = self

        SFSpeechRecognizer.requestAuthorization { (authStatus) in

            var isButtonEnabled = false

            switch authStatus {
            case .authorized:
                isButtonEnabled = true

            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")

            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")

            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            @unknown default:
                print("Fatal Error: Fix Option by UIKit")
            }

            OperationQueue.main.addOperation() {
                self.btnStartAddNotesRec.isEnabled = isButtonEnabled
            }
        }
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        recognitionTask?.finish()
    }
    
    
    func startRecording() {

           // Clear all previous session data and cancel task
           if recognitionTask != nil {
               recognitionTask?.cancel()
               recognitionTask = nil
           }

           // Create instance of audio session to record voice
           let audioSession = AVAudioSession.sharedInstance()
           do {
               try audioSession.setCategory(AVAudioSession.Category.record, mode: AVAudioSession.Mode.measurement, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
               try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
           } catch {
               print("audioSession properties weren't set because of an error.")
           }

           self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()

           let inputNode = audioEngine.inputNode

           guard let recognitionRequest = recognitionRequest else {
               fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
           }

           recognitionRequest.shouldReportPartialResults = true

           self.recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in

               var isFinal = false

               if result != nil {

                   self.lblText.text = result?.bestTranscription.formattedString
                   isFinal = (result?.isFinal)!
               }

               if error != nil || isFinal {

                   self.audioEngine.stop()
                   
                   self.recognitionTask?.finish()
                   
                   inputNode.removeTap(onBus: 0)

                   self.recognitionRequest = nil
                   self.recognitionTask = nil

                   self.btnStart.isEnabled = true
               }
           })

           let recordingFormat = inputNode.outputFormat(forBus: 0)
           inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
               self.recognitionRequest?.append(buffer)
           }

           self.audioEngine.prepare()

           do {
               try self.audioEngine.start()
           } catch {
               print("audioEngine couldn't start because of an error.")
           }

           self.lblText.text = "Say something, I'm listening!"
       }

    func startRecordingAddNotes() {

           // Clear all previous session data and cancel task
           if recognitionTask != nil {
               recognitionTask?.cancel()
               recognitionTask = nil
           }

           // Create instance of audio session to record voice
           let audioSession = AVAudioSession.sharedInstance()
           do {
               try audioSession.setCategory(AVAudioSession.Category.record, mode: AVAudioSession.Mode.measurement, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
               try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
           } catch {
               print("audioSession properties weren't set because of an error.")
           }

           self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()

           let inputNode = audioEngine.inputNode

           guard let recognitionRequest = recognitionRequest else {
               fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
           }

           recognitionRequest.shouldReportPartialResults = true

           self.recognitionTask = speechRecognizerAddNotes?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in

               var isFinal = false

               if result != nil {

                   self.lblStartAddNotesRec.text = result?.bestTranscription.formattedString
                   isFinal = (result?.isFinal)!
               }

               if error != nil || isFinal {

                   self.audioEngine.stop()
                   
                   self.recognitionTask?.finish()
                   
                   inputNode.removeTap(onBus: 0)

                   self.recognitionRequest = nil
                   self.recognitionTask = nil

                   self.btnStartAddNotesRec.isEnabled = true
               }
           })

           let recordingFormat = inputNode.outputFormat(forBus: 0)
           inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
               self.recognitionRequest?.append(buffer)
           }

           self.audioEngine.prepare()

           do {
               try self.audioEngine.start()
           } catch {
               print("audioEngine couldn't start because of an error.")
           }

           self.lblStartAddNotesRec.text = "Say something, I'm listening!"
       }
        
//    @IBAction func voiceOverButtonTapped(_ sender: UIButton) {
//    }
    
//     let datePicker : UIDatePicker = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MMMM yyyy"
//        let picker = UIDatePicker ()
//        picker.datePickerMode = .date
//        picker.preferredDatePickerStyle = .inline
//        picker.calendar = .autoupdatingCurrent
//         ViewController.selectedDate = dateFormatter.string(from: picker.date)
//
//        return picker
//    }()
//
   
    func buttonTapped(_ sender: UIButton){
        
    }

    @IBAction func DateTextFeildPressed(_ sender: Any) {
       //textField.inputView = datePicker
        textField.text = OrderDetails.selectedDate
    }
    
    @objc func ValueChanged ()
    {
        textField.text = OrderDetails.selectedDate
    }
    
//    @objc func datePickerDone() {
//        textField.resignFirstResponder()
//        print("the date is \(datePicker.date)")
//    }
//
//    @objc func dateChanged() {
//        textField.text = "\(datePicker.date)"
//        print("the date is ---- \(datePicker.date)")
//    }

    
    @objc func datePickerChanged(picker: UIDatePicker) {

        textField.text = "\(picker.date)"
        
        print("the date is ### \(picker.date)")
    }
    
    @objc func datePickerDone() {

             textField.resignFirstResponder()

        
      print("the date is ### \(datePicker2.date)")
    }

    //@IBOutlet weak var voiceIcon : UIImage!
    //voiceIcon = ("waveform.circle")
    override func viewDidLoad() {
        super.viewDidLoad()
        //LOCALIZATION
        
        lblTextDetails.text = NSLocalizedString("Text Details", comment: "")
        lblDate.text = NSLocalizedString("Date", comment: "")
        lblServiceType.text = NSLocalizedString("Service Type", comment: "")
        lblAdditionalNotes.text = NSLocalizedString("Additional Notes", comment: "")
        textTranslation.setTitle( NSLocalizedString("Text Translation", comment: ""), for: .normal)
        textConversion.setTitle( NSLocalizedString("Text Conversion", comment: ""), for: .normal)
        outletRequest.setTitle(NSLocalizedString("Send Request", comment: ""), for: .normal)
        
        //textConversion.subtitleLabel?.setValue(NSLocalizedString("Convert an informal text into a formal text", comment: ""), forKey: "Convert an informal text into a formal text")
        
        
        
        
        
        
       // textField.inputView = datePicker
      //  textField.addTarget(self, action: #selector(self.ValueChanged), for: .allEvents)
        
        
        datePicker2 = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 100))
        
        datePicker2.preferredDatePickerStyle = .inline
       // datePicker2.addTarget(self, action: #selector(self.dateChanged), for: .valueChanged)
        
        datePicker2.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)

        
        
        textField.inputView = datePicker2
            let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
             let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
             toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        textField.inputAccessoryView = toolBar

        

        //DatePicker.preferredDatePickerStyle = .inline
        //Do any additional setup after loading the view
        //dpButton.layer. = datePicker
        //textField.inputView = datePicker
        //textField.text = ViewController.selectedDate
        //textField.text = datePicker.date.formatted()

        textDetailsView.layer.borderWidth = 0.5
        textDetailsView.layer.borderColor = UIColor.lightGray.cgColor
        textDetailsView.layer.cornerRadius = 10
        textDetailsView.layer.borderWidth = 0.2
        additionalNotesUIView.layer.borderWidth = 0.5
        additionalNotesUIView.layer.borderColor = UIColor.lightGray.cgColor
        additionalNotesUIView.layer.cornerRadius = 10
        
        
        //VOICE TO TEXT:
        
        //Life-Cycle Methods
        self.setupSpeech()
        
        //voice to text for additional notes
        self.setupSpeechAddNotes()
 
        
        textTranslation.setImage(UIImage(systemName: "circle.inset.filled"), for: .selected)
        textConversion.setImage(UIImage(systemName: "circle.inset.filled"), for: .selected)
        textTranslation.setImage(UIImage(systemName: "circle"), for: .normal)
        textConversion.setImage(UIImage(systemName: "circle"), for: .normal)
        
        //Localization
    
    
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}

extension OrderDetails: SFSpeechRecognizerDelegate {
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        
        
        if available {
            self.btnStart.isEnabled = true
        }
        else {
            self.btnStart.isEnabled = false
        }
    }
    func speechRecognizerAddNotes(_ speechRecognizerAddNotes: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            self.btnStartAddNotesRec.isEnabled = true
        }
        else {
            self.btnStartAddNotesRec.isEnabled = false
        }
    }
}
