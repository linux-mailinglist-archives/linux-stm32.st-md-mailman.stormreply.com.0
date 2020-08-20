Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803024B078
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:52:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4039DC3FAD8;
	Thu, 20 Aug 2020 07:52:25 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E31F1C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN2w27agZnqgEA9oa3EDc+TZussk50ocX/lb7i85iRbxkOQJ3B6N2dPwnufv/f68oztEPmV0TpD7vAtN25pI4Oxby/HYLqE4p6LWBCod8dIi3ZgnoMdaIVQBB8zJRmrYB67y4lBGtng3uc9B3peTIGO8zedtHNt/HhjVea+m6dVo3oh+mK6ZN1Ec+rAZ5itbZjfZUfFpRRmBUGDvO0NPqMtE+qKfDRsGlAO5XhP8uzPXonPx5zVxSq3i7GCDAaAUowHLAbffoehiaNnywPOGbC9hI4FFMkU7h+seISFDIWvLPwacNuSRHvddJuqhTcXHRxPemZDSwDqdVa3l5vSlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY98/iL0igA9aI5KOwzSk23gsLJVoLsPK3WGTOCE19k=;
 b=Qrj1A982jvDR3L/vDTJ3KstETCDQGsfIxVk+8gg1TzdALFiATTXaHK/H6F1qUomb25Bo/Wfv+C77kFd4YtPzjl8KTBt4Ud3q8fx3b7nDXKFMp0Pt82cwUUD8Cxv+xRHTAAl5sdA5bx+xkeC0NNNNGgWRNqA3tKdMKAq5MC5uPPkSCHJ/kNxk3XiDTmi3r4Log5MSLDxfNF+qR3jALJNksbDebKWuYaBrwinhpJZrF+u6LLDoHoW38B7cn4zZafhdGvDYd6HewvFE9oaKWH8sUPQu3EwdSgt3UBeUekIrnn7d5Lu0Un1hc0ak7e6hrX2wfSzoGZMBc+Ae/NzHASoCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY98/iL0igA9aI5KOwzSk23gsLJVoLsPK3WGTOCE19k=;
 b=bjOyaqr7+w1nUwvFKx5C9R0mq54GiwRFgSwXjYDfh1nywbgG1eM4xG4ErPvzJM06JR1M+XIuAqzHotKcbJP3UpVJBV+3ovNIhYCDec0swYRvysMuJ6wxurrLGqAqp3RZ7OcgaYDz1K39qB+Cr65uxs7GwO7/73063UHPuQhr2/Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:52:22 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:52:22 +0000
Date: Thu, 20 Aug 2020 15:37:29 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153729.4bee7e48@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:52:19 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39989689-7188-493e-6047-08d844ddf87e
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB456327E806361D7C5321AF47ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5glhRY6cYMwHxVlCZO/Pw23Mn66kjd4aKjkuZyrS8fiyKq3ixCAVhOdqDg69PRsb4mU5SaKuFcPmJEktQJLeHOcZ3zrS1imw8jswEPA63qAQwhDhS+XQEMpFFFNL20qvicNaxQyo5ACvi0yDxsQf7HVuyH5xNHe61XJRRC699nPKaDsHpsA1Nb0T8P1UrY2Th5uYCji4gsAE7HECWmcCzM7iF9T3Gf3logQy3OO3xy1pb3NIW24hmF6ZbYVYScxkEVdZFrXkEL9swpi3Li43ucPGJQ89q531uuZoY6bU+kGcaXIzHNO62kWAC/ma4WAZbfGVfsSuYFQlXn6PODpJRNeKpIbJ+Fy/CCTGzwNQXv6lVsnMZDwFzajIVzmCl9X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0C1RznXcXqwL+LTr4MfdOC7wZ9fuIX9wILv25biXbSxxpoYTnSvtqsj2IT5quk6QMnS7Kj0ED6W7eVwmCgmx+tyrXBH4XU58EAODmaNGfg8HiDBtwxs3pp+8g56ApLTdXqqdESm+b4CH4M+kH5nc776h3D++cIG9WaejGIfT9oWYtwC/BStNon87u2cBb+B7fu0ElREdepH16Bei5N6qxHiFvtXcNjKXriGObmLSUUp/vc1EBVcXwO3VQOOC+QAxdlA2BfjcMePLQX/+VYSQFYWX4zTYb/9b4tbzkzpGBzTac+VfiCOlQRTxgUHPG6cLUh5jRw32SBxfQe8bRraoMUhLSJlmeL4tL58qzhU4RnpQu4a7VnUF78nslf9UQhlbF3HtYvegYlDxl+jgiaWX/lXWc11NExC2sPVy1y9QoW/1i8we3/hMwRcfBlAKdAVOX+rC3eYJcf22oB6Hwau59iX1AbKKofVkf47dqDm2t9DWakSHmLEKujiY1b+u+tyeROqzi3nBXbxAoPXgEc6YkjU54nPw1BusMgQQlfsvomXniOrcm0Qen2mwMxyjxKzijRk4fJw6eTWyklxytCXJFN6pTayR1/EEWBMjve9jmpv/zVG/BxfEWGAkkw6nS9PkXv76xCw4OFlFo53RoYgbQA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39989689-7188-493e-6047-08d844ddf87e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:52:22.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk8iTm89XHsAtHoM1pEL/YGsE/5Rk0q9H0VTNycwR01TySthq9bcAlpKN7s9l5weTB2lH7WI7SOP/AKcsR48zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/12] regulator: max77826: Fix W=1 build
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
cy5jb20+Ci0tLQogZHJpdmVycy9yZWd1bGF0b3IvbWF4Nzc4MjYtcmVndWxhdG9yLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9y
ZWd1bGF0b3IvbWF4Nzc4MjYtcmVndWxhdG9yLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9tYXg3Nzgy
Ni1yZWd1bGF0b3IuYwppbmRleCA1MDJhYjZhZmM4MTQuLjdmYmRjZDcxMThhOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9yZWd1bGF0b3IvbWF4Nzc4MjYtcmVndWxhdG9yLmMKKysrIGIvZHJpdmVycy9y
ZWd1bGF0b3IvbWF4Nzc4MjYtcmVndWxhdG9yLmMKQEAgLTI3NCwxMSArMjc0LDEzIEBAIHN0YXRp
YyBpbnQgbWF4Nzc4MjZfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiAJcmV0
dXJuIG1heDc3ODI2X3JlYWRfZGV2aWNlX2lkKHJlZ21hcCwgZGV2KTsKIH0KIAorI2lmZGVmIENP
TkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWF4Nzc4MjZfb2ZfbWF0
Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gIm1heGltLG1heDc3ODI2IiB9LAogCXsgLyogc2Vu
dGluZWwgKi8gfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1heDc3ODI2X29mX21hdGNo
KTsKKyNlbmRpZgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgbWF4Nzc4MjZf
aWRbXSA9IHsKIAl7ICJtYXg3NzgyNi1yZWd1bGF0b3IiIH0sCi0tIAoyLjI4LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
