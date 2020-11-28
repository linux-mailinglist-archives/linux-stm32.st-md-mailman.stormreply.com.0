Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC52C711A
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Nov 2020 22:54:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28AF8C56632;
	Sat, 28 Nov 2020 21:54:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EC7FC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Nov 2020 21:54:39 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mbzdn-1kCp1h3pip-00dVpA; Sat, 28 Nov 2020 22:54:35 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8Ap-00027n-QE; Sat, 28 Nov 2020 22:54:33 +0100
Received: (nullmailer pid 4098 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:31 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Sat, 28 Nov 2020 22:53:49 +0100
Message-Id: <20201128215353.3991-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 53f17ed7acf4619e77ac9411375ac493
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:EV7J6yS0bGPfutnvWVxMCCVlSgPwiskXwos5S6beCfiCo9yItBc
 VP7B501UjpYvDbqaI2nyNkcHkzh61wxAc9T6vG6yPKDIogjV5FQGR5Cuz5hqkLY1WwnXh+S
 SrLCNFf7dWlqZ3etQu8AuAe3VYnmp3Z7wt55/0Z9hb5Y0+C/2KTJTpxFdAIxYw5bdKgBvv9
 K4zjotGQiLPn+HdjITW8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELxZVikg6TI=:PmypatW+rzOMpdxBmlAY1n
 EdFBUyFl74PH/aQCYuElzcbYc/o1pIlryiqJ/lRB9OEjdGS6ahQosWWII4CanGexPuhY79yDa
 /kCCTAHMK9v5s++x3s/ssR/w+WeIGiOHE7FoA5m8bueMTcEJWDnXYxjKDe5ArWKU/f5Am5qzc
 8/EoNSfStwQQI7EStFPMBEqyuTqf7S4n/4NHWqC9O+iyCE8ged/Ek4Vg9OAR1pYiuukqi6wNp
 fNM5SdUFIw6s/P0DPbMXRYLsjCypIi74xl9ohS87pwHygZ4/dbNR4IDdWYy/Ciu78w38tCCZv
 US86sU16i4I5Vx/952629q+pUPXPoSTGalk4qR+WUXPCSOhzenFmhcm+Uw8DbOSO5Jpilxnu9
 36kxQU4emB3a9Y+fck8F/eg7Id66dJgFm263GeC60oCEl3YzzWct7mLmzgGRKZsshSeILowJP
 N9PyGKn/yQ==
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v8 1/5] dt-bindings: mfd: Fix schema warnings
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

  DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
/home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
      * added Acked-by (Rob Herring)
    
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
