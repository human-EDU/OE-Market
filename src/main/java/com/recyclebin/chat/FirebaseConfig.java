package com.recyclebin.chat;

import java.io.FileInputStream;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Configuration
public class FirebaseConfig {
	@Value("/team_oe/src/main/resources/com/recyclebin/firebase/oechat-c5b97-firebase-adminsdk-x74mj-aa4504d51e.json")
	private Resource resource;
	
	@PostConstruct
	public void initFirebase() {
		try {
			FileInputStream serviceAccount =
			  new FileInputStream("path/to/serviceAccountKey.json");
			
			FirebaseOptions options = new FirebaseOptions.Builder()
			  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
			  .build();
			
			FirebaseApp.initializeApp(options);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
