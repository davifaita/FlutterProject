class FormValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'O campo $fieldName é obrigatório.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'O E-mail é obrigatório.';
    }

    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'A senha é obrigatória.';
    }

    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirme sua senha.';
    }

    if (value != password) {
      return 'As senhas não coincidem.';
    }

    return null;
  }
}
