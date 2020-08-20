Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1824B08E
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:55:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F0DC3FAD8;
	Thu, 20 Aug 2020 07:55:08 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9745C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxuks3pFP6ERlEzCvhlPvlpkgarNBM7pmVG0hHIFBW9u50j7PVrTWsJRLufwreLrleASm/lwoGQUKEkofAWSnECymuzlJ3cI7cQI/mGQDQN2CJ/jjNUyQ+/QZvORwn3CAl9IScB0vVJUonZX+wlbtMgQjBNBxBuitpFgSMvhY42SHXGLau4+MKUdpIU1h9/57AuPsemwBLIdvPnNZ6+3vcuwYRcCgAYEvFVUYsS2JQIg2t/NAvmmDiJccyzEdZO+oJtcUW3ckINIy2t1v4ehM2RM4gRFmQo7KlVvW1aLkB7ugDvbvyGJ2SzP1GlgHLa19OQjNI/hJ3hXSU4i+HcZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0F+bCmqcAnRxC8KfRXIvz6WdWsumQc7DWHZHtfxOus=;
 b=kfS1hhXBVidDvOtnj7CrW1tap/3H1ce/AreoxxWwkadpWbIg5To3+fALA2NuZWIsZj73zWLHd/D3sou4QudAxTmwTNr6QfhCeu5VsySzbbGMb7zE9lncwLMdVpJ9h2tFsaqh41XM04hp14ZfpfPenQZ2IrAGPevrSgELUcEoZMGuQAt3/2A2xOn7tFKKcpn0d+a0O0uXOojJ7UlNUguFEAH4jq1s9QKXDbmk4+q/ktinTbrIuUoIAY1rq7uG48Wgq1RWq27GPVMUf7bvzuy1yTLtoAL2mLE9kYphk8iIjByF5vy0ZZngP7aExYJe21tDMtaE8Y7aGW8m5ahEkd+jPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0F+bCmqcAnRxC8KfRXIvz6WdWsumQc7DWHZHtfxOus=;
 b=IhKg3YZ1G4PGsJ96Tum3KqPYGjUZsFI9Joxx4Q25H5Dnr5XRgJW1NBNHdMSK73s0TKOqFatjd/G1ToCG4NMLYd1cNPDT53nN3WIBhymaNMNxoOJZ1aebMtVsIUzyjphFJnPGFejQv8jfqRI1IhKdm+pBTvfb45g6gZsnc9UTDnY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:55:04 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:55:04 +0000
Date: Thu, 20 Aug 2020 15:34:36 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153436.39088071@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:55:01 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31f1421c-bf0f-4c46-e3ee-08d844de58e6
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB45635C561B5D1601C9927DFAED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S55hj0RnyNfk/t4q6QGeGpTNuP2YUyq7EPiTIyNOJZg7Ze5LUd3au2DsC2kcE+2CPYki+r0bnKCQTB5GEto8vVSmIMjTJLnDKlUM2QKXzKv/JFH2aXeOJK5jPtr6QXyEn20NZPyGtPb0Oe0A2o8/L3uJOd6YipBmWr1VWn4cMJxz/H9emfh1RWEZBeKVUiU4qcYa5JuuPFz5XQsDetBXsJafCpRBCiX4mVeHkaPpn6e+MuZnNHFQ7eTntH4eS9nh/mFa1GrIrnM9cRoaavggqc07M3xIE11SGZomSRgcNVpn3inXdEK8x/bOQAT6hvU1tp2GxUNpVmRYeVLaJRfQYq2P2YO6bJTtzoGJ+XR1t9uThu7NfoP2lTV8Da+/1l60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Pvicf3XeI+mnIRJBXholur0MDPEe9yuHdr58X5UpSn5rLhET3hMysg+3eK1BKQiiXNr61IEpY9EwFTEm7i4NibdxCI9aLhFpZM3Q9m/XGi6/oImteOJhAnkbprZ2Iu84WQ5RrpKqldOtk8yDwb4Sh9VFARNT+bWTmMLaIm4C17QNndTy5h28lbE/pdI0iska+mUzq+JOIg3VTAU+Cegy3g+voXUe8pLXN2zcL3xImkH4m+IlTy4xCsHmo4J/yNT2QgTYGWE5cAQ1ifndn/MLtTFMFD/EXar61K8MwvvMscX59oHeHjXtvEc3rVrXRvp1h0oBSQwu0cw+gf/thvxWzLjslbwDY+V25kY5mc4iF/sOHhSGKl8XomGwpz1u9gPEDb+bXAdR5K7yKJE8tQ4bkPwPaphkX0I7tX/6s4pXV5+WqCULiMtvT8GFlUoUktY0dlXeci4EDO+YMJdHfFUDjCjkEHsWCDq7dptoHxjT5ybhs0tQcLQr1xSmUFmLtg15O5PICwGTxAjbNO/XXFSQ3/35/MONLKl8HMu24k8bMzI+yKiiF+2q21ibn1H7+QyRKy5AqqkQCJxg4jZbvs6ZKH7YHKBSWKH72OfqlnEONyDLnH6ZjpOv3Jl/UU63ih5/JTNqvvN9CCGxZFySt1+AsQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f1421c-bf0f-4c46-e3ee-08d844de58e6
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:55:04.0678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpRNSr8GOGI1vx1omaF4z3aS0x5eZRQXmm1/1851d8oJVDPVUr2x+SEj/9r2O1jBVQV0SFi/shZGhPm3DVENHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 04/12] regulator: fixed: Fix W=1 build
 warnings when CONFIG_OF=n
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

Rml4IGJlbG93IHdhcm5pbmdzIHdoZW4gQ09ORklHX09GPW46Cgpkcml2ZXJzL3JlZ3VsYXRvci9m
aXhlZC5jOjQ4OjM2OiB3YXJuaW5nOiDigJhmaXhlZF9jbGtlbmFibGVfZGF0YeKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogICA0OCB8IHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZml4ZWRfZGV2X3R5cGUgZml4ZWRfY2xrZW5hYmxlX2RhdGEgPSB7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fgpkcml2ZXJzL3JlZ3VsYXRvci9maXhlZC5jOjQ0OjM2OiB3YXJuaW5nOiDigJhmaXhlZF92b2x0
YWdlX2RhdGHigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KICAgNDQgfCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVkX2Rldl90eXBlIGZpeGVkX3ZvbHRh
Z2VfZGF0YSA9IHsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5a
aGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yL2ZpeGVkLmMgfCAxNiAr
KysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL2ZpeGVkLmMgYi9kcml2ZXJz
L3JlZ3VsYXRvci9maXhlZC5jCmluZGV4IGQ1NDgzMGU0OGI4ZC4uMmQ5MmE0NzFlYmMxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9maXhlZC5jCisrKyBiL2RyaXZlcnMvcmVndWxhdG9y
L2ZpeGVkLmMKQEAgLTQxLDE0ICs0MSw2IEBAIHN0cnVjdCBmaXhlZF9kZXZfdHlwZSB7CiAJYm9v
bCBoYXNfZW5hYmxlX2Nsb2NrOwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBmaXhlZF9kZXZf
dHlwZSBmaXhlZF92b2x0YWdlX2RhdGEgPSB7Ci0JLmhhc19lbmFibGVfY2xvY2sgPSBmYWxzZSwK
LX07Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4ZWRfZGV2X3R5cGUgZml4ZWRfY2xrZW5hYmxl
X2RhdGEgPSB7Ci0JLmhhc19lbmFibGVfY2xvY2sgPSB0cnVlLAotfTsKLQogc3RhdGljIGludCBy
ZWdfY2xvY2tfZW5hYmxlKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2KQogewogCXN0cnVjdCBm
aXhlZF92b2x0YWdlX2RhdGEgKnByaXYgPSByZGV2X2dldF9kcnZkYXRhKHJkZXYpOwpAQCAtMjYw
LDYgKzI1MiwxNCBAQCBzdGF0aWMgaW50IHJlZ19maXhlZF92b2x0YWdlX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB9CiAKICNpZiBkZWZpbmVkKENPTkZJR19PRikKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZml4ZWRfZGV2X3R5cGUgZml4ZWRfdm9sdGFnZV9kYXRhID0geworCS5o
YXNfZW5hYmxlX2Nsb2NrID0gZmFsc2UsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVk
X2Rldl90eXBlIGZpeGVkX2Nsa2VuYWJsZV9kYXRhID0geworCS5oYXNfZW5hYmxlX2Nsb2NrID0g
dHJ1ZSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGZpeGVkX29mX21h
dGNoW10gPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiLAotLSAKMi4y
OC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
