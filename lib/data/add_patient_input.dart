class AddPatientInputField {
  final String title;
  Function(String? content) onContentSave;
  String? Function(String? content) checkContent;
  bool isRequired = false;

  AddPatientInputField(
    this.title, {
    this.isRequired = false,
    required this.onContentSave,
    required this.checkContent,
  });
}
