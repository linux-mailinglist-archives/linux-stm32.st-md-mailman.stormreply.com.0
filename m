Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D609284112
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 22:36:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1DDC424B7;
	Mon,  5 Oct 2020 20:36:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6DF0C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 20:35:57 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MJVY8-1k5oV82ZaK-00JqZm; Mon, 05 Oct 2020 22:35:46 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXCw-0004VR-Ih; Mon, 05 Oct 2020 22:35:43 +0200
Received: (nullmailer pid 10325 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:37 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon,  5 Oct 2020 22:34:42 +0200
Message-Id: <20201005203451.9985-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 4b5898d038d1415590f3a2ccc7ce21d7
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:k0yiA9lyvy1/Zh9nh+0nofx8ISHoK3KZN7K2P4l768bFHrROa/O
 pwi2OA9dDAAdh+gXmQmP0vr4EtnzAiNh8Yslnw1T1V0Vv6ZPhJK0C2tTp4DqxQtaG27Tk3c
 +upi/Serv3087WaSsaFGKszSXwqNZvFniQ4W0uNIIk2AF92G48G515uvh/+htX+NW/+CPt4
 qtZBZo5LXWC3MSeOPaJLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pePHsAIg4/0=:6zFjBC1h9Q3yInlKRJzjXk
 GRvZrKsohZbuA9PZAJudVE3v6m7OUshdmj9zF5H82bmBZ6rm1oqDBJPO1sPkw28NkEL7Et/OP
 l9VImjVJlmYd2PN4bfc9xBqXJGMkW6FlGHBLUsIpVnOJBy8u2iC2s5uI+7Xqbp0zHXVBDWwE9
 thoMmf+V5bDhbQGb8j3R6HeqZQaMsZAg6QQpTO+hJbg0gN2MCKrJAipp6eijGtF6dKk98Hv1G
 GNqSYPtQsZlD5TD5Pk6IOHUrHVdyA8pT9BsKP9mZiXrMF6wgeplSktBEtRP7M2UA5NHN9KDSw
 aEsjeb2R2KP6xmLezzBh0uTl3G8LhhXT0KLqH7w0YNHPA9rhhFH0MCOh8bh1W8dah9kuDUgI4
 nR+ohcWZwuLboWOhglIY+5FT2iAyruZsyKP4PPNGkZm/lLAHqWAfb+ESTot3VxvyGeF7uK3zo
 lzBVG6LXHL+aW7CTfP0vIWugjs1KNL69CXEiyUy+hgEOlodWTfH6ydFjmdmeYv6y0gvpYiSEZ
 7rSFQE/COJN9a0WKZWu+ROAlnp25ymEku+s9ngCETEe/rjHCYMeL2rDXrPdQ6mfAScdLnmTlL
 XXxJ6j6SjIPbxPKIDfShc09LtV1+HbUZNX6+Kx9RxZgvi07hQZLPGL8n1mhWnQ0y8KKW52Rv/
 0B6D8lginTmCjvpHKXJbDPftBvI8BVDRe0ZD2IbC5Q3bMHtD3mNqTLQme3Bi3DZUZVvmgHegd
 ykG/07og7yADofWR1hO1eu0TXw+Wgd37WDhn1fT6WhBQDqsnBys3bgH36T3OkCEYu77Ye8BZN
 Skl5inys+DhbXebBsFzjz8XKe2/ilJeO/zANbw6fDkksuvrRHL5o0fP9kwPSQq2/4S5KnXr
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
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

  DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
/home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * added warning message to commit message (Krzysztof Kozlowski)
    
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
