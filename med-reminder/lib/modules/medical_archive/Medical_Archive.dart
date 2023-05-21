import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/Components/Componenet.dart';
import '../../shared/cubit/Cubit.dart';
import '../../shared/cubit/srates.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var List = MedRemindCubit.get(context).healthNews;

    MedRemindCubit NewsCubit = MedRemindCubit.get(context);
    return BlocConsumer<MedRemindCubit, MedRemindStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return ConditionalBuilder(
            condition: MedRemindCubit.get(context).healthNews.length>0,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BuildArticleItem(
                      MedRemindCubit.get(context).healthNews[index], context);
                  // return Column(
                  //   children: [
                  //     MaterialButton(
                  //         onPressed: () => print(List[index]))
                  //   ],
                  // );
                }
                //  BuildArticleItem(
                //       NewsAppCubit.get(context).Buisness[index], context);
                ,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: MedRemindCubit.get(context).healthNews.length),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}