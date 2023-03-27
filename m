Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048A6CA93E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 17:40:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4FFC6A5F2;
	Mon, 27 Mar 2023 15:40:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5CF5C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 15:40:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RFCAvn014587; Mon, 27 Mar 2023 17:40:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Zaz9ftBrP9phIlIsVnD6D+kijhjG9aBSAHkYz2AG9vM=;
 b=j6TJ0kkEs20OL/Y1uSEZVad8/DV5wnqNpIkAbJ2xMQMg4O7RSdeGKQCHara0/W0Xz5nF
 2TWYYgq+5mSTQiCCtUE50ZR0IY/bNpd8YYv1yB0r2tD+Ndnp3Ynwbn/NwvDyHacdgPZs
 8gf+YElJaEweWaGy9ukxJAm9p5VWWlV8pGOeiyk1E8632AS6MIt3G2iORzychSTEUrq7
 E+5KNJH9vFwLpG86X+u6W/ED4CFv16I7lC/wjHLZIbHjr4IItgUY1tahBN+NwLKlELZZ
 8BZCqHF5QBH1P/A27ffBo+tVWwdapdhD6cUqcSQBaAKmdsYBZmOF4DfoMOh57bQO+dvI 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsqwc2nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 17:40:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A16B910002A;
 Mon, 27 Mar 2023 17:40:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AFF12194F5;
 Mon, 27 Mar 2023 17:40:14 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 17:40:14 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 27 Mar 2023 17:39:38 +0200
Message-ID: <20230327153943.275124-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327152948.274743-1-valentin.caron@foss.st.com>
References: <20230327152948.274743-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/7] ARM: dts: stm32: fix slew-rate of USART2
	on stm32mp15xx-dkx
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

On stm32mp15xx-dkx boards:
- Fix slew-rate of USART 2 to 0 like other USARTs, because frequency of
USART pins doesn't exceed 10Mhz.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index a9d2bec99014..af5ce19794e3 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -2163,7 +2163,7 @@ pins1 {
 				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <0>;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
@@ -2181,7 +2181,7 @@ pins2 {
 			pinmux = <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <0>;
 		};
 		pins3 {
 			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
