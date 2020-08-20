Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE624B077
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:52:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2DB0C3FAD8;
	Thu, 20 Aug 2020 07:52:18 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A2E0C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:52:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIo0ukr/tZi05K76JZSmoAXDJM9l/GxXnneXpHxlt0Sv4/f3lDEWf9l/SSpNtzGJ3XgsgbPI6psu36lUaFjKJTezwnXwORlnLx2mRyiPoSImFtoFI78sKk6Ydvb1rqJ2Z53zQzd5lyR5Yw6CkN6okXreYaphLfnUlOXm4ES1VptgxQzUFHMtSiSYDFV0vxjtUCi/LWcA5xTJcwXNcHI4c7dxSqMu/pkaCusxH/EzLmHRT/iOMGThgo5PNZ4E6Zsl260H8aThuIkNGIIhflVAcSpfSeG7k2pme9vKNHNRYxpdS4nlLDaMjXyVwvR8/2D0qfFVkBNnEtVanONgOiQcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jnf3nmAMf0jniAlfsxDeUj7QFOtbRyfP2ALd/gz7Q3I=;
 b=Ch7De4FjAN1XBEDUQWsKEpCcMunS97E80uPIiPCQ2ePVOv7+wIlCJaEprx0YKi7RnyqF0+8nuVD66xFVsRGLuL/tEERVTv1K5GWwcLKDfIoA49CrUezzfbrfTQ8nru8w/tb+AYnfzAZYXUUhqGD2OnWHa+wkyfta//OuJ+Bti6FYNlAupfoFUyM7vMr/3hzop/FTTdqZ4IrAPCJPaVEXm6sTghQmZtUyfySup4QHn6JK0YWVQ+8omeWLyv9fUluiJ8KHpGsGUB6a52niAXF+quXhjugcap8ndoEDgV+S+g02IgNuNLv6Lt64N5V3m/7JvSoJ+QzEd6OM9pT9WDoNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jnf3nmAMf0jniAlfsxDeUj7QFOtbRyfP2ALd/gz7Q3I=;
 b=Ok07fS94C5yZiSRQ4f+F/M5OpLbpfIEuEY5B9Th5fvWxX9HMOSriVwaHI+o1C0KPyivHSRspDGpHGWFxw0ORv2do1RMAucsTwKtBqqSicYxvNXLLdhsVkQ6TpqHbu/tI65snHCmvI2bsDOGDAU40YY7mVeKneFXlYXFz9L2DhV0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:52:15 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:52:15 +0000
Date: Thu, 20 Aug 2020 15:35:29 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153529.4c658b61@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:52:12 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe96ed47-9148-4f02-b77b-08d844ddf486
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB456311CE913E16AE319CE9F0ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6RMGkcdO4Wi2Riv2nUnxv8ch/SxXlz9lYN6KnOusJnuPoXy13aZzw9Xdw1G9dZCjYRdgmJ+05deI/9jx44bbnhrf7EhAjNJotB5c5PY5F5rbfoLlx629DUBtXQzS+rhEtHXf0PrjZPj6UrZshWEZPLEMMfkPDYYCKoWtmrgGdsMSSZ2H/ybLXVfdUo3MVowo0ECBNd31aJtV1CwXkskOB6bpJGeM8X/Gm9mq5CGG6Y6Rgd94ynsu3yYIfStY4VxmuWDgz6F0er6GNHXM3WfvHPnPZ3RmRPq/lxBTcnvCTUmb/EM3xPlH5cDObUfg2vw9EUL7MBR5hVDOaQQGqzo2VdK17tmIq9J+FMfjsm6n2xVfpYjGxA7ygN79nzLbjK7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WlMz3vbJRachqM7TKXPoRtWPPzuD4CA66FvHZ/0yKGdMBvsYFZGyXn3eL5xD/lYj1BVpZs7CoQYFgkyk3i3RFgzQgCRqcBwZEIMQZHaI822FckSPoZ3jSBVaiwbTrqx81njRlhu9tzfbmvKVEedzz4fJx3qGpmuPNvtdxLRE9ZlGJvVg6hX9i/MtQLXFefP78hJaulDwZ3LqW3LsfyKP02BZ219oFJ3bKDvyq5YMlcSv7XU4Q0EFT8QmV4uBPHKcEW4eA4Ns36+SC1ZzlcwoXikUvbAs3PyXCFtL3a4Mh1xFESDI0+piGKAWjw6szEo06DXeg2v5dsOmDQonO18nn3JliHVFq8CbNbllf716tCBzXZAZxa51s1qZUoG26a6okA5zjwe+IgP7+cqU2DBs3x3qS58JUJX5+JsiEjI/urSzebxqhaNk1/x4EnkkwsPRLRLJUgp+ydlbYAn5IvAJlt2LhCU/0FUsVO2mAnzkeS1fbvk5ZMx0jrSCSFkgdoeb+UP34Uo6oIEAKpBWWlC94KjBS4390z9jC0bwGhNV+1zr88YKvvbnOsTsCDJbAt7813Dh92s1ZYrG89CUeX505Mlp41C00v/qMbITiax2nsPfsJMK21e1GdscFamN7ZTGANwHQXqNBFM7VUuWKTmQOg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe96ed47-9148-4f02-b77b-08d844ddf486
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:52:15.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQbEZZXAvKkL9d0Pty4QjXLw1IwMzUlKDBSUOKTwiiuUQ+Hg5ZdqIAvFgC1tRTh8HwIlJ7lwALbkgv3ilKGrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/12] regulator: ltc3589: Fix W=1 build
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
YzM1ODkuYzo0NjA6MzQ6IHdhcm5pbmc6IOKAmGx0YzM1ODlfb2ZfbWF0Y2jigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICA0NjAgfCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdGMzNTg5X29mX21hdGNoW10gPSB7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRy
aXZlcnMvcmVndWxhdG9yL2x0YzM1ODkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9sdGMzNTg5LmMgYi9kcml2
ZXJzL3JlZ3VsYXRvci9sdGMzNTg5LmMKaW5kZXggOWEwMzdmZGM1ZmM1Li5jNzMwMTBiYjNiNDEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL2x0YzM1ODkuYworKysgYi9kcml2ZXJzL3Jl
Z3VsYXRvci9sdGMzNTg5LmMKQEAgLTQ1Nyw2ICs0NTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgbHRjMzU4OV9pMmNfaWRbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RB
QkxFKGkyYywgbHRjMzU4OV9pMmNfaWQpOwogCisjaWZkZWYgQ09ORklHX09GCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdGMzNTg5X29mX21hdGNoW10gPSB7CiAJewogCQkuY29t
cGF0aWJsZSA9ICJsbHRjLGx0YzM1ODkiLApAQCAtNDczLDYgKzQ3NCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGx0YzM1ODlfb2ZfbWF0Y2hbXSA9IHsKIAl7IH0sCiB9Owog
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbHRjMzU4OV9vZl9tYXRjaCk7CisjZW5kaWYKIAogc3Rh
dGljIHN0cnVjdCBpMmNfZHJpdmVyIGx0YzM1ODlfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7Ci0t
IAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
