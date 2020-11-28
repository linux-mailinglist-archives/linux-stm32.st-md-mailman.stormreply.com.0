Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF42C7131
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Nov 2020 22:54:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35FDBC56632;
	Sat, 28 Nov 2020 21:54:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1803AC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Nov 2020 21:54:53 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1kgvGg011s-00X6B6; Sat, 28 Nov 2020 22:54:46 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8B0-000288-DU; Sat, 28 Nov 2020 22:54:44 +0100
Received: (nullmailer pid 4111 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:42 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Sat, 28 Nov 2020 22:53:50 +0100
Message-Id: <20201128215353.3991-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 467395612c70a9d75b41506b3ac52c2b
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:yLxbQe4fLlXjVIaFuag2S2PxaFAqe3BTGyh1CJ6YB9L6+GIZdAz
 SFmE94IzR094e/EdVMhrwcx7BUeFyUtjXwpE9KlI/WtZJG2V8lU4H2gMeA+zHaSPVabwvQX
 IU04uuFDKF3HKybmoNvlRalIKPSH6n8T0wNwhvAxisGg+2T1MWOLEiXyg5oapanB3SVFD3B
 Tz/I/ipnH1jMBIWuaGlPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VoId4h40b8E=:NvSURxE0qdKPIEw05FiB/W
 l/ch44701hupU0PgW3Pa0l3SMKOBB0kAgiNrVUbSvleykRjPTMlQUw2irN2rlGPwBXwf5LRuE
 XhILhZ1Ko2oGVUCBu/XjOmHCPcHNIRpg8juJIhUoLT2iQuNMpTdr1qpBZth3SG5wvZstmo32s
 k7nI1x5cfP/+b01nhAlfrGsEpUsgencXoLF89/95RO3v1LORM8oEyKwq7TyxzWUHcI509p5Xo
 o4o9njOqr4SFtraNOVe+x6V8+twLdrvji+QrvbcndJ9Jg6uQKfJVdzGz0Z0QBHWGZ7csUYM2o
 0Sj72o42CwSJ6yMi7HmaENumcy0J3ms05q0900ScH6tk7G1QsSWRVvvDt/2uEINo7mOY9TBQm
 hbTLRp91Zeoeo3gjwaPBH5Kwv6mvTVhhxQNYADbQcZ7Jfkaytkn0KDtWTUQQMkNWtHTNAJYJR
 1zG2QhmTbw==
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [Linux-stm32] [PATCH v8 2/5] ARM: dts: berlin: Fix schema warnings
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

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
