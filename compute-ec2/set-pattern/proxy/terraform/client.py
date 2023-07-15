import socket

# 서버 정보 설정
server_host = '127.0.0.1'  # 서버 호스트 주소
server_port = 12340  # 서버 포트 번호

# UDP 클라이언트 소켓 생성
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 서버로 보낼 메시지
message = "안녕하세요, UDP 서버에게 메시지를 보냅니다."

# 서버로 메시지 전송
client_socket.sendto(message.encode(), (server_host, server_port))

# 서버로부터 응답 수신
response, server_address = client_socket.recvfrom(1024)

# 응답 출력
print(f"서버로부터 응답 수신: {response.decode()}")

# 클라이언트 소켓 닫기
client_socket.close()

