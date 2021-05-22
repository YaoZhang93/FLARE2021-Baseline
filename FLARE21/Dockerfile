FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
	# 从上面发现 image 已经有了python，这里不再安装
    # python3.7 \
	# python3.7-dev \
	# python3.7-venv \
	python3-pip \
	python3-setuptools \
	build-essential \
	&& \
	apt-get clean && \
	python -m pip install --upgrade pip

WORKDIR /workspace
COPY ./   /workspace
RUN pip install -e .

CMD ["/bin/sh", "predict.sh"]
