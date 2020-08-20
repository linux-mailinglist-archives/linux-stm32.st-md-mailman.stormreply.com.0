Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9D24B091
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:55:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40C4FC3FAD8;
	Thu, 20 Aug 2020 07:55:29 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20FC9C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7i+t0tkYQc0SjTJMEzGhA/FORWM0YXAhzWtfeKuk/+CajLvrzdnmWndAFXVjeTjR5Gx8IfYU/5HZIWNkrZ+2T0vu/TI4t6ESxKfJXgAQk968hTb65I8m9zRDeVpc8Gia3MVOz0JnmBSKuTXPnglf0gSS1bocRSE+H/s/VkFxa6fdteTZ9t2joi/ZTNhlN0/WPep3VgYNA0yWV0pRmYHodv8TIchhqfQfCMeXDRyIlS9n6whc8vRt8779bKTTuiKoq1Hlt6rvGQyuyj99lfZruc0T8FN7nf6FtqsU/SpCg6kn5KjZA4GUHJujfH2RmBCWg5FWHfQT++bv2CwHVAYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIBWkqwgrba5o7D2YduJImEnPNs0UI/3+EVP5ccdMGY=;
 b=HGUPWvXsoUhDqKSshGifHMRZUduDH+/vpIonmVXm00Gftd6EKzrmZoyf0DFmVOadhRIDQv4eq8qBGh7kzg1wbZlDqp5X0ie7UgTuGVgnpJUMs2NibozKliEjdLCj6Np877HA6eAME2NNlpuDqyJMpXTUIHuGI9JMsc7ZV9RqMKqBDOuGKgf0HA3MxcrTer7d9sgXCl9C0DcLhkJZln9lpPDTJbFqjYmSZ735UjxaLUKpLDMO+wGRI8jXbv6Dat9p6AisV3rkW1qDxUIzIMUNWDzLCyYp3iyMHX0Ktvzvgle+SpoSA3xctX/Y8ErEAndBMNX7B3tKUZTY7buGn2g5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIBWkqwgrba5o7D2YduJImEnPNs0UI/3+EVP5ccdMGY=;
 b=eBfxeggaZOOstw1mKT18uVO3tcWPFB9CKjeLoN6XB0uuKZyca0IYH69W6qjG4WPkfGBkSz4qvQaQ+cxeJxfCWWBdXU3Gq++2So5RltPJ8hTxla/VigrGYdY2Jby0kjmWkOQOcwpaPXsjojrkaSkEiSQtCDUzD/yqTMjOoV9I9Co=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:55:26 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:55:26 +0000
Date: Thu, 20 Aug 2020 15:47:04 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820154704.14554720@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:55:23 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5f0b7e-7e0a-45de-64f5-08d844de663d
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB45630594D00FE1BFDF3BD391ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 91Y5vmgbIBvLxxSSwG1BQT/nEOhigh+nxTuOwmj6anJW3PNqlA/J34L7JpGSLwKo7JIZ3MULnUHhvBaZs+HQzzDdnMu0gze6Ave/+PJUBCLIR4j35ElzSZcjkEv9gKjRFP4cLyCjbAydtBZFjfILWibS2Sk18AwHQfomeOzFE8+dJy12C72NC0dMRYIgEM0478NTciuFuq+fle7DC/hMqB6gWzFSqmgIuE3e/Au5SK3Wbjm95DzQrpvbmtt0RTjtyNt5M+QWt9wYieynybQO4MWNSQtk/8TYYyrp/yprBm1riUnsEQknEuOmilTXfZV0Ov3uO3hDvzOCA9AjAju/4mGH2i+Us1ht2o17fAuj+QEF5I8SYOVdOIIXhK4NiZdU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ir4uxmwi6IDskQkqx7G4ftsxyJvffmbI5nDdNXrzTqL6WHi6f6AtVC3r0e3Jwi2UXgvtUoDuaVEULHyoEFl1eHLgsJo3Eo9P3qq4CQ2Il8cJI5VPvaJoVbQV+4uXYvK/1EXYAResqDmwIDSWPJaTQyzZxWrxXO31T7/bYdjLubqE2C0+KSSTLSbXHP25N3DlO4/oKzfvLzlU70fOFqPeSg40M5RFtphpfmyq8/+qAyvgl07SPPBX54mL/aJb1tmzf3YU0tSNYUhc2sdS+nSwsnlvAkzjPVSzqgMQPzGviMytNEpYXJw5z65sxcxEntaxM5Sy3FbMRFFexrPI3B1V+MpDJeFiplOp19CXb1fAFP57iCi/nEh27c+JcWQSbwpVp6pX7aEgE4e50q1nCyC7awQyH4scTj9lqA36KzXbWtx+xIvlURce6HwFwg8kc68I6SlR8wQN8/o+1qdWBC3lgcF3ilmxYt1/e6L4EpimEJHE+k95yFKAhVoeq7nbCevphrgzmRqZhGXL9NEP8phebz38eshQ3Hl0KNV0A6Ry/oAY8zZ6q4ZFsjZ1IqsFDBmVc+DXqQGyRJWtEtlWy/Aava/eMNxO8h/nC4z2u3y8BIxn3OH0ZijJDeaQNmiUOsqLX95OV5ta7yUU7yio8m0Ldw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5f0b7e-7e0a-45de-64f5-08d844de663d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:55:26.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xirjHcObegYLoN3gT1jUW4rkvu637yC59EGkgJpQ21sY09q7v5NzAvAUWN/gVBrnHJQrgPdsuEvf5FgFTM2HeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 12/12] regulator: sy8106a: Fix W=1 build
 warning when CONFIG_OF=n
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3N5
ODEwNmEtcmVndWxhdG9yLmM6MTI2OjM0OiB3YXJuaW5nOiDigJhzeTgxMDZhX2kyY19vZl9tYXRj
aOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIDEy
NiB8IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN5ODEwNmFfaTJjX29mX21hdGNo
W10gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdA
c3luYXB0aWNzLmNvbT4KLS0tCiBkcml2ZXJzL3JlZ3VsYXRvci9zeTgxMDZhLXJlZ3VsYXRvci5j
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcmVndWxhdG9yL3N5ODEwNmEtcmVndWxhdG9yLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9z
eTgxMDZhLXJlZ3VsYXRvci5jCmluZGV4IDIyMjJlNzM5ZTYyYi4uMTg3OGNhZjRkZDQwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9zeTgxMDZhLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZl
cnMvcmVndWxhdG9yL3N5ODEwNmEtcmVndWxhdG9yLmMKQEAgLTEyMywxMSArMTIzLDEzIEBAIHN0
YXRpYyBpbnQgc3k4MTA2YV9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykKIAlyZXR1
cm4gMDsKIH0KIAorI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgc3k4MTA2YV9pMmNfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gInNpbGVy
Z3ksc3k4MTA2YSIgfSwKIAl7IH0sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3k4MTA2
YV9pMmNfb2ZfbWF0Y2gpOworI2VuZGlmCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2Rldmlj
ZV9pZCBzeTgxMDZhX2kyY19pZFtdID0gewogCXsgInN5ODEwNmEiLCAwIH0sCi0tIAoyLjI4LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
