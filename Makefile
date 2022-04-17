# environment variabls


# spins up a containerized instance of jenkins
spin_up_jenkins:
	docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:latest

# processes for configuration of eks Terraform CI/CD server node
configure_jenkins_node:
	echo 'setting lifespan of node'

	echo 'installing git'

	echo 'installing jenkins'

	echo 'installing terraform'

	echo 'installing docker'

	echo 'installing kubernetes'

	echo 'installing aws cli'

set_node_lifespan:
	echo 'determines how long server and managed cluster(s) will live. Useful for preplanned termination of resources so that you don't forget and end up paying more than you wanted to'

# provision CI/CD node from a MacOS environment(will be deprecated after provisioning & configuration has been containerized)
provision_on_macos:
	echo 'provisioning eks terraform CI/CD server'

	make configure_jenkins_node
	
![image info](./pictures/image.png)