Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069E24CB42
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:21:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE4CC32E8F;
	Fri, 21 Aug 2020 03:21:32 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95194C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2+XmJNffEED3IY6m+acraKW2+9OEodBrdkQVqIYReguhOVeCW3+kOnZNWeqnOwUckMR3z9BqNMokAzEGISk6wqayM1R7H4gDBdVaqlfE1GqgaKvEPGN1FseZ9HyLeQyz/sVWmojVLakTNQ74Yjby7kQ9a2m9xvtL1OjZtExUgmpegS7l3nzysQoan5T8Qlzy58Vw7AJECvM+JM1MUMAyG6XSpDbmsdOigbt5C9jFuR/2cF/0AeVZsIJGfoWDNOxKYDxLDScptJuUKHkiH+mmDsa46HPYMnzOKZZ8kX4bnlITwkxxfFpj1Y2pt8PqS6cue4Xl6ExEuoHlOt0u9nJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfV4mxwKqyeAKVXUe2OK/ZKUOFBIRp7DuSMjz6hb7Cw=;
 b=Sf2YohprQsjmRr/1pIrqY1mu5eCNmkd8jfPutV8+8sdrZAdn21QlWybSVDJ06Bp0rbrQH2s1cUVjZ2sHsbmlfVB6g0TuQlF4sT2iW3NFnAoI62wWDnOLT3w9EEw3DTPmzqcMjrFrF6kCw2gcOeGZI1GrMj4NcxnIRFwiO8bOtpC/XWyTBEUfQ/ke0fKU987qvgCBdjwVGWmVLL19ZHEYCRIOA4TwFh4/FlANjDsepDpgvZ/RiShcdLIsMPBECABc5LbFAO8TtnTwyY5dKs/q+boaSp0NRtXe1yGcL+kNMq4Gte19xE2OQtwf3U2kcPecpqoz8aUvwAt4tOIzx4WPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfV4mxwKqyeAKVXUe2OK/ZKUOFBIRp7DuSMjz6hb7Cw=;
 b=HMkYOpVhbaUzPmvVV1faOTEe1U6pbhqMT883pgqSZXrTfxUHg0Wr7stjUr0hWhavfL9sHoyVPg8mzt4gdiuckCqyWzzGHwCm1nI7KImvOcTisGJ6yIvqs3Xaz78oG4BDWSif7aFwn97/m3McFk0VJomayjc66qllIeH4eBGyoLY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:21:29 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:21:29 +0000
Date: Fri, 21 Aug 2020 11:17:55 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111755.4c461039@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:26 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eff0eff-e219-4567-f1ca-08d845814bb1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617F9671E1C40482ED53469ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlarCBdAFdEOesLDKHbTTlPWfrY3LpsOfP10DJukCnSZJ7N7YW5gcZvE1kRxYmFCBgpRQYvT3XWfLtTN/r/0dKfVJTO2FVBSszw0VpqE67a3WOo3b3RZKK40DBTgkCrV+TB5GXLsO047tBfzEUcmRY7E5yc7GnP/9NC5Hgq4U8PzHQipFM31JzBE8WKBKRDiBoQMeRqpAaHKwxLJEM8LBdrGTJmEYYbnmopPfe5msN/5KwjRe377Ve6WdCn4UvG8HKn14ExCa/bk9NtUF+m8LfK01k2mBA/MTcQpYyJMOHQBhEVMD47q9zEWfCQNLjLsXsfSB6+MwTaGb5S0kzTSPwPgHz3HVi6Tuu+wPLpzJVh+GhN2lUj+DFkt1q+XrR4W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5EtHmIOLi6oTiHBvzXx1Cwf5Ah/em6LJtYdin1AjBx8lRxaXytO+rB8B9tbiy5iMFho4sgNqq0klzRW8T/Y657W0n1lEHDy1K6Lfy+oZlZ/JEDPUoEcyfMwZisFt8Zawr2awoGTW34RcKVYgXptI0sUetrs+viIOgVUuhw0y/J1xeY8rbIWOQLbstW083aiNVYs0jJP6c1q9tP7TkO88F0q1xrbRf9sBlwL3RC6xLUVh7i9UraCtf3ra9w0xMvkL5Ru57RmqY1AsmUsJihaySsHv2V2NVhtlfgJopTQhnj2JxjpkMqcYs0V+4w6qI53h6eJ4UO+7iwbh8H5EwPZZhD2uE0r/VeaaP7FMw9uMfGqmPOYFCRIx5xWAu5TNzslbXLIUfuGdSLcuOz7o+PDXVS2v2+0N30wiHgf1frAtAl8EYP932IWmQXTNRjako3n1fTxpNk+LJlEarfi8E8JnfITkV3q218mXqg4WToCZ+Lgn4zsdl6T+nQhv6VMnCbpKQjDBUKg3NTO8hp2IXDpHLWIEQqa3jnNxbZTipOo7sWJi6gojO/mdsk4L2xaZSz34ZKfmPLVWtsZ7BJ5fMrJhLPrw80TWhZsh5zfHHGVYXJ+j48tx/tfab0KP39sQ4RmsY64B6FtqPTYQjaA7qZg1Vg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eff0eff-e219-4567-f1ca-08d845814bb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:21:29.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ/KZa+qJnS8l0aOwmmrxuxjWMdb7CCR08utrYQ/1v+qXRuJwb+GQha/riCU9PIRxBc3lF1x6G4gAvv5tItLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 11/15] regulator: stm32-vrefbuf: Fix W=1
 build warning when CONFIG_OF=n
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3N0
bTMyLXZyZWZidWYuYzoyODc6MzQ6IHdhcm5pbmc6IOKAmHN0bTMyX3ZyZWZidWZfb2ZfbWF0Y2ji
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAyODcg
fCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl92cmVmYnVmX29mX21hdGNo
W10gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFu
Z0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYyBiL2RyaXZlcnMvcmVn
dWxhdG9yL3N0bTMyLXZyZWZidWYuYwppbmRleCA5OTJiYzE4MTAxZWYuLjE2MTYyMmVhNzI1OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItdnJlZmJ1Zi5jCisrKyBiL2RyaXZl
cnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYwpAQCAtMjg0LDcgKzI4NCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdG0zMl92cmVmYnVmX3BtX29wcyA9IHsKIAkJCSAgIE5V
TEwpCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl92cmVmYnVm
X29mX21hdGNoW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21heWJl
X3VudXNlZCBzdG0zMl92cmVmYnVmX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJz
dCxzdG0zMi12cmVmYnVmIiwgfSwKIAl7fSwKIH07Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
