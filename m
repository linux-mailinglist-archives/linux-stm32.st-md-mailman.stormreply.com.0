Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BE552D50
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 10:45:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251B7C57B6C;
	Tue, 21 Jun 2022 08:45:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13842C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 08:45:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L7u7eV006621;
 Tue, 21 Jun 2022 10:45:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=2OyBIvFq+cbqc84GuaJEdZ2RqadPrXQDktccoEX4tyw=;
 b=YG8k6IgOGCpOqcO56I4GnWgsxNUvRpkvSbNJUa0NzXbZbwSDTquS6TUJakri3vIvhoym
 CHVkqJt+Lygzt9yIFZCASFqpE/Yg5pyPxJcFh5hqYjIZ0JDqOMtYZ1HrkyDhkFfwzOGo
 CC2xE33Mb9jjF/+FBp/dxbIhquEoXqBGJcpiUSS6LCygY4UKCI05GzPHB0xGDEY4OWx1
 0rrL0AvGHcp7AQ2m0jLr22EiAyEicZdCBVgY4OQ/dPoZuDDyuRv2+POBbeYhakUoKodm
 fYQagkyuBD3W4puQAtzKFOzHcwefZz/SIZmaXPZYrBZS8V/C3rbMlyLYT1iNma1oe0j/ OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1n0atj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 10:45:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 309D9100034;
 Tue, 21 Jun 2022 10:45:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A12721515D;
 Tue, 21 Jun 2022 10:45:18 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 10:45:17 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>
Date: Tue, 21 Jun 2022 10:45:09 +0200
Message-ID: <20220621084509.407451-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_03,2022-06-17_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add missing usbh clock and
	fix clk order on stm32mp15
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

The USBH composed of EHCI and OHCI controllers needs the PHY clock to be
initialized first, before enabling (gating) them. The reverse is also
required when going to suspend.
So, add USBPHY clock as 1st entry in both controllers, so the USBPHY PLL
gets enabled 1st upon controller init. Upon suspend/resume, this also makes
the clock to be disabled/re-enabled in the correct order.
This fixes some IRQ storm conditions seen when going to low-power, due to
PHY PLL being disabled before all clocks are cleanly gated.

Fixes: 949a0c0dec85 ("ARM: dts: stm32: add USB Host (USBH) support to stm32mp157c")
Fixes: db7be2cb87ae ("ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on stm32mp151")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index edc0a1641c7b..9e2226430802 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1473,7 +1473,7 @@ stmmac_axi_config_0: stmmac-axi-config {
 		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
-			clocks = <&rcc USBH>, <&usbphyc>;
+			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -1482,7 +1482,7 @@ usbh_ohci: usb@5800c000 {
 		usbh_ehci: usb@5800d000 {
 			compatible = "generic-ehci";
 			reg = <0x5800d000 0x1000>;
-			clocks = <&rcc USBH>;
+			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			companion = <&usbh_ohci>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
