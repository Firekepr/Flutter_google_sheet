# Flutter_google_sheet
EN_US: A simple project that takes the value entered and saves it in a Google spreadsheet. It is possible to consult the value entered and other values ​​in a list. Below I teach you which code I use in Google to understand my requests.
<br>
<br>
PT_BR: Um projeto simples que pega o valor inserido e salva em uma planilha do Google. É possível consultar o valor inserido e outros valores em uma lista. Abaixo ensino qual código utilizo no Google para entender minhas requisições.

![before_save](https://github.com/user-attachments/assets/77d5326f-02ec-4d11-8a09-610b36ec5542)
![after_save](https://github.com/user-attachments/assets/c11056f6-188e-4d29-ac59-bb10301a82fe)

![google_sheet](https://github.com/user-attachments/assets/552333da-aba5-4be3-83b6-57b830ac90a3)

#  Code used in Google sheet:

EN_US: These methods save or get the data based on the action 'field'
<br>
PR_BR: Estes metodos salvam ou pegam valores com base no campo 'action'

> await http.get(URL + '?name=$name&email=$email&mobileNumber=$mobile_number&feedback=$feedBack&action=save');
```
function doGet(request) {
  var sheetID = "YOUR_GOOGLE_SHEET_ID_HERE";
  var action = request.parameter.action;

  if (!action) return ContentService.createTextOutput(JSON.stringify({"status": "FAILURE", "message": 'Missing action!'})).setMimeType(ContentService.MimeType.JSON);

  if (action == 'save') return onSave(request, sheetID);
  if (action == 'get') return onGet(sheetID);
}

function onSave(request, sheetId) {
  var sheet = SpreadsheetApp.openById(sheetId);
  var result = null;

  try {
    var name = request.parameter.name;
    var email = request.parameter.email;
    var mobileNumber = request.parameter.mobileNumber;
    var feedback = request.parameter.feedback;

    var rowData = sheet.appendRow([name, email, mobileNumber, feedback]);

    result = {"status": "SUCCESS"};

  } catch (e) {
    result = {"status": "FAILURE", "message": e};
  }

  return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
}

function onGet(sheetID) {
  var sheet = SpreadsheetApp.openById(sheetID);
  var result = null;

  try {
      var data = sheet.getDataRange().getValues();

      if (data.length > 1) {
        result = {"status": "SUCCESS", "data": data};
      } else {
        result = {"status": "FAILURE", "message": "No data found."};
      }

  } catch (e) {
    result = {"status": "FAILURE", "message": e.toString()};
  }

   return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
}
```
