import java.io.File
import org.gradle.api.file.Directory

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val flutterBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.set(flutterBuildDir)

subprojects {
    // Keep Flutter output under <project>/build so flutter tool can find APK.
    // Shorten only cloud_firestore path to avoid MAX_PATH issues on Windows.
    if (name == "cloud_firestore") {
        project.layout.buildDirectory.set(
            File(System.getProperty("java.io.tmpdir"), "map_app_cf_build"),
        )
    } else {
        project.layout.buildDirectory.set(flutterBuildDir.dir(name))
    }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
    delete(File(System.getProperty("java.io.tmpdir"), "map_app_cf_build"))
}
