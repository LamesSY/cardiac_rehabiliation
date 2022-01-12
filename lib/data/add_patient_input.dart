class PatientInputField {
  final String title;
  Function(String? content) onContentSave;
  String? Function(String? content) checkContent;
  bool isRequired = false;

  PatientInputField(
    this.title, {
    this.isRequired = false,
    required this.onContentSave,
    required this.checkContent,
  });
}
