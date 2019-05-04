# DESCRIPTION:    Installs Ansible, the AWS CLI, and the Kubernetes CTL on an alpine base image. Intended to smooth GitLab Continuous Deployment to a Kubernetes pod.
# AUTHOR:    Prayag "Nikku" Chatha
# PULL IMAGE: https://cloud.docker.com/u/chathasphere/repository/docker/chathasphere/eks-runner

FROM alpine:3.8
ENV PATH="${PATH}:/"
RUN echo ${PATH}
RUN apk add build-base gcc libffi-dev openssl openssl-dev libssh2-dev python2 python-dev py2-pip git curl \
	&& pip install --upgrade pip \
	&& pip install awscli ansible \
	&& curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator \
	&& chmod +x ./aws-iam-authenticator \
	&& curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl 

