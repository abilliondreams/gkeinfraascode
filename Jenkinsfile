pipeline {
    agent any

	environment {
					GOOGLE_APPLICATION_CREDENTIALS = 'build.json';
                    GOOGLE_PROJECT_ID = 'gke-project-id'; 
	                GOOGLE_SERVICE_ACCOUNT_KEY = credentials('gce-build-account');
	                
                }
				
    stages {
        stage('Init') {
			
                steps {
                    
                   sh '''
                      echo ${GOOGLE_SERVICE_ACCOUNT_KEY} | base64 | base64 --decode >  build.json
                    '''
                  
                  sh 'cat build.json'
                  
                    
                    
				sh """				
				echo "deploy stage";
				curl -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-220.0.0-linux-x86_64.tar.gz;
				tar -xvf /tmp/google-cloud-sdk.tar.gz -C /tmp/;
				/tmp/google-cloud-sdk/install.sh -q;
				source /tmp/google-cloud-sdk/path.bash.inc;
				 gcloud config set project ${GOOGLE_PROJECT_ID};
				 
				 echo "After authentication gcloud";
				 gcloud config list;
				 gcloud auth activate-service-account --key-file build.json;
				"""				 
			}
		}		
			stage('Deploy') {
			
                steps {
				sh """				
				 './cluster.sh'
				 './mongodb.sh'
				 './istio.sh'				 
				"""          
		}
		}
    }
}
