# instragram_flutter

# Uses firebase for database. 
 1. firebase packages
    - firebase_core
    - cloud_firestore
    - firebase_auth 
    - firebase_storage
 2. Save the google-services.json from firebase storage
 3. Add add the code below on the project/build.gradle on the dependencies
    dependencies {
        classpath "com.google.gms:google-services:4.4.0"

    }
 4. Add the following code on bundle.gradle project/app
dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.6.0')
}

5. Install nodejs
6. run firebase login
7. dart pub global activate flutterfire_cli
8. flutterfire configure
9. upgrade gradle version.