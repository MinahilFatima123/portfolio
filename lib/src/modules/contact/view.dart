import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/utils/extensions/theme_extensions.dart';
import 'logic.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ keep screens white
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(controller.isMobile ? 12 : 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading
                  Text(
                    "Get In Touch!",
                    style: context.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Contact me for hiring or help me join your team.",
                    style: context.bodyMedium?.copyWith(color: context.textGray),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Social icons row
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _socialIcon(context, Icons.code, "GitHub"),
                      _socialIcon(context, Icons.alternate_email, "Twitter"),
                      _socialIcon(context, Icons.business, "LinkedIn"),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Contact Form
                  Form(
                    key: controller.formKey,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: context.sidebarColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Contact Form",
                            style: context.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.textBlack,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),

                          // Responsive Form Fields
                          controller.isMobile
                              ? Column(
                            children: [
                              _inputField(context, "Name", controller.nameController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Name is required";
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 16),
                              _inputField(context, "Email", controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$")
                                        .hasMatch(value)) {
                                      return "Enter a valid email";
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 16),
                              _inputField(context, "Subject",
                                  controller.subjectController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Subject is required";
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 16),
                              _inputField(context, "Message",
                                  controller.messageController,
                                  maxLines: 8, validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "Message is required";
                                    }
                                    return null;
                                  }),
                            ],
                          )
                              : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    _inputField(context, "Name",
                                        controller.nameController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Name is required";
                                          }
                                          return null;
                                        }),
                                    const SizedBox(height: 16),
                                    _inputField(context, "Email",
                                        controller.emailController,
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Email is required";
                                          }
                                          if (!RegExp(
                                              r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$")
                                              .hasMatch(value)) {
                                            return "Enter a valid email";
                                          }
                                          return null;
                                        }),
                                    const SizedBox(height: 16),
                                    _inputField(context, "Subject",
                                        controller.subjectController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Subject is required";
                                          }
                                          return null;
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _inputField(
                                  context,
                                  "Message",
                                  controller.messageController,
                                  maxLines: 8,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return "Message is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Send Button
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: controller.submitForm,
                              icon: const Icon(Icons.send),
                              label: const Text("Send Message"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Social icon widget
  Widget _socialIcon(BuildContext context, IconData icon, String tooltip) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.sidebarColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child:
      Icon(icon, color: context.primaryColor, size: 28, semanticLabel: tooltip),
    );
  }

  // Input field widget
  Widget _inputField(
      BuildContext context,
      String label,
      TextEditingController controller, {
        int maxLines = 1,
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
      }) {
    Icon? prefixIcon;
    switch (label.toLowerCase()) {
      case "name":
        prefixIcon = const Icon(Icons.person);
        break;
      case "email":
        prefixIcon = const Icon(Icons.email);
        break;
      case "subject":
        prefixIcon = const Icon(Icons.title);
        break;
      default:
        prefixIcon = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: context.primaryColor),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: label.toLowerCase() == "message"
                ? "Write your message here..."
                : null,
            filled: true,
            fillColor: context.screenBackground,
            prefixIcon: prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(prefixIcon.icon, color: context.primaryColor),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.primaryColor, width: 1.5),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
