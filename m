Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC51284113
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 22:36:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F78C424C0;
	Mon,  5 Oct 2020 20:36:02 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE0EC424B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 20:35:59 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1jyPZM0wd9-00RHu7; Mon, 05 Oct 2020 22:35:51 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD1-0004W6-To; Mon, 05 Oct 2020 22:35:49 +0200
Received: (nullmailer pid 10343 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:38 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon,  5 Oct 2020 22:34:45 +0200
Message-Id: <20201005203451.9985-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 08386759e7be537865a5b4fcb90d540e
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:guPzpHouZYsDItxJ2VwmbE1hLmLueuILeAA0xXEMRTr8ny0z7+r
 M3VxkcQRzNq7TcNvxUTN44v398fyE6l1UwsNy+sOkJ55ADAi0UH+IZ1CLzNvc0TdFoNddbM
 rSui4EMI2aeOPF4YWZqm3dTcuSii2/p926KHSS5wULYXMeaKLglCu/vTDZath05MJAqmrVX
 XjDGCBaLmQBJgWppPaTpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4lr8xTdu67U=:hzBHJ/QNqSAwgrq3R+eD8H
 WuPjw6nUaTamq6r5jFDNam3zhDEfNFKmVxHso0zTYy1EHtHXpuoNMzsyL7/x8Tubpeu5X624c
 nBjBQ6acovXif9BSvybV5yl6EsbyoZvOnQi6A45UeM2FtsZF+XRwmAkH+NUFGl48QUtgycpuz
 SvhAihSpmLNRGUY72PdMYqcV0c1W368GFdnA88Vm2x0Td4nukNtlzSC0UZOZ2F7EnCKZwaYJR
 xu8L6eGfxpvwp8sEmBkEMKG0fXLPNw3GYEnPNuYXpCp2b25QCWDUJAL1K9T/evr5MRqBwXHBh
 GvhO0vlcny96SWQMuCyGd5LMvTIbWbWMc75hO11QPPgVGLIn7HMK1SmRCNjuTdHxLv7YIg3zV
 KVvz0Q7yk7bKuAnmNrNps93KCm7lNDaUlbN9PbGjaPg7N/KbnKeO3tmsIwScdtxneRhevCA7s
 HceGkoxPWA+8tqiDqMCI5ApYARI+REun0fY5gU1pidOSFVeeoAVBtZxH2A0rPY50La3mwLr/e
 6zolFkFt9rbI8B+emPZK8gzOVHGbecnqj4oIHescM8K2cNBQ5zhbWQsyL8j1YN7j+Eni4Kiys
 cbqc6miRKyUBwEkvt/4RPnVtBAz4nt0mEw5x0VSFI7mXjtRKmRq0QeNOVHpNlv2ubeUdvYPmQ
 gzD8lOe52bfrVOVGkpRKiAdHxCE8rRNrt7LGgwZDSsDh3rWXQpD55Rkz9GCw1ahBhybicw62w
 Mcbxs35mnFh92qROSR3s5dpEAdjmARpTXEDi1GezGvsP1kUWntamj7dt8ZSE3ykoWB30M7pKF
 acFVedDXKtG17m/5RclNm5OMh4IqqVDy7Ivmo8JKPBZgydARKA9GHUG0xiT4S7VLGZVVHMh
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [Linux-stm32] [PATCH v7 06/12] ARM: dts: berlin: Fix schema
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

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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
