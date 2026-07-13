Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TCxIO73jVGpBggAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:10:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783A74B594
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:10:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=azClcS4R;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 309C0CA8E41;
	Mon, 13 Jul 2026 13:10:21 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012014.outbound.protection.outlook.com [40.107.75.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D44DC58D77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:10:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5VthNGpGqeYH2tsFCJ9szT7MX9J9AprLdnajM8B30H2PBCehYNiPjfB5bIK6Qchau4aP4v3NDjak35I4/7H6LfcqRzyNMsUZc3rGjXmicJ6YfhdTwX5bvUm6Z//bQmJW/Cm5Ye2z7PdxhERPbob0ecOUdpiJHXa6zvkk1tnnC86B93/QOyi4/go6mEfapcNe1v183LJxHbeSTO4od55cli2ScHnmJQ/crOMLo/zkl1rv5NJ0OoCFhldQJzBwspKb7XOSzVCCPQgy+9aT4KKcdaZOQwnEtcDIUnjjqJNmvfBzukjZH/SHhUpclnZtHP9BgLqmmgm8JKsM63HsNDdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHf1/UEPEL9JQZVy2MFsqf+KA5lDj6pvbkOGsFpOshc=;
 b=em4S4bjDW+7nprQzziAK/qf0yfnue9Gk1Gp1rgMdoUNsUFAuKO2fDZJcCLrQF045lH8zcpkBuQ6VjCq+b4tJMId8KDgWBnWnPSyNGrK5b8y+30sTv671n9fGhn9xOTiqzFCkFyaFzFYhGci7Yd39Ll2WbABSkfRY/I/Qpfuq+1odUNkO1cj7duyaKXJBBSVvGm/n+Hm9Nr/iRYfSPKkeOMtOdrYyxCXtJpOAe/UkJT9TSlJqlPsKDZhg0ylTJM4kiHPnBlPw1q4h1ttdD8tvuUowL/BgO0N7mnx3vCJqjjiCBfAzk4P1iuGqUqxqfkDqRqMY2DNzPpJfCE6Qda7zFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHf1/UEPEL9JQZVy2MFsqf+KA5lDj6pvbkOGsFpOshc=;
 b=azClcS4RjOxytk2hToAriFX5Fsm8jydxM3ljKcBIpJiuGVb4h8mhZGbkv3GhitlACbrdHprTqUXoQDxYOQaa+uP9dniBtJOTpjqSugAkghD8qYaKtEB/9ALNG99Cu6mqqVAqC2hm/kT27/I1NVTWjDC/OyDqLO4xYQ0+oHLl0qdmBfZFwUBDRvlLfzylaNgeND2dyfpJhVDo/K261as4fNn1jiKBNfKowdZSZGKUCt2RWCMOYWLysMA6ad0PWxqCraUfVP5laxXuwkPEXTWOTctoNCtdlJUZz+qw/7d+oIjca/fT2SvnDnbhBR0QTVPJjiVOLMXCt6KkhbJ1J6pmlw==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE1PPF50B2D80A0.apcprd06.prod.outlook.com (2603:1096:108:1::415)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Mon, 13 Jul
 2026 13:10:15 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:10:15 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 David Lechner <david@lechnology.com>,
 linux-iio@vger.kernel.org (open list:COUNTER SUBSYSTEM),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list),
 linux-omap@vger.kernel.org (open list:TI ENHANCED CAPTURE (eCAP) DRIVER)
Date: Mon, 13 Jul 2026 21:10:04 +0800
Message-Id: <20260713131005.306069-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TY4P301CA0112.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE1PPF50B2D80A0:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f789f0-7a95-4a3e-13a3-08dee0e01428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|52116014|7416014|376014|18002099003|56012099006|11063799006|6133799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 9U4p1vnBsdPwrXivN4Kmo8NCFdJKMaw80I7IcF7CQWNOiHDKBdtduBsUk6UwPrQ9HPGdHhFYoILQGc2VGefcTJTQhEF8K9z3c8fJjaob55CWoPCeDmX7mTx0jdeWEJfV/TtDcnx/MURPliLMmytpws+FpqrGM24Dvofkjt43USv0EFaYty2V2wSul37OpceBhhHHjAxXcAO29PRt/YMTJj3Vo4eFDeJzDujJU+W8OtWE41XIt593XtOvqMNbuKCJ3WmHuvXjcT0hvFC2tiZr01qYVX3Vi7Bahsdkc9U8/YtI2GpqxwzDR29Iq+J4llvGdF/ke9Vd6/Ki1bIt47smlv+yvwbgLn1u7XKyPe6qMbsT5RTK3gciAedEQDg0+rDPArYpqLb+WIhzt5xUE0K7Sf+v82NGeoNFdZrKTnVadKUaypRuWhMiE18cI3ZeS0DNFvfsXfknastVTtsT3Oyi6nE9tTU+iWiUn8qBPsVyW6NM0hsF/p/ZkYCVATnkh/ecxElUyaPt4bYfcYPe3Qgwn5J9+rs5QopJqoyWuqtOxAfWS4Pbzptog2/5xxGdCJDYywzQiH0C7rEZ7pP4wpdUXaNTtpvoxU7uYA9vJrQ71aFbGYouja15NCJ/sGITExG+LCxctiSOyFNkOEAAgHu7RC3KflwFY55d+cQuZcniR2t8FvdrIQEr1AcGVmDOYUProocIpcsrJoHLzy2dnjmV7G95txDpOIztZFnHYDIA1y8vVfS6/Tdz0hgL/xE8B3UJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(7416014)(376014)(18002099003)(56012099006)(11063799006)(6133799003)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?viHZTUovs4dSSXEo6K1B3T++uQ0bY4x9OIhYnL+vl0/ok3R8u+i/uQQArSt0?=
 =?us-ascii?Q?7dxt38pVnoZD0or0/GEGTHGdwwoQJE4Z54sY1ADq2GOQ8UgP5J4/YhwFICFR?=
 =?us-ascii?Q?iWIROIVw6HhD1ypVBd/Vd6a+CcA4GVQ1pgUHLOz85swjxdMxCYDDAsKIGsJB?=
 =?us-ascii?Q?1C4Qp4zL1adVxWxmhbLVzbWbMiuyxM6BX4Hrt5/yhTqEG1+bK6LBdvX0PXtm?=
 =?us-ascii?Q?fZR5NmrrmfEN19uR8WOcY5cA3Di7PeTM+fBo1J6Zyr7Y+WJxoaeLHZR9L6J5?=
 =?us-ascii?Q?/c2ZKMlgDby66nIFuanupa6Xz57ZZz6zm/QPfTs33esDes6ZedKelFU72Ruc?=
 =?us-ascii?Q?XSTkGymod7/XRGw2RdOK84u8Dg0Z3SWB+lNiz7OB8TLLid/YmaH5yNWkzmoq?=
 =?us-ascii?Q?4zTQMizdHh9h8MPtwB1GnlNhI2MeYy7pLpqXBBhjHeavrVkHV4B2fZI99hb0?=
 =?us-ascii?Q?jno74CwIm3yeoSrgDhEnPXq8OuokEwH0XZCRpkHMGNfVl5soOmyT/nfhJnIB?=
 =?us-ascii?Q?m9bbBjXqu3kayzPchtiXFGt1Z2c4gv9cl79PKToervyXouoORM2CdqJv6VUF?=
 =?us-ascii?Q?dYdhS9cKkUNy9oDhCCpZD+QwtYwaF1oP/cGOoVn4Yr79ow348+9QzW65gPV3?=
 =?us-ascii?Q?Cj0g2aOT+iv1QcTEwJMkmSq5MZwfFtdYRHPD/MinY42lOxV6oZyBVcsjCApu?=
 =?us-ascii?Q?LZjzxHMT+C0bl5APMKml4u/PwE3ucW9Ochf/5YYeXYXwDfyiagn75UhN2VRE?=
 =?us-ascii?Q?CEPS8omVH4WJaxwLUwTGmGLMR/ULo2xOhAJCJZWxCRICr/HykNbD2xJAkGNo?=
 =?us-ascii?Q?sgnIxHi3rwhv/g5/fudjk/Ku+MsteApoj5WGZ4/7zPX6WqVojDFJBpznXcOc?=
 =?us-ascii?Q?h8arIU6Q/woYs82qEaOs9cvv6KL3DqE47wv1qfDLSKeQEtd7Saoi+mNUPaxx?=
 =?us-ascii?Q?WOFeBA7gvLRppEZixJ4o7u6JVNVpEZUnPlFWZK/4EbakRo9PvgoWQpUigplm?=
 =?us-ascii?Q?6XvIuUNFi2GB3oFjI/N8uZYNXb+EB6eW1kiIqXN6CxDnM5DmYN29j18CKwFQ?=
 =?us-ascii?Q?Vbhrk7IKpvq9pkNRyliKkAqumXMbiQimeRok24nvEkIjFDDFLUHigtPd4ASc?=
 =?us-ascii?Q?BAUyUfIVlikG0N00ADYZaNb+Pe87lycXGPfUfi8KmsKIF8GG6Yuw44ULyhXr?=
 =?us-ascii?Q?TAbNAVmCFMqxZw3Yrh1SGT+0KwGMNoAvyNkLWAsMLkSvIt8I/70xFTgmDT/Q?=
 =?us-ascii?Q?s0VrQ9F3Y7iFTu2DBDWjOQdm/ZoR3tZJ6fDuBLqmWS1mxgN7UuFpIov/LxBm?=
 =?us-ascii?Q?7J6JmvIOMmc/e8xt3GSdG5qnbe6HmWxESaMov8vkk9Mnr5jebjf06Fpml4BP?=
 =?us-ascii?Q?qnwY/QPpVzvYWZFe05zJzAQcSRQmjGzEaVzq+YulMH/sBcZxfmtZ1vvdVBdU?=
 =?us-ascii?Q?yyStCqBZQrokRZ5ql86Un49N7/5noLG8Ux/qx9D2Cwy2OuP6N5he7KwrDZAG?=
 =?us-ascii?Q?seKnoLHhwmbTFydxK3UYxbuXUtafketb3iz50m1Vk/qsJNxkXvCUSxuBxq0G?=
 =?us-ascii?Q?DGOFw4iBpwgbGsrmLjsCb4ZkF07FovPF6/JKXHqNVYmOjguAH+Tc1zzP4TRJ?=
 =?us-ascii?Q?ebKZzphFx1TApoBplKQM3cLr9h2KOAXTWRkiQUp1+CbmGXFeGmHrDk31BA8a?=
 =?us-ascii?Q?4NNWwT8IwIq06GJkrfc5/JPSl4ifnYWMrUICkNJjku+azXhcHJFhnmNRHbsZ?=
 =?us-ascii?Q?nBep5kuXPg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f789f0-7a95-4a3e-13a3-08dee0e01428
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:10:15.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MjQaf+YgrQC2BWQ/PLNClmPsxejFTL/paxSPSLRocTNvMsdBoEl+/RaX68eeT4dSshNEo4YAvDuGysSKchcXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF50B2D80A0
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [Linux-stm32] [PATCH] counter: Remove redundant
	dev_err()/dev_err_probe()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:wbg@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vigneshr@ti.com,m:jpanis@baylibre.com,m:david@lechnology.com,m:linux-iio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:panchuang@vivo.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,ti.com,baylibre.com,lechnology.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:email,vivo.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6783A74B594
X-Spam: Yes

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove the
now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/counter/stm32-timer-cnt.c | 10 ++--------
 drivers/counter/ti-ecap-capture.c |  2 +-
 drivers/counter/ti-eqep.c         |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index a3d8f7a5874e..9eee281350d0 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -759,11 +759,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 		/* All events reported through the global interrupt */
 		ret = devm_request_irq(&pdev->dev, ddata->irq[0], stm32_timer_cnt_isr,
 				       0, dev_name(dev), counter);
-		if (ret) {
-			dev_err(dev, "Failed to request irq %d (err %d)\n",
-				ddata->irq[0], ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		for (i = 0; i < priv->nr_irqs; i++) {
 			/*
@@ -775,11 +772,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 
 			ret = devm_request_irq(&pdev->dev, ddata->irq[i], stm32_timer_cnt_isr,
 					       0, dev_name(dev), counter);
-			if (ret) {
-				dev_err(dev, "Failed to request irq %d (err %d)\n",
-					ddata->irq[i], ret);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 
diff --git a/drivers/counter/ti-ecap-capture.c b/drivers/counter/ti-ecap-capture.c
index f69b6920463f..d77a256f0ed3 100644
--- a/drivers/counter/ti-ecap-capture.c
+++ b/drivers/counter/ti-ecap-capture.c
@@ -513,7 +513,7 @@ static int ecap_cnt_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, ret, ecap_cnt_isr, 0, pdev->name, counter_dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to request irq\n");
+		return ret;
 
 	platform_set_drvdata(pdev, counter_dev);
 
diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
index d9302ec21163..0dda3f2b14c7 100644
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@ -526,7 +526,7 @@ static int ti_eqep_probe(struct platform_device *pdev)
 	err = devm_request_threaded_irq(dev, irq, NULL, ti_eqep_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), counter);
 	if (err < 0)
-		return dev_err_probe(dev, err, "failed to request IRQ\n");
+		return err;
 
 	counter->name = dev_name(dev);
 	counter->parent = dev;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
