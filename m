Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJYcHhohoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D711A44BE
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2A0FC8F281;
	Thu, 26 Feb 2026 10:31:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013037.outbound.protection.outlook.com
 [52.101.83.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D64CAC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQxiVTaiUr65k/JfXJtem3ECnXwCNYKtvvHiCUD4oi6yCYI3/t6FU7/ivh8+vsoZ0fEQoocCiWSQYRpkvVN4L3ldzVSib2+zDCKXbdxo9ruM8E+90Xs+sI0zzaof2lXM8+7/XDwFvV/r/67dE39lQfG6ZgNG8p4Jz22nj1jIJ/CiEkzTd1RFk1HtPX3jlUYDWMdGMo9Rd3ytTSJMEZtmXxRc0QgBGNyUlH+DosWkgn7axYusSs7TzR7Nu4SbhBdziDcVViy3rHAJWHeGV9jL03gW8Fr5JfqsTLX2mnb8ljCRhn/97u0SHsWN1uvXUcnsNC7RP6bhae2wnhKbGB62HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=E2Scwj7NuMSBpFj7PM1dGFCyaEDeft7q4k2cH9EGUflRj/XN4TAO2PVyDw194Z6jWjQRfrYvb0vo1ueKkpfAwaSMUWtHD1aQWEX7RdoerBPzmFiBdHzg82/H0ZBtKacYXt1AmFT0tZWyM7/Nm22OgcyHQXEGleyFo7Ay1UVX0eT9rHuGXgrLnoiNuOVY0/9pSCiZN73K0wSNtfEMZPm8m2ZQSq6GDU3TCEP3ks5zkHjMp8vsvgFqXKeeCrZ0CjmZqc08k9L3OdeBgB4Eip8vWE3/g9Kd8EX+S7g/W9weeoA3zP5eW/wlWeCZt29ub/ilmjaXShYXMDPwiA4VoI5EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=KvDjeT/20mjP2bFZuXYqNS+A66bp8zmTHKLVYWtpJTarlsK3p3Ec8vvqbdPTrrV1PndhHN56aa2FL2xqTJsvHMFkzrWNvRLX7zGvqQEaQh2mREMbXT+zjz+mMO52Xz6yetsm0AK16Iyh7SS57HDPJLiMVm7ZNCJmmuFK1NM5jeKIitJ641D9R+gDVAcj1n86xmpOWyq4N1yeFv/0wzu0Qr26llSO571CkrJztauOwGiacbI8OE6zyzdcqLiDoQWieBzqr73bi798iJaxP4BCPjeDMgChqoJYmUAubxIu0X0PznUB6DQJDeG/6zLIm/CA047ILuV0pauiiLqyJpnn5A==
Received: from DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) by VI1PR10MB3614.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:13e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:31:48 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::3b) by DUZPR01CA0351.outlook.office365.com
 (2603:10a6:10:4b8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:05 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:23 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-8-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
 <leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
 <jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
 <sudeep.holla@kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|VI1PR10MB3614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: XyxXCWTB1zTcCet2F70fZyNeHFdhMi0Qv8bE4LEn7Ybxnzx/tqKDq2v8uPI9o4XmO16VI7Fjb/AzVZQGPEMP2EHoPyQ+uRiWUdSPD/AkNX1VvR3g576aq5aJdPPN/9UZfg3sBZbsftBtCp8JEXX/PbFxzNAXwHpy5kflGqEDpfr/UewYMw21hvLo8WXzXMi5PTC/dPa+GTzfMiZ9UiNymSC5BOff8xJeGEeek03E8efaDiznISW/FwMCahCPWv7m9D9d1VAMWjZVPgzrUjbI/Ru5haaoiJUMQRsBVLLVGNl2XnKQgCnbXaR2zllAqRidgH1AFR9OlfGPZryjtwYpmLSfzfHwsRLP7eNasUmXdAmTiDCJuufV5SE9F9IRQ71+0SOXs/JhsrkGT70M393Kxw4WnxigbfX/dc60aCqBpxeAeN0BUQFamg1v7ieRpNXAdn5axRoE5zFrHH7i0V5ZOem9kUsCt4ilF/k4y/zsU+V+5v06V71kHsZoM3RR5SzoCDft1fa3FH2SjPJIP3DTKspp1AexjNcTpMINteRwwc1GI0GQnzmVOa10gsPXXyjWke3ud+qdEROqCU9FG1qA9t+WKdml2YX3rK0F8sPIFtWbtDHtCAaBhAm5n2joiRjnmLnCv+nP7I2aZZO4wq88zKCy1R7cGw8sjah6IuFg//h21VyxYSMeimNzIBTobjFXi3n4cUYAz3NYPP3+i8GcGkHg+qd7AQLFHnP+dh+njRNbgjAnhC8zOf+fdaRFklr/E7GaDPNb3NDReS8UPiO0J98AN9cpMtjwS+TbjKbTZe6bmQLqp992ColEfbYTfOXRf8WBabhbNi1HRXW3f9pD5pJEcupkEoaWhiQAGjz1pqg=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: coPVxx07mut1cNztnewiixikjPcTtZsHWDsVUxau1gnqaaXylzhpSw3lKq3KOUPsWVyHlmunRvw0pFTtXDzby6OIkm3h9NPJ/keM/koIGGAp8xaKO3xD9f0FDziOGG2eoSLlppG7opkZ47jxyiUP5uSqQMBuYw2t/hTnjVhzUAUd2DoaNE2lvIgQxQUDj3AHcv42TRTsN6EmWoEFgKYhJJrNlBfb50xTqP8LEGiGpqltcGQaD9+B3Jxpwq4UexF6oxnbZVTDCzFNZEO2d1g027qjlmFMMFPspd5Bn3efTx1RWmMs9K2JRDfZ0OFeUVTO/6dzmYhzu3KFFIvP/tpFBwGmqEVYyAgG6dMgaVgQQnqod/kSkUgt4tubgHft2QfVffZya/wpWFq1HakeCS2t0IDvKFesVkJU3KMyZ6wlCLHhFIC+0vdPiOlBH+1/6oox
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:47.8974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3614
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 08/12] arm: dts: stm32: enable the debug
 bus on stm32mp1x boards
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.066];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24D711A44BE
X-Rspamd-Action: no action

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 8dcf68b212b4..0a47687bd9ed 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -187,6 +187,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 4e46d58bf61f..d91b4ba79527 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 7ed2b01958fe..98b27b5d1311 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,6 +155,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
