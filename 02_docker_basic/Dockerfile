# Python 베이스 이미지 사용
FROM python:3.12-slim

# 작업 디렉터리 설정
WORKDIR /app

# 로컬 코드 복사
COPY . /app

# 종속성 설치
RUN pip install --no-cache-dir -r requirements.txt

# 서버 실행
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]