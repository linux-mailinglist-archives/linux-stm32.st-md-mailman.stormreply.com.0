Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA60EFD7C
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 13:45:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 753A5C36B17;
	Tue,  5 Nov 2019 12:45:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60A77C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 12:45:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5ChmNP023589; Tue, 5 Nov 2019 13:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CODhr+HDgZkmDdBSbE1YP8Qun5G0drMcjRcuyYv9BoA=;
 b=xr1vrEhK9E2UdA4D56BRuieh8Qtbs35gN2hpd/l+2BIvRohh7ORpiMQa4VEItcebZORN
 QN4OcyglfXewE1iDc5aZvKhIRByb7HN2nK0yoYN9TcccoAePg3V7wc/3peD4VefEPAa1
 xE2RACDUkCj/hVn1zbM9EviiXu70AgLKVzS+USBOyIKYLg/aRSbYV0HScSy7v6ooQClL
 yqtkRBQSJLo1VbuXu7GgOk65pdrzZ4ELb3FYUNqs1bbD2L0+NNg1g/Zrm3OmsIRR1/7B
 DPWT1jgSDSwE4iwv+OOvHhog71un03I25unI8e/zX/fYLtUf5VxN9yKrIxpgfTY0BYCz kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w11jn7j8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 13:45:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AA1210002A;
 Tue,  5 Nov 2019 13:45:12 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A1852B97D9;
 Tue,  5 Nov 2019 13:45:12 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 13:45:12 +0100
Received: from localhost (10.201.22.222) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019 13:45:11
 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <joabreu@synopsys.com>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <peppe.cavallaro@st.com>
Date: Tue, 5 Nov 2019 13:45:04 +0100
Message-ID: <20191105124505.4738-4-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105124505.4738-1-christophe.roullier@st.com>
References: <20191105124505.4738-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_04:2019-11-05,2019-11-05 signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 net-next 3/4] ARM: dts: stm32: adjust slew
	rate for Ethernet
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

ETH_MDIO slew-rate should be set to "0" instead of "2"

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 0a3a7d66737b..9a8f0d4c9ea3 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -217,13 +217,18 @@
 						 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
 						 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
 						 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
 						 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
 					bias-disable;
 					drive-push-pull;
-					slew-rate = <3>;
+					slew-rate = <2>;
 				};
 				pins2 {
+					pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins3 {
 					pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
 						 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
 						 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
