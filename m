Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B024B06D
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:51:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBAA9C3FAD8;
	Thu, 20 Aug 2020 07:51:45 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB4F9C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRtKnEHC3Iv2dI96XoqRGArxUw/mxXMQvlCe3sDJVRHgKYeyGUdyuE51q7iPy+/54EIe2RFrlRU+st2rA18ttoSq2i7pwheXhC0Nxcy1r5fJHuaCW5V3T8wZy/R3KXY7y/BXtVeaF8RAFD+faLkk8pWNLkA6X/3KBlsXiyV+JBDWcBoEj5a/4AnL2GUafMmNmRn8gbipsb1WtEiA3R12XgzyHN9LxmFNt9GWz4R6zRIQ+ukTnalDyhum7b0umFsXDZ+B6VGqbwQU1EJhz7Pq5Z2yprDS9//j7OwjUrGli5hhtNA1iUABrvY2pZ/+ANpBS+MMV+E9OJYAFUjzLvj+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B2/JNzCKZKLjBhv6F3rxJW1sECk3G2yv+iD/ySGx/o=;
 b=Lf6C97bePYPcDh0+IymfXLxHiYEF6FiDcpMF92tounc+yHWk7/DLLvYL8FkHE5msTH2DFeOo2TD1V39SPyzPdfBLc3kazgH3d0/yrr3SaM6qtcnkDhjMCbne/yH1TFGn1IRFA0M7BHMZKV/g55J6XXzqM1Lv3VS0Pol359FrpS3CTqz0o1MS0WiOAyEiF4yxl5KcEtmFBSN4ren2kpFdT1GKNKMFFXjR9PS/tykqxg6wynYMhXI2DpMiIogRgwfTLUDtwv3sh4t3dlac1Tx2BVvGElx1isCkU3G2ui8knqtZJsRjzT/Ig9BVlYQOvkfA96Bet8e+DZe8BqqFpxjhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B2/JNzCKZKLjBhv6F3rxJW1sECk3G2yv+iD/ySGx/o=;
 b=ZkEU/HJdmu6TxXcvMFD1K3u4ow+4t7pmlNSoVcyuUFXVm35563KeCjffYDvPpgVpXBg/HB5LzYCI96NrNihdPDA1G2navuhZOmV1rgvwqCQ7SZ4uaJzEYK6Mt7VJ21gXRdAIWcgGUkRcKVT32KMpyh8mXnAf3quVDpPIn6bSAro=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN8PR03MB4834.namprd03.prod.outlook.com (2603:10b6:408:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 07:51:43 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:51:42 +0000
Date: Thu, 20 Aug 2020 15:34:10 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153410.498aa9d3@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:51:39 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9458ca1-456f-4953-1bed-08d844dde0c2
X-MS-TrafficTypeDiagnostic: BN8PR03MB4834:
X-Microsoft-Antispam-PRVS: <BN8PR03MB483469D92A3FE545BE5DD9E8ED5A0@BN8PR03MB4834.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6JXlAfTs0hl4HgJuoMucnY6VsLCO5WWyJ0Lm0p1/qpzqbUi2I/Q2o9vmpoERCJt6zZ0O3EDKtpxqUD8BigJdubArMZxgTdv7nIo0T/rTnXu3/U86yjF4UGOwPdZykXHNU8qQcoKLymYoOyeTVNFktwMdZdYzb1biVcCkP/03SHq8f//hgQ994OtPqjkoeXFDPE69y9iLMPvH2utL0foKDiccH29ElTxRhBnWYjQuIXlml6DPdQtKmTS7XoA3nfJY3odbh4MsiWKpDXrMJTWkkHpRcfP5s+5ACy72q1rPW8jVAMYrECum5OLY+H90OyAo156vvJZH5zhlBPmYiuzqsYaIArGqpk0gYg52bfDS7YdYfI5CtyWQyZjo1G8pPzJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(478600001)(956004)(5660300002)(186003)(1076003)(8936002)(8676002)(9686003)(2906002)(66946007)(66556008)(66476007)(6666004)(4326008)(16576012)(110011004)(4744005)(316002)(52116002)(83380400001)(26005)(6486002)(86362001)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mdvqFX6mYF99jP1RtZ7kfAFD4Tr4HelpiZFAf3VWzu9HXsitIxVc38CVfBD070mXRZt5yjy678Nr8e+5AmmvWZnLd8mIGVilwiCe67qgXvJJLVlTm4TXVBqzinBbpRTfE14zVGUFdoS0tUDTquV4otD+ywFHeQlU+oBwlNcPWSCxQ4Lb0MQmukVc5sc+rQNni5CpIT2lLQmkbPa8m/Xy5sYmA8S0kcW5UdBWmoLhaViCDbMEe3heKb1IlTeWfFzaFOjgVRBvedGjc3rOhcyRAiaqXcjhCVEtW5UVDMctl3KkqCzdNg2+47SQKnqsJBVFl1gCi5xtdPPVt/OZC7rJH6BcBS6b9AQBf5RVM69u7UQgNJGemJI1zzgGkAY4ffhE/Nsa2vnshJX+SZwMtTha35g6zNdQXnQEuL1SBNzeiTGbq3PW0DoOdQmVgVgXOY1UvUWsC4IlqR1pptsWLrpE6KvIkMRdGOqFQLsX8JTCzj1pgDmNvcSOKuqfKAJv5k9N8Lguzm8t4V2ZkBY52lxYjv1C1jctOwFMGVIdUArG0kqd3HsgTFJMA+KC1OQTxrSphKFM0OEthdeZqcnxXAuWA3FujzqKtMHnUg3iEzghZlhBDMDYsC7KmPZemu/O0tx4aQi3Ndw1w4ckaTs+fmEEaw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9458ca1-456f-4953-1bed-08d844dde0c2
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:51:42.5861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHSkNnhI99pmFWOCK2dvsJx1tIMZXzNzf1MEHFmzeCex9L2h/iULGdKlGX4NSIMo4AUTp5ACqXMm3Hq+bA8b+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4834
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/12] regulator: fan53555: Fix W=1 build
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
ZXJzL3JlZ3VsYXRvci9mYW41MzU1NS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL2ZhbjUzNTU1LmMgYi9kcml2
ZXJzL3JlZ3VsYXRvci9mYW41MzU1NS5jCmluZGV4IDAwYzgzNDkyZjc3NC4uMzg3YzUzZjM4N2Jh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9mYW41MzU1NS5jCisrKyBiL2RyaXZlcnMv
cmVndWxhdG9yL2ZhbjUzNTU1LmMKQEAgLTQzNiw2ICs0MzYsNyBAQCBzdGF0aWMgc3RydWN0IGZh
bjUzNTU1X3BsYXRmb3JtX2RhdGEgKmZhbjUzNTU1X3BhcnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRl
diwKIAlyZXR1cm4gcGRhdGE7CiB9CiAKKyNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGZhbjUzNTU1X2R0X2lkc1tdID0gewogCXsKIAkJLmNvbXBhdGli
bGUgPSAiZmNzLGZhbjUzNTI2IiwKQEAgLTQ1Myw2ICs0NTQsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBmYW41MzU1NV9kdF9pZHNbXSA9IHsKIAl7IH0KIH07CiBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBmYW41MzU1NV9kdF9pZHMpOworI2VuZGlmCiAKIHN0YXRpYyBpbnQg
ZmFuNTM1NTVfcmVndWxhdG9yX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJCQkJ
Y29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQotLSAKMi4yOC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
