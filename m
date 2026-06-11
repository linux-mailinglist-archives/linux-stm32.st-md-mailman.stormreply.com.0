Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WiEVO7h4KmqrqAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D25FE67019A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=WddpW2zr;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 998CBC65074;
	Thu, 11 Jun 2026 08:58:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029A7C65073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw5gymM/D2EXxTgregKaDIaq5oOWg2avgaiZvCQJlB1cX8hPoyvq5U/kIWnj7b5vPGAobgAjEb27f+dHsanko0ojlVAhIhoVOlMJ+Jp0JqGAZfP4lhe8YCxgGIaCIlwVkJDGpAbfdsPrH92XnlJHr2SF8HpN/wn4k5H/8KK/m09GIS98rZJ7DJXEyYdRKQjR26fZTEY2jV4R4xJ1pLqqXa0CoT1M4x1b4/zhOqtzJ6zChRMuemXOt9deEhBHqAKgyUF8Rs624pxGOH3C4LNomZAbLU9hPc39B8mSGYo1sFWLehalL2UpeQJwGIkX3AZiP27bUxSB9/MNPvgnLMz4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=aYcMEbSYDGhiJbwxw4OnrG63Bbbe5UC7ZapECd+Zp/Bu21Ph9KWhVnaDz+NAphKwGf3RxQDaMNvzW9LdjoHLb6zOxV3RXG4IBgB9nNmRmeBpZfGPxowZEohZ7ynSNUpe616KLRT9YibVeKbcnR9QH5v/zH2PyBVh/9IYPaYb0sHjxOnvd9S8hT88y3EeJOctKaqfIxUufqpGR0VI0lWbCmkG8BuoT9ovIWJD5pZNSOiy5z55dioROEHxL1HCcGxK8PASUbQjXDBrVl0UFzkdjYWQqLGg9guWvg6pyJa/6YGrfxQcfCxXsU1nUZvAeKHwcjuvzOf+GecRMttBcbZs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=WddpW2zrPmJ9bWYFZIK5doJm7RDXKgfVmxAjSqJY5WHqfJakmT2AANw8byi1YYzVD6HQOrSM66IMYyCyhrtiFLCKg9K93erzyNLx6JOwjm4AO8PYQ8VshVV/GojesOFKTPUvPHAH+LLvcpwUQiizF7Z6xJVk7OcCnR/AyuApvTp5NTZ/dgODfGf/Jn5x/IJQ5FxGbWkb9Nil0/3pd65ScPEtQpvHFRX9OSk1kwXGDJ7kEUzLFuoRLAiZr2tPoP94UQFf5svZX50yjIAHEnH5fP7ptsvshAjLvq7mR1u6VokuvnlmsOkCBlOYycTzlOHxNvKQavej5p0AyZ9dFTJz0A==
Received: from AS4P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::19)
 by AS2PR10MB7130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:58:25 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::a2) by AS4P189CA0015.outlook.office365.com
 (2603:10a6:20b:5d7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:09 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:21 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:19 +0200
MIME-Version: 1.0
Message-ID: <20260611-node_reordering-v1-5-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|AS2PR10MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3322296f-0a32-49b3-f08e-08dec797987c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: LiPdJxG1DjI9QruEb3nkm1YiWooUrkDhbYOgZGHzWrJrSaBCuf2hut3OT4sLatXhqxwWGrOjHXzM8dW3CDDmgUayZHq3IMbQitHtV8rYLIiaUA2s1FvPxYGG90PZBVBj/dDU512giZQ75p72T8hh3ZJHqtWF3g1aVvYBDyto+6tMLFQrJ90dps0hcMzcLSjtOn99OL38gknJiHAPPPzF3jRHFm7zLyznGQFuC/XecLbmGX2bFkXmML16+1W94jV1vmZ61p3oyFEAzLKjwiGOURZRHYEC1mkzyOBP5NoSrhN2cvBIGS52o8+aw+iCL7QSIx/BAydF3BcfAehu3XUgdAYPyff4nQ0UUSXPzZVPWyPgHPbwAyR+qMQDP/VslMJ+Iy2pSmpqSeV67MA5HHBUQopcDP+bCReY/CzNCUMqy9IfqbMV/hQLqpGLWcyIq1oMXbplSxgV1XKn+oraryPgRfrlwhsr9MLc1r3pokxWUnlGSm0GPtqnl1bbFTAafkzyEvhpIBAXShv5UObBTW85c3WVrccr9WUcwDApHga9bc3KWE3fWCqWGozzsROoLTSlxnIU4gI2HtUPwk+KSKHlEVtxkfK7kq0sTa3uZama6dpeqv4RdTXAoTcYRPJsuOsKhVhdWsMCWdzi5rFgCH8uK+FSlWJcOydQJQ2rjTZtQVKO9sagMmmH/hVwmGQRsUL5DuyhQz57DW5BMHW8kD+86CkCs9o1krtvxoDVJqbTBOs=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jziRpJS+FQCHREkY/q0HYGpJMEsgYQ4ekQ7TIk+zrY0y0zcHedSEI22KG51EaSYG/as9zIJuGnC37Nmzoj7AYa58ytWIm2wGUA6YKLsuzJQ6TKDTg7z4w9Sct4efDHag9r/VYp6H4MSEyAkOeCBEo25HfJQfx7LXffe11yoWRm7mHag23Dico/IaWuBXS+H5KXGvlTN/UFcZLkE9HdtpzB7OecClSo/qcfSH5GHPdiV+k403Mm/9n1uZ5awXtXkoXj59NOlGnBtSIF0R76ifqd24slpWSfnUmLPdzbyblqsCCbJL4zL1dS9k5wq+tmXlO52rX/x4EjDY1bg7KmHMM0kSkzgmd1UrOcwfVro4KFAZmjgSd6SS76QgQ6DfyD1xX95ny0M1EBbxA2rVzL1oZ+DdqggbsMbefbPrtn4hWt2/1pqKV8H95fYh549CGBqv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:24.4633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3322296f-0a32-49b3-f08e-08dec797987c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7130
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: reorder mdma1 node in
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp];
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
X-Rspamd-Queue-Id: D25FE67019A

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
