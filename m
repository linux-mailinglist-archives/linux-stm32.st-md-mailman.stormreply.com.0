Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGmMLl1nFWqVUwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 11:26:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E465D3439
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 11:26:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39915C8F297;
	Tue, 26 May 2026 09:26:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D80C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 09:26:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeCM7nT7ZL7gEUCV7ELgkgH4DclyFngJmdDPTUNBptFpwXecTczYahNDdvGaiooadgWqUGZPakoHpQLDjmf2zWpnRNZuUIIrGtfekgFbkDLdEj+hp7py7qfa8n3dEmAM9nDR2dmZ+dDev7BWMmSFP+t91i4i8KvfVwns3Rbm+TS+FwgbI8EAVFQnWno6iRTlTMGKmdRzMnSsd+x1egkWdpJi8jiN1/8W5gxZ7SP+h92k3ViMhmmZg0rnW9+kx60ZdAQze00m/O3JYPYphNmU9AuJVjVL5PJE2jMN7xDAVN7YfjWMBvY+k6cLlJQymP9v6yb2Hzg3RCfYqNNXikjBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=N+4NQu3DqJGBGaKlNPdiTNGqgAJ7dpBNi1GVrRR8kTj87CwGYUn32RV4tp3lDebuwSC9SJYoQEp+Zizf6PgGPJDAOJrgBpbN5V4gXwGWtiFZ+/K79QRFYb9ErXYR77UoZ6TpDsEiVUzxPEVmaB8DEhsUEMNupVoyXIhI5AG3Ibe/+q7t3BO448KS2i0cQdOtL6Yn8P6RvEJLUTCTmZIONVm+TthVP0VtHS87NHHEjQKuEVm9jWe+wXQeZ7pkwHIYkIBoF+IGvzbluvF47mm6cbIJ+HVMxiQPicoGiNqnhJnnVJ6tE4VH5XZU76ejhUUH8YyjCCnQF7nXE813jVp3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=A2cTLzywts2XJjnY8eQ6fFCByvAzc5iPflKsvGnBQbqGa0K+meb3W54fWrzUWlmCF4wg3lMDJ5TEgoTuLa6W2KTBTSiA7ZPdAlJHAyEkzGPe+Qkm8GV9+3Kg0K+CZpSHKMGcZ/g85uHKGEBBVym7Our/BvXFW5bHPQTPlHlbAy4OngwuCmT6ejbQWJlK5jBo1PAMjLtggKFkAHnCKxgu8rDlijbXmJQiQ5scnxLl0wswRrfQ0MLJUAx5qJzJcq3ouzhpa9QJXX35iPEncLyd2Pnau/eLjVdVBmFg/znRmZS6hNQxcgfGPjxUsbxNmDjQbudqs+8kk4ghQhx/4lzJ7Q==
Received: from AS9PR05CA0318.eurprd05.prod.outlook.com (2603:10a6:20b:491::25)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:49 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:491:cafe::1b) by AS9PR05CA0318.outlook.office365.com
 (2603:10a6:20b:491::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 09:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:28 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:44 +0200
MIME-Version: 1.0
Message-ID: <20260526-upstream_uboot_properties-v7-4-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
In-Reply-To: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b5a182-44e3-4637-f75b-08debb08e9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1pRay7Org31RlwVSMKOXXfZepZ29P4zss2GnOF2Ta/y4ncQy2kpRiO/0/HbAQC7/ay0/q3iq2e/odMj2IAn4FJba457j8CDJKyMwAHf3F+6wUu+Ey2Aw0B5uOl0B53PpRoULtUb4EFHLc0RvsvY2tWrwz1qjUa+Xz1qeC6rD+Imz8jFE27v5DcQiYntMw2NAPSaXq7ikOESvoFsJuKs8/hGUTZ04N2zmx2tBjSyBDzojWkB+thiWUCWY8rA/uL6ZNWJmSyrEAEIuYpEe1ZysXzhpAvpgmiX9iuJ7bX/CaIyl9p5HRXbIMQxaDMt87ITRCpvpVcPJEm3Ld9v9KgMPhqj9scSY4CIxLO5+kz2CiwaCrv6gwdKmaawYUQ5RXPXS4ei/4DR3UXOj+qBz9aNLftRRzSiA0/hc7QTH/ao1ES6CaXlORB8jh+9HWMUwxYg8pvgNIQOtMnDwJwcxGKA84pnoGpn7FLRHrrxeGbu0zfGdyQ4g9oqUiFTdHtQcThFRzN3+rPBAtP/vhG0+WH8EBkf6Vzndn32dhSyw46uP+pGC5V8wZbmrUL5RaMyN5JWRjSCbcPche9ihRSM8rIwTDpv9bJtkPohlERUW7s1Wbbsx9OjF+InCEq+dfRz3HY9tFhrmDL6HiKQDnV10zPwEaCKTonlUoC/xlHSKlnT60QeJWamBbzQgCYPHSkoeE09bq2YMQAQLISyKwLxJOlFyqWYCGaqfzeVgePx0BehRBtM=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6u2RUP3AeivT+ZjunM3gXHIG9bpCDmWsrOW9hKm5czGTIqlTviZUJH1uP9W9WsmbsiW8X3pcViwQE2hly5YkIFnORd9fKarbBVK6ARe+kaQ0OUZsi1YeqpEKaKUc8bdEEoe1nC48TsqMq1x+2OHYbvpSJFntj5VRb1ZEL9kTDb56bJjLwgj8YUpF5VfXvIcDS869jfWrgjzNH2JpRiitsdX2bXwxmtyAywjCtaN+gMVjyz58wzS7FX/yT4BHf3+sgeh8cyWtgOeawoGWymsGiB/SL6YA/b/Z8vY8Y/YuMnujSLEvRow+W6TvQnJa1l48CE5mXWkOT1eNvN95/7nzr9C+vVakgkcThaAcKQNzz1bmC4Oz0rtoeuF8fBhbHpgexJrOiDdfA2eo54/4bQHFYQERfIJX57zNbNs7CTWLdEFUdqBH4POJvRJz9+TCDpxA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:48.9421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b5a182-44e3-4637-f75b-08debb08e9d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 4/7] ARM: dts: stm32: Sort uart nodes by
 alphabetical order in stm32mp13xx-dhcor-som.dtsi
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrick.delaunay@foss.st.com,m:cniedermaier@dh-electronics.com,m:marex@denx.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@dh-electronics.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,dh-electronics.com,denx.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,0.0.0.0:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.486];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E465D3439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort uart4 and uart7 nodes by alphabetical order.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index c18156807027..54ece71085c1 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -241,34 +241,6 @@ flash0: flash@0 {
 	};
 };
 
-/* Console UART */
-&uart4 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_b>;
-	pinctrl-1 = <&uart4_sleep_pins_b>;
-	pinctrl-2 = <&uart4_idle_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/* Bluetooth */
-&uart7 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart7_pins_a>;
-	pinctrl-1 = <&uart7_sleep_pins_a>;
-	pinctrl-2 = <&uart7_idle_pins_a>;
-	uart-has-rtscts;
-	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
-		max-speed = <3000000>;
-		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
-	};
-};
-
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -312,3 +284,31 @@ &sdmmc2 {
 	vqmmc-supply = <&vdd>;
 	status = "okay";
 };
+
+/* Console UART */
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_b>;
+	pinctrl-1 = <&uart4_sleep_pins_b>;
+	pinctrl-2 = <&uart4_idle_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+/* Bluetooth */
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_a>;
+	pinctrl-1 = <&uart7_sleep_pins_a>;
+	pinctrl-2 = <&uart7_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
+		max-speed = <3000000>;
+		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
+	};
+};

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
