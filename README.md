# Database-btNhuAnh
I.	Đọc hiểu Bài toán Quản lý học viên và điểm thi sau:
Có một CSDL như hình 1
 
Bảng Test lưu danh sách các môn học. Bảng Student lưu danh sách các học viên. Bảng StudentTest lưu danh sách điểm thi và ngày thi của mỗi học viên với môn thi.
Một học viên chưa thi môn nào nếu như mã học viên (rn) không xuất hiện trong bảng StudentTest. Một môn học chưa có ai thi nếu mã môn học (TestID) không xuất hiện trong bảng StudentTest.
Chú ý dữ liệu có thể được nhập thêm tùy ý.
II.	Hãy Tạo một CSDL đặt tên là ‘StudentTest’ + <tên máy(tên Lab)>. 		
III.	Sử dụng T-SQL để làm việc với CSDL trên theo các bước sau::
(Chú ý: Toàn bộ các câu lệnh phải lưu vào một file đặt tên là StudentTest.sql. Nếu học viên không lưu đúng tên file bài thi sẽ được 0 điểm)
1.	Tạo 3 bảng và chèn dữ liệu như hình dưới đây: 
Student (Lưu danh sách các học viên gồm mã học viên(RN), tên(Name), tuổi(Age))
RN (int primary key) 	Name (VarChar (20))	Age (tinyint)
1	Nguyen Hong Ha	20
2	Truong Ngoc Anh	30
3	Tuan Minh	25
4	Dan Truong	22
Test (Lưu danh sách môn học gồm mã môn học (TestID, tên môn học(Name))
TestID (int primary key)	Name (Varchar(20))
1	EPC
2	DWMX
3	SQL1
4	SQL2
StudentTest (Lưu điểm thi của học viên với từng môn thi, gồm mã học viên (RN), mã môn học (TestID), ngày thi(Date), điểm thi(Mark))
RN (int foreign key tham chiếu tới RN của Student)	TestID (int foreign key tham chiếu tới TestID của Test)	Date (Datetime)	Mark (Float)
1	1	7/17/2006	8
1	2	7/18/2006	5
1	3	7/19/2006	7
2	1	7/17/2006	7
2	2	7/18/2006	4
2	3	7/19/2006	2
3	1	7/17/2006	10
3	3	7/18/2006	1

2.	Sử dụng alter để sửa đổi
a.	Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
b.	Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
c.	Thêm khóa chính cho bảng studenttest là (RN,TestID)
d.	Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
e.	Xóa ràng buộc duy nhất (unique) trên bảng Test

3.	Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi giống như hình sau:
 
(Chú ý: Với tất cả các câu có hình minh họa, học viên chỉ được đầy đủ điểm nếu kết quả chạy câu lệnh hiện ra giống hệt hình mình họa, phải giống cả tên cột cũng như dữ liệu trong bảng.)
4.	Hiển thị danh sách các bạn học viên chưa thi môn nào như hình sau:
 
5.	Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) như sau:
 
6.	Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm) như sau:   

7.	Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất như sau:
 
8.	Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học như sau:
 

9.	Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null như sau:
 

10.	Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
11.	Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.

12.	Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student lên như sau:
 
13.	Hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi như sau:
 
14.	 Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và điểm thi trung bình >4.5. Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình
15.	Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng). Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1.
16.	Sủa đổi kiểu dữ liệu cột name trong bảng student thành nvarchar(max)
17.	Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu sau:
a.	Nếu tuổi >20 -> thêm ‘Old’ vào trước tên (cột name)
b.	Nếu tuổi <=20 thì thêm ‘Young’ vào trước tên (cột name)
18.	 Xóa tất cả các môn học chưa có bất kỳ sinh viên nào thi
19.	Xóa thông tin điểm thi của sinh viên có điểm <5. 
