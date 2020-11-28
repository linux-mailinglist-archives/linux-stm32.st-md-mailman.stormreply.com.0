Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA32C7134
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Nov 2020 22:55:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E903C56633;
	Sat, 28 Nov 2020 21:55:15 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35E03C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Nov 2020 21:55:14 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MowT0-1kPnaD463C-00qUqX; Sat, 28 Nov 2020 22:55:12 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8BR-00028l-4q; Sat, 28 Nov 2020 22:55:10 +0100
Received: (nullmailer pid 4158 invoked by uid 2001);
 Sat, 28 Nov 2020 21:55:08 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Sat, 28 Nov 2020 22:53:53 +0100
Message-Id: <20201128215353.3991-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5ccd8535a2f53357608f384c4c8220c3
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:P2Y70kYg3CuoaW8dA2A8duhR9E0iY4+BlupumaHUtNIKfJBeMpE
 OEgb7CJ++1ExB2HMOrc+kjbDjIxt3D/u1QGmQdPN+lwOArjSw/jNEeftA3LbzW6RB+p45FY
 ynTo4IR46hHblnF+KU4SocDdQ3aXarkEBDGX3c+chthToemwFtl50WLmz7arkEAbywCCYX6
 FqGqXip+nP3GxNZD3gwMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mgwv/y2PQyo=:l6g3zbRgOPuTRcX6qX+csU
 0Z0rHM3WEDNVxmydmMlmuKHcygVtROPApeRsUkJltJJaK0JC9miqHjYdGdLwMqVeEnR7GQn1s
 eSXr6yQszpDcnetk0q3TOfwk96e+BtazDmR9J35o5X6nANSnThQxxAHfOHFjfjTQhMONtv3iP
 q9Ux3W2x+3jrHm00xXgB5Yu10DsPHF0JUTygljBbM7Go81k+ILSWltGIPlaoW53WEogsotnUR
 eMRm76Ro80+y/eRcZfc5mRzrvfCEtcfkIlbzHfcOwE1Ncqgu1fSQb75kKFJQetjQSl7yzVR3+
 pEOY4XZaM76uAFsOcjFvphMgjNelgVA81l+nt4AqGTSJxExDC+LLz17vx4FHR9vOnh8ffQCtL
 oFEzQGMkRVJSZXJgkuqNpK+UYUCKo7xCqOLl+B/uHG2k3K7HJHDwdFznlfpzzBeW+7avu3EGA
 FGGytYzNRQ==
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 James Hartley <james.hartley@sondrel.com>, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v8 5/5] MIPS: DTS: img: Fix schema warnings
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
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * added another explaining sentence to commit message
    
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
