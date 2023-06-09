# Weather App
Weather App là một ứng dụng thời tiết tiện ích cho phép người dùng xem thông tin thời tiết chi tiết từ nguồn dữ liệu API Weather Bit. 

## Tính năng
* Xem thời tiết hiện tại  và dự báo thời tiết của vị trí hiện tại và các thành phố trên thế giới
 <br> - Dự báo thời tiết theo ngày
 <br> - Dự báo thời tiết theo giờ 
 <br> - Chất lượng không khí 
* Quản lý thành phố: Thêm, Xóa, Sắp Xếp
* Setting
  <br> - Thay đổi các đơn vị đo: nhiệt độ, tốc độ, áp suất
  <br> - Hỗ trợ đa ngôn ngữ: tiếng Anh và tiếng Việt
* Thông báo đến máy người dùng
## Công nghệ và chức năng
* Sử dụng Retrofit và Dio để thực hiện gọi API và xử lý dữ liệu JSON.
* Sử dụng SQLite để lưu trữ dữ liệu thành phố yêu thích của người dùng.
* Sử dụng Shared Preferences để lưu trữ các thiết lập đơn vị đo và ngôn ngữ ưu thích của người dùng.
* Sử dụng Firebase để gửi thông báo đến máy người dùng.
* Sử dụng Riverpod, mô hình MVVM (Model-View-ViewModel),thư viện Freezed để quản lý trạng thái ứng dụng và liên kết dữ liệu với giao diện người dùng.
## Cấu trúc dự án
Dự án được tổ chức theo cấu trúc Clean Architecture, trong đó các lớp được chia thành các layer sau:
  ### Presentation Layer
Chứa các widgets UI, các lớp ViewModel và các thành phần liên quan đến giao diện người dùng.
  ### Domain Layer
Chứa các Entities, Use Cases và các Interface định nghĩa các repository.
  ### Data Layer
Chứa các Implementations của các Interface ở Domain Layer và cung cấp dữ liệu từ các nguồn bên ngoài như API, cơ sở dữ liệu.
## Screenshot
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/121ae629-3e28-4aff-9d92-2150c1f252e3" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/e77df145-1c33-4770-b3d7-dd98f9726390" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/995d9637-cc3c-4ffe-94ef-2930909b70f3" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/132a90f5-eeb8-4486-b0ca-782ae48d52f9" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/893f53fa-b176-454b-add9-bc33941aed8b" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/099138bc-6964-4def-966b-fc15f583fb1f" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/3e746b9d-d995-4152-9576-c19381abec65" alt="Description" width="200" height="434">
<img src="https://github.com/letanssang/weather_app_flutter_monstarlab/assets/67082439/4b2ad676-882d-4399-90d5-bf39d570e49d" alt="Description" width="200" height="434">

## Cảm ơn
  <br>Weather App được xây dựng nhằm mục đích học tập và thực hành các kỹ năng và công nghệ trong việc phát triển ứng dụng di   động. 
  <br>Rất mong nhận được đóng góp và phản hồi của các bạn để cải thiện ứng dụng trong tương lai. 
  <br>Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào, vui lòng liên hệ với chúng tôi.

##  Tác giả
  <br>Tên: Tan Sang Le
  <br>Email: letan.ssang@gmail.com.
