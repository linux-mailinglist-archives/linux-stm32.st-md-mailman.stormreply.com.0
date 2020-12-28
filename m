Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDA2E6817
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Dec 2020 17:33:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC1CC57189;
	Mon, 28 Dec 2020 16:33:06 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 507F3C5663B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 16:33:05 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxmBc-1k66FO0Vl0-00zH4a; Mon, 28 Dec 2020 17:33:00 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS5-0002GX-8S; Mon, 28 Dec 2020 17:32:58 +0100
Received: (nullmailer pid 32629 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:54 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Dec 2020 17:32:17 +0100
Message-Id: <20201228163217.32520-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 9f3e2451014eddb8c015276babd3c637
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:8uronqTsuXPgzFbvVftbTks1E0sX0UeFjWtLf04xFRehTTCBYdy
 yzCyTwaCtC765Xf57s/UyBYY/JNonjzM3opE6ZEG8Cyi3xo9I02Yks2bzoUC5hpA2AvojQP
 td6yXilYMGXIWOvY5ba9NbYTWUIJbGr+GOkJQnccJsc3buNLMJy9A4ywOK6qnjshKj3sRlx
 yaulYhkUGnXPRPKpLFRfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n/+RqIPN01Q=:RYT4l5liSU5gg7GNcMZE12
 Jpr1bRg4dGohmKMtq6H0aS4fujycVB/eVOXky4hQkVI/FNpQ24cLhG8S6jI7ruGjqijpTT7+J
 byBP+xjAHWYL3fRZBp0yWS2j4QCaN0ZTfPU4+S+E+yT3TLnJL8k13Lo6i5lNt61iAfjY4Y7Rl
 B8sV2qnNeebpNfZNRbUUKeBvcV052PmI8YMvJ0sgP0zjM4rLeJ54IZWTWxQri8aP9p7/I7Xec
 9Lu02oDjbhyg2Dj9UcNvZJ0SoxNbVUqgfMvnkjSlsUrFMsU8jLlYNuf271RPLl/yBm1ke6SNU
 bxaeKcRqLvsjL5JqrqszJ+hc+HsD1G9QM9pGqR0BZIcx/WaoY/AzWGxqcnPrUv3gilqkL51TD
 DJT18xCikn6NhFFdGr5x9qTQsaOPueEJrIyak3hVX7GvPTLzLurwFk5FiEymOHkuVBQAAv6Y1
 8f1rxzI8kg==
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v9 4/4] arm64: dts: meson: Fix schema warnings
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
    v8 -> v9:
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on pavel/for-next (post v5.10-rc1)
    
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
index 6fe589cd2ba2..45adae480a3d 100644
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
index bf9877d33427..25857e0c0831 100644
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
