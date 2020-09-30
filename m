Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD827F955
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 08:11:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D20EC424B0;
	Thu,  1 Oct 2020 06:11:13 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A25F0C3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:47:58 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1jvFXk1OsC-00X0F6; Thu, 01 Oct 2020 01:47:52 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlp7-0007a8-MI; Thu, 01 Oct 2020 01:47:50 +0200
Received: (nullmailer pid 7811 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:49 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Date: Thu,  1 Oct 2020 01:46:36 +0200
Message-Id: <20200930234637.7573-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 57fe0bff746948a1c00c1c012c955907
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:aZN4vsQ09FD4ST1oiQw/j/zmw/WZNfS+WwJm4ljdYqSrse6wOJB
 HIwUSHD8ea0pFYgoq2609uGTcfq+/wDtaLXxV06FrmGKixxlLClh9iiByk498n0mUczE2FF
 F/K5zjrNkCk6f5MbiWHQn7sUxo+NM/BUwyGjUIuw14TGdLjs4Kwa+ZFrJCRuLIfO/DnScWu
 5T8JxfvsL1SFxYJ42c6Uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8xDsnToblKs=:i9D+lIxwSR0wVQMwoBhj0C
 Rqtkz1qmZN2Nl0cEKIBJVdazJUP0U1bfmAI1gMxMRw9uK7dQ6k0zAilbCgb8n+sJHDwhqvajm
 8D4MU3Q9ZMv8vfYxQVAVIjecyF18EkyoTLDsxk+cIWhKATA8Ay5qzFJnI6DMVO9r7UKuLldDB
 Y7lFpFiga2OQTbZ5/8kgacWgf7J39jp+XDU9K+6K4439EQ4UtobRug5DKV7A1k25F55dCWMn/
 0oCWvuNNtfyttSgZfF7PALNVathPbRrSF13N3E72yI4KRxGU8bvNHM7YeiBCDFO6XRW4yzAW2
 p5GkeiuJVwKUYyrlS6LqMEn9ywuubmDLSm7YDQ/tRjaAnisxEMpm/Gg1t6CO+vMXdc54cSWcn
 TCPPAEadao3O6Z5PXc044Dy344r6apnEin+phw8V+hTjLUbH0rrxWdNfFDsCfsO78E9PqZ+B7
 JDer4c4i8WK3tgSCPBGGumtVr8hwTxSlgpOxGF5PGGOuZqLMKCZut0A6Yyl6wlxD3yP9WYukc
 nc8hnRgimLHdc8hj1Nxp/Bfa+wyosCeAyLJDPifImFMUtrX6XSQ41b0U9i28gYDtYPMCFMPOL
 umgRJVSCIdtBs/O7K6vghrkGK6oP+UGq0eDb6UG/A7Z8OIIG+/9rbFs5tSlFLpTcl3f5ztS9H
 pnABQvVFhC9+jVq0fmpYsThPCUnt+wVgjkWIW+kKFlsvgyKOryqWAbRUPKSHxQ5vOnPqXM7Nn
 0qJXsTkMCOWsk60GhPxxPfskiblRy1U2GWMy4v7EQXWEe3Rzglf66ZXsbk4UVOgHBqJGoCYWt
 jnZK79D1kPyLWV2vTy6felafY+K8f83rWBIQybG7fHCHnpJIL+7+yMAEgzmNoIBKGRmMOsF
X-Mailman-Approved-At: Thu, 01 Oct 2020 06:11:08 +0000
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [Linux-stm32] [PATCH v6 6/7] arm64: dts: meson: Fix schema warnings
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
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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
