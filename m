Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ee1Iz7op2mDlgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3AD1FC2FF
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1E6C87EDF;
	Wed,  4 Mar 2026 08:07:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A65C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 08:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCbPMe9yUJSaBlje+MSm8kBerxW2bsBAHp+CFND2xjpdwX1thS75NZE35MYwm4ihY11Z35G4O6UK+Qhcab5+OrI0QGb9ChWOZ5LDDo+F9n8bVg19qkTM0dOwfy/Orrkd6PbbEp72wkcyevJMBXIDSn6NkT6g2eSLo7XtgEs0EBAlXF9f3ZBxWg3e09+1DgJOBJtHr4OXKGM06NoelvmuB78k3eKXHoQGcMjFKg1XUR3s8zpjyCSqpLE7yFTEB+17jwEUIL1jxgtauolm4EYdHMtbUeiyzKkTn2zxHVSmP5tiiLmN/FWME0jhno7x7nXEW1/uOeE2MCyHVjeUXZIHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezaKcTCwxvc8WCNj/aHK68Tu0GeEJ4didEw5cUNO9nQ=;
 b=do4BYEydoO3rsu63s72Pvf3/HkpvC3pxLMRuCXWc+5xEeifv8cQTdIfl57EFiABGJMTICvM9I0hNL/+NcWDlAUJ0N3MnUCB7pfsaIA+o0wKvxuDRt3ZxTwxVh57/xyh+ZCNtCl9HOY2p2E+TksEKDY8GgUTA1ExyFE4jFpy2un3twHw7ek0DMUefYKQUeeI8XvDxGOv6ad+NlTqikYN1wWuq3OWfizcX9bddrAj/9oTDfJY5NBg6sv7V0woJpj+u7JqRbdIt7lsVNu/Tf668/dke/IcKcFMA9mJRO133rJVLlGu5GBGBGIil6qntvhkS23JmhrYkoZwxOdwaP3ELLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezaKcTCwxvc8WCNj/aHK68Tu0GeEJ4didEw5cUNO9nQ=;
 b=FIFtAg+j+ZNnoyH3jRlG/IuxohYIbQy3/VvWMvg2rfproK6SnukHEFC/4WgrW/zFR3amQHGbbEi5LE1FsZTR+8W3Bvzy4ExPq11ouFhhrPc9o5SXEpEIvCgyBqSsKabsRGlXtCqNO94H+TU+Fm8JKuaCIZOlgi9jb0zEdhNB0R8fw3rLUsa48oAdq/1EYoiw+jz3mr9OnQuMn/jy+eqDIQMCqQvUXJ6KYHaBjDD6D1BeFNGkC8ZDNHWTm0x5+Gcd0iKqBtISYdYyo8YP5PwBT5euuDe3djQ+m1+DzQtKLXGezWn7/EK+fvqC2kibTy+abyFHUmRkKcAu0/UZvETrSg==
Received: from AS4P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::12)
 by AS2PR10MB6349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:550::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:07:18 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::9) by AS4P189CA0011.outlook.office365.com
 (2603:10a6:20b:5d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 08:07:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:09:40 +0100
Received: from localhost (10.252.5.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:07:17 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Mar 2026 09:06:59 +0100
MIME-Version: 1.0
Message-ID: <20260304-mp1x_alignment_issues-v1-1-19a8013782a5@foss.st.com>
References: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
In-Reply-To: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.5.222]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|AS2PR10MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: fae59708-48a5-4ae2-2bf5-08de79c50ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: MLYUS9yU9WfjMPqTB8zpNxuBle1FjW7NA5UfO+/hj4UTTdfQbInIZoVo9ECcr/aLOe1PtgU91poXyZp87u5wzhEpgye/btfbf7TZTEq0WUoRTqd6YdGzImkcfNylT+SJnoTEDWa074X2UunoZZwF2xA2tj2RCWr6moVtkeLIBqMOv/Bu666Rn0Ntwt4VWwDBQG6kGYcYEllVjnbjcVbIXMlMtmafrRGWro9O/PyjylXIDreJmbMqt2PkTFRIX9yGto+cN0pC0puIo4o5IgFbXHMZBcJ2NF/1peLPqmz3Vkh5oeIZWAnR+xuURZZbahMqRMOOheymClZn/DDD3w1G6/Np+kOiUvujb8J+8nCC8cqbKFTmklfLJywRP8RN0XwLD1VzVloKKl4f4ifbxeL9ESHqnZKIe+GvDWRQxVMnQngoyOmD2let82brGTDQqWKe/WSk0/cmQ+W6DPxsnKKliPIaHQZmICobQYY+YvYMiJTxhWWtnfBKizj6CaLivS6at7EiGospQgYhxVoRVElJbW9KLdGaox0PNgJ7MvKYNNkEYfoocnwLJIwCTn9fQJWiqFshCEBlZkrsuV9dRUMKaJN0RrmMHEyUrX+MkJ4QRpSo86gN1uNZ7cAAZsJj3MTpAbAgxYUxKOT7bxMDEXuPwqhOaYtn7TAPBoPh/Yn+QkNjUToGc6dKUeQ9OW07nRVShdg4aI3TeLac33ZjLcRFWIJsmJ2JTec5cgKOIb9Q8x5FbbZizlff8hurTNyXCUA7kPeqCQ4Q/3rXJzyygCLSdw==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V1LBcNn1+WboRoRbYGxYeL3Cv4T5qDE5TlXabuhIWjh63vbCxBotdL/zdmLHwkzitJPiii4LPvNlXJvaJQ++voIrJYpuO+1WI9qP1vzMnz7CwWTVg+Mk7lTpW2AqAAdEXEiynuxbCLjjLK466O+YIqwSMEKBafgMWfdQpGzNarGJbLjhc7VhB4V8z1JzRNhfUkjoiN4kvHYVpXecckLPpi7W3RbmYSd0lzwxkij+iXQGIVJhoagdYlh6ASMii7ULP+UaofsAcYNsRlXhZldGa4lMZpzYKAyEYhLoGMvFaDOHMy0Zh2zpve1InmFR58gsy8+LtXr+c2+jqLcfPWc2Mnxa27NiT5N73ny9WAYqrr1St1L/DmauTfoczxTsNSAXLcQh/w/GAtve2gzDf7qdRiWF6FjQIexATdtE/wsnFIjvu0N6+kbXYH4ceaL/A6q7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:07:18.1523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae59708-48a5-4ae2-2bf5-08de79c50ded
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6349
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: fix misalignments in
 nodes of stm32mp151
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
X-Rspamd-Queue-Id: 3C3AD1FC2FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
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
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.530];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Since the ETZPC system bus was introduced, misalignments have appeared
in some nodes moved under the etzpc parent node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..fd58bb700f6c 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -1083,7 +1083,7 @@ usart6: serial@44003000 {
 				clocks = <&rcc USART6_K>;
 				wakeup-source;
 				dmas = <&dmamux1 71 0x400 0x15>,
-				<&dmamux1 72 0x400 0x11>;
+				       <&dmamux1 72 0x400 0x11>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 51>;
 				status = "disabled";
@@ -1095,7 +1095,7 @@ i2s1: audio-controller@44004000 {
 				reg = <0x44004000 0x400>;
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 37 0x400 0x01>,
-				<&dmamux1 38 0x400 0x01>;
+				       <&dmamux1 38 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 52>;
 				status = "disabled";
@@ -1110,7 +1110,7 @@ spi1: spi@44004000 {
 				clocks = <&rcc SPI1_K>;
 				resets = <&rcc SPI1_R>;
 				dmas = <&dmamux1 37 0x400 0x05>,
-				<&dmamux1 38 0x400 0x05>;
+				       <&dmamux1 38 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 52>;
 				status = "disabled";
@@ -1125,7 +1125,7 @@ spi4: spi@44005000 {
 				clocks = <&rcc SPI4_K>;
 				resets = <&rcc SPI4_R>;
 				dmas = <&dmamux1 83 0x400 0x05>,
-				<&dmamux1 84 0x400 0x05>;
+				       <&dmamux1 84 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 53>;
 				status = "disabled";
@@ -1176,7 +1176,7 @@ timers16: timer@44007000 {
 				clocks = <&rcc TIM16_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 109 0x400 0x1>,
-				<&dmamux1 110 0x400 0x1>;
+				       <&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 55>;
 				status = "disabled";
@@ -1209,7 +1209,7 @@ timers17: timer@44008000 {
 				clocks = <&rcc TIM17_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 111 0x400 0x1>,
-				<&dmamux1 112 0x400 0x1>;
+				       <&dmamux1 112 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 56>;
 				status = "disabled";
@@ -1241,7 +1241,7 @@ spi5: spi@44009000 {
 				clocks = <&rcc SPI5_K>;
 				resets = <&rcc SPI5_R>;
 				dmas = <&dmamux1 85 0x400 0x05>,
-				<&dmamux1 86 0x400 0x05>;
+				       <&dmamux1 86 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 57>;
 				status = "disabled";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
