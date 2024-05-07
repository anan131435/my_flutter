/*
import 'package:flutter/material.dart';
import 'package:flutter_module_organization/config/flutter_module_organization_constants.dart';
import 'company_item.dart';
import 'package:flutter_module_organization/generated/assets.dart';
import 'package:habit/habit.dart';

import '../entity/org_company_list_entity.dart';

class CompanyListWidget extends StatelessWidget {
  final List<OrgCompanyListEntity> companyList;
  final Function() onTap;

  const CompanyListWidget(
      {super.key, required this.companyList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 318,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CompanyItem(
                          entity: companyList[index],
                        );
                      },
                      itemCount: companyList.length,
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 16),
                  child: Image.asset(
                    Assets.imagesCommonIconCloseRight,
                    package: OrganizationConstants.OrganizationModuleName,
                    width: 24,
                    height: 24,
                  ),
                ).wrapGestureDetector(onTap: onTap),
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
*/