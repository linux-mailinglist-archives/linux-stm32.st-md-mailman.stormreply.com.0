Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63047FD76F
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Nov 2023 14:04:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE20C6B47A;
	Wed, 29 Nov 2023 13:04:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17FD6C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Nov 2023 13:04:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AT8vK3V030958; Wed, 29 Nov 2023 14:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6AU3mM4W4Dpoj7He082seCwDnAZEhdu+kcbYvk2yFl8=; b=vn
 n1ywX5H+G/YjKEflyGiG9D5Eq1ZqDVDyHX0Q4+u6lQSRJv9xI9JzT+ti7Ogp0TJD
 P5krJ8rTIXcTVLd8EYr0KuQS6Lex5FQSwSMqKp7svbQtremZmG+6NzfaDrJMBbUk
 GIgBq9wGPMFbVCaI2MLOWqsfNM6iyFD2O852zibsPA3nT7e2QPSF1SYeOV+fNnQl
 gvpt89XjC7TWvTdUQFWZYAsY/mbsmEmvEM3tkD/k8gwWcc23Uxrg15SzSoIImxhj
 zeQK/bjngqqAYarZ8CBhj0Ou766NpzF3ctpRDpx4ClRxr3QWFYvvGnIecjLX4Rpw
 gEoaHzAvbX/NFM4OuTIA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk9521ay0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 14:04:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C2EC10002A;
 Wed, 29 Nov 2023 14:04:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA9B421D387;
 Wed, 29 Nov 2023 14:04:27 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 29 Nov
 2023 14:04:27 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 29 Nov 2023 13:59:16 +0100
Message-ID: <20231129125920.1702497-8-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129125920.1702497-1-alain.volmat@foss.st.com>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_09,2023-11-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 7/7] arm64: dts: st: add i2c2 / i2c8
	properties on stm32mp257f-ev1
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

Add properties for i2c2 and i2c8 available on the stm32mp257f-ev1.
i2c2 is enabled since several devices are attached to it while
i2c8 is kept disabled since only used via the gpio expansion connector.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index b2d3afb15758..0ea8e69bfb3d 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -55,6 +55,26 @@ &arm_wdt {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <13>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c8_pins_a>;
+	pinctrl-1 = <&i2c8_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <57>;
+	i2c-scl-falling-time-ns = <7>;
+	clock-frequency = <400000>;
+	status = "disabled";
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
