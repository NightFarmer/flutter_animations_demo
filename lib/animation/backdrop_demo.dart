import 'dart:math' as math;

import 'package:flutter/material.dart';

// This demo displays one Category at a time. The backdrop show a list
// of all of the categories and the selected category is displayed
// (CategoryView) on top of the backdrop.

class Category {
  const Category({ this.title, this.assets });
  final String title;
  final List<String> assets;
  @override
  String toString() => '$runtimeType("$title")';
}

const List<Category> allCategories = <Category>[
  Category(
    title: 'Accessories',
    assets: <String>[
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=4f53fa8e1699def18e976deaee5558bf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151851_r34Se.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557758&di=ea77e663ac012b8ce7eb921454528cb8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151853_Xr2UP.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=513a2deeb0b9f66ac9f7713c1f08e38c&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109132.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=d895baef0710a780cbff871b68fbabba&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515909.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686376&di=6c670e61692a4b8a8c97fc8d751df6e9&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-8%2F2018082209071335857.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=5772b73b9349682e9883d57394655c5e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109561.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1919562808,974781852&fm=11&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
  Category(
    title: 'Blue',
    assets: <String>[
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
  Category(
    title: 'Cold Weather',
    assets: <String>[
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
  Category(
    title: 'Home',
    assets: <String>[
     "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=2c0ccc64ab23eb9baa5f6582e0e4f52d&imgtype=0&src=http%3A%2F%2Fpic.feizl.com%2Fupload%2Fallimg%2F170725%2F43998m3qcnyxwxck.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=37d5107e6f7277bc4bfd323845a2ef32&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Fsmccloud%2Ffetch%2F2015%2F06%2F05%2F79697840747611479.JPEG",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=95860b0fd501110885cf6e191f7403f0&imgtype=0&src=http%3A%2F%2Fuploads.5068.com%2Fallimg%2F1712%2F144-1G2011I420.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212636935&di=110a278fe4fb22f07d183a049f36cba3&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3695896267%2C3833204074%26fm%3D214%26gp%3D0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=3730dccf46e4b4f35bcb882148b973ee&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F71%2F4c5b0d26ad.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=4f53fa8e1699def18e976deaee5558bf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151851_r34Se.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557758&di=ea77e663ac012b8ce7eb921454528cb8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151853_Xr2UP.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=513a2deeb0b9f66ac9f7713c1f08e38c&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109132.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=d895baef0710a780cbff871b68fbabba&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515909.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686376&di=6c670e61692a4b8a8c97fc8d751df6e9&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-8%2F2018082209071335857.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=5772b73b9349682e9883d57394655c5e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109561.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1919562808,974781852&fm=11&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
  Category(
    title: 'Tops',
    assets: <String>[
     "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=2c0ccc64ab23eb9baa5f6582e0e4f52d&imgtype=0&src=http%3A%2F%2Fpic.feizl.com%2Fupload%2Fallimg%2F170725%2F43998m3qcnyxwxck.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=37d5107e6f7277bc4bfd323845a2ef32&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Fsmccloud%2Ffetch%2F2015%2F06%2F05%2F79697840747611479.JPEG",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
  Category(
    title: 'Everything',
    assets: <String>[
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686376&di=6c670e61692a4b8a8c97fc8d751df6e9&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-8%2F2018082209071335857.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=5772b73b9349682e9883d57394655c5e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109561.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1919562808,974781852&fm=11&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ],
  ),
];

class CategoryView extends StatelessWidget {
  const CategoryView({ Key key, this.category }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    getInex(categoryArr,assets){
      var index;
      if(categoryArr.contains(assets)){
         index = categoryArr.indexOf(assets);
         return index;
      }
    }
    return ListView(
      key: PageStorageKey<Category>(category),
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 64.0,
      ),
      children: category.assets.map<Widget>((String asset) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                width: 144.0,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      asset,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 16.0,top: 10.0),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "image${getInex(category.assets,asset)+1}",
                        style: theme.textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        );
      }).toList(),
    );
  }
}

// One BackdropPanel is visible at a time. It's stacked on top of the
// the BackdropDemo.
class BackdropPanel extends StatelessWidget {
  const BackdropPanel({
    Key key,
    this.onTap,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.title,
    this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      elevation: 2.0,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
            onTap: onTap,
            child: Container(
              height: 48.0,
              padding: const EdgeInsetsDirectional.only(start: 16.0),
              alignment: AlignmentDirectional.centerStart,
              child: DefaultTextStyle(
                style: theme.textTheme.subhead,
                child: Tooltip(
                  message: 'Tap to dismiss',
                  child: title,
                ),
              ),
            ),
          ),
          const Divider(height: 1.0),
          Expanded(child: child),
        ],
      ),
    );
  }
}

// Cross fades between 'Select a Category' and 'Asset Viewer'.
class BackdropTitle extends AnimatedWidget {
  const BackdropTitle({
    Key key,
    Listenable listenable,
  }) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return DefaultTextStyle(
      style: Theme.of(context).primaryTextTheme.title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: CurvedAnimation(
              parent: ReverseAnimation(animation),
              curve: const Interval(0.5, 1.0),
            ).value,
            child: const Text('Select a Category'),
          ),
          Opacity(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 1.0),
            ).value,
            child: const Text('Asset Viewer'),
          ),
        ],
      ),
    );
  }
}

// This widget is essentially the backdrop itself.
class BackdropDemo extends StatefulWidget {
  @override
  _BackdropDemoState createState() => _BackdropDemoState();
}

class _BackdropDemoState extends State<BackdropDemo> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  Category _category = allCategories[0];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeCategory(Category category) {
    setState(() {
      _category = category;
      _controller.fling(velocity: 2.0);
    });
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    _controller.fling(velocity: _backdropPanelVisible ? -2.0 : 2.0);
  }

  double get _backdropHeight {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  // By design: the panel can only be opened with a swipe. To close the panel
  // the user must either tap its heading or the backdrop's menu icon.

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed)
      return;

    _controller.value -= details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed)
      return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  // Stacks a BackdropPanel, which displays the selected category, on top
  // of the backdrop. The categories are displayed with ListTiles. Just one
  // can be selected at a time. This is a LayoutWidgetBuild function because
  // we need to know how big the BackdropPanel will be to set up its
  // animation.
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = _controller.drive(
      RelativeRectTween(
        begin: RelativeRect.fromLTRB(
          0.0,
          panelTop - MediaQuery.of(context).padding.bottom,
          0.0,
          panelTop - panelSize.height,
        ),
        end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      ),
    );

    final ThemeData theme = Theme.of(context);
    final List<Widget> backdropItems = allCategories.map<Widget>((Category category) {
      final bool selected = category == _category;
      return Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        color: selected
          ? Colors.white.withOpacity(0.15) //选择添加透明度
          : Colors.transparent,
        child: ListTile(
          title: Text(category.title),
          selected: selected,
          onTap: () {
            _changeCategory(category);
          },
        ),
      );
    }).toList();

    return Container(
      key: _backdropKey,
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          ListTileTheme(
            iconColor: theme.primaryIconTheme.color,
            textColor: theme.primaryTextTheme.title.color.withOpacity(0.5),
            selectedColor: theme.primaryTextTheme.title.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: backdropItems,
              ),
            ),
          ),
          PositionedTransition(
            rect: panelAnimation,
            child: BackdropPanel(
              onTap: _toggleBackdropPanelVisibility,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              title: Text(_category.title),
              child: CategoryView(category: _category),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: BackdropTitle(
          listenable: _controller.view,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: _toggleBackdropPanelVisibility,
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              semanticLabel: 'close',
              progress: _controller.view,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}