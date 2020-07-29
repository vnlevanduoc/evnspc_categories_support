import 'package:evnspc_categories_support/base/base_bloc.dart';
import 'package:evnspc_categories_support/base/base_event.dart';
import 'package:rxdart/rxdart.dart';

class TrangChuBloc extends BaseBloc {
  final _data = BehaviorSubject<String>();
  Stream<String> get dataStream => _data.stream;
  Sink<String> get dataSink => _data.sink;

  initData() {
    String resultData =
        '{"Sheet1":[{"LinhVuc":"Kỹ thuật","Title":"http://baocaokythuat.evnspc.vn/HeThong/DangNhap.aspx","Desc":"Báo cáo kỹ thuật","Support":[{"Name":"Lê Hồ Phương Thy","Phone":"0976688835","GioiTinh":"0"}]},{"LinhVuc":"Kỹ thuật","Title":"http://dotincay.evnspc.vn","Desc":"Độ tin cậy","Support":[{"Name":"Lê Hồ Phương Thy","Phone":"0976688835","GioiTinh":"0"}]},{"LinhVuc":"Kỹ thuật","Title":"http://oms.evnspc.vn/","Desc":"Quản lý vận hành lưới điện","Support":[{"Name":"Lê Hồ Phương Thy","Phone":"0976688835","GioiTinh":"0"}]},{"LinhVuc":"Kỹ thuật","Title":"http://pmis.evnspc.vn","Desc":"Quản lý nguồn và lưới điện","Support":[{"Name":"Lê Hồ Phương Thy","Phone":"0976688835","GioiTinh":"0"},{"Name":"Lâm Tấn Quốc","Phone":"0938473189","GioiTinh":"1"}]},{"LinhVuc":"Kinh doanh","Title":"http://thitruongdien.evnspc.vn","Desc":"Điểm đo ranh giới","Support":[{"Name":"Đặng Trí Hải","Phone":"0905971907","GioiTinh":"1"}]},{"LinhVuc":"Kinh doanh","Title":"http://cmis.evnspc.vn","Desc":"Quản lý cmis","Support":[{"Name":"Phan Thị Hoa","Phone":"0909540704","GioiTinh":"0"}]},{"LinhVuc":"Kinh doanh","Title":"http://mdas.evnspc.vn","Desc":"Hệ thống phân tích dữ liệu đo","Support":[{"Name":"Phan Thị Hoa","Phone":"0909540704","GioiTinh":"0"},{"Name":"Lê Văn Được","Phone":"0968000377","GioiTinh":"1"}]},{"LinhVuc":"Kinh doanh","Title":"http://drms.evnspc.vn","Desc":"DRMS","Support":[{"Name":"Phan Thị Hoa","Phone":"0909540704","GioiTinh":"0"},{"Name":"Lê Văn Được","Phone":"0968000377","GioiTinh":"1"}]},{"LinhVuc":"Kinh doanh","Title":"http://spc.ifc.com.vn/","Desc":"IFC","Support":[{"Name":"...","Phone":"...","GioiTinh":"1"}]},{"LinhVuc":"HRM","Title":"http://10.170.0.146","Desc":"HRMS 2.0","Support":[{"Name":"Nguyễn Hoàng Việt","Phone":"0974873087","GioiTinh":"1"}]},{"LinhVuc":"HRM","Title":"http://hrm.evnspc.vn","Desc":"Quản lý nguồn nhân lực","Support":[{"Name":"Nguyễn Hoàng Việt","Phone":"0974873087","GioiTinh":"1"}]},{"LinhVuc":"HRM","Title":"https://giamsatqldtxd.evnspc.vn","Desc":"Hệ thống giám sát đầu tư xây dựng","Support":[{"Name":"Huỳnh Thị Tố My","Phone":"0908714878","GioiTinh":"0"}]},{"LinhVuc":"HRM","Title":"http://qldtxd.evnspc.vn/Login.aspx","Desc":"Hệ thống quản lý đầu tư xây dựng","Support":[{"Name":"Huỳnh Thị Tố My","Phone":"0908714878","GioiTinh":"0"}]},{"LinhVuc":"Eoffice","Title":"http://eoffice.evnspc.vn/spcit","Desc":"Quản lý văn bản","Support":[{"Name":"Trần Thị Mai Tuyền","Phone":"0985188851","GioiTinh":"0"}]},{"LinhVuc":"Eoffice","Title":"http://home.evnspc.vn","Desc":"Cổng thông tin nội bộ","Support":[{"Name":"Nguyễn Ngọc Huy","Phone":"0349110697","GioiTinh":"1"}]},{"LinhVuc":"An toàn","Title":"https://giamsatantoan.evnspc.vn","Desc":"Quản lý lĩnh vực an toàn","Support":[{"Name":"Đặng Trí Hải","Phone":"0905971907","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://erpspcapp01.evnspc.vn:8040/","Desc":"Hệ thống ERP","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://10.170.2.79:9502/analytics","Desc":"Quản lý tồn kho trực tuyến - ORS","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://10.1.11.86:9000/workspace","Desc":"Kế hoạch tài chính","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://scl.evnspc.vn","Desc":"Quản lý Sửa chữa lớn","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://10.170.0.8/qlcapvon","Desc":"Quản lý Cấp vốn KHCB","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://10.170.0.8/capphatvattu/","Desc":"Cấp phát mã vật tư","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tài chính","Title":"http://10.170.0.8/inhoadonerp/","Desc":"In hóa đơn tích hợp ERP","Support":[{"Name":"Phạm Hoài Phúc","Phone":"0969007900","GioiTinh":"1"},{"Name":"Mai Nguyên Hoàng","Phone":"0374086345","GioiTinh":"1"},{"Name":"Mã Nhật Khoa","Phone":"0908094122","GioiTinh":"1"},{"Name":"Phan Thanh Cẩn","Phone":"0968773144","GioiTinh":"1"}]},{"LinhVuc":"Tools","Title":"http://10.170.210.131/portal/","Desc":"Quản lý và phổ biến đề tài sáng kiến","Support":[{"Name":"Hoàng Tuấn Anh","Phone":"0916537393","GioiTinh":"1"}]},{"LinhVuc":"Tools","Title":"http://jira.evn.com.vn/login.jsp","Desc":"Jira evnict","Support":[{"Name":"...","Phone":"...","GioiTinh":"1"}]},{"LinhVuc":"Tools","Title":"http://10.170.3.55:8080/vtdrspc/","Desc":"Viễn thông dùng riêng","Support":[{"Name":"PC Kiên giang","Phone":"...","GioiTinh":"1"}]},{"LinhVuc":"Tools","Title":"https://10.170.36.3/WebConsole/#!/dashboard","Desc":"Remote local","Support":[{"Name":"KTHTM","Phone":"...","GioiTinh":"1"}]},{"LinhVuc":"Tools","Title":" https://ktat.cpc.vn/Hethong/Thongbao.aspx","Desc":"KTAT CPC","Support":[{"Name":"CPC","Phone":"...","GioiTinh":"1"}]},{"LinhVuc":"CA","Title":"http://10.163.0.241:8080/","Desc":"Cấp CA EVNSPC","Support":[{"Name":"Lê Hồ Phương Thy","Phone":"0976688835","GioiTinh":"0"}]}]}';
    dataSink.add(resultData);
  }

  @override
  void dispatchEvent(BaseEvent event) {}

  @override
  void dispose() {
    super.dispose();
    _data.close();
  }
}