Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0A124B090
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:55:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34458C3FAD8;
	Thu, 20 Aug 2020 07:55:23 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA4CC3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBW0Qm/523wbbtMxI4KWgnwZmWElDfDIk4DAmAmn9l669E5lc3pz7nB8X4eyTnM1ix6D7NSblM8LWjdNMKXZ+GTR5TQj5IWLCzRhqdU28/eDrZShcz22c/sabSNV4c+0ZkgbgYvd7uLNYdZb4DkhZcrq6HO+I9EbkcNqN+IhWasXZ4+9P/BedJi+fmZfj1LzYcBhLWTkmz9MFGB+N2JGMMXIx0OaQZR+D2roaxYVD10GV2Bl7bRCb/gK9TTwA8w7JDr+ir3Rb9RGEbR9p8tObgGfbRip4qwRhKsSNCkttAUtwQLlkjR0/w2k3q+cmt576U4xaeAngQmbRF6W2635xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3zdwZEIEY3QYW7SGpQYmAMFrLLvTDP6gpCky+gDaWE=;
 b=Wg7gtw3Z7YilNOZQeAchoVAojKo4BbPxc+re0CQKzRid/3Wgq6SElGOYN4vq1Ql9XJRZw7Oaop7/jAaGmUTmHdag7fgfyTSYNJAgDAYfvxccpXCtTHgH/5Rtf6/G+vxfk7YRqPWP68cY2klX79EPc7ECSNmNDgjSp+bAN32KyZA+xOwRHMIWM7B+3cGS/+joAQRgANpPg0zm2W/N3V9oInGro1f8kAJfyjwTPp37HtUkB0j/mPH0zoCQCGg/Apu/g0ho667TcUOP/z3ip2h/Ac+LOkdASmnolMxFe2GeVp+OgyPDSt3vyhTcQHXpUkQEhZmU8qVcaL89lcXyki5Yzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3zdwZEIEY3QYW7SGpQYmAMFrLLvTDP6gpCky+gDaWE=;
 b=hbfQDW7cck1d6pmGNKRxjX6twkLJG46OAs7MVO9RfFKOJDMSmbgjwU0BMqHiC6djT5W79FvfYQ5YtuoAweoi5O7Er03SU41Fgf5moHV6JCZsaznUX15NgEY7wdwV33XHOeO3pUPdJtuGNM/bijJwJiOmG5c5C7o0SNTJC1VVxz0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:55:20 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:55:20 +0000
Date: Thu, 20 Aug 2020 15:37:00 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153700.21be8ff4@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:55:17 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53f4a4b4-d5d6-4990-5fbf-08d844de629a
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4563A9CE13267201B4AEB6FAED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9le9ZTYwdlgs7VKCacD0J7pDyRyw81FV+y3OA1OJGtlD1zwgHJ/HvLH6Kh1E6Nmivkbs59RglAzyQhBMeC+5ofxqkBYaoBycsCXzDrBOojt/XJ3sSZBgGfI9FBdAUN0Kkjm5XBo3geL1kN6rsjOepD40x8MDKnv+Xbop47CC+kchDADE6p6DtM5Oyrg3JsEo7R1i6R1GK9iK2qY8//EwuFVqoUO+zQzwfVa+7lWgIO7QVzxZ//iNia+TV2dAXJjndm3PmcotxB4A06uZgKAuGNrg4Y340IbH0wYa2rYBSWpeTq/QG+4KorVV7/SGD9hKo1HEr574mKOLLCOsIw285FTYdjiFnqO1ptqDs99/K49FvhiNFdNqP7JOL2iRsz7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UmCF4udFDTyQmvRodyyfDvvVOHlhVOIZhgPfZM2bg92dryaXfHc3e0s36YdP3FbCDhhhiE2D72kwojG1ZzCB/CPO6efXYJDEyCOafLEMW9THFe/Sct3/sxOHzdBmkQcMJD07Blyh8HYXodofqN3HQ4vM54zJBx0pTFti2kDq4EdGBIcsQJfD1ONIoFO9KNjXe/j0AfUWCD7WBcXfOn5eK7KDVoMDx2gG4SjDnIp0TScOET+ZPByu0KO7bHBxn79JhRFZF/knnJlOiKLqoaqsKAfAWOqMI1Y00rU8YaeZKhxQM2kFLPT+Idt+Dd23LiSeHX7+xatgVmfJROxsTaNMuyqWruf9VAwfezHUJO3wchtx/RdGfScdjx7ONfKme8RFkCb6iwMbp82lqEmERx+pRD1jmU47P8ySQnveB2PxJ9P0xTFxDeYSagcK5UUk0QBVLfn9m8/elGgXqJvOhH1ZMcpaE8xEMydPedrfcPzsEglUqfyy+G5/n6nYt8xq5dH58SMlFM7XpYNRZmyYdXalghTR69ZwakxVLim6p/RPLiGqibFZfpTe+HdKRoz2JaYrF3jga5KvaE21rvCtNOmraaj8Ok2/9QN+rnI0VTWWV8zgmf14P0XLKYW4CMyuFhbLwC7PqXY0uHExkkZb4NT1dA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f4a4b4-d5d6-4990-5fbf-08d844de629a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:55:20.3336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvrZsZjJnH3ozfg+uNQrEf/0de8fEhL4r0dglJg8DOBpuyzip1EKDDH6iOweL2sE0oCOq4sL+2ouS1pj9M9vWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 07/12] regulator: max1586: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL21h
eDE1ODYuYzoyMDQ6MzQ6IHdhcm5pbmc6IOKAmG1heDE1ODZfb2ZfbWF0Y2jigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAyMDQgfCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBtYXgxNTg2X29mX21hdGNoW10gPSB7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRy
aXZlcnMvcmVndWxhdG9yL21heDE1ODYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9tYXgxNTg2LmMgYi9kcml2
ZXJzL3JlZ3VsYXRvci9tYXgxNTg2LmMKaW5kZXggZjg5NDEwMjU3ODBiLi4yZGRjZGQyOTA4YjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL21heDE1ODYuYworKysgYi9kcml2ZXJzL3Jl
Z3VsYXRvci9tYXgxNTg2LmMKQEAgLTIwMSwxMSArMjAxLDEzIEBAIHN0YXRpYyBpbnQgb2ZfZ2V0
X21heDE1ODZfcGxhdGZvcm1fZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcmV0dXJuIDA7CiB9
CiAKKyNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1h
eDE1ODZfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gIm1heGltLG1heDE1ODYiLCB9
LAogCXt9LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1heDE1ODZfb2ZfbWF0Y2gpOwor
I2VuZGlmCiAKIHN0YXRpYyBpbnQgbWF4MTU4Nl9wbWljX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQsCiAJCQkJCWNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppMmNfaWQpCi0tIAoy
LjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
