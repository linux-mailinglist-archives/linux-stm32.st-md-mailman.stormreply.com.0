Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DB4F84C4
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 18:21:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 144A6C628B8;
	Thu,  7 Apr 2022 16:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7304C628AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 16:21:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Aq1HB000624;
 Thu, 7 Apr 2022 18:21:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=UVkF1Bcf9hpHGFk32BlULgFhoGv/Na+BE/LaIs1dpXY=;
 b=JM7qiOt4ZeweUv+HHbWQ0CbzixBwWZ05Sgx2tn1XTyL0tCTJiFYJ6dWg3xpEZxS4lHck
 IrSNHK0OasclWU5tk50kv1LXA2eVEr3BLm6oV03QkShtrZnFz6o0A7IHJvKklAUXS1ne
 fdrTXJ2chKSZYvnnf04hK5NJQZT/kAkxx4zjv+0R0qGl8fMSYVQ9+f3UI3NKBp56/H/l
 RdGW5uxV/Fe7A23MH/XE5mil1h7A39slraKfo0enZ3M0vS0MuBn/7iIBUjqbW8zTnTd6
 UUpNVQbugrF8KlG/waBSNp3MRct5jurrbdQ8+aoY/WsKb6fsQZXJlc1/PaCL8UmXMuXv fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f9wr7jaqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:21:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91AAA100034;
 Thu,  7 Apr 2022 18:21:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A22D220FBF;
 Thu,  7 Apr 2022 18:21:03 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr 2022 18:21:03
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 7 Apr 2022 18:20:41 +0200
Message-ID: <20220407162042.361956-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407162042.361956-1-valentin.caron@foss.st.com>
References: <20220407162042.361956-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_03,2022-04-07_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add RTC node on
	stm32mp131
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

Add RTC node with compatible, clock, and interrupt properties
on stm32mp131.

Add clk_rtc_k fixed clock for RTC.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 1708c79b5254..9b1c87edd613 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -75,6 +75,12 @@ clk_pll4_r: clk-pll4_r {
 			compatible = "fixed-clock";
 			clock-frequency = <99000000>;
 		};
+
+		clk_rtc_k: clk-rtc-k {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
 	};
 
 	intc: interrupt-controller@a0021000 {
@@ -218,6 +224,15 @@ iwdg2: watchdog@5a002000 {
 			status = "disabled";
 		};
 
+		rtc: rtc@5c004000 {
+			compatible = "st,stm32mp1-rtc";
+			reg = <0x5c004000 0x400>;
+			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_pclk4>, <&clk_rtc_k>;
+			clock-names = "pclk", "rtc_ck";
+			status = "disabled";
+		};
+
 		bsec: efuse@5c005000 {
 			compatible = "st,stm32mp15-bsec";
 			reg = <0x5c005000 0x400>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
