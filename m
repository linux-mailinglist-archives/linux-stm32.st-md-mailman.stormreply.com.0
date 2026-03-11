Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDU8IUhSsWn8tgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 12:30:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF66262E6B
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 12:30:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891B6C8F26C;
	Wed, 11 Mar 2026 11:30:15 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011035.outbound.protection.outlook.com
 [40.107.130.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA6CCC87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 11:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdcYgfmyxDVzX8M+jfoGIRfwpM3dRyg00hG47a3dcFNNYZpUwD3X8L02E1CNQMnI16Q8BlV10/d1m0Qv8F8GrQdYH4psq8HQJPO3q241tY05BrYXyPEzjg6FYhLmRsz4Gqf1bgW/ZchRYtaS3I/0j0hWko2RVnV2nDZUcOKAuNTln6Cp2d7SpkLm7Gt7FQnMNb7wc5i0emWxNARfgHRJ2amZ3wQ/0C8Oc6Ak7QV+8ZApcKqhuKpP/DWLWoQ6FpRtl2AjzegSeepRSebEF9KfjVnQ1xXqZ2aIk2XawCViMMIjkngaUHgcnY4h7AOWsyxYeB4uECiP1p62XgUqTfz5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiTfJaqX1l7LWVZfZzvn63JTMCA3JnUE8dp7t7/nVY4=;
 b=P8S1FzlJOZY2MA/U19SVUDIZXGWg93DJnF4+CGJGia127oHbPiAhp8fR98lCFR/phaOOokwIVrO2Yt3jaXPq8B7hbuQoHyYWhIk079BVz8Wn/RmgB4xqq+/a2Up3piGWP/qkNOWL7nsxm6fwE1BUvb6CYFvk7x+REmfUL2OAiqFN6nTkZyNcUy80KUyoYLE0h8UQmDvNGG3oWV0K8w3XXL4ikAPRe9Y+Lrp+u0ujU0e0VHhjt3GWS7Sxuv/cMgwEDm9t4C2jfcupCRcjLM5ZRqVpbi4WtLmG5WIbFm7B5Q1ip0NKnXBdsCxslLhhCwrRas7BgrpoLCOsgfpcPR3pUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiTfJaqX1l7LWVZfZzvn63JTMCA3JnUE8dp7t7/nVY4=;
 b=D9QFZN3SJhHAEDjCxQQlorfteJp6Ode5i50RdlQj+7tgxdVH6dAflf3K+QjlpomBODF2ZMIXY1i/+bfOobxmGUAIXBx+xD1Jl+WafdY223du5Nwp4FxJxWH/JzikwMyX2aVtuZd/4oEnD/fHnxyOpz0drB/21EitgoD5+jjYlltO3Dh+Ktn6XHB5QxJ+Tkl6sWBWbsYZPJ4sjAYwY0cZjxjKOmFqN7QBMSBMwbncf0vUJLxgTpKRhBgKdXlFlj+VbcOLRpaxK6jYubF1dZuy8HQmaYSPAsx68gmjIMCBhuGvVmzoXPYvkhnPgt/WeIt4FC2D7nAZtAlNaum4eZbsIQ==
Received: from DU6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::28)
 by AS8PR10MB5999.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 11:30:08 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::82) by DU6P191CA0071.outlook.office365.com
 (2603:10a6:10:53e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 11:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 11:30:02 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Mar
 2026 12:32:31 +0100
Received: from localhost (10.252.8.160) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Mar
 2026 12:30:02 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 11 Mar 2026 12:30:00 +0100
MIME-Version: 1.0
Message-ID: <20260311-mp25_pinctrl_omit-v1-1-5a3d40046b10@foss.st.com>
X-B4-Tracking: v=1; b=H4sIADdSsWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3dwCI9P4gsy85JKinPj83MwSXXPjlGRzCxMLU8ukRCWgvoKi1LT
 MCrCZ0bG1tQA/5TOEYwAAAA==
X-Change-ID: 20260311-mp25_pinctrl_omit-73dc784859ba
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.8.160]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|AS8PR10MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd98644-e4be-4e00-5c7f-08de7f6189a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: SNgYEMp7V7FoxuF0QSnkZe6suJDs0pm8ekDMUD7U4+f7FvpG3b1AJpjaTgBcRcm1jM3f+4dLP7V7mkvN9o7IlDXU2v2ZWQLLOrMXTV/Kd6qNP2Xrkbaw4vr17ROkqU44HnRhjAcb4fFKtSly6x/w9QoiQGKx9SBFI8+uqao6H8zneCI8hWZn1rwNyqhxNX5+PTV6m7LvNDTuk5D7NF/Fix8DXdFFKP8SVnm088FvkaTDIfDYjUnZ0E1nCO0P397xkJVfyndkvjxTC/aRubI5jphM/0qlgTH4f9zIlGq2lw9kDQR9EaLA0TDnCxey1zv2Qooe5NMQ8WjJV+/kOEi6d20C+a2nWj12xsjzf/tLPCD/xGCJ9Lks/CtqyMVfcRbNzc0Ad5iHfQgNgSAHeKrHGWK4OVFvtq9ADsz4Pvp+eo13xiFq/9VV1S4IE64dTZn234b6rsJNSoxq55VZmF3UqYvZZtOAtDJ5DTeWoSRwSdjAWh7yTuFL5MMUZ+W8kzDcP0vkTLSGYQjJx5FuTZZEGYXrdyW7RoMH2TXGB3d3XN2YaFw0jGPp7pb4x1jL+7lsYB4iEpxEZjnqmqQdG+oIeguhTMHVe0wLddxxnh0crJDAb9F7BGph3OwbF0dtOp1wMXSzdwVA9us3/DjLpUmyuYEwXa5rkSuCwSOSH0GV8JqdMZjy0OnNfSs75US560yFvjICq+rjWUGG6DG2w/oMF09DU0rjyJgm89X9Iaq7jtwm4FfNUHuhna7uX2qerXpwo2nhuUPlHxGqJ2JcaFQtoA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B4trSoaMDbvz4+7TB1ed5mQNm8Q94XXJAeuU91QHR9U8v/2pqKBn19/8f0eSciei1DRAnl6mqkEc4NbKROPxL78KYpuvtBoyW6cX8ANwL5LjlRjPBFs9uhJ+5VbtJoLzneyKfu4/isOAlIqagqTfyMj/jfeMMk/ciOEGJv40OY0YYRvP+d5C1qj5j0NlPzbGopT4m9jcLXrc4DUJE3qOQmw+3GVjdAFEsXDGNImCSqduhh6S9Bbu8l6iq9EV9v9JO19nkfZnFZLnFrsIBNgnupIcxpioNXkWQ72NlzukF5R7z0xixvG1u4+8MstEquOXc1YtRFTvrRbf1ByPFq4KthafEEQSxzPFxaFPivDjuW99i32GyqwVp0DK8CSXRHulx0KFIUrWiMccAqJdXwWfij3QDV2CswVy8JqCFfCrlDMbVj10PCVyNCknGq10hLvU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:30:02.9726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd98644-e4be-4e00-5c7f-08de7f6189a1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5999
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] arm64: dts: st: omit unused pinctrl groups
 from stm32mp25 dtb files
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
X-Rspamd-Queue-Id: DFF66262E6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

stm32mp25-pinctrl.dtsi gathers all pinctrl groups from current and future
STM32MP25-based boards. Some groups may remain unused by any board,
resulting in wasted binary space.
Adding /omit-if-no-ref/ to the groups will remove unused groups from the
device tree blobs.

Use the following regex to update the file:
's/^\t[^:]\+: [^ ]\+ {$/\t\/omit-if-no-ref\/\n&/'
Also, merge the duplicated pinctrl_z node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 44 +++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855..a7ac9d08484c 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	/omit-if-no-ref/
 	eth1_mdio_pins_a: eth1-mdio-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, AF10)>; /* ETH_MDC */
@@ -21,6 +22,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth1_mdio_sleep_pins_a: eth1-mdio-sleep-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* ETH_MDC */
@@ -28,6 +30,7 @@ pins1 {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth1_rgmii_pins_a: eth1-rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
@@ -62,6 +65,7 @@ pins4 {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
@@ -80,6 +84,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth1_rgmii_pins_b: eth1-rgmii-1 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
@@ -114,6 +119,7 @@ pins4 {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth1_rgmii_sleep_pins_b: eth1-rgmii-sleep-1 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
@@ -134,6 +140,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth2_rgmii_pins_a: eth2-rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */
@@ -175,6 +182,7 @@ pins5 {
 		};
 	};
 
+	/omit-if-no-ref/
 	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
@@ -195,6 +203,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 5, AF9)>, /* I2C2_SCL */
@@ -205,6 +214,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	i2c2_sleep_pins_a: i2c2-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 5, ANALOG)>, /* I2C2_SCL */
@@ -212,6 +222,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */
@@ -221,12 +232,14 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_clk_sleep_pins_a: ospi-port1-clk-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, ANALOG)>; /* OSPI1_CLK */
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_cs0_pins_a: ospi-port1-cs0-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 3, AF10)>; /* OSPI_NCS0 */
@@ -236,12 +249,14 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_cs0_sleep_pins_a: ospi-port1-cs0-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 3, ANALOG)>; /* OSPI_NCS0 */
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_io03_pins_a: ospi-port1-io03-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 4, AF10)>, /* OSPI_IO0 */
@@ -254,6 +269,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	ospi_port1_io03_sleep_pins_a: ospi-port1-io03-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* OSPI_IO0 */
@@ -263,6 +279,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pcie_pins_a: pcie-0 {
 		pins {
 			pinmux = <STM32_PINMUX('J', 0, AF4)>;
@@ -270,6 +287,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pcie_init_pins_a: pcie-init-0 {
 		pins {
 			pinmux = <STM32_PINMUX('J', 0, GPIO)>;
@@ -277,12 +295,14 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pcie_sleep_pins_a: pcie-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('J', 0, ANALOG)>;
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 15, AF7)>; /* TIM3_CH2 */
@@ -292,12 +312,14 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm3_sleep_pins_a: pwm3-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 15, ANALOG)>; /* TIM3_CH2 */
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
 			pinmux = <STM32_PINMUX('J', 5, AF8)>, /* TIM8_CH1 */
@@ -308,6 +330,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm8_sleep_pins_a: pwm8-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('J', 5, ANALOG)>, /* TIM8_CH1 */
@@ -315,6 +338,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm12_pins_a: pwm12-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 11, AF9)>; /* TIM12_CH2 */
@@ -324,12 +348,14 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	pwm12_sleep_pins_a: pwm12-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 11, ANALOG)>; /* TIM12_CH2 */
 		};
 	};
 
+	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
@@ -349,6 +375,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
@@ -373,6 +400,7 @@ pins3 {
 		};
 	};
 
+	/omit-if-no-ref/
 	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 4, ANALOG)>, /* SDMMC1_D0 */
@@ -384,6 +412,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 7, AF1)>, /* SPI3_SCK */
@@ -398,6 +427,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	spi3_sleep_pins_a: spi3-sleep-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 7, ANALOG)>, /* SPI3_SCK */
@@ -406,6 +436,7 @@ pins1 {
 		};
 	};
 
+	/omit-if-no-ref/
 	tim10_counter_pins_a: tim10-counter-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 9, AF9)>; /* TIM10_CH1 */
@@ -413,6 +444,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	tim10_counter_sleep_pins_a: tim10-counter-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 9, ANALOG)>; /* TIM10_CH1 */
@@ -420,6 +452,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 4, AF6)>; /* USART2_TX */
@@ -433,6 +466,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart2_idle_pins_a: usart2-idle-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 4, ANALOG)>; /* USART2_TX */
@@ -443,6 +477,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart2_sleep_pins_a: usart2-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
@@ -450,6 +485,7 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart6_pins_a: usart6-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 13, AF3)>, /* USART6_TX */
@@ -465,6 +501,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart6_idle_pins_a: usart6-idle-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 13, ANALOG)>, /* USART6_TX */
@@ -482,6 +519,7 @@ pins3 {
 		};
 	};
 
+	/omit-if-no-ref/
 	usart6_sleep_pins_a: usart6-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 13, ANALOG)>, /* USART6_TX */
@@ -493,6 +531,7 @@ pins {
 };
 
 &pinctrl_z {
+	/omit-if-no-ref/
 	i2c8_pins_a: i2c8-0 {
 		pins {
 			pinmux = <STM32_PINMUX('Z', 4, AF8)>, /* I2C8_SCL */
@@ -503,15 +542,15 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
 	i2c8_sleep_pins_a: i2c8-sleep-0 {
 		pins {
 			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C8_SCL */
 				 <STM32_PINMUX('Z', 3, ANALOG)>; /* I2C8_SDA */
 		};
 	};
-};
 
-&pinctrl_z {
+	/omit-if-no-ref/
 	spi8_pins_a: spi8-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('Z', 2, AF3)>, /* SPI8_SCK */
@@ -526,6 +565,7 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
 	spi8_sleep_pins_a: spi8-sleep-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('Z', 2, ANALOG)>, /* SPI8_SCK */

---
base-commit: b6af4f8c4e551d2220787f153e7fea9290d152ea
change-id: 20260311-mp25_pinctrl_omit-73dc784859ba

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
