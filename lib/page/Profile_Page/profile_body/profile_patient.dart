import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlife/models/model_person.dart';
import 'package:starlife/controllers/profile_controller.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/image_picker2.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_other_patient_page/profile_edit/profile_patient_edit_data_page.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ProfilePatient extends StatefulWidget {
  const ProfilePatient({
    super.key,
  });
  // final Patient patient;

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  final c = Get.put(GlobalController());
  final p = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      p.loadingPersonal.value = false;
      p.getDataPersonal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Profile",
              style: TextStyle(height: 1.5),
            ).p16b().white(),
            GestureDetector(
                onTap: () {
                  Get.to(
                      // MyPage()
                      ProfileEditDataPage(
                    patient: p.person,
                  ));
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 15,
                ))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 220,
          height: 240,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0.1,
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => (p.loadingPersonal.value)
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(1000)),
                          child: SizedBox(
                            width: 110,
                            height: 110,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: FadeInImage(
                                  image: NetworkImage(p.person?.picture),
                                  placeholder: const AssetImage("assets/images/img_avatar.png"),
                                  imageErrorBuilder: (context, error, stackTrace) {
                                    return Image.asset('assets/images/img_avatar.png', fit: BoxFit.fitWidth);
                                  },
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          p.person!.fname,
                          maxFontSize: 13,
                          minFontSize: 5,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: OPrimaryColor),
                        ),
                        // Text(p.person.fname).p15m().primary(),
                        Text(p.person?.email).p10r().primary(),
                        Expanded(
                            flex: 1,
                            child: AutoSizeText(
                              (p.person!.rm == null || p.person!.rm == '') ? "No. RM : RM101085-101223/012" : p.person!.rm,
                              maxFontSize: 12,
                              minFontSize: 9,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: OPrimaryColor),
                            )),
                        GestureDetector(
                          onTap: () async {
                            Clipboard.setData(ClipboardData(text: p.person!.rm)).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('RM Number Copied to your clipboard !')));
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: const Color(0xffD0F4FF), borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                              child: const Text(
                                "Copy RM",
                                style: TextStyle(color: Colors.grey),
                              ).p10r()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : const Center(
                      child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
                    )),
            ],
          ),
        )
      ],
    );
  }
}
