# Flutter_google_sheet
This project is to learn how save and get data in google sheets


# In google sheet codes use this:
  ```
function doGet(request) {
  var sheet = SpreadsheetApp.openById("YOUR_GOOGLE_SHEET_ID_HERE");
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
  ```
