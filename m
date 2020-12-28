Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE02E6816
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Dec 2020 17:33:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABAC0C57183;
	Mon, 28 Dec 2020 16:33:06 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE4D4C5663B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 16:33:04 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MK3BO-1kakAl18Pe-00LYy0; Mon, 28 Dec 2020 17:33:01 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS3-0002GQ-UH; Mon, 28 Dec 2020 17:32:56 +0100
Received: (nullmailer pid 32623 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:54 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Dec 2020 17:32:16 +0100
Message-Id: <20201228163217.32520-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 36fd1d55df1a518e40d0076c137e1855
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:LimgWNDLRRVaCNMFJ+i8uoeo7wemoEqSTqKIxlEjwEQ0TAFGuEF
 giflE4niugQcsvUU03fAn7MZtYe0yiKtyYHhcinoIFrm0EL1hfhSgXxxogmZgjhDw0GJGAo
 gnw4rIbBS3xmUwabYbz3VxjgpcnKvJTCVDmD596yvbM/yFNWAoL/r+ZqihH4loDs1yvLvS8
 EZkd8Z5h/dhqRv2iqJfjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SRKurWlsH04=:ZZo6M80gCHdBDukFBDuNcl
 cW3FHOCbtY1D1gzP68XLOr4owTJJYM0qqPUDoHdpTsB5c02qQZINbdknIQxUuKeHukJgVc6+S
 Z4QBAJsTK3SQMi8gKHg9z1HhJNNy/uydY88DGi2MIy1yfrVRCc36kkV0fJ0rwju9MQXIHJf7Y
 59dS32EvXgACAHgVeawKAH9QtZct6FGgZe4SsTSRjD/Og4TnldOuV3juNPL1hRIKjbc48DNVF
 EqTLOR0kYduP1wMva9WjTk/JiVdYTmnG9YkIAa9WZPXE7r1yFRtjtkeOn3BfUd16xLw0xCL2h
 FvEvz+fjbNFp0h3McyFFeVnw+0+TGV+/iMPVrmkl3b0QlE6Mz6DNMB6/KTR+XWkyn2TM8JkW/
 CagKjGdtuNNbw2O+7aX29X9bo2uvqyOI/PBGlt65tmsBlY7SLgxU9ppdlz2L9nXYMYd+Hjwpi
 SfOMsK60AQ==
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v9 3/4] ARM: dts: stm32: Fix schema warnings
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

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

Notes:
    v8 -> v9:
      * added Acked-by (Ahmad Fatoum)
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
      * updated indexes and added comment (Ahmad Fatoum)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index cda8e871f999..1e9bf7eea0f1 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,35 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-0 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-0 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		led-red {
+		/* led-1 to led-3 are part of a single RGB led */
+		led-1 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-2 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-3 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
