Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC924B072
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:52:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D477C3FAD8;
	Thu, 20 Aug 2020 07:52:05 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFC70C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGHfTwgzLiTBk+INrDQh4XmW7djAfSNPqkmW4WoPg4ps7upzKhlxK9aYShJcL6hahEhLtt/b1hzDg9b9hoTNWUB6KGeQiD5DD558geAY6WXj6iBe9rUfOTvAHdQ0mqwr9G7eKOa9zFA58xkvwxd9dZ97YyiKM+oEvIzO+pauwYXKQopRz+m9skplmwX7bzDXyXkyMD5WbQMv80sQVTXmIS2U6w60EXQTW4G1hLISlVHGZ3H8bMc+uGn155fF6m6gM04kMmVs9z6ryFMMJSmI9N6KDprBOXTSAu+Y4UjrNw7fcoYOSpyAHgO7F9ZhsxGs4TnZFfcTStlLOYBujTbRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNtAOBC3aUw8TNLgI4GIzbD8jxcV4QRv6CXfrsJeh8Q=;
 b=i3OgaSXHEqiqGoY60SSkKirCKIO0jvqGg7u94gS0CqLONEeI+49YRFLAELqdP3UXNdDxaCefEQnflDljQKMWsvu8LzIeN4xzRSrRCFzzxGXG2CnfesuIONxL0JYOL5vCE+2rRMVUx7MIf7BiWVzenBMFwpbktFqmlM2KCHxQSQD+tYKSBf7wC4AhOW/zRO8xFAdA2keH2L+GD4ngDVM5cd56cTGCL7liNOq5xtmi43OBWS3dLyS9uh08PPoGeIp1YbEMrZkyOWyeDzJ/a/93GwlHwrowILeDIj+s8UxZ4yiGRXyQkm5JnAd6MpkbhE8h78yqvpZYEq7KlYosIn5CIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNtAOBC3aUw8TNLgI4GIzbD8jxcV4QRv6CXfrsJeh8Q=;
 b=gXEYhmkrjvk3T5/kiEDpsw4UL15YC6T4101E/f8vaAgP8xk7380/JKUOkiUAjynUWuzZTWH/ktLA7ppg5OUYuFghezELeKDzoiDXTU+ymAIL8h+GPL2QaeYMpMtSjgQg6ogACBiWpapIuAt/nf+DMa/f3ZXwPX347Drf8MzLYH4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:52:02 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:52:02 +0000
Date: Thu, 20 Aug 2020 15:38:16 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153816.5f64bd0e@xhacker.debian>
In-Reply-To: <20200820152926.42c48840@xhacker.debian>
References: <20200820152926.42c48840@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To BN7PR03MB4547.namprd03.prod.outlook.com
 (2603:10b6:408:9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:51:59 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f664a77e-fdf2-4598-0474-08d844ddec74
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4563321E4B75C8F6FCA8322BED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/XqH51IPVQItCmHnFwwhXHwzphOAuyDgX5bMXtey1oRMZxxtlKPV/q660ZzjnqDPL6fCsUuEKYl2ORq6azibbN+yxpo9FtVs3089ym86XVvlU/3qDc7DVL+p6Nnd3SVSs+bhp23u7X+53BIygpAPIHgV2DrCEdB8hmQZLdjJUkagLigdtFIybLmNTEuKSkMtMJcgSidvYCXts2hbbmJ/CA29To4U3BH7sKlgn3LyCsfMhW+ZO9lghHchTyHp7kHLGcly7pYtk5q7jJY1EBZzos1ji8QRKTvUXJtoCGhVZZV1J/jyyi/FOGMhwB/TAad9KI2JpwUJVDSfd4u61UiBhgZqmE3FQzSglzSomNWL2itwSmw64iUC0HeJYyFLN6q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: abaGsiNSvE7whFO2We9VMFdZfGDpGCPYOf9OiV3stxDDcKfD1PAAvhZN1u2UcPXrr+2wSpSxDTv96m93rV2tCWi2/MTItd0iB/rZBzQt0IVbE+USj9EzEQIRYDtgB+6bYb+w27M7/9yiMiLgbC0JobNyp2RrcR56U2u1bl6fLDRtmhf98xj0RWBpOIT04Z0cIEnyzAjt3icc46IDbvCIu4Q8C2VsSa6BP/eXJShq9AI/Ljm2k1cinok0qEg3RHdM3Ci7S8qHhvXYXfsbeZdpjmg6vBzNkPfsvLjD0ojwrTiF/g5HDrsxSqHf8JRS6brNykUMOJbWXXy6ylTTawqMErQU/Z9IxspPA+1hqff2xHl0VSYMV2x2l7AFz+1wAN2Gn1T5Zs6dTdF6tNZMrOxe7nN7a9icw9KHH2WontEizkhfp0a1PzpxxHmXzTyNqwvpcBZcXXpNCOQZB7xXYjHSmdO3VJcoTF04W1YWztVD4VJs1TfPeH9Zc7siBxjskNL3c702HqhJdNaJa6V4E29LnmpKinICTdY69+G5C1LTAc4hd4ul2EKt6x6yKatDQS1go2GnuJETgbeNKTivyrIycngMesyes+ul6zL09UnkRI15QICb4ezxaouUBOo3HWZXuqCYPNMope1eThjzO28slw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f664a77e-fdf2-4598-0474-08d844ddec74
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:52:02.1181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiyW2059+gRGwUdSRFmJ5p/7LKxlB+900+eIHOT6NTqZJ24+nXC8Ng/DrRS8mNSpriaEiSe7yg7TcXsIXClzMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 09/12] regulator: pwm: Fix W=1 build warning
 when CONFIG_OF=n
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3B3
bS1yZWd1bGF0b3IuYzozOTM6MzQ6IHdhcm5pbmc6IOKAmHB3bV9vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIDM5MyB8IHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHB3bV9vZl9tYXRjaFtdID0gewogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMv
cmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9wd20tcmVndWxhdG9yLmMg
Yi9kcml2ZXJzL3JlZ3VsYXRvci9wd20tcmVndWxhdG9yLmMKaW5kZXggMzIzNGIxMThiNTNlLi5j
MDA4MjliZDVkN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL3B3bS1yZWd1bGF0b3Iu
YworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9wd20tcmVndWxhdG9yLmMKQEAgLTM5MCwxMSArMzkw
LDEzIEBAIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCisjaWZkZWYgQ09ORklHX09GCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBwd21fb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxl
ID0gInB3bS1yZWd1bGF0b3IiIH0sCiAJeyB9LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IHB3bV9vZl9tYXRjaCk7CisjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
cHdtX3JlZ3VsYXRvcl9kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKLS0gCjIuMjguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
