Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A32C7133
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Nov 2020 22:55:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5120DC56633;
	Sat, 28 Nov 2020 21:55:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0828DC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Nov 2020 21:55:07 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZTa2-1kfG2R1Nfq-00WWi4; Sat, 28 Nov 2020 22:55:05 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8BI-00028S-QM; Sat, 28 Nov 2020 22:55:03 +0100
Received: (nullmailer pid 4138 invoked by uid 2001);
 Sat, 28 Nov 2020 21:55:00 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Sat, 28 Nov 2020 22:53:52 +0100
Message-Id: <20201128215353.3991-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5bb92339bba0719d578836d7c87c3e13
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:oP/0XxMu+IgX5ka7POmxyYzMfJNDIbeKHwEoeasrGNTNlD5ScoB
 EmEpbu+lG6L1dYxFJlcEF/ZOgP7W9ABXMTBTW0v4vYsTqLPXVcdhC7J1+3oHtJKW13jG5Xh
 15r8apDXGY3HPFKueJhObR4agVGLxp4iFocRv792ALlW41z0PaiZOWkukpYBs+j0gCZdI2K
 yveTZDhzS6pxCo8uUg8tw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HaqRyB1cjtI=:ko1C0VzfNs5z5lWW2DzZCL
 tpZY83uas9zOqAK2PQqfGMhM5qqtMqGDT4Z+9MPUZZp088fT82sbYmOtZwqFZVt80LWVDEWrb
 ca4KBMzY0r37/g6X6n6rY7hYXv2CHSBSnj/mdw5ckGa9RxOVOf4rwwS00p/kQHw/QgiWv2YqE
 H6FNccRksRklLWkAoMIHUI7BWRA5rfpwK1mCLbS2BA+/T/Tc8UErtxfq1wRiy0lNeAer2Fekh
 psnOVHHHSx9VCQmpZ4oiKqCswre9wxY8mh9JGfvdp5giatgmBIn3W4eZbMfLhQJczUKqJrPPx
 OMXmOwHmg3ZLWJGV9OGvB1EHatloSLxUEmdjBkEOu7r6YNjwDqxMrcTBt34LnKFlpUT9cYzIJ
 mtpORoy2IVSA50VHQoGlq0i0fqAw/vn2qwyp0ork5ZVwz/Wg/90ja2LvKmiix0+VUVKc/ov0Q
 7Vq8Nrk90g==
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v8 4/5] arm64: dts: meson: Fix schema warnings
	for pwm-leds
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

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * added Reviewed-by
      * added another explaining sentence to commit message
    
    v6:
      * added this patch to series

 .../arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts          | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..adfc72500e66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -42,10 +42,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..dcb435af4e0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -81,10 +81,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5ab139a34c01..039a8d0d1e9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -101,20 +101,20 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-bluetooth {
+		led-1 {
 			label = "sei610:blue:bt";
 			gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 			default-state = "off";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		power {
+		led-2 {
 			label = "sei610:red:power";
 			pwms = <&pwm_AO_ab 0 30518 0>;
 			max-brightness = <255>;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
