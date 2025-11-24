class FormValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'O campo $fieldName é obrigatório.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O E-mail é obrigatório.';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Insira um e-mail válido.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha é obrigatória.';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres.';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha.';
    }
    if (value != original) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  static String? uniqueEmail(String? value, String? savedEmail) {
    if (value == null || value.isEmpty) return null;

    if (savedEmail != null &&
        value.trim().toLowerCase() == savedEmail.trim().toLowerCase()) {
      return 'Este e-mail já está cadastrado.';
    }

    return null;
  }
}
