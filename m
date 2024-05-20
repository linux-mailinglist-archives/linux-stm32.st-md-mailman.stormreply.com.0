Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B66088C9E88
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2024 16:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80CBDC6C83D;
	Mon, 20 May 2024 14:01:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5900CC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2024 14:01:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KDxAV5023047;
 Mon, 20 May 2024 16:01:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=f9k8KFpeNIYsTHqtNNW8OjMXp6vJaNWX8ngMl7er10Q=; b=Ms
 vF/ukIiO2cgJEkMvHkMWN19QNEFT0y7Da0DRZVWihQyh6wiYrIFjRHi+ng4uHo6N
 FhWsPuchvsGkGSeGgV8DgR+V3aVwz8AFsI0eacXBrcJMkWhftpNtazted6nD+jsh
 pWavvIIlwgkfVKqBOisHK+DOmGTCXkdIAEAeqJicPTGSKSVv4iIRyGD3ROgGyD2k
 jZ4xfuHbrjF7igN0LtqxXr4Jf5gSebZoVOmYGGH5qQjpjqm57OcyKc9+AGBzbHz0
 Fmam+tNUwZ5hFR5yswh+y1Usimw/iToKPW9N1HRUgBYyir1Wk9La3mR+EqqXjMHA
 kH8/CEh6clisWo/Fkmww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n6hfb1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 16:01:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C8D540050;
 Mon, 20 May 2024 16:01:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BE01222C88;
 Mon, 20 May 2024 16:00:37 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 16:00:37 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 May 2024 16:00:23 +0200
Message-ID: <20240520140024.3711080-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520140024.3711080-1-valentin.caron@foss.st.com>
References: <20240520140024.3711080-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] arm64: dts: st: add usart6 pinctrl used
	on stm32mp257f-ev1 board
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

Add pins for USART6 on GPIO connector on stm32mp257f-ev1 board.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 7a82896dcbf60..4e677e64c406f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -128,6 +128,47 @@ pins {
 				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
 		};
 	};
+
+	usart6_pins_a: usart6-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 13, AF3)>, /* USART6_TX */
+				 <STM32_PINMUX('G', 5, AF3)>;  /* USART6_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 14, AF3)>, /* USART6_RX */
+				 <STM32_PINMUX('F', 15, AF3)>; /* USART6_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	usart6_idle_pins_a: usart6-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 13, ANALOG)>, /* USART6_TX */
+				 <STM32_PINMUX('F', 15, ANALOG)>; /* USART6_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 5, AF3)>; /* USART6_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 14, AF3)>; /* USART6_RX */
+			bias-pull-up;
+		};
+	};
+
+	usart6_sleep_pins_a: usart6-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 13, ANALOG)>, /* USART6_TX */
+				 <STM32_PINMUX('G', 5, ANALOG)>,  /* USART6_RTS */
+				 <STM32_PINMUX('F', 15, ANALOG)>, /* USART6_CTS_NSS */
+				 <STM32_PINMUX('F', 14, ANALOG)>; /* USART6_RX */
+		};
+	};
 };
 
 &pinctrl_z {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
