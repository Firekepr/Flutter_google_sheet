# Flutter_google_sheet
This project is to learn how save and get data in google sheets

# In google sheet codes use this (This method saves or gets the data based on the action) :
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
