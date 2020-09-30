Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231F27F952
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 08:11:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16ADAC424BA;
	Thu,  1 Oct 2020 06:11:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFEE4C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:47:41 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sQ6-1kJuCR17Ok-0050dZ; Thu, 01 Oct 2020 01:47:37 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlos-0007ZT-EL; Thu, 01 Oct 2020 01:47:35 +0200
Received: (nullmailer pid 7769 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:34 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Date: Thu,  1 Oct 2020 01:46:33 +0200
Message-Id: <20200930234637.7573-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 2beb02607f6eb8f9cf7f14ab96a8f994
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:bP90eXR+w48aTn1ppXN+URCgE4TjDapabKR3j+t/0oN2he6UhS4
 m6ghKbSHJkVGW+jQn/1s17fu0hH++ewc1KAf1hb8c6rbXVTMJqhqGfghejlKAXTk2KnVt4u
 h8COnj2ZoHZ2irrHbvClLgCbfgW76zmIICkfLfSaLRqsttzfOoomDwOmdDJ9wQS0PwVO3A7
 j4ZxtfGDHC5halIijwdXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rgwX+3edwsM=:+F+Lk5lVZWeAg1oAkNSG2l
 SeNBwiXso4jjoA9hE5cjQmT5n1frhfkYKkSwkP8a+PRRUQk3OtDpB7imMHJcy/tyb1QhjucOx
 nTaigEyQCndAl7P1/tyOBj1iqi4pG8eXsFzwTmyO4++fa2WZ6GsanWGyNcFezGStaDM5JpGgx
 mDiNjkdTBAkvEfYa2KnfFKWPwfizSuQums2wQqeqEdQgrqPjbvBUPq6DuGEmZ3Gf5L4vvRdDY
 H3kNDrfmtK/HGq71MqNte9mz/ZQlP3TiHqiYC2Z0ViB8FYTGhWs9OoJZZ+LlgigwRLu3d+LAb
 QByBZNMQU+xQxc83GT6CmOzDkrhHMoUG6n/OZJTC2slrWkinAwZJ8/8UXhChLua1odpvo+eaC
 jyZdaaZALVM29FucV6cqPi70jJiZaXO+Zk/CzYw79AsXA5KiHPvIwoGMcRCmvAmGGR3+XQ0h8
 UKa4FPHw1WIm4/pxlj/Ux1wxmGodnkQsN+jTugFS1Q3RKfEWOkcWpDL26bWy9ynkk/pxXhEFx
 jhJZE3mkhzPFXAGqMDBNkGjYsdQo9xRiXYG9FJc1k8BGgQtHbj4PMJO2rUskedyqNjcfhCXMD
 pQ58YgwQsyFFeM06xF0W51AvBYs3vdSK66cQ3p8i+tO0yurEJKYM2tIulI8on3Ewl1ei4DbmC
 fGuUkIVAUO81ELOJAu+TfxWclLAKO63cwGNfldBu2hW4zNV9wIpSmCbkHzLT8h7uTAVR4syt7
 l6UxZrGSMg2flMZpQ/1gnTrQ+euWQnpB7tL5PdiDHevMhJo18i4EF1LCJ6OFMhgxH0olQQQBN
 BeaDR6IfQd7ypj/La2v4cK7MtSCIur+WrysyIE8UB0CpHTr1YadNhb1kkz5B/W6muFmzLHw
X-Mailman-Approved-At: Thu, 01 Oct 2020 06:11:08 +0000
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [Linux-stm32] [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings
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

 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e73..92dc48a8dfa7 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -90,10 +90,11 @@ examples:
             };
     };
 
-    pwmleds {
+    led-controller {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
+                    label = "panel";
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
