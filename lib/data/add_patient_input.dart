class AddPatientInputField {
  final String title;
  Function(String? content) onContentSave;
  bool Function(String? content) checkContent;
  bool isRequired = false;

  AddPatientInputField(this.title, this.onContentSave, this.checkContent,
      {this.isRequired = false});
}
