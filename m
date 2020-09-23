Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8427646D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 01:25:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43CF5C3FAD8;
	Wed, 23 Sep 2020 23:25:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58F2FC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 23:25:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BxZ6b0bghz1rrjv;
 Thu, 24 Sep 2020 01:25:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BxZ6b07sjz1qy5S;
 Thu, 24 Sep 2020 01:25:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sRTGpLM3ixPY; Thu, 24 Sep 2020 01:25:41 +0200 (CEST)
X-Auth-Info: zl5883o50PNVnbzRTVlAtn5msU277RWk1ekSPet6Q0s=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Sep 2020 01:25:41 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Sep 2020 01:25:35 +0200
Message-Id: <20200923232535.241437-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
	support on stm32mp15xx-dhcor
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

Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor SoMs.

Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree support based on STM32MP157A")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index 04fbb324a541..803eb8bc9c85 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -21,6 +21,10 @@ memory@c0000000 {
 	};
 };
 
+&dts {
+	status = "okay";
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
