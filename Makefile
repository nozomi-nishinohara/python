tag=""

run:
	docker build -t nozominishinohara/python:${tag} -f ${tag}/Dockerfile ${tag}
	docker push nozominishinohara/python:${tag}