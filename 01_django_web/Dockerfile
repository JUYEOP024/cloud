# 베이스 이미지 설정
FROM python:3.12-slim

# 환경변수 설정
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 작업 디렉토리 생성
WORKDIR /app

# 필요한 파일 복사
COPY requirements.txt .

# 패키지 설치
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 전체 프로젝트 복사
COPY . .

# 정적파일 수집 폴더 생성
RUN mkdir -p /app/staticfiles

# 포트 오픈
EXPOSE 8000

# Gunicorn 실행
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_web.wsgi"]