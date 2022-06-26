Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6055ADBB
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jun 2022 02:21:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 614C6C5F1EE;
	Sun, 26 Jun 2022 00:21:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF84DC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 00:21:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3D1F184449;
 Sun, 26 Jun 2022 02:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656202880;
 bh=jlUl0utbmcLRLqXdAJk47tE1vZnuL7EO8VhDDCrMYGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iujY3XR6yNvaEQxy0LFlzm+NcWh1BXzklYu6uNBMIBWsLq+iEHPxyhVOmda1UMXu2
 G1ebvEt07MdriZIxOjOqBeA6hvGNyorXve83uHFVh19ZcAac7svj3CcAH8Y1gx35Fz
 g+dm1njk8f7m2yW0MFABVCBx7hDHtNBemMSOG6/wIWk9RGqSou0exO/5ZpfCfhhnwf
 k2SgW7o1oOStfE6dGu+X05ucX4KwjhNk95E4UIJPFspcjEhVuvQtHrqLPwN3QYZ5TW
 lnOURKcSsasN1pG+vyTT8fC7G/kdMZCUr+eipjElrqIPdAJ1EktQqxkdoz/MOE37ey
 /BB/G45K6ZCEA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 26 Jun 2022 02:21:01 +0200
Message-Id: <20220626002105.198854-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220626002105.198854-1-marex@denx.de>
References: <20220626002105.198854-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 3/7] ARM: dts: stm32: Add alternate pinmux
	for SPI2 pins
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
V2: No change
V3: Fix SPI1_ comments to SPI2_ to match reality
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index b4cfa11fc9be9..58f5924902b82 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1879,6 +1879,21 @@ pins2 {
 		};
 	};
 
+	spi2_pins_b: spi2-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
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
