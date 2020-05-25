Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E01E0886
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 10:14:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDFFCC36B24;
	Mon, 25 May 2020 08:14:18 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30065.outbound.protection.outlook.com [40.107.3.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90756C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 08:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4PJIvc72in6wPu+7eY6HbY7Alwv2U+W+VTkUMAAXTHn6mXw+v1ta+OQvlq9rYuruEgDRNUM+U9w7WdtlaN9vj+Ixofn0NRtVppRpMwHdpl1G3cAnvZmoERPBuFVVYnS55zItnQwAVCW5C/61qDMAxINpQ27vEJn7nB4Mtzys519tUTU4T7fkSRDEBqS1YwxPXUN1mVL5XTVfrKMzpt/VlYY+ELBfrDlTmuNokEtpUTsD3OAYa3wgw0vmymqs+G7tobE8/QbyEJWLVVWBphwNTmQb4XxbyD5sdKjgaLD69hFqSOU5+kXKosQ6PowSruO9Dp+uTWUPono6/4mVh8qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMjqADPXcr7gZ911ODQ9t2r94LjENwwbABkPzilulFs=;
 b=bYnlIWLA4sehHinmErzs03VV35mzylNJtCCMDR2XWqdqrB4/bUpwoCYFrhbAkUit+93vyBpCk6nkwW0RwrG5tYbHzWm4NrMgDP5z/V/vGSXlxrM7ONZYppNFouxeVguKmrksfN+gkg0NDOAZTCN0To9ok6qBQZnEnkgTWlEPgh+vzKlH66l5c2DNORPpn0Ic1TXjxH5FtRLgLMdxq+FSnriEWC+6FTuGZMJn9U2FI1y1Q7ttEOtaaSJVxbrVOV9zqEETXNT9TFMyIhJh+gmmASf8noWMWUti4J+7q2+F5qksz55BEBf2iUdVsuE+UEN+Dd+7y88zECZweMD2imK5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMjqADPXcr7gZ911ODQ9t2r94LjENwwbABkPzilulFs=;
 b=mJO1/5CDHCHJ972PUhIQQKR4kxCoKa4APBOhqaY9OJbBCjuXJ9gU9AJmIddb4buGIps4ZepzlKzT5VjKmyDdwtNqZf1I2fw7N5BhUOHm9aZQRTQlKkRIePkvU0yzgPtuVLGWQm6SP++tRBeRgRvb0M4hpbyUDxg2Kkv7xWfj6T4=
Authentication-Results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3896.eurprd04.prod.outlook.com
 (2603:10a6:209:1b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 08:14:15 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 08:14:15 +0000
From: Fugang Duan <fugang.duan@nxp.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 kuba@kernel.org, davem@davemloft.net
Date: Mon, 25 May 2020 16:09:30 +0800
Message-Id: <1590394170-5363-1-git-send-email-fugang.duan@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR0302CA0017.apcprd03.prod.outlook.com
 (2603:1096:3:2::27) To AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b38611.ap.freescale.net (119.31.174.66) by
 SG2PR0302CA0017.apcprd03.prod.outlook.com (2603:1096:3:2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3045.9 via Frontend Transport; Mon, 25 May 2020 08:14:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b567133b-179e-4dc6-e804-08d800839d49
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3896:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3896180B2F01DB93F9AD1E23FFB30@AM6PR0402MB3896.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0414DF926F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/yH2RBgA9AiIYAe484IN7UG6m7kZ5QxYbzdZkN0A9qHbZX+DJ8PHCUb3uHrJAM5Z6VDcN27Mqmy28fRGfFXjCZhi9oTbGSBzM4CqLKDePFptUQMvo3RuN4IPpMxYH0XXW+N1dWac8fafkkOYIL/DTQkQavJPdcFYnbey7/GZBSWzixAcGMBD/D98U5h7mbcF6R+kinGRer80QrcemlCW9MnCAIO12KOI2+EEqc2+Cjr0x3F9bvX9hDmwoA60G+hfCtPsu2cHxx1fj6XspEVyKnrKg+tVfFzRTQ6ULHXP5EecM4UvMegcvKzp9iES8Cg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(6666004)(478600001)(52116002)(6486002)(86362001)(6512007)(316002)(4326008)(2906002)(186003)(8936002)(16526019)(2616005)(26005)(5660300002)(8676002)(44832011)(66556008)(66476007)(66946007)(6506007)(7416002)(956004)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: suI/oZQbS9BXxBmpbQiKgIPjPtyM+Pm9FSTX8zVbflbDk3kbXXH9W9cUpwLm7enyOcCerPet4fFo3W0bBJLKy7e+5aAN+va7AZExw/Vy7hazD3zkuOov01dnbeHxonrP8rEmDH3YJBh51CApvYtJN2gdtDQiJDEXhWVT2TP9kAK0IWkpQdgWTZzeGLCbMmYbI9FtWUrviFoLHJ2xUuqP3hCULI+C5DfaOBOzhxSHTK6LzZxg+tbRDjQDv/42PEPCbqrO7EsSm+d4QyLheztWTWjoD6mhDonQ5V5FBnOT62MYcRtDTNpGoQhwD+qCVAbVFl8MQ1Kaqzz7i0xl1iUF1uNmoidQ6wanw5uKoDbgjAlmAu5psgACavXELHw9jCOFIEU5yhMLGZ6HNxToXOmtkz1R4P55h/VaZWiXoO4glGVNXoM1bzZTrQfaONhbv5DY+esk9ZejexDq7t4BDVSf/ZK99xUBFVg4gPD97yiHtcYkAHHtZM72wx/2eH91uobW
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b567133b-179e-4dc6-e804-08d800839d49
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2020 08:14:15.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYCJG6PbxKFNhJ21XWhiKYpTHEuogLk0IzTtMIXqKxnV5+BKvvB7JJSd9cV9Y1vEK6hykjXQ6BYAxGaG50knqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3896
Cc: fugang.duan@nxp.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 p.zabel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: enable timestamp
	snapshot for required PTP packets in dwmac v5.10a
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

Rm9yIHJ4IGZpbHRlciAnSFdUU1RBTVBfRklMVEVSX1BUUF9WMl9FVkVOVCcsIGl0IHNob3VsZCBi
ZQpQVFAgdjIvODAyLkFTMSwgYW55IGxheWVyLCBhbnkga2luZCBvZiBldmVudCBwYWNrZXQsIGJ1
dCBIVyBvbmx5CnRha2UgdGltZXN0YW1wIHNuYXBzaG90IGZvciBiZWxvdyBQVFAgbWVzc2FnZTog
c3luYywgUGRlbGF5X3JlcSwKUGRlbGF5X3Jlc3AuCgpUaGVuIGl0IGNhdXNlcyBiZWxvdyBpc3N1
ZSB3aGVuIHRlc3QgRTJFIGNhc2U6CnB0cDRsWzI0NzkuNTM0XTogcG9ydCAxOiByZWNlaXZlZCBE
RUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXAKcHRwNGxbMjQ4MS40MjNdOiBwb3J0IDE6IHJlY2Vp
dmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcApwdHA0bFsyNDgxLjc1OF06IHBvcnQgMTog
cmVjZWl2ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wCnB0cDRsWzI0ODMuNTI0XTogcG9y
dCAxOiByZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXAKcHRwNGxbMjQ4NC4yMzNd
OiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcApwdHA0bFsyNDg1
Ljc1MF06IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wCnB0cDRs
WzI0ODYuODg4XTogcG9ydCAxOiByZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXAK
cHRwNGxbMjQ4Ny4yNjVdOiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVz
dGFtcApwdHA0bFsyNDg3LjMxNl06IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlfUkVRIHdpdGhvdXQg
dGltZXN0YW1wCgpUaW1lc3RhbXAgc25hcHNob3QgZGVwZW5kZW5jeSBvbiByZWdpc3RlciBiaXRz
IGluIHJlY2VpdmVkIHBhdGg6ClNOQVBUWVBTRUwgVFNNU1RSRU5BIFRTRVZOVEVOQSAJUFRQX01l
c3NhZ2VzCjAxICAgICAgICAgeCAgICAgICAgIDAgICAgICAgICAgU1lOQywgRm9sbG93X1VwLCBE
ZWxheV9SZXEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGVsYXlfUmVzcCwgUGRl
bGF5X1JlcSwgUGRlbGF5X1Jlc3AsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUGRl
bGF5X1Jlc3BfRm9sbG93X1VwCjAxICAgICAgICAgMCAgICAgICAgIDEgICAgICAgICAgU1lOQywg
UGRlbGF5X1JlcSwgUGRlbGF5X1Jlc3AKCkZvciBkd21hYyB2NS4xMGEsIGVuYWJsaW5nIGFsbCBl
dmVudHMgYnkgc2V0dGluZyByZWdpc3RlcgpEV0NfRVFPU19USU1FX1NUQU1QSU5HW1NOQVBUWVBT
RUxdIHRvIDLigJliMDEsIGNsZWFyaW5nIGJpdCBbVFNFVk5URU5BXQp0byAw4oCZYjAsIHdoaWNo
IGNhbiBzdXBwb3J0IGFsbCByZXF1aXJlZCBldmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBGdWdhbmcg
RHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwppbmRleCBiNmY5MmM3Li43MzY3N2MzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCisr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKQEAg
LTYzMCw3ICs2MzAsOCBAQCBzdGF0aWMgaW50IHN0bW1hY19od3RzdGFtcF9zZXQoc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwgc3RydWN0IGlmcmVxICppZnIpCiAJCQljb25maWcucnhfZmlsdGVyID0g
SFdUU1RBTVBfRklMVEVSX1BUUF9WMl9FVkVOVDsKIAkJCXB0cF92MiA9IFBUUF9UQ1JfVFNWRVIy
RU5BOwogCQkJc25hcF90eXBlX3NlbCA9IFBUUF9UQ1JfU05BUFRZUFNFTF8xOwotCQkJdHNfZXZl
bnRfZW4gPSBQVFBfVENSX1RTRVZOVEVOQTsKKwkJCWlmIChwcml2LT5zeW5vcHN5c19pZCAhPSBE
V01BQ19DT1JFXzVfMTApCisJCQkJdHNfZXZlbnRfZW4gPSBQVFBfVENSX1RTRVZOVEVOQTsKIAkJ
CXB0cF9vdmVyX2lwdjRfdWRwID0gUFRQX1RDUl9UU0lQVjRFTkE7CiAJCQlwdHBfb3Zlcl9pcHY2
X3VkcCA9IFBUUF9UQ1JfVFNJUFY2RU5BOwogCQkJcHRwX292ZXJfZXRoZXJuZXQgPSBQVFBfVENS
X1RTSVBFTkE7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
