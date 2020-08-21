Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249ED24CB3D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:21:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E867C32E8F;
	Fri, 21 Aug 2020 03:20:59 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7686FC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEDfIX4AeMZ8IbT2mPBzUOyIObbHADZdWw85/eIFwzYzJUW+uU3nioMA5V1NkZS3c77VPbYLzmP6JCAn4VMnUm+E6l0qUE85G2DPDb5qp0IHhOSh5Q63fWDdOb2SVeG45pOE9xpSfcN2m8iXsY88R4ac8KqXYFQRtGAQv7T0fLcjvbOjX0tnoIUuKpfIJ2CX83WgSoClh+B+hCjqLhzTo3Ykn+8+C4HPA1RVOzklKI+UhAaXr/LTA/0y/w4gtxVmCICi2CNH3h3kuTiQZsyLhGfGyBFibVasAm/d0JCrJfe9DBD4sYBiTjSqVJRFUBhb32RfIsy+cYdIEBDarPfR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7JS/7BXnnRuPn0zPKlPB4EE+b4KH7GRiE8Sl/r6Ixs=;
 b=PcAg2552w8w09fzGPscYTtVhfaSGQ/PUZRM0U5rdKgTf4coP1gsRnrFRvuKwGoeO326OIk9vLQEmAKWmWGyoh+nnWBTIJHCcAn9PnvqdkIrO1k9O0ygThYBEi5qDC4UjpwmaFx37mfEsh62tbHBjJQqaqgXuHmYGUbvDbLWA+lxxwuMHF/yqijXnMIfzEmTfL5CLN/z4pKtH+Wz4cc7CSAgFUhN8M3OrMzfTywIarK9a2QzwNCApsi0JPp6Jga1l7G0P1dFB1rsK5uTGMDyBWoofRO4+9qQMXxqagfW6k0rVs169Uxkjs95x2ueaM1+MQouhGu6Xpru8oTaGS5WfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7JS/7BXnnRuPn0zPKlPB4EE+b4KH7GRiE8Sl/r6Ixs=;
 b=fy8OA3hbmSQSUE+wpmaqWXMGvi0CkHag6FTAY5BB2mAvag/40OqVmqvk3T0xJYX9PolEIbwviKRIl6zQvtGmbBTYlhW39IkpTRoZ8PByTxcqwsa/DHA93XT1iuZZUyZ7N4dbFtuCJwLn54XABtiQz2K1FR6yq5IeI8BxBypEFDY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:20:53 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:20:53 +0000
Date: Fri, 21 Aug 2020 11:16:31 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111631.4e799c86@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:20:49 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d591de87-faab-4e2f-34c9-08d8458135d6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617DC75F2FAF6F6FED8EB7EED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RolNriHAhyRdVr04zS4Fl2G1nPIkMOpndh/iiA4VpM1lARB6s5xUWeWw9UNT1mizxE6HJIRXbJ3ADtgx8odl3EmzNM2uLU2VyK0z9/5FUDphVbdzrXfS5jgIM0MrA2dPEnYQrqYZYjQgEoh1riK1Z8Uh78gmoToE4rT8dySGAvRNe3bii5yfhAXv4yQQxof971/S0VNVex2ASIh9Es71ETVLx2/Xs7vRnGVybKdZBJBFGLbSLOo9nY5Mxtb0KXDPP/xdtUT3lDd7OXt/q0rILHczNCRTrJDeoz9ZXT6tM6vFcj0tmmZoZkzc5UhUGPZ7MyIJgT89BMVdxB3OfZUP6qVWhrwSqRmjTb60lbC/Aa7poTOCRlxyNRtue5azJBTf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RyKx2bA397HLCEsFjkJiF5mBhoKdu6SSxebZloGQFm/8KV5tP9hhV4LkRppJZrJJiAJtgu7gJyR7kVkO5691GszHnNcn8RzVD7WQn0JJWu44N6WWisqCcgJHndx5Hm9ca1+45jaR2NQStxCuneW8fuzMK/xehYhz/PpwUdApZfr3BJ/44YLxBsjyk5NlPu+mWFXy2UFgt/n/x/lXYnuVyS0/dig0RxJeaDuDSxMDYZNAolSmN/u3cT5PUY8tlTUqSRUcLYWiYgEyY59tvEGApZtX81GAdqaBsbHdXHml5n5EBh33Wf6pbDvYpMjboAQQ0iRJ2tbpgl/sP41cFkNZDj0L1wBtyyy4A5d9k1tyuJWDHTIz2+9LijdVIb5HSCg1etSC55CH3h6VgfaQckg6D3C+hVii1C1xW0zBFE3l3qJmd8fVlqxQh2ghGEXgndNKNchSOrpMpgLGljSo7voa/eGeNGeGzIa5X9HvDSl2vTgxjzxcweiHBln9pjIbM6f8/iS963/UmjDdaEi5e+otPL6nOleh1h00Beup2mSZNyov62Swe9qDJc5vu+7XpXyWAtcZkwqVsajHZEZdHg7ye+t9FO7Hb7SjUVrvXIEXFv56em6DwFn157NuF9qfsYnnkT8fgNbK4XWyzkKkWPHm9Q==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d591de87-faab-4e2f-34c9-08d8458135d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:20:53.2641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZLs6Q0zoq40uoPPZpfifhSa5M5miQarNzRiD2BoxHcbZCvJtxfwp33xlGoRhSJtPNGwikhgnx1fHto4fhXcXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 08/15] regulator: max77826: Fix W=1 build
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
eDc3ODI2LXJlZ3VsYXRvci5jOjI3NzozNDogd2FybmluZzog4oCYbWF4Nzc4MjZfb2ZfbWF0Y2ji
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAyNzcg
fCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtYXg3NzgyNl9vZl9tYXRjaFtdID0g
ewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+CgpTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxKaXNoZW5nLlpoYW5nQHN5bmFwdGlj
cy5jb20+Ci0tLQogZHJpdmVycy9yZWd1bGF0b3IvbWF4Nzc4MjYtcmVndWxhdG9yLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9tYXg3NzgyNi1yZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVn
dWxhdG9yL21heDc3ODI2LXJlZ3VsYXRvci5jCmluZGV4IDUwMmFiNmFmYzgxNC4uZjllMmU4ODRm
ZjU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9tYXg3NzgyNi1yZWd1bGF0b3IuYwor
KysgYi9kcml2ZXJzL3JlZ3VsYXRvci9tYXg3NzgyNi1yZWd1bGF0b3IuYwpAQCAtMjc0LDcgKzI3
NCw3IEBAIHN0YXRpYyBpbnQgbWF4Nzc4MjZfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCiAJcmV0dXJuIG1heDc3ODI2X3JlYWRfZGV2aWNlX2lkKHJlZ21hcCwgZGV2KTsKIH0K
IAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWF4Nzc4MjZfb2ZfbWF0Y2hbXSA9
IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9fbWF5YmVfdW51c2VkIG1heDc3
ODI2X29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJtYXhpbSxtYXg3NzgyNiIgfSwK
IAl7IC8qIHNlbnRpbmVsICovIH0KIH07Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
