class OnboardingResult {
  final String? status;

  OnboardingResult(this.status);

  OnboardingResult.fromJson(Map<String, dynamic> json)
      : status = json['status'];
}
