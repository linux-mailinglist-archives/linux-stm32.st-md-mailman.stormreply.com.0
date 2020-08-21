Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D734A24CB5D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:22:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A04F5C32E8F;
	Fri, 21 Aug 2020 03:22:49 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBE47C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5fryBS6zXa41PRphOMR6X/0+6Ja618ChGjFUxLD6YQXWPzLEjwUnFePJHnsaHOt1B/EczbVk0mn2pTfNcHAaktdiqv9yZaCohKRntJVyF3s6R9zsY5NPMdtufBjnUo+B/ksNmaCR2mPjgR1cOIpExRI1v10EhnC36qzTO0FPptlaz2kcIM19fBzKzTu6u7tEug4Esq4h8KecV+tmdQ/gDqPNebOhljEnI57IL3bhLGq1GjYTtjvNJnldE/kIN8KiSqJsYWUpJsRdqJ0osEgW0dXoBUDloJAihMFmJ/Nk6S03rLZ8bcMMcKeVYYiRA/ExigsfzUkEaOnMkSjl6o1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4TkbuXwJ+GIOsk8gxUaGl4+aHu7taJ1o09t3D6xLP8=;
 b=gNugHD0TYNfa5ci6/NyR4rxk3gbCcY3LQj+E+p2hDOppZwR3CO8w5X7VeY+OHICepbxvPiS/AMLcZt9t0GbJPZGnTZ4WWi0exrI2Zqdpd9LBGOSx2zD9N4qFT/EjTk3IShtq7xaHl4U5+MubH40PNNnLlr532xohKvqAnlm+hEbbM5vPhUqOKvuewt7dzPeerBiCgMPd27+rhcOjAGYo5TiTgjyhBUqWYfM/bdyLtY6ZxVuYwHfffZtlp1JIAkitYACBRtE5poj3FApbCGijPP6l43d2yrg4PsNgu2fDTHybmKxl2f74xvUztntG39XWGKcZCYZjM2cmkziBkwz2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4TkbuXwJ+GIOsk8gxUaGl4+aHu7taJ1o09t3D6xLP8=;
 b=jgSZs45EzoIp2vzp84IL9BdHGoOpWYMktNgFNIq4DFWT0I9ekQhkJEVmJxhH5qW8GpQDsOPzbdoU9fCfgNSh8nkfnIi+bvMFxpbrrPnWpnMaGDytXN25LadtFmHS1309jn50eFFJPybB/8p2i8C2R6U/e8910TMpqgtsBqUyjDw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:45 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:45 +0000
Date: Fri, 21 Aug 2020 11:12:10 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111210.0a0bed94@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:41 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f78c2a-0058-4906-d308-08d845817897
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617D28456FF7C59339A7B35ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLhYUulhkRgyNq0sWyTKGwEnj60koL4Re7aN8G0RxX+1mWxpz75YJJeZX48TCG64J1e7lJjkJw/zLU4WLWpCc8dUPPH9wdYDnrZfEPmg4puJF0i7ekgncHyxVnkVXiu2GKBMqLHyBaystEcVhJBW0xRsdg2Yv6/Xqgt0P/ib+x16Inp7drEaBa5NJyW9XV4++c0Eqru6SMcV2ngVfFOzNXxWVXOV4p78fAipgWL++xnBQqJdjcXJq6lZmzK2VyPbKP+SIZo+Y/c90le6XxiLAkZrzmPxcQZnNIvN0ckqR3PW22s+daI8T9EcCWimVJAmiV+5lX6/rNgwr5bHH6nPw1DzQzOMKTkjcxl1Y3Hg9jTNEZg7QA8vsZFgqaaX1B1K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: d/EzE77ZHjjq05LdNIT93jtWiKc46AHtIwhPFtnNzok1AojEn0MqH9Drcf4503L35IdkodPtnXkxrQcngPFA9IsD7XyFIV4ma49/8aJEOK7/8GlToWFa14t8hdzVvcbQCyogZljbapL9sWpPqiPgI8dMkv2BFWvp67FTTEQLCEYfLySLsBnygIr0iuk7gXtxlIIKGlml/v1CQElmk5fNx6nosVHQiTAHdZ1qqBmLvbeh0eogNgKlwaU7DFm3Cxu62nhyMu6XEsf6mtz5mx93qadnkxZLs42Jp49SIe2u9GMnM3G3qR6LyrFm5p/sTkdOv2K8aHCGMCAEfjO0IuezAZCwuMBgNcn5CLU8KhGcMIRToF0cvEGeAEQ80vdogR0jSDtRcVBJbzpP5A3rZ8HYmF0pRe9vmOpD7wPIglgztBX1ws+zzatFh2hJK1ip3S6TLZ3ie1Eh3WtRKf1CK5MCT2C6BdfXxlTGAF7YLJX3wCqDAVopwGxjgHDCafNJnIUQVeldAGzJXhkSXZHEomhUI5MZfTDY4NuttsegkFRQcxgOMfmRQowoSQlMeSHsJP1RP3aYN6WVrQ79k0kyHTes0AIYw39femhaeX7mq4sIUMWxhIRpthN/g6tDYk5tsSAXKXTDPm50J33dKcqfJK6q5g==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f78c2a-0058-4906-d308-08d845817897
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:45.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khxxMgVT9Sj0aCJ4Yf8HZ8SpUJxVOQAOLVilUK2J9kmU4c3wW7QmkNEonvLrqClky54YjsixvvqXexmRn21zcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 01/15] regulator: 88pg86x: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yLzg4
cGc4NnguYzo4NzozNDogd2FybmluZzog4oCYcGc4NnhfZHRfaWRz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCjg3IHwgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcGc4NnhfZHRfaWRzIFtdID0gewogICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFu
ZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yLzg4
cGc4NnguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yLzg4cGc4NnguYyBiL2RyaXZlcnMv
cmVndWxhdG9yLzg4cGc4NnguYwppbmRleCA3MWNmYTJjNWRlNWUuLmU5OTVlNzM3OWEwNCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvODhwZzg2eC5jCisrKyBiL2RyaXZlcnMvcmVndWxh
dG9yLzg4cGc4NnguYwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IHBnODZ4X2kyY19wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBwZzg2eF9kdF9pZHMgW10gPSB7CitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCBwZzg2eF9kdF9pZHNbXSA9IHsKIAl7IC5j
b21wYXRpYmxlID0gIm1hcnZlbGwsODhwZzg2NyIgfSwKIAl7IC5jb21wYXRpYmxlID0gIm1hcnZl
bGwsODhwZzg2OCIgfSwKIAl7IH0KLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
