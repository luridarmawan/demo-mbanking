import '../models/mbx_receipt_detail_model.dart';
import 'mbx_apis.dart';

class MbxReceiptVM {
  var loading = false;
  String title = '';
  String amount = '';
  List<MbxReceiptDetailModel> details = [];

  clear() {
    details = [];
  }

  Future<MbxApiResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/receipt',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxReceiptContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        title = resp.jason['data']['title'].stringValue;
        amount = resp.jason['data']['amount'].stringValue;
        for (final item in resp.jason['data']['details'].jasonListValue) {
          final detail = MbxReceiptDetailModel(item);
          details.add(detail);
        }
      }
      return resp;
    });
  }
}
