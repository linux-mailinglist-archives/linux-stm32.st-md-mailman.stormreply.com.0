Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWXOHvgBLGriJQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC76798CC
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=LhM333ua;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 174E1C9AE33;
	Fri, 12 Jun 2026 12:56:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013030.outbound.protection.outlook.com
 [52.101.83.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90BECC9AE33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 12:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqwmaDOZcepvp+AxBMm21zsKQCIlK8/GUfQf3gG2lLFm4ppqsiqhRWLUerBj/bUwNpHlBN2YpVIq6ycqengP36mvUC8m7wXAYoWk3YGqeCPLzwvZs8Coj65e20eMREoTI4hGIc+3M7T9RQe9kuR5stR533fbJE5rndbSylYusrSNmrTmYH6cYCXzCbuqE/jzAcPBtS3og/PoYbV0YWL1U3NxqUM0zVxX/fkr3RIN8VsX+ZwQsTrIH0EPT9t+wASg/BJK2W4/F7fvH/+th2FUjaCx/pel6lBNopuY3mT8oB0VqAcplMvifZo3P2k2Zuw8P8Rc2YdYGxbxEb/O2837Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=sPz/hL0OW8RITO5y9ISaiM6YCgjK4DUeQSbhPpNF8VRncO3EgRBk8/88he433y2QNRZ+Cn1i0Irdve+EpGYWquCmy6Utp1RuIP8Ieut2rbxJg5IUH6UC3q7mu7+FAQi2vE5KK6ccTSuhfcS0sHQGoHfIYv7LoGn4iJIbbqE+xC2y6M6w05WllEcSWpcqg1xYB58Ze/NdpBn5Hj6ocQgJpm5qj3Fz2OvbP3MMmotFuUv2gmapys1OYRkUiD+DtK7qkgHYV5orqM3Hci8Oy35xjGl/rMbpseQr5gypcGB+klPu+iztbzHR72WmmO40Gfw2ocOaOouoOh5ybsUzRMASpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=LhM333uaRZYdrZ5EUI+mIqekUOUdJDsqIAFwtbnO7itki5TnmIm23xhn2OSx7kVjkbDYGsV+FhNoLM0iOkN1iAnrjx0XDXxHNwkpd0hbANmuOJLbU/1UhAYyi80zmN+/yqNzWCpdX/2Zt5cbCqkzDw+6CqClAn0TaIiA6PegCGrR3w8IRzcqtER47hupnJeG1jLFJnc4DdQfo33u/hX/NjEhOFqjpAA8HFWcrXXaDj7dKi+JgGwd9GvF9JxENWXwzszWNmsm/Zk6n9pkyTLpuxSFauIV+8s7vEXWIBHvZ3lNlLZi77iA6xoCDtlAddhpjoylABteVTy69MVibSNQyA==
Received: from AS9PR05CA0356.eurprd05.prod.outlook.com (2603:10a6:20b:490::22)
 by GV2PR10MB6307.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::54) by AS9PR05CA0356.outlook.office365.com
 (2603:10a6:20b:490::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:04 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:15 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:06 +0200
MIME-Version: 1.0
Message-ID: <20260612-node_reordering-v2-5-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|GV2PR10MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa0c9a7-d781-4e1c-63df-08dec881fda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: zpK8NRwMdJe55qImf/F9lxGHrVbw9g83MPraMpDMaMRjt8rZ9BQ39TEsyoLJ+lzlrJl3zKqcgpOeSGGG+NRDGMgwt+YsJaRSLJXTa+A9uBp6cuCLn46d7ANmg82dBx6zLlGBEKbKnP6tXcY1890tT2KsXWxCfb2RomCgA7ZQVVdWYZ85bDY4WOQ4axTE/9KtsgZIU0Gz+rtPZrPbxRhUUBgHvuVGoL7HA50mv7gWNZw82zsHF3hzOWTiAfRKd8ZA7edWLDOnGka3e2W30lxX0G9nV9upFee8qeTqEBsKQVUJe7KZ6MLjg/Yp9PiQn0VMUIFTDhsmKdIXqaxF/g39QJWj+o4QHWubz2i0fAUb4SsvKd/5DqLThSj/exm5cR3Pyi+0NWqYJRvrHS3bSMhlbK1Fh7L8XEfREMjWifKPWleQANRiWyxHfPSQRKpY/GSjND2Jlm2BkBbqkVZS0nuvo9HB2GEvobCcgwpK2HNU+hpB/deun/maA4dB5B9JyRpv3WQah56FccAbJiwkBM/x0deGdDyARUFW8m29q/ZSoWYkrAHoWO3El2rqhl73rfmeT9Sk8wBe5nLXuRd3ZJzc547e6R2dTjbIfXsl3gBr8+LpfgdfiPPCrAzSLh4NUAXdazHLdx+r/6f83nG1Ok8xU0/bKpjT+f1EwylZKaKXaukcEhWPglrsCWE0krsOphZ3oUnBiOvm+7KAiBhgFzrrRLIscqzlWrUMt3dqpnwtJds=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(22082099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nEPhhNuoxjoN/5OWkMVWuvPC8jDoTrYdsRasIhVLXDFNz8hOswmZjCf2wYZ2JKALug0tqKiMUuW8yMpoQBpJE21RnA3JusOK32XoXaF69gA43JgTl78s5G1M7D+/ra9Gzz5eKBfk4t7olE7c1Ita9ETfOTR8WIDx5vpOKWHUBotUXyD4eqYqgMe81qoXccMMVau0VyPlKep84DH7OQMDCvYDEeOglGw14eV2s6DZCKDvITrHjnbgxBgAzMmnKMruxAxqLd7vVbkPt7e/NmWw7CZlD1g0IPqp0G6OdIX0yhuygF1As8lCnWcGSFQA5Ar+yUolp1nrxl0eCfahgLLL9LauouLLGiY5i26n1HGQNQFTp2wrzxvmIQIh5a9PFnZ4ytmFu7wgdFUz8Kx999hMlgjBFdxtxldeq0zNLmk0KYAMb7Fn/6hhfoYQtaBgUmAb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:16.4018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa0c9a7-d781-4e1c-63df-08dec881fda3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6307
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 5/5] ARM: dts: stm32: reorder mdma1 node in
 stm32mp15*-scmi.dts
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,foss.st.com:from_mime];
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
X-Rspamd-Queue-Id: 50AC76798CC

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when mlahb was replaced by m4_rproc.

Move mdma1 to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..53e40e2f776b 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -51,10 +51,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -62,6 +58,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 43280289759d..0790ed426ebc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -57,10 +57,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -68,6 +64,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..0a3894aff4ae 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -56,10 +56,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -67,6 +63,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..c2b6efb1cbb7 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -61,10 +61,6 @@ &m_can1 {
 	clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -72,6 +68,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
