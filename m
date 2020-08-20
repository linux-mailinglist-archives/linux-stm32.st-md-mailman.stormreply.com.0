Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39F24B075
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:52:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9AAC3FAD8;
	Thu, 20 Aug 2020 07:52:12 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 981ABC3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEvax3OKoJTWma7pjLdCrjEV6VveqbSp8ReDXCGdxL7RkxTcN4PnLdMA7w3nyZcuwfVhgmhqqloNtUAxVT8zq1N0uEWZFoFPRS4FasSorRzDcT55zaN2B6fU0Am5G1XOzkQ1/wsaZTvaLmMsdaalsvQvL6qS1tgl1JkRNDoa5uNI+qytQCHTTj4G6qHr2z9pbnS6ORPjcLqevI9bxgzJqMd2SGNYVsfXw0k9R3DdtPIm82xyBm4Tu3MmXUhdCSBYPonvL0NSp+PCb0D3jM0Iv/X8YZY6lJCdha6J41lvKDt24IiDFpRpxAv23cr/728q5bDqfpk1cf+AKiB/vfmT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf9elrSMrynWeCwBNS4UstmD+7omgZ5RHNj2u7wXjT8=;
 b=ExAa6jS9qS579gDg/61/ChrjVVR+XChcT1R9+r5hHH+r57jIkBpBPWalsQGegqnrWV+su0ZEBqEKyAPgf2AS+izRdVjFSxDg59Qa5O8SldIYz8WunEg3BnGcWm+gVhBEzbZve06yvsjHD8xoU6zc1X8MQRI8rNzdHE30SQ9yTJ/bLfmyKNcgLDqCbMIPHtpNjVJSNfqdqxVxYuay3bPzCiRpGROUb/N2xLFfZ9XwLOxKFBZHtOoH/BOjs50gMGg04G55eIj9m28Si2V0Vs1NWYTvSoOxMlk/u+EGYUcNSLptapLEOle359p2ipWnS6zfRZp+FZXyhZvMfehv8G44MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf9elrSMrynWeCwBNS4UstmD+7omgZ5RHNj2u7wXjT8=;
 b=j+oSdNVPLrtSgLY6misxjuOJ6UjayAp78mtIGcbL0Dl/gH8kroKKnC0mldi7M+Tuo9RX69qmkb2sVi80+lk/xl6G+NSEa6BCnLnVxWhHPqH6oQEQ31O6DW/Ujv3xuZi3w7XzKC+r9XFDwxYpg2bQgsd8LWQJE+MVJq+9sxCA9YU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:52:09 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:52:09 +0000
Date: Thu, 20 Aug 2020 15:33:26 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153326.4dc2eaa5@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:52:05 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bad55c1e-41c3-4b62-5b7a-08d844ddf0a1
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB45632985AB0717FC4EEF3D80ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5expQg5fpK3C9cZWhhtaQwcbguhjTYvt2pe3RmmXoN/8znE/gRN7lfzQBg4KCtFhyVjcJUIsuv1HJ9txOKTQcoQeHOOawJFR+GLQRw7TPu7hvWvQiK0eZ5+GMfVX7nqU1X6RydLnQYn4gLnXaisIB96zxO8YQqvP7nDXw3YnjYNQrPkKkT1/oUGvfbLvQ7cbkrM1KWcH6BCBVHWmF88uNYNxwCtHgI9iQtf5OVFQKsa9Jj6rZh+6LpYETe1Wn8KftUqSMb3guuzUgVW79aS522XMicY83vYB6nq+aXX4JyiF7uIlOTPklug+ka6jXkRKoT/P6ouIwuugg8BI6Sp57QO6IScjOyDVhC6zzxYVPw/CI/zpoL5H/Yx5hayi+RLJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: k/Znn0rBnP/azwhf0RXfIqIsf9arQ6mV0//KGYY77Gj/1u4rYSTCqIYYFAtHDqd9qmtZgT8XVAHhfO+OoZl3TwIhxKOjx0w3c6dRS0toAJ1gJZ9QtFLyLjNEgVoZcXIHFbntMqXOxot6FjwX2nKgf0a/XanSyR/VUJpxIJfB8Udmh0tpGfHqQDQ+k2QA9SnT0eqioaNKS5fcNxE8rsgp1lteay2ztYof9QH53F6A5BWRUHr1Nb746uHwnj6gzo1rovD2a6yN95N79iJzxfn9tMiGHQdJRN3N64GwyUT5Zq0AO9jiQV2prJ8THL0ZEqrOoqNIFj9mt11UKW2CSdKnxHejkzzrOrpe0mG7/X6/TWEG/R5Q8palvjd5VS+P8rzlEAee1cyfw4+FaN4wvTVIgZ3Upfgc3flqPB5gAh2CZIoToFV1gy6rT6gGFujY5prGaFUx5UmqptbszS3184dIgGFOBVoO0VUhP+baE/b6ep2tlw2YTq5Ap3QbQ83UY4cX0GSxMqQ13o7hcGQUXlkZyhfc8DB4Z0YtGPZgk3A2pQX6ykK1UpE1BSZSVneaZjJBym98CH4nLe6T/FPsslr3yQVjVw7kX3Hk3uO94KpoSogVp746dn2EJHy06bGB9mfdX6vTl0yZG7IlhwRiTOskfg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad55c1e-41c3-4b62-5b7a-08d844ddf0a1
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:52:09.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzsXlWIZBN/YNVPyjhzi4bjfdR2t+gAIvpDknmAbcJTM6L6e6u5ZlA8JSdMUtpWsmnuHBudNeELjDET4AIPh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 02/12] regulator: da9210: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL2Rh
OTIxMC1yZWd1bGF0b3IuYzoxMjg6MzQ6IHdhcm5pbmc6IOKAmGRhOTIxMF9kdF9pZHPigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAxMjggfCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkYTkyMTBfZHRfaWRzW10gPSB7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRy
aXZlcnMvcmVndWxhdG9yL2RhOTIxMC1yZWd1bGF0b3IuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9kYTkyMTAt
cmVndWxhdG9yLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9kYTkyMTAtcmVndWxhdG9yLmMKaW5kZXgg
MGNkZWI2MTg2NTI5Li4yMTliYWVkODliYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9y
L2RhOTIxMC1yZWd1bGF0b3IuYworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9kYTkyMTAtcmVndWxh
dG9yLmMKQEAgLTEyNSwxMSArMTI1LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkYTkyMTBfaXJx
X2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKICAqIEkyQyBkcml2ZXIgaW50ZXJmYWNlIGZ1
bmN0aW9ucwogICovCiAKKyNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGRhOTIxMF9kdF9pZHNbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImRsZyxkYTky
MTAiLCB9LAogCXsgfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGRhOTIxMF9kdF9pZHMp
OworI2VuZGlmCiAKIHN0YXRpYyBpbnQgZGE5MjEwX2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqaTJjKQogewotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
