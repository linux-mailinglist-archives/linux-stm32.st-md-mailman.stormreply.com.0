Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C009D284110
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 22:35:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD6AC424BD;
	Mon,  5 Oct 2020 20:35:56 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 920DFC424B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 20:35:54 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQdMG-1k4AsY0Q3q-00Nkup; Mon, 05 Oct 2020 22:35:52 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD3-0004WI-Ea; Mon, 05 Oct 2020 22:35:50 +0200
Received: (nullmailer pid 10358 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:39 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon,  5 Oct 2020 22:34:46 +0200
Message-Id: <20201005203451.9985-8-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5e9d40fdb1e6868c9688ce2d7506cedd
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:qAOppKaFOEEFvMLS4UbgIKeSIya5V0XEJXxPiPeBJFhM6VitkAL
 Eps8BCWJUd1k/6O4szURKXFCNlVRs0I9wUfXCBvAlvaBwur5GSNFsV0K43loo2VLgCJ8MSn
 t6Onhy0Gbzy8FeG1r0mkdmRB7fKoqHRENqlJgq5KG3E+s9endHkfqgrPHijVpOf0tB0pAnu
 Z7B7fA86EnKFPQa55ILIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wa0B2A2jN5g=:FLebsajf/2pJOWMDJLdAc1
 8BZY7HyVsCG1NWzQS6u1dqAAi3C6/FN4YICYo36Tcr32bMmleopKPo+FvNG5TRh6Ypqx/ipvJ
 RgFpFi+BB5Q7c6SqNI3SIfiOHJJYSV+GEANKKx76Zu/J1J70Gc6Ws4qzsglD7ENMJsYqViohR
 VuuzWkZxxr+tzdV8x5kHDDxythG8L6CAnVJpA3X6/rGrKr+A6r0unJKLL9HUCasr3uABugj+c
 /aq/O+lq89l90HwYCNXvUZDvqweNBE75LbRD5EDgHbfqm38ZPunu9GcNZl9saD9AV86Wzeawv
 6ksKAau02RPpJcmLd09cwdW6CiVnV594gAif9Q4Ccgsqi15tPLhH+c0KX6ZjxzGIsBMzfdwXB
 NOhAI36tsuAuQcbBgGogUbKeJ5bbzZE1aRFz05goOW8Psllz/PbzNNIFIs4Ht/XgY7jHH8TYF
 wqV3X2Iv5p8n5O5+9Nlc8zYqAhxIhLBuQ2O+0p+plb8VNShp26OlTrkw1e1kIoZYzluH1JuqR
 aWyDQZi04vXdIHz+QO0WSFdFLHftY/sEKGGkwhViZXT6ggudbCM/CAhX08fdA3AO4JjfJIUnN
 QfyWrwlcjyUyBD4QPlPdHrMvbP+1azbh0lADvP0sRbz0bITkOuLRILQI/uxZQI+jLtMga2465
 yugeYi/ye89nl9ivzf5jjndmTmIo+6kFCgbRg3saHIZ8LV+Xzy4uSEWKxO8qn5iWBR6s6Ztrq
 LzFugwz2OWfb/LSfVtZQrAgTMWI6X8sYl4uIL0GjaECDzkZlcJx9R8jm8cHdsRzoljNgYKTLl
 C3IBokDLWMC+UuREltN+yMrHTaMVCrhipJe87I834KOvJFkzNSuy6eWYFSJcHUjzlQo6TNe
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 07/12] ARM: dts: exynos: Fix schema
	warnings for pwm-leds
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

  DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
  CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
  CHECK   arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
  CHECK   arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
  CHECK   arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
  CHECK   arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/exynos5422-odroidhc1.dts      |  4 ++--
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      |  4 ++--
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 11 ++++++-----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
index 812659260278..20c222b33f98 100644
--- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -15,10 +15,10 @@
 	compatible = "hardkernel,odroid-hc1", "samsung,exynos5800", \
 		     "samsung,exynos5";
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blueled {
+		led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 892d389d6d09..955065ee57a0 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -17,10 +17,10 @@
 	compatible = "hardkernel,odroid-xu4", "samsung,exynos5800", \
 		     "samsung,exynos5";
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blueled {
+		led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 56acd832f0b3..2fc3e86dc5f7 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -11,10 +11,10 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	pwmleds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		greenled {
+		led-1 {
 			label = "green:mmc0";
 			pwms = <&pwm 1 2000000 0>;
 			pwm-names = "pwm1";
@@ -26,7 +26,7 @@
 			linux,default-trigger = "mmc0";
 		};
 
-		blueled {
+		led-2 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
@@ -35,9 +35,10 @@
 		};
 	};
 
-	gpioleds {
+	led-controller-2 {
 		compatible = "gpio-leds";
-		redled {
+
+		led-3 {
 			label = "red:microSD";
 			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
