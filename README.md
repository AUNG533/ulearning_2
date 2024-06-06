# ulearning_2

A new Flutter project.

## Getting Started

## Firebase Connect

#build.gradle
allprojects {
    repositories {
    google()
    mavenCentral()
    }

    dependencies {
        classpath 'com.google.gms.google-services4.4.2'
    }
}

#app/build.gradle
plugins {
    id 'com.google.gms.google-services'
}

dependencies {
    // Import the Firebase BoM
    implementation platform('com.google.firebase:firebase-bom:33.1.0')
}