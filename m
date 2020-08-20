Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9424B06F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:51:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C82FC3FAD9;
	Thu, 20 Aug 2020 07:51:53 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B5C2C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpFZ/lHg6fh6FNOZ8DQEiusROr7lhERNEAzSpk7qwMGyh7/BDs8AgBkBf7C4Pge0CY6qfWSfrK+WiXET7Od7NpTcxhRBiyKmY/QXxdwvI+5PtpdaKpl/Q/TiyeUIpvOWmr1JW+9AaB6Ru3ut+Uc7hlJALIDMHTzRv50jtpB/7zgZHarf58FiK7ImBMaCLWdl6NU5Yb2G1hZsjKVMEJ21Mq5ZFU5iihgg8yGSSjBnXbkgM14zm5M2ejVPi5NjC1Boxs/o5fFDtOXPv9MybcR4LkKZbvmY8sfagcOMrgQ8q6FL9OpptQQkuXGl0u4koed67jHxlpIixcuXOK1okQ+v2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6r3a7f5HXta43l3bKvwm/ztY7DNODH815tZybl7iU8=;
 b=LpAPsWc/rMQsgYZV3MXF2bWitjzE5C6dXqyvf2LaY3lX+FMYlNhgUT/ZCi1r7FbhrGFhE8TRzUkqawpHWLCwqOt7eiwTlj14nl3I4iaiOnVkeffA6Cb72MSHATzf+hyFEwXM9Ebeuv466qbQaUGB593Ag0Z4kwepwlrYK8tWk4YGii8HlmESlW3AwD+FY22kYGZWiFNR3HoVSi5yFzqgw/mT4y9ULK49oOn7p+a4M5Yt+4SL/kG17vlAU9j9vciyuFBQlN0ckmD+Bnv/fB3IoxuPWO3dTU2B1FZR2Ios3qutLbCibrCExlMKZKTItIS+7tm7aziE4VYFAjGdypg7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6r3a7f5HXta43l3bKvwm/ztY7DNODH815tZybl7iU8=;
 b=ZJj2qSa7YpQGZPYdbd4iIFy+Lc93+ctBEzl9ED0ZICFm5GGh2BSVFE3wsrzWo+pJiqeACc/BnghpdLmKxrQv+UIIEO7icf2lTxtkd7Ze8ATNA+2JL+U3v+0zGQZmPksdazOSpI93WUECpspD0l11LV9Qwbw1hQfdp4tLYqhGPOw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:51:49 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:51:49 +0000
Date: Thu, 20 Aug 2020 15:36:15 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153615.352947f6@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:51:45 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11172cbc-63d1-4e41-f2c7-08d844dde493
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4563B3E97BBD373C9C6B3EFFED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mH0ydswDHdNYylQwBRv75mKUuCWrlGXV0i2byJ178GNHZso6tFTnBrmez5aSXrrEHn+BgeJ3v7MCvFNrt4gdFdVrgGR+x/+xXf3Bbo+9hGDN6BHgcjVoF7ciWcSKUKqH2hBIBIRg20wUPpxyxkFlWkl4TgF+rt6+zIOOrdHvgUinkKjHB9w287zc2yzYRn1o/jlFSIpFC/gekQCQa/31UlBaiEZNALO3oE0AX5YcjgbRY168dcQq4LdsX2y2+oYMi5mGjHOxFrMP+VLOTjx88QAc/A/jliA1dlU0oDToaKlzFgQ1RBtGhgMaitXPlb4LIBNIkMrHXxBxiKK6xfIRgWfA5qVA9gQMTgY2RShqkXhF0TtCiXUdfCnp0s29T/E3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6NFwbL6CJIYazAISo/bnG3r+Ds6Wg9sfYCz03SHgYnOFzI82O7XHLHkH0jYeV0IB5P5qAL0w1AvoHMU8irvoY4P2KLdL7rLHwtLUEWYgDMKaYMxdvfdmoqsAxEQ2ZmTDjK6wM0gkDX9/sEcbKcLLdZ7ZcyeC2v6VvBNGzpBomo1Jg/Ff7nT10E9KAd0KDd+AzlXV0+OLBso3z5kb/r4HKsUZsCjWzj1uTgUoRgbfDYjl1pse6mzU34Q8JyuPei9JrQktCWre+B00VtqD8c2537PzF71FeUcvMUVrNamVT9Kv8R1AZekirT0XB/rXL5/TzjBwkZDRNt7/0PFWMAZONcwR8bqpPWrW/hAEJWBwjCrSylvXMe0t4SIPcXf8Xy/fYPXq+Y7rIswPgBgNJ2BGulervlD7oPV9+EUSSHvdFS0KIJZfFpAFDtKaw5ZWCXd47Hh/1FwQH/drQfvcniyEVvrE/GS5vQbrnaY1/gGvIaIbQvlObqvMPJ8NQ69bbmmTTkd0NMwTRIeMFqOpAXLO2dHd24rPDdftDrvJ3RQhWS2ZzjnYqwxeSDYpTgabxtn5tXbkDQUgy7U+ClvlL9siaJFSTwLNRMW0Hm9uvk4DBpnLzA91ARLTvNitphV6ragWndNXg7WCDY+0lO7W8gz5cw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11172cbc-63d1-4e41-f2c7-08d844dde493
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:51:48.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGPBBTSz2wThhp54meTkCN2myFjZ5Pesw18aKK/dEuJ4jr+rqzNJydq/SnX2Z6plgzndecBPQwIq6/YFkT3D7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 06/12] regulator: ltc3676: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL2x0
YzM2NzYuYzozNzE6MzQ6IHdhcm5pbmc6IOKAmGx0YzM2NzZfb2ZfbWF0Y2jigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAzNzEgfCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdGMzNjc2X29mX21hdGNoW10gPSB7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRy
aXZlcnMvcmVndWxhdG9yL2x0YzM2NzYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9sdGMzNjc2LmMgYi9kcml2
ZXJzL3JlZ3VsYXRvci9sdGMzNjc2LmMKaW5kZXggMDkzYjNlNGE2MzAzLi4wNzc4ZDViYjc1NTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL2x0YzM2NzYuYworKysgYi9kcml2ZXJzL3Jl
Z3VsYXRvci9sdGMzNjc2LmMKQEAgLTM2OCwxMSArMzY4LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaTJjX2RldmljZV9pZCBsdGMzNjc2X2kyY19pZFtdID0gewogfTsKIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUoaTJjLCBsdGMzNjc2X2kyY19pZCk7CiAKKyNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGx0YzM2NzZfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21w
YXRpYmxlID0gImxsdGMsbHRjMzY3NiIgfSwKIAl7IH0sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgbHRjMzY3Nl9vZl9tYXRjaCk7CisjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBpMmNfZHJp
dmVyIGx0YzM2NzZfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7Ci0tIAoyLjI4LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
