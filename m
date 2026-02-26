Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEo+OzghoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C871A4500
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A6C6C8F281;
	Thu, 26 Feb 2026 10:32:24 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5400C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbsYsGBIbgJoDppmSw2nwKh/e0gQePBwU0jaoQl5dFtgpdZXOxhS1Qc5rWefTrR2ZaJ69amoQ2ZyPOEN0KnwBBld3NdoFE8GKp7bFz9HZkAnBk4wZ3wrJzpctaEwgPj/FBkxpbvdGXVa5UEyR9uQgE/TpxQA8QoaC01luNgyeV3AgTpif735Di1PH0voQrKx1LV0XGLWL6uL0k6e1QdDv0ITEI26yalJ4+ljOoX9UDiJTnSxCMl71OMKLeKJXwCqFUDGPzMnDWGfrZtKyiqWCRqXXDudmbAusu/MvbqLofQaj6WkQeWM6u+KOgBtJbIst3lBPVitrpSZRBao/kdGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAFyc7vOA2nOtp3hxGi1netAb9KvXOb7ypO70KPv3X8=;
 b=XLPD4ieAzUdm1f15zoomaPrQxYHV5+CF9/ywiAaa3UkYmEAaYhxGwBfVbTBTvcbwnZQOxDuOpCqv+e1TY149PH57KtlNFD5U/ZoLhGsuiujtIHjHqst3q5zPXfB8dcaaZq61V+iEVSVS9uUiDe3p3E+QhN/vNJSzVFPWTlHGX0R4Af+l7xkn9/s8AcPY1zDoJ2WAW82DkJE/byBuvA6qiX31qURHmLxkjOf7snTA7FFTBvSfFPcldftP9AHR1FXKmtYqKhNCoOD1emadzD34pB5Dh2kW122M4OZUXWROkWLYpMmgOYm6xg9nb5V7LBPMLeq+4YhZtIRyEa7D0E+jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAFyc7vOA2nOtp3hxGi1netAb9KvXOb7ypO70KPv3X8=;
 b=SIPS9EVaWjtQ98BnPd3ewjrBM4QIf0c+6L5Jv9WeyWN8LfSd9rSYYgRBqEd2HM6tpZfNzKqcNx29AMjGGohJwEpTt+3JJywIUcJWymZ1pr4RAttRefsECCmNnUT7hppGERt/XG7n1I5S/tPUf15o3ZFg3z0Q5yTl1Z0hR85KYGgWCwCaDCL0rHf6fASOJJA62zP+nyVjE9tb5VOSBzzrW82/PvyJa4MQc0UvN5KMYRPWQRHRKnwXMxbtybu/ZrJvku19lgrh/Kap9HLTIiARv/KG8HOxx5jc1AkIlSfPO3WAdJoTpUvbcXBgyvDUaJci7ur1lTCrDE19nu2umo+0/A==
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by AS8PR10MB7522.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 10:32:20 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::33) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 10:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:32:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:27 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:19 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:26 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-11-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|AS8PR10MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 624309f7-4250-4187-0691-08de75225236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: 5Sz07frF1e5R150aXL2faNIG+miCZSqj6cpsAD5IWpKPs75YEbUJdsVdWo9ZNPX6dwifjGXpMrEIA3Ym4YuBLyN/dvHqIZQ7Ym3HAzdgMvhozbEba81FsDdwpFCygVt6BrhRcIR7JXXnejdDoy7s6QwQfveAKRz516TYK6bcjcY7u+tCQhiU+N9wNaSGDcqSHrVGiWJGVIk+7BD5cd6CkE3Dojo00hOYaAMZC84lQLLpgvc9cGGMUm9cXIh9SOfCou6Er8mIdep6GAvsqflrcUpKsuidtB+FJM2bt7fNkWi3UYhvML+/S/ltMjWPBXpyvbtLJgQqM5D7FCDQGJj2ob/8SHgACJd0qgwmRZ9+2DwybHx1xUJvJkHgsxT//m+nPsR9JJfWE8CvgV+hidCIs7XFan/zkZNxMJXNZbXUnvpa+8CPhs/rF9jgjCeZjOeGCLfsPe6CsFwG8d/6t9kVX4udgQvkSdaEd32GhuuwpJ8Mpmkp2GlZvU9ZsYg3eUhVQO2AxNdRuJ51qfpg6Umv2C2ZH/h2ejulv2S3Gt1S/asi0xaPmoOZeFuTdL2Gp3bI7iWVrz4pSwPjhp5hyZBTwm4p0dVPkZLXHVt/U+b2A855zQ1M9/l0eliTu+LltFl2wRfDCU0NS5hoFhSNmOyfJ8R+xuk/Ju44t/2nqYSvKey66i+EyGHUJnWBT4PS1Vzf5uf1HbOwQ4pkTbWildnzHGpSMtRtQONHcDpmgrO8tnIno06wCru6V7DfcMSQuE9C0X9fCEFVY+P3nqV8kSfD7zdoE8m5MSqxl8ufYguy6yOb7TT6ujhVo0rkWXq8naEVAvG/7yPieooLK7pB1t4Zggqoeld5iHOc2i4GzvGGDdI=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0Je7t8V4vlc5iu1KZcZaVaI9OQ0B2aXRQsrbyuXnJbMtDz0XhVhDuj1z3HFUGg+RfMYsprXuoSsFi2VwPDY4KuyPfvwkXcE9CiodISU90SbkyZL/dthtaKJCMDkyqGoeTfzXHEeBZQXxZ6O1cGCIrj33bTM2tA4I0yzTt1eRDhpFX8WZKw7Q5AUe5sIEROiaKC2itYMBAdCV7/sF6t6J+CTeH/91NjBfSBiTEN2vYyRbCmc+YowriFk8Q4nKs0TKNYtHSWyxwGn/wKCMuTkPUBimJ1/4ZIP9AAxnquwhu6/85+DUHmn18idFgKJwteQX/1T4F/a8xe2h1KpFGO6EbrmzrQ2AQ1Mb2LWI2efcw8mxuS9hbAUmn+DziUPj4mA4fKv0/GHolpgnGtguaOlgOwBe9VAXU1OjKS8N6KpXPMugrabTvZKurhm8dLFHW306
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:32:20.0818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624309f7-4250-4187-0691-08de75225236
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7522
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 11/12] arm: dts: stm32: enable CoreSight on
 the stm32mp135f-dk board
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
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
X-Rspamd-Queue-Id: 93C871A4500
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp135f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 0a47687bd9ed..4d4cec8b86ac 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -187,6 +187,26 @@ &cryp {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
