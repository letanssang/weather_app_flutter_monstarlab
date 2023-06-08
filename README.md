# Weather App
Weather App là một ứng dụng thời tiết tiện ích cho phép người dùng xem thông tin thời tiết chi tiết từ nguồn dữ liệu API Weather Bit. Ứng dụng cung cấp các tính năng sau:

## Tính năng
#### Xem thời tiết khu vực hiện tại
Hiển thị thông tin thời tiết của vị trí hiện tại của người dùng, bao gồm nhiệt độ, độ ẩm, tốc độ gió và điều kiện thời tiết.
#### Xem thời tiết các thành phố hiện tại
Cho phép người dùng tìm kiếm và xem thông tin thời tiết của các thành phố khác nhau.
#### Dự báo thời tiết 7 ngày
Hiển thị dự báo thời tiết trong vòng 7 ngày tới cho vị trí được chọn.
#### Dự báo thời tiết 24 giờ
Cung cấp dự báo thời tiết chi tiết trong 24 giờ tới cho vị trí được chọn.
#### Xem chi tiết chất lượng không khí
Hiển thị thông tin về chất lượng không khí hiện tại và dự báo chất lượng không khí trong tương lai.
#### Quản lý thành phố
Cho phép người dùng thêm và xóa các thành phố yêu thích để dễ dàng theo dõi thông tin thời tiết.
#### Đổi các đơn vị đo
Cung cấp tính năng chuyển đổi đơn vị đo nhiệt độ và tốc độ gió giữa Celsius và Fahrenheit, km/h và mph.
#### Hỗ trợ đa ngôn ngữ
Ứng dụng được hỗ trợ bằng hai ngôn ngữ: Tiếng Anh và Tiếng Việt.
#### Thông báo đến máy người dùng
Gửi thông báo thời tiết hàng ngày đến máy người dùng.
## Công nghệ và chức năng
Sử dụng API Weather Bit để lấy thông tin thời tiết từ nguồn dữ liệu tin cậy.
Sử dụng các công nghệ như Retrofit và Dio để thực hiện gọi API và xử lý dữ liệu JSON.
Sử dụng SQLite để lưu trữ dữ liệu thành phố yêu thích của người dùng.
Sử dụng Shared Preferences để lưu trữ các thiết lập đơn vị đo và ngôn ngữ ưu thích của người dùng.
Sử dụng Firebase để gửi thông báo đến máy người dùng.
Áp dụng kiến trúc Clean Architecture để phân tách logic ứng dụng thành các lớp riêng biệt và dễ bảo trì.
Sử dụng mô hình MVVM (Model-View-ViewModel) để quản lý trạng thái ứng dụng và liên kết dữ liệu với giao diện người dùng.
Sử dụng Riverpod để quản lý và cung cấp các dependency trong ứng dụng.
Sử dụng thư viện Freezed để tạo ra các lớp Immutable và quản lý trạng thái ứng dụng.
Sử dụng các widget UI và thư viện UI hỗ trợ để xây dựng giao diện người dùng thu hút và dễ sử dụng.
##Cấu trúc dự án
Dự án được tổ chức theo cấu trúc Clean Architecture, trong đó các lớp được chia thành các layer sau:

### Presentation Layer
Chứa các widgets UI, các lớp ViewModel và các thành phần liên quan đến giao diện người dùng.
### Domain Layer
Chứa các Entities, Use Cases và các Interface định nghĩa các repository.
### Data Layer
Chứa các Implementations của các Interface ở Domain Layer và cung cấp dữ liệu từ các nguồn bên ngoài như API, cơ sở dữ liệu.

## Cài đặt và chạy thử
Đảm bảo rằng bạn đã cài đặt Flutter và môi trường phát triển liên quan.
Clone repository Weather App về máy của bạn.
Mở terminal và di chuyển vào thư mục dự án.
Chạy lệnh flutter pub get để cài đặt các dependencies.
Kết nối thiết bị hoặc máy ảo để chạy ứng dụng.
Chạy lệnh flutter run để khởi chạy ứng dụng trên thiết bị hoặc máy ảo.
## Cảm ơn
Weather App được xây dựng nhằm mục đích học tập và thực hành các kỹ năng và công nghệ trong việc phát triển ứng dụng di động. Rất mong nhận được đóng góp và phản hồi của các bạn để cải thiện ứng dụng trong tương lai. Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào, vui lòng liên hệ với chúng tôi.

##  Tác giả
Tên: Tan Sang Le
Email: letan.ssang@gmail.com
Đây là dự án mã nguồn mở và miễn phí. Mọi đóng góp và phát triển đều được chào đón và đánh giá cao.