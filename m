Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8724CB5A
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:22:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93590C32E8F;
	Fri, 21 Aug 2020 03:22:42 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F030C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU/v4+ejdy2hDH23Cj2W7XQRaDwfR267aoJit8Xa/LrPiUNfZ6nKzwMwFpVrHN3Eelb9Z5ZpjhLnI2wMDpDC+RB7LQ5EgLUU3P2h4JkUFsXVAYLMyaLKuaDuTM5HP0Ot3asl3gVxWiuoLmYv4SlQ/dk91EPVISJ5TEYI0JT+9bwtmz4dCZHgXfrxoo64PE5cWtZb91sDjGiYZ0xw7PD2fSojRvv042NK9q80DJv1C+FmzbjnD36AVy3CTGgd6jI2Aj2+/qMxqHahyLAu7CDSkk1rOyj+9p6jZ2Ox2nVZ0uXyS+XX49OsdegJwsugAivN5J43Lkpf66iuy/4hHplLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzyTzVhiEHMv4my2kE2lC6bPRtsbB0+inniXkUx51ck=;
 b=czMEbeG7wgvVRt/o5tvvGwHH7bP9U91rEUa1xbOf+qo61+Tli6q15Kp3fD6c3koDmz/sDsLZFoNQDQ/GvyM8vinsIPG4ihVleUqClJfswQMmiEiZLxQhq28X3SLNAUGCLtqFm3GNd2t4DQslK9GZekT1WcE3sQ/S/exE1Gb83FQ4GTIdL7ora7MxoUaJM6u4LZIPWKNATJ2Vy014zJu6q7jsIkeDAI+S4cBdUduzWupp90230BqSUD+CDdiGOWDq7urUQyolsEYed+r0VELmq9YlS9GpbwXjO1dP1ilkdzVkEZbMKE8lilo/w8iS2cX7ScZAeahSkhoHn1YhCKam3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzyTzVhiEHMv4my2kE2lC6bPRtsbB0+inniXkUx51ck=;
 b=CmgjocVF6OFRcCwDNC7xRb7BEZXu4j76udrgpBfksOA6BYuJQE9WEReswW4Zyr8wx6kySCyQ49OPiRGa6vZU05rhYhgPcglD6qHC0vjzKIort7c+YP0W/A+cxSxcEpfG7Wm6STghahkukaLmXNgNoVawPdmNEblCAwZ9FBdPOBY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:38 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:38 +0000
Date: Fri, 21 Aug 2020 11:16:57 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111658.59a7218b@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:34 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9ca4c6f-8114-4774-114c-08d845817491
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617703CCD723E00C3F30E00ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0FYzlZTmPc0ronJbIiquUiT0w2X73x4J9NRQiK70kTis6JjsF6I5ntwzKr5Mqb+ahEmvkMBnE2KIFjoZaDNB56EElbjv/GuYSaQfVxmsDIgwM3ip06roy/qze/wgbYqmINe2RMenEWpXZPgp4ENv2QVGu2Jpx31iJNRpWEMcBFsK0rs4Q2EDf4afXGYK/2c8JwxqiJtGlczeZmOZ0v8xE8fIkDMYThs1T8UTj2QFWZ44eg40fPsv3PEcBd/Jv1QtYLW0OYsBR/DLAf6M6oHmWzGNsNPE9tGmde+qOFMNhQseFEy7n3s15Z/ESY/C1hxUdIloeLPBnJSb6tmUk9WjHsaAC3AB7Udbn8cK/ijLBXgQZf28Cso/BTjCTRIEDJD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ijMc5iUsNL34IOBeoME1zJBjxXOMPDZh7CK1Z/35sjRGGp5eKhWooHc7Ty4F+1finr1WofVWeA55KduvguPT3uWBCb98WLMCH71HgsN+z37YJ59LgnTZHTK/YVW7iFFcB0uoEkRLrg2NP94PDzKbYlw6sfkAwr9Fhi/eW/YVa4Jo6mxWVHZ48k+uOr8I+ECjb4Gx7Dkq8puIp8kNTQ5pfapuOWe2UbNtvb8gNVNIeaM2r5/ZH1UctHZTad2SxIxOi7fm09koHh+DkEs9qIRrHM6bFCQvPjZvWES/sJWcud63XSgY1UI1WaTsw9K3KyRnuKERzvRle2pEXIDnoAsbgFbW37OGVucr5C5nkxY9XNaQ2qHAwwCG9MgB/G/MMdIsXSpL/bk8QN6CLoT6pQIgrZH1OXUQGUKKgfx/W4Vx4gkEjn7mVHmzmglA8ho+DT93VjJXzhFCUHeiJ2jMs+l27XfMubWE7LVTGltM1d4FJT3kwyVeumkyq5FQdfi3nKIBh34F3rG0Kdx6cWhQulxsTYgy2EtOzBqzqpgN/wqQUVA9sZWsGYqvTaqpwM8tewtDSRI81e5yA/O7fJa+CHNIA7Gjn/qToBNmkw9wGICL3X+QirS83ccoBJ24RRmKmvcw6Q+NqSKKl3AvEtIEwxCusQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ca4c6f-8114-4774-114c-08d845817491
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:38.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLmvTGegR4EP6Ow7U0zawR+HYRcH1PAJjaOSKrqjI+92p2ewJ/v8WIM98WHqrqXapFFVg0XsgvtvIfZtGKy1IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 09/15] regulator: pwm: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3B3
bS1yZWd1bGF0b3IuYzozOTM6MzQ6IHdhcm5pbmc6IOKAmHB3bV9vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIDM5MyB8IHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHB3bV9vZl9tYXRjaFtdID0gewogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMv
cmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3B3
bS1yZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYwppbmRleCAz
MjM0YjExOGI1M2UuLmQyNTBlNjBmMTYyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Iv
cHdtLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYwpA
QCAtMzkwLDcgKzM5MCw3IEBAIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBwd21fb2ZfbWF0Y2hbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIF9fbWF5YmVfdW51c2VkIHB3bV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBh
dGlibGUgPSAicHdtLXJlZ3VsYXRvciIgfSwKIAl7IH0sCiB9OwotLSAKMi4yOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
