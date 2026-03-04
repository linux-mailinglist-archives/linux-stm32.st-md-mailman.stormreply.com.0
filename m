Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPjPFTvop2m4lgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 230171FC2F6
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE314C8F264;
	Wed,  4 Mar 2026 08:07:22 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013065.outbound.protection.outlook.com
 [52.101.83.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BD2FC87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 08:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLDyehJa8HgXThlgc8q+Wi0+b1spu1P9Ad/RsZ45h37dXR4D1oAYK2antKp1HzqLnwEOpNAPErR2xicyei8VHeylGHkllJQ+S1sNZfPbGeLlJMmFeO2t43fNUwHcm9FNH5xP83sv2GxRBYgVppE7NI1OHFT9y75rrg79eYWB7WVbmQ6bFn1Wc+RbOidqnzXgHvTlhF0kZj0dBQiOjf1Wwfa9pYPgwlK/rtMIWSnhE4uBFdlhpZOFoLy+ADEtxyvqfmZH1l6bBlp1baAE8cpB1NrJ8VqlrjKL2eKDsDIFJwXPWMw4jjBSNfepfBQFwu+cyUFjfl6fhFPB/gxDVvhetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXXgPqKoUTHLaL9O7rOASzD4TDgFfQNB4LqgvRKw+u8=;
 b=S74MO1CbAuD9qEtW0Dn6ak0wVOsW/yl9Gaq8lCpivJrzdswYdkSctDM/dhgjQSEI/F5YTkD87FRpdgyqkRsdU6b/Q07d+66oe+uq10mtAQXZWzKLgpH+fCJGrtPY49IAoyZ1AqF3wYXK1QWdSEeWmDkZN5s9UsVo5++bLPzslkypTBTFuK+7mRQ5rDDIZCLaAN32eaGIATbd+sgXwko+1G7ZUYP8nF3kYdxi4ilNgytWQ88oIdnY4rMru8NdElGFAAp0pOSQXpLI9KKuSfbbArTdA7v5BU/vqtfUDD9VcVMMRtrB6j1wvFOwWrmhjOKrMT712/5ZY4NFk8hXS3xmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXXgPqKoUTHLaL9O7rOASzD4TDgFfQNB4LqgvRKw+u8=;
 b=NmhjB3G1J1VHMVoey8L1dQiylGNNdt9L3PaaeDUZonDDjJsxZw8F48eqHjvggP33hSyOyk4JuTcGev4yCqUGUemUjhnlMfGFr9o/09WNYOQf3odHrYmaQwW2yjyIoMyqLSoxLU5nzac78FdD4nW2Ew+bkuv9GZhvYll0Ec2W72pID+28vFsXPKt3cfh+8Wrup2X33o61ywviNVuCIVGpjupj1NGr24k9p1QoVrPK+FLafsu+6NEzjXWyDlGUmD2mR42QcPM8WoE1ucEXsnP75Qu3ieKfFyeI/Ek6yTO3wrxSUbM4iXAW7wOQtQmOwfLCKA+EggBNiJhg2D9p5TwY9w==
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by AMBPR10MB9882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:762::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:07:19 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::3c) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 08:07:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:09:29 +0100
Received: from localhost (10.252.5.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:07:18 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Mar 2026 09:07:00 +0100
MIME-Version: 1.0
Message-ID: <20260304-mp1x_alignment_issues-v1-2-19a8013782a5@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AMBPR10MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c31b7b9-5e03-48c7-4681-08de79c50ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: zbs22PtAn90i8fIBDFDMpYGHTW8FSoAs7+LoQI+6NodeGN3FbnYieomLzNa3hkIp6rO7iUTc+2ZjALuEsITJtd+mINKzt0ZDpsl+RyFxIwcOntOajxw3xqxnCXoc1IbsKrwkdnQ/0ngujG5VqcmZtJ3MFcN8SxwNUSd5GEXUxLems2AzYQyE+WpLWfr/x9kTzCKkInTxx3ff+bAoOyqsX3v018suEgMzgtS8sNllqg4Vr3eJ59vMi1WycRMabsb0KUwmwxQtXaZfW4xKo9fV/f9BltVpjuRJ5X1a4/QcKIk/Ts5PWmi/zOtRotugJ2N0KomsBACdC9LHsIGtfcHLuSRM6UnDkNXZ8km6b86TqxSIuh2c8WwS4G5Ul4RLPvQnF6m0sSf7rtPtykQp+oDrJsU878faDJXDKNF7aX+T3yfDqiN1y0f++18LrEVZheBlzC7U456xJ+X3SJh4okf1bqdWCoz1JSDUn2gzCVeFQuZfstdru5Z/Jl/eMnO96/GNL+3OcTpynGjgNwyni1mRsg91DuaPIQZ14VdV0MYt3K3bx1KMllvqT0Qc1sTDXHit/HcUamC+x2TTrArMVpKFbNG5wAc475iLhpE3ORR78OG1YTzJRV9BfjzdMFzLaQSpERjFh095FMkaoIhEyK+9lfCphv3cw82NBoPX/nU1chqORJhpr1KY14lZB8snEWfyRIQiXIA1v/xBm4jwmTrh8IEN2lBBkW1vG8IKDzVNW3n0FyRRUM2vXxYrOUAuvcnV0LInyHrKUCs/JWRozv6KIQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w3lrigXLRjAEG1KSzHCW1qcuSWweWBI5tPL+2EyB+JO1dBqU01WyEMV6Po1weXHj9Wt66CPd+HOzGhxk1usz+Lgm92vqAGBSIxqx7FTfWi4j34ZFsEK2O+x7sszeTTLAxP7N6SVThzE35Fjf/abZ6/rrXv1Jn/wPhiv3ZpFfMNVAoGt47TtoKxIrB8OKPmmzwleWus7ybTACoQCJ/J7aVxI93wZumS6nuxrA3I06fj+IztsAOmsJoO6CzdqES5phy31zR9po9U14+GuOqHnnsuS4qBNBjnJb3kC1+a2Sdo+nhUyx3+smnS2knCZpPsMJSiaSMB90brxxWmu8pNUZCISSwoSM06Z4yxyuWLbt7yk5rH6bq0Gf3eOLLyUuUwgZ6QENjTIRmTybrcrVXlhW/RftNUXQEusPbwuNUaXAgxExm/2lxxVxnxSdaLpGBOzU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:07:19.3555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31b7b9-5e03-48c7-4681-08de79c50ea9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9882
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: fix misalignments in
 nodes of stm32mp131
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
X-Rspamd-Queue-Id: 230171FC2F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,4c00a000:email,4c00b000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.527];
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
 arch/arm/boot/dts/st/stm32mp131.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..93d52fbd0de2 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1129,7 +1129,7 @@ usart1: serial@4c000000 {
 				resets = <&rcc USART1_R>;
 				wakeup-source;
 				dmas = <&dmamux1 41 0x400 0x5>,
-				<&dmamux1 42 0x400 0x1>;
+				       <&dmamux1 42 0x400 0x1>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 16>;
 				status = "disabled";
@@ -1143,7 +1143,7 @@ usart2: serial@4c001000 {
 				resets = <&rcc USART2_R>;
 				wakeup-source;
 				dmas = <&dmamux1 43 0x400 0x5>,
-				<&dmamux1 44 0x400 0x1>;
+				       <&dmamux1 44 0x400 0x1>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 17>;
 				status = "disabled";
@@ -1155,7 +1155,7 @@ i2s4: audio-controller@4c002000 {
 				#sound-dai-cells = <0>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 83 0x400 0x01>,
-				<&dmamux1 84 0x400 0x01>;
+				       <&dmamux1 84 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 13>;
 				status = "disabled";
@@ -1348,9 +1348,9 @@ timers15: timer@4c00a000 {
 				clocks = <&rcc TIM15_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 105 0x400 0x1>,
-				<&dmamux1 106 0x400 0x1>,
-				<&dmamux1 107 0x400 0x1>,
-				<&dmamux1 108 0x400 0x1>;
+				       <&dmamux1 106 0x400 0x1>,
+				       <&dmamux1 107 0x400 0x1>,
+				       <&dmamux1 108 0x400 0x1>;
 				dma-names = "ch1", "up", "trig", "com";
 				access-controllers = <&etzpc 26>;
 				status = "disabled";
@@ -1383,7 +1383,7 @@ timers16: timer@4c00b000 {
 				clocks = <&rcc TIM16_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 109 0x400 0x1>,
-				<&dmamux1 110 0x400 0x1>;
+				       <&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 27>;
 				status = "disabled";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
