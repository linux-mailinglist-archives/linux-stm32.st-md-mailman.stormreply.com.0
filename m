Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6B5483BB
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 11:54:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95FB0C60490;
	Mon, 13 Jun 2022 09:54:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3885BC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 09:54:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B3AA38437A;
 Mon, 13 Jun 2022 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655114041;
 bh=u4u5hj1nbW81Bwv8RUP4P2gOWpkv1+YuSnwCVIc++Kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TRSeu/RpWnDgGdu85Fo0SRZ02Chwp6m80uYVndAt73YuYH6y209HVNIVxdBZ08xhY
 9ZKLHW2IfQciClgO+VjwijIQti/31EJdxYFgVMLtUkGttooyfjHW6zyngwxXxTYqzM
 /Njb53A5dFsvTK+R68X3hMHeK3olZrf9FWftPXxTwHqzjJUTCSwFX38i+cIuzvm4rV
 a9mcuK3jU+s85dQedENIf5DzBDzlah2mfknp9LCdUBOfGdZd4Tb7hIVQQ9rrk2I8pA
 Do/W91fholAGbuixYyfKEeuB+IyWbEdfqrYuYR9ft1++78FrjDELouclGR+b6QK0Xi
 BTe1A1Smuor+A==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Jun 2022 11:53:23 +0200
Message-Id: <20220613095328.5661-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613095328.5661-1-marex@denx.de>
References: <20220613095328.5661-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/7] ARM: dts: stm32: Add alternate pinmux for
	UART4 pins
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

Add another mux option for UART4 pins, this is used on DRC Compact board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 9816331e4bb7d..feedd84b247ed 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1936,6 +1936,36 @@ pins2 {
 		};
 	};
 
+	uart4_pins_d: uart4-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 13, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_idle_pins_d: uart4-idle-3 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 13, ANALOG)>; /* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_sleep_pins_d: uart4-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 13, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
+		};
+	};
+
 	uart7_pins_a: uart7-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART7_TX */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
