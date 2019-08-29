<h1 align="center">Facial Recognition App</h1>
<p align="left"><strong>Description</strong>
<br>This IOS App analyzes a given picture which the user provides from his/her camra roll. The program can detect the number of faces in the selected image. It is also indicated whether or not these faces are completely exposed and not cut off. Facial features and structures such as eyes and smiles are also detected and analyzed. The complete report for each face detected indicates whether a person is smiling and (or) has both eyes open. The program allows you to switch between photos from your camra roll instantly and effortlessly. </p>

<p align="left"><strong>Implementation Details</strong>
<br> The program contains three main Objects (from the object library): A image view controller, text view controller, and a button. When the button is pressed, the camra roll is accessed by the program. Once an image is selected the image immediatly append to the image view controller. The text view controller loads the information and final report. The built-in framework "Core Image" is was also used for image processing and analysis. Personally implemented methods and the swift class "CIDetector" was additionaly used for the analysis. </p>

<h2>Key Learnings</h2>

- Swift  
- Core Image Framework
- IOS Development
- Xcode Platform
- ImagePickerController Method
- CIDetector Class

<h2>Project status</h2>
<br> The program has a couple bugs. Images with bad lighting are often hard to dectect and the final facial feature report may have some aspects wrong. Also if you iphone is not updated the images taken through the camra app will be unrecognizable. It is recomended to download a third party camra app from the app store and save pictures to your camra roll. However the program works perfectly for pictures saved from the internet. </p>
<h2>Future Addition(s)</h2>
<br> Currently working on adding more aspects to the final report which contains more information about various other facial features. Also the image selected will be altered to contain a square on each face to make the report easier to understand.</p>
<h2>Device Installation</h2>
This program can be ran on both your IOS device and the IOS simulator on xcode. First download the project and plug in device to your computer. When running the program make sure to change to you personal iphone. It is also important that the computer being used is trusted by your device.</p>


