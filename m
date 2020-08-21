Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F624CB57
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:22:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B17C32E8F;
	Fri, 21 Aug 2020 03:22:35 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58659C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QISZ0iPb8ZABuePXLarwpznFt8qv8KGi0SZQ36WLy5CKE/coQByqzcEhjd/XwE+WgWZ3nfy+pNLYqyZ/o71JzuAdW8+OFElid0zvROuSSblZMxDHVk8Sadrdg+vzuOLHwx8PK1tBwN74DEZz/gfBDpqW4c34CmHpQNQxSTNol3PdI3eYOgJgKJVvdCFxAvKak+qCChDxhBVqmItzfPxkhDuRnMXoFbsywIEunNS9FGOhkftHiwldVG7eCauO5/c08DspRyhOtzmrDyuJDcj/iHDFyWwRPTPoCXNPIWvsOwW9CNauYqivY90T3U4oEOgcpMoPBE+zmEkQM3WBbGaXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHvYbXKB637tjZ3eQiUxscttQbltDndxqdCobT2il9g=;
 b=F7OU2/QhqgGDhT3p5ZVw2aVe36iarBv+qZ7yKaYMn81ByLTMxiQwjTl5bjh9ENzNPCAOY6KU+IIu+WBOjS/UnYnub1LZ27ADpRAy+kqOwalWzUJ1SFWuqqI5co9VXLOaSQssf23K2xCYZKJpdX5XezwA+wSwn5xPaao+2gfRHV+Pq3XFHGms3ofIeNYs7RjyJfpLOjmh1+/v6tvbF+Ob/fKnn1XO3LKl25W0d/81iCwqiJabBXSsCXSchTSTgkXSGlRPrsjI3NPe7xCQZqznb3k0udkjGAlFG7njpam1w4pEcFxLCfkfNLsDaImDVgaVJAQTE5hc9Bb5HvWid3eQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHvYbXKB637tjZ3eQiUxscttQbltDndxqdCobT2il9g=;
 b=Jyvd5tP+oUG3negd4+if5tPAIBcx9QxmC27IimgMVaZdIueq/yiKfNwAEO/e6qeaL6Sc6uUxpThF/vlS1LiDXor8mG4dmVIRrYpCgOTtozJHJL+yUMOH0+9IvjDqad/WmPp1dhUjueK/jee0DRuWxXnHl4sKF1lYyEbYP/Fpigg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:31 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:31 +0000
Date: Fri, 21 Aug 2020 11:19:13 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111913.1096f7cc@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:27 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35d47033-3d8b-4a12-3b03-08d845817079
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46177F0CDD5D114F09A5EB8AED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQlpmQdaVw6Hpp+cBsemuEZZNol67DOvhyEmwjITU+PBiNLW6phz5m331JUhh7aCyFlw0r847PixmhAEMaBBNNv2zJ85aDKAsG7DTYTHIEYRLA8PfD17uSeUdeN3zElwIwLgsz3srSnHXBWTq2wu+h3rTUY/ljGNxasufhTNjTAGOjrTHW4dnGR6etf6nen6moDyP8h0nCCrW8kBitT7/Es3R4Abroq0ZDqbUoPrfKPZVuJtFypjyh8yXa7RDFPVbCEZyHd/KL3FYqDuIeg9ZxBb5K9wSMt+UABsnA99SX6pzIn/HyPc6oBZPvo2nCVwGINBQ/IujEqFlq1+o61Wl+o0OcJqyz/zxZl1t50+QW7D2iVRyg9bxNjAmCVufq/Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZozzH3w/rJCYb0jrRctBPEEtsmetV03d+JorS7rfxSQtncbsYE7IXZk/Cf7mRq4NumPSJ2M4D5B/hgmPwvhgWEOKUo0RKx0vIIwnkklGHVyz+Kkq5hx5E1rPVqRvNkwOzRa2IHySBvZrllu88BlE2rUFzzhPGg3J8YAa2l4sIMRMpB4Z1ZNqbUlWZUahD324irCtTrmyiDQrEtNMISlVLsi4XipSDwB9/ciacBPbP/xoRYB7/3JwW78k2kKGuWIwHoO2T/3KdXuuPHJd3tEVZroJv/zieUQGFS7eXaNZEBhmp4cTwML5WobLsd1MsHQF73ApmVl0Pl+66rY8bbnCrUxdLvN1GmWo0y8Ae19Gw5MuUHG2nx5nDEqEYx1+VwNnwF7atF9DA9+k0YcRviirA/d4wFKKE4AwTNs594/EHqmdskeUTjVJ+hv/H3CZqw/rKRNuNoELlghIGCY0bR7siRQRkEktExBBtdweufPQOm1yfM4BmQUW8BLnUv1qbuAFBJzCZWozu1XJAhmVNCOQ/C5XVo7UX12AYppECQQyMgD/f1kpHMMRJkJkksKqMMdCi+Z7R+saFWDEn3eSXZLWVe8jSopQvxSbhRiRToMu2cu9yJtjFzRCY7qcmitTxlT+59Tk6qzcOJsizQPUkFOlkQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d47033-3d8b-4a12-3b03-08d845817079
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:31.7033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xemi8rU5Edv/2oHXSRVGOqaQ3acohBTBhmzQXOBJ0AGcXCt93mIeMHtOh94Ty24MgVvnJZem8ovhiGybnTxiEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 13/15] regulator: qcom-rpmh: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3Fj
b20tcnBtaC1yZWd1bGF0b3IuYzo5NzA6MzQ6IHdhcm5pbmc6IOKAmHJwbWhfcmVndWxhdG9yX21h
dGNoX3RhYmxl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT1dCiAgOTcwIHwgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnBtaF9yZWd1bGF0
b3JfbWF0Y2hfdGFibGVbXSA9IHsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBa
aGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9y
L3Fjb20tcnBtaC1yZWd1bGF0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3Fjb20t
cnBtaC1yZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVndWxhdG9yL3Fjb20tcnBtaC1yZWd1bGF0b3Iu
YwppbmRleCAwOGRjYzYxNGVmYTcuLmQ0ODgzMjU0OTlhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9y
ZWd1bGF0b3IvcWNvbS1ycG1oLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3Fj
b20tcnBtaC1yZWd1bGF0b3IuYwpAQCAtOTY3LDcgKzk2Nyw3IEBAIHN0YXRpYyBpbnQgcnBtaF9y
ZWd1bGF0b3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsK
IH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnBtaF9yZWd1bGF0b3JfbWF0
Y2hfdGFibGVbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9fbWF5YmVf
dW51c2VkIHJwbWhfcmVndWxhdG9yX21hdGNoX3RhYmxlW10gPSB7CiAJewogCQkuY29tcGF0aWJs
ZSA9ICJxY29tLHBtODAwNS1ycG1oLXJlZ3VsYXRvcnMiLAogCQkuZGF0YSA9IHBtODAwNV92cmVn
X2RhdGEsCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
