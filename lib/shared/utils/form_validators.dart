// Funções utilitárias para validação de campos de formulário.
class FormValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'O campo $fieldName é obrigatório.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O E-mail é obrigatório.';
    }
    // Regex simples para validação de e-mail.
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }
}