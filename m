Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1355483BD
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 11:54:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBC1CC6049B;
	Mon, 13 Jun 2022 09:54:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C80F3C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 09:54:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4DD0E84429;
 Mon, 13 Jun 2022 11:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655114042;
 bh=f0z+xqk3fmNgAnvheK7A4jgNEtkvie26jC0VJLOnVeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x5mYWFvwQfPlTMEKo5LxILeqBeu7BuLj8wirWZ8YV3zZw3jO49Dc7Qo97FQYJKZhB
 +Zkfa63qeAuYLw5eBbMybOWAP9kv5kleHITHat99kNRAVBLYdEZD5O/AacWJWRBz3S
 080vZjQDpT67OyyjX6XSozlHaAYrvhBgUbBEFdqBHWoNXgUtWjHhZ8VmX0pkGuAXZ9
 /R2qTyKlrBz9jLJJemSJOkkMVI4ySlLrt20aC8gJIfCM1o4QgPVBDl6bIzC0Avv3VM
 vGD33k72mTBabZr8ucXt8NxWbWAXpJKDsiUvskxAgSoBpekDrZUBckIXdwLreQjCwg
 +OxteTYPlNn6Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Jun 2022 11:53:25 +0200
Message-Id: <20220613095328.5661-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613095328.5661-1-marex@denx.de>
References: <20220613095328.5661-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/7] ARM: dts: stm32: Add alternate pinmux for
	SPI2 pins
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

Add another mux option for SPI2 pins, this is used on DRC Compact board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 6d84fa963e793..dd0609fbd88e0 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1879,6 +1879,21 @@ pins2 {
 		};
 	};
 
+	spi2_pins_b: spi2-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI1_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
 	spi4_pins_a: spi4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
