//
//  ViewController.swift
//  FacialRecognition
//
//  Created by JEET VACHHANI on 8/12/19.
//  Copyright © 2019 JV. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


	@IBOutlet weak var userImage: UIImageView! // image view
	@IBOutlet weak var userData: UITextView! // text view
	@IBAction func newUserImage(_ sender: Any) // new image button
	{
		// pick an image from user's photo library / display the image

		let chosenImage = UIImagePickerController() // let the chosen image be the one that the user picks from camra roll

		chosenImage.delegate = self
		chosenImage.sourceType = UIImagePickerControllerSourceType.photoLibrary // the image will be picked by the user from the iphone library

		// displaying the image inside the image view controller

		self.present(chosenImage, animated: true, completion: nil) // nothing happens after display


	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

		if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
		{

			userImage.image = image; // makes the image chosen equal to the image which is inside the view



		}

		analyzeUserImage() // calls analyzeuserimage method once the photo is selected by the user
		self.dismiss(animated: true, completion: nil)
	}

	func analyzeUserImage()// algorithm which measures the face of the user to determine the mood
	{

		// make variable which holds the image currently in the view
		let newImage = CIImage(image: userImage.image!)!

		let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh] // make sure best quality image



		let detect = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)

		let face = detect?.features(in: newImage, options: [CIDetectorSmile: true, CIDetectorEyeBlink: true]) // the type of detections which are imported

		var faceNumber:Int
		faceNumber = 1

		var informationLoop = ""
		var inLoop = false


		if !face!.isEmpty
		{
			for eachFace in face as! [CIFaceFeature] // will continue looping as long as a new face is detected
			{
				inLoop = true

				let mouthPresent = "\nFull Face Detectable: \(eachFace.hasMouthPosition && eachFace.hasLeftEyePosition && eachFace.hasRightEyePosition)"


				var numberPerson = ""


				if faceNumber == 1 // if else to only add a space in the beginning if its not the first entry
				{
					numberPerson = "Person:  \(faceNumber)"

				}
				else
				{
					numberPerson = "\nPerson:  \(faceNumber)"

				}

			


				let isSmiling = "\nSmiling: \(eachFace.hasSmile)" // variable which calls method hasSmile to check if user is smiling and the answer is in the variable

				var eyesOpen = "\nBoth Eyes Open: true\n" // variable which calls the method


				if eachFace.rightEyeClosed || eachFace.leftEyeClosed // variable which calls the methods left / right eyes closed to see if both eyes are open
				{
					eyesOpen = "\nBoth Eyes Open: :false\n"

				}




				informationLoop += "\(numberPerson)\(mouthPresent)\(isSmiling)\(eyesOpen)" // final report for each face which is detected

				faceNumber += 1


			}


		}
		else
		{
			userData.text = "            NO FACE DETECTED" // if no clear face is detected then this message will be printed

		}

		if inLoop
		{

			userData.text = informationLoop
		
		}



	}




	override func viewDidLoad() {
		super.viewDidLoad()


		userData.layer.cornerRadius = 6 // the corners of the text box are rounded
		
		analyzeUserImage()

		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

