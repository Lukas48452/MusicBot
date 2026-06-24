plugins {
    java
    id("com.gradleup.shadow") version "8.3.6"
}

group = "com.jagrosh"
version = "Snapshot"

java {
    sourceCompatibility = JavaVersion.toVersion("26")
    targetCompatibility = JavaVersion.toVersion("26")
}

repositories {
    mavenCentral()
    maven("https://m2.dv8tion.net/releases")
    maven("https://m2.chew.pro/releases")
    maven("https://jitpack.io")
    maven("https://m2.duncte123.dev/releases")
    maven("https://maven.lavalink.dev/releases")
}

dependencies {
    implementation("net.dv8tion:JDA:4.4.1_353")
    implementation("pw.chew:jda-chewtils:1.24.1")
    implementation("dev.arbjerg:lavaplayer:2.2.1")
    implementation("dev.lavalink.youtube:common:1.5.2")
    implementation("com.github.jagrosh:JLyrics:master-SNAPSHOT")
    implementation("com.dunctebot:sourcemanagers:1.9.0")
    implementation("ch.qos.logback:logback-classic:1.2.13")
    implementation("com.typesafe:config:1.3.2")
    implementation("org.jsoup:jsoup:1.15.3")
    testImplementation("junit:junit:4.13.1")
    testImplementation("org.hamcrest:hamcrest-core:1.3")
}

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
}

tasks.withType<Test> {
    useJUnit()
}

tasks {
    shadowJar {
        archiveClassifier.set("All")
        mergeServiceFiles()
        manifest {
            attributes(
                "Main-Class" to "com.jagrosh.jmusicbot.JMusicBot",
                "Specification-Title" to project.name,
                "Specification-Version" to project.version,
                "Implementation-Title" to project.name,
                "Implementation-Version" to project.version,
                "Implementation-Vendor-Id" to project.group
            )
        }
    }

    build {
        dependsOn(shadowJar)
    }
}
