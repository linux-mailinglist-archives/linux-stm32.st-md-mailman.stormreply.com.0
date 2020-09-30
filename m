Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE127F956
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 08:11:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B4F0C424C4;
	Thu,  1 Oct 2020 06:11:13 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D83C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:47:59 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgRYd-1ku3qH3u3T-00hvd8; Thu, 01 Oct 2020 01:47:55 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlp9-0007aF-MT; Thu, 01 Oct 2020 01:47:52 +0200
Received: (nullmailer pid 7817 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:51 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Date: Thu,  1 Oct 2020 01:46:37 +0200
Message-Id: <20200930234637.7573-8-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:0IUo1RRU7aAo8lMj4tzZs2tdPUuRWx/DVg9fWHk99XurY6GYSNC
 hi0k4Y+6Rvd2A96ObtnJkZ9b7FaJC8oTKeQjrqDQoiAJi59zcVISDFtcTQC5r9ppEjXMxT5
 9JZqTtubXCNiBVhQw98FxKkqHLFjh1VvJjlQu5KTRSOTFE3yj4N8WYGh5qJoe9yvg0/N+ST
 0mF0lowsi3Ph4kHDEtMIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hvz3tk245Nc=:g/QpxKPbn4M8s0R+crrBqj
 I2VmIhXT0H7hfD8iolSFiF5pfJk1jjHCbJDejpW5i0xcUHXHkdYYHUrgIB3eI9wb+b/7vg5os
 xvWLdtfnoYeBwjaw24UwhpEDoqWI2Stidl9ttPKsn2XyTzFoAqCWkXn5Y6yLtWSwu+YxKnbsR
 CE3a6lcZ5kEq+sR2ILpVKekK9s4DRQWL6sQANVGACBsgkAeObJ8FC97ZZHv0GcygW2c2nnc9U
 +wMVs+C/roYWYmcllk45fidSri4t03BmK+fmDA1k+/nuUMAlovJP7Pp9qwaMUIM34eh0pKIyP
 8QtBnQEMIRFWTpM9uAsL1jj78mPi6XvnhhyBIzPXuFQhZ12cwrc40RWV6MklzwnCLIA7toh38
 Y+XvrZm1Em/xkAUE7duoH/OhVXEL3WAR2UlLSKZBNRPCzlypMfupOpqitnWzWQVbv4lvmaTAo
 Ds5kC4JTHvuLe3lg8LzBGi5GT0z3dfrfy55HpxqB1bKDuj/mg7YdbrWIJ9qVQJOvPOYah0voW
 9r8BeiDejdWckpDWwy56KFtzd/mXRFJWOI4WbLeSvWoFrzg5ssp4AXIpYO6Y2rKaJ4vf+wP8J
 eZzHp7dKotPf2kJs60pqfdQ22V7kBtUSqO0ku+MOnATpx6GxR3nsRkWFjtpbzUUstBNc5bVFj
 AD2Y5Kp6KE5e31OJ7uFLHs0qwhSMD1rFunKe7UBse8Ja9COyvP63eXD3P1MiD60/LqogT8+MO
 IAY8Rc3GLJd2YsoER8rtHAf6PP10Xb+FQFK+2gu6aBl8oLVX+kwiKHyNukJ+MB5i0op1yAnlb
 fECpu3O/2vxpuM4an/qjA4csLsG9xhGj14Gdptg8z0hrmD7UhYQRJRhkzNpGlzDPsCCg0D3
X-Mailman-Approved-At: Thu, 01 Oct 2020 06:11:08 +0000
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [Linux-stm32] [PATCH v6 7/7] MIPS: DTS: img: Fix schema warnings
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

 arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index bf69da96dc8b..a8708783f04b 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -46,9 +46,10 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
-		heartbeat {
+
+		led-1 {
 			label = "marduk:red:heartbeat";
 			pwms = <&pwm 3 300000>;
 			max-brightness = <255>;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
