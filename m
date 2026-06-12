Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tZVsB/QBLGreJQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35D6798BA
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=Rw7jHvZS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC75DC9AE33;
	Fri, 12 Jun 2026 12:56:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3229AC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 12:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgTExjTrnXOZ7HnsfcJHAy+1/aFjabNbwSK0TKANpj1kexREUlWy2cERulcLnrMNOgJZrujNanh/B0KzvSydPm+5omVEBWkho4fogliFWm9kfJ3TiOkD83uGnpGOuwfZ1fTRXZAMdOmjYtT2nJbTjjGkcp4Z2F3q5JrRxdMVs5thlULiNR/4j9bnAUdX/MP4TI1GrBep7qYQYCQRkK21kHYE+o25gfiM7ftXzzp+R1rIfnKlI8f/3L0K9mh7j5Ra3GWo1Mi7qgGVccPyJ5nBrxuo/jIjWIpCUkw39YT1KG/P7lCZZ5YFQ5m/qTazgTBjrbK9IV3VC5HNOCi12Ff4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=KGV+Q/O3IdK9MdNKG2tqxQGzfMMGWJpdaoHDfB1FNZYx6F/WB74GxU71swMBiVRkb//dyAGlhvLd0dSyb3sUhA9PmSx/eNvraLu/Je0xLv1/lDPjcZn7Za64PRVqyTPGhK/8V7K4+pPuf6wUMQtGQzbBPaIg4uI+X6l5J7MUpGLcFMDASazhT8s0do+wD3aWJIJyEyX+Tjc8AWnQKqyBvhHmP8ZoDJpWrvlykL54a793HQBRTUt4oxuXyXQ6gWnTDaS6x5sAxGYH95o6oUikdEPE8yhIPsh5k6iuxf43KLkEb4yeoayentMz52K1viZCzFNawBx2CSU9++D0XtOvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=Rw7jHvZSNfjBypjh3V+opK+RIiSHamLU1tvXgyMJIu6f7c6EKOKDL4WV+YgjRQxht5U7Kom+QTN/rvgjfvFL/aIlueVhIIEA+WZb581YOq4GyljLnrxT+SqfMFNVcfX+TRxjqtBj0ggElrZPFEhIdzGzEUMvntR8v6fmBHqqyyyQGfJuxyC7DfHEmXti56yy6oSeC4ZSPaZGUNgOv2FFCHYA7AFFDSsjLrXTUr1rhjT4VGW/YArrldVBJJCcnjESrlI+PBj8wacsAu7QC0o2OIFPweEXb8Z9njeZokdiV6sTca3Mj6Yg07VVkohST0+4mgjF9op+2wEO9MrIhrGu+Q==
Received: from DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) by DB4PR10MB6189.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:387::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:14 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::50) by DUZPR01CA0237.outlook.office365.com
 (2603:10a6:10:4b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 12:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:29 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:13 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:03 +0200
MIME-Version: 1.0
Message-ID: <20260612-node_reordering-v2-2-f68032ca3088@foss.st.com>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|DB4PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: af04a009-270e-4344-af78-08dec881fc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 00zMHPDHoetvwnyCWv0+9z9OeafzrqC19sdEfANIT9EBBbMl6pRvsk85eantpmZbDocEGT9Np8zr5IPRVWvG8SRxWrBQEcLo2nQ/+CAo1Jez3QkIgvG2e8PI80hmUrmWnTcp0mB0qGdJHTpMCbH+yG7qIb5yAvGeSYBQHhFklZSZrKLhx8wOR/21cI2b8d4g99cgWznxCJk+ujUORtlmlKPKRc9AaskBHsxLBAGAkmfY/Sp/ZhRm+6FEM34Izwvz7j8A2Gyq9z3dv9FRovn2RVbSVa70le8iPXPu2Wi4DkK7PngtJrDheqhbHkfC0ybOv0coRVjBoBrI0Ki2oYXFFrDn+n52R2xI4iJvcoSptUo18HMLyR1uTkB8OPzVwKQn6ham3q6t02hvw65y1Saf0Q5dI12jvTcvmsFJArUL+sI1VoXLIts0uQA48b3lb0vY++0PjhplkE6+P9FAOlmS5S0sv7VvplB9V30FF9rQcw6c31CLlex9/pqBopohLeof+OKGQYC24axxs4FYWsV0DtTnOTBlU+O+K0c2j4uRQraiMNXWQgvVI1fTjtzs87Oc3iDCsLF0JdjzvvNuh6k9QWPwM//SvyEeC0i11O7TM7k67OhErLcNbu6ymeFjvBZcS7IK7/4ghYcgzddwwjGv5t+iaGRe9NEnEr780/6BKJEm4S7Rf9GgznJ+BhWNK8I97bJWlagaJHUxP7FuSpsMnP4GcInEbegvAv7IaGwNkA0=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +jgjc8O6xbGnO5wRj/CB/z7mLqyttXhg61ltQ6q4PnFuGk/vra/Y/SZRopQA0ZiaL23tJjgZe2CYxUswf/WMyCfUe/JoZLaYE8mzrv+mKSNBwGfVnrAJevrHlMq/5XXN1bjhbAAw4pZP1hUYuuEW6ABkenJJjjLJ2dRL19gV12XxKtBRGTbushwJ+7g0a5vahDRRkwCgl8yr+HvgDztjuQL4gva5+9TW2duI7XeNTrBe2A5iqtM6asQAIyaDWLd3vps22H3FIcsAhgNDrbCJsCJr8keTlkQe68RhUSAVptvn/8OAnyy8axE+QpMSw1SECjBHTiLkp35qo+sOe16vVa1FqSGiEgmOe29E5n5+Ct8sFziDuLbrBV1/80gsLwxJctdc+MSwmI3/gjX3PAGkZDc3khbYteYWqg24lr9NLSKS2cIPa/96fOnItSlk2xNv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:14.5571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af04a009-270e-4344-af78-08dec881fc8f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6189
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/5] ARM: dts: stm32: reorder cs_cti_trace
 node in stm32mp135f-dk.dts
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,foss.st.com:mid,foss.st.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D35D6798BA

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..bc3050a9bec5 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -190,11 +190,11 @@ &cryp {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
