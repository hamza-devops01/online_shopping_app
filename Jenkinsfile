pipeline{
    agent {label "dev"};
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/hamza-devops01/online_shopping_app.git", branch: "master"
            }
        }
        
    stage("Build"){
            steps{
                sh "docker build -t online-shop-app ."
            }
    }
    
    stage("Test"){
            steps{
                echo "Tester can test it ..."
            }
        }
        
    stage("Deploy"){
            steps{
                sh "docker compose up -d --build online_shop"
            }
        }
        }
    }
