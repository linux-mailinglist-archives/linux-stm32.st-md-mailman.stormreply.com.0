Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DF24CB60
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:23:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDFBEC32E8F;
	Fri, 21 Aug 2020 03:23:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 464B5C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFLu/EnS0AIJ/RREclTkb+IGvDfqheetzvrO18Hq3GXMMSvHzBgYpUZHwuFJJxqab81m1EcXhDXAAJ05FhhXxznS6Xa/VfGCtEmgi54567rlsDmoXpoSwPfV7j/ZAESJo1+gWaWJ4+1rb3lCwoX3BxxHoqbsvdfzQ+8Jqz9h7oZtlTuGtbduJMHMYmj3L2bysn/pAR0kp1gRH12Ss5hO9PfguC+4XkWir1OjsMYc8xf+aEr4XxLqRQY7/ZHtpJPjFE6fr0aVvU+opsppkGC5TI9MfJ3sUZxd3OMsZ14bOTsEimSrLwi0nLnx36GAGUTmMcFfbikSbAI+jAl7SCjeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTw5Ibbu23x/dtBOWV3YGwBoBdt3BnnI8d/c5cCYjSk=;
 b=Gy64CZoNrjlAfHXDyc1TnuCxFwgjy7hKsdKwl660POB3sAGgStvp1JAyKuKJ3RN5pEVOV5ypkozejca1Wmz4V+YN4dY/U0fL4uK1nGem65StKzOciLyNuBGPPDeFQQ0CMR31J+fjMknTrffMIFVbInCEXrhSJX+wJXIuMlHX2hQ6Q6/qfCGwIjMW6GVphorucdnk1rMhXjfPcWYIMTaGadKfCRSjDd3U+UBXKySsSb3h65Pq7+uuIZub30/LvYoMNhzZWaeq2uBLkoJav/BNueK8DMYnrn4expeG/b9uaWBPzPkd71W6cLyM1nSdRGZqe/y4hp74st4Wa65tz3/J+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTw5Ibbu23x/dtBOWV3YGwBoBdt3BnnI8d/c5cCYjSk=;
 b=nNzG8qHoFwt87uctq3olGvI+gip7hD4kI/ezbSoLfmcjmYSIQrjzQ+KCVC1lsngS/x2kD4NmHEKcYm0J+SN4NEqBDY0UHE0sZ+7WEMJVSPK2KnVb6Yjhft4n3o7g5HUnC7pcdTDx5gBI1WUcoYFof3Zp5CNGMNkdnqA48TRBRt0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5308.namprd03.prod.outlook.com (2603:10b6:5:242::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 03:23:50 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:23:50 +0000
Date: Fri, 21 Aug 2020 11:13:24 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111324.430fe1da@xhacker.debian>
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:23:46 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999b66c9-f971-45d9-4ddc-08d845819f65
X-MS-TrafficTypeDiagnostic: DM6PR03MB5308:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53080D29D6FF94437B72A070ED5B0@DM6PR03MB5308.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNCevzQNzizapUuqTeLogCDEzwaFP7AuB8o+wXELnILOLnN0SXpLHWL6zpyE6TO7GMIOpn6qxct/qfwYhuEPLQ326V2UUYE0rfLkmfWOwP83zqET8McMj80qRj7SItr7ddBmWatxNZhIzYrw/4d0NxVJVJ4YrzeYs2xxVrf2ks0+GDO4JurZXqTq0vfdAk8996OiTu/1RckKHnZl/aRsNVjZU0JVIcW1V1cOVjfo1WdoytgOjQI97YZkQXEYhp6lDxOWuvKoy8b5LrPx0NRbC1P1dqrgLbd16yWifbbppcwZFwrI6vl8XvoPjnvkDMHNkAQ7wS+3ttsjTU9pyBbPWgB7R2iYTdvSq12IiW1Xmp92v5UmiI0OijU3PY0uAQdk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(7416002)(316002)(83380400001)(16576012)(66476007)(110136005)(8676002)(86362001)(956004)(4744005)(4326008)(6486002)(6666004)(26005)(186003)(1076003)(110011004)(8936002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xSXpR6ywMBNQHXatqY0UW6YvkqdfZKvfmZ+bgYDFQqS+otHdzqnbUrfJswEdGaO8znEjwwBa0n6sZ0rSwUdKboOyPKKrUtkS+FHQsl0BHftUBIIK16yG9UojYzdkIwJjoedufbT/zBQ+iMVzMNy+jkkNw0J55iHGkjTX4ZFXTxjhyWBl5rTf/OAf1ryLSZyztKBzBCsVSqeCvgLOsyFaWn0hX6S5iCX23/pTCQ0gKky082Mz5E393MDx2U/GDWt5H73jAgk/p39DzoWY7wHkvEsLnUa3a2A7ukts9B3tuwJ10YQxUvC6IukNxjrTJAFX3ogffX+LWTr5FwKZRv63gVnVLqBlliF4TvJUFxzeh9/NTEPIIfu9xdC4dvUGb5PwQv/pXaaMbxT2CUnqFnxaMi9ms9t+ASUbybwq50Gry9gl4jE842GZ3iV4EFvyTa4yTM8WxriglNo9AeTy5ys4tDVVRuKY6k+VILbbVQ8SmS9bQlPdYkYL/l2agmA1cJATlUsvQMPMb9iZOcLCYyeM4Nrj3JihFkxx3zs0n9cYArjRELnteRl7/COb9EHzO6pMZA2jPf14WAGbw30nFqi9cTeuu7J5AxPnUkK6HF+PXwFo0lm4UWcWg25G8gbocSoPXVbKYGBTH00TufKwQtFsAQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999b66c9-f971-45d9-4ddc-08d845819f65
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:23:50.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU4uvaOAkG3OAmSDjhzVquzjwYm3/lIQANP1fO98dDIPf7kzF+qYJuZOmEvZ3lFojIh28jQhFwRLnfUVc+FASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5308
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 03/15] regulator: fan53555: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL2Zh
bjUzNTU1LmM6NDM5OjM0OiB3YXJuaW5nOiDigJhmYW41MzU1NV9kdF9pZHPigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICA0MzkgfCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBmYW41MzU1NV9kdF9pZHNbXSA9IHsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYt
Ynk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KLS0tCiBkcml2
ZXJzL3JlZ3VsYXRvci9mYW41MzU1NS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvZmFu
NTM1NTUuYyBiL2RyaXZlcnMvcmVndWxhdG9yL2ZhbjUzNTU1LmMKaW5kZXggMDBjODM0OTJmNzc0
Li5hYTQyNjE4M2I2YTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL2ZhbjUzNTU1LmMK
KysrIGIvZHJpdmVycy9yZWd1bGF0b3IvZmFuNTM1NTUuYwpAQCAtNDM2LDcgKzQzNiw3IEBAIHN0
YXRpYyBzdHJ1Y3QgZmFuNTM1NTVfcGxhdGZvcm1fZGF0YSAqZmFuNTM1NTVfcGFyc2VfZHQoc3Ry
dWN0IGRldmljZSAqZGV2LAogCXJldHVybiBwZGF0YTsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgZmFuNTM1NTVfZHRfaWRzW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCBmYW41MzU1NV9kdF9pZHNbXSA9IHsKIAl7CiAJ
CS5jb21wYXRpYmxlID0gImZjcyxmYW41MzUyNiIsCiAJCS5kYXRhID0gKHZvaWQgKilGQU41MzUy
Nl9WRU5ET1JfRkFJUkNISUxELAotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
