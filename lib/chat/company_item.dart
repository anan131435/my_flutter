import 'package:flutter/material.dart';
import 'package:flutter_module_organization/config/org_colors.dart';
import 'package:flutter_module_organization/function/home/entity/org_company_list_entity.dart';
import 'package:flutter_module_organization/utils/org_color_utils.dart';
class CompanyItem extends StatelessWidget {
  final OrgCompanyListEntity entity;
  const CompanyItem({super.key,required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: ColorsUtil.contractColor(entity.colorCode!.isNotEmpty ? entity.colorCode ?? "" : "000000"),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Text(entity.organizationShortName ?? "",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: OrgColors.color_2A2F3C),),
                  const SizedBox(height: 4,),
                  Text(entity.organizationName ?? "",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: OrgColors.color_858B9B),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
