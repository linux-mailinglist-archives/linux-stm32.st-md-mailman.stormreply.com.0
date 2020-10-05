Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48872284114
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 22:36:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1169FC424B7;
	Mon,  5 Oct 2020 20:36:02 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B090C424B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 20:36:00 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MDhQt-1kH2ss02o3-00AnRe; Mon, 05 Oct 2020 22:35:57 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD8-0004Ws-Og; Mon, 05 Oct 2020 22:35:55 +0200
Received: (nullmailer pid 10401 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:41 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon,  5 Oct 2020 22:34:51 +0200
Message-Id: <20201005203451.9985-13-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 07736050a5de048e796b12253fbde497
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:p4vODZJGo9+t9tn9s8bm4upQ45uAf97K+kjoIIIPTinrUJiiStE
 rpcrEB7DJRk32pGB4QvhMU2kgfy+90tUnfDra74bIY6U6B04OzthKrpNFh7xKKN1Gylf3ML
 M3fkSZXJlDQJ5SC3TXFZ1Hzj09ektnkRJBP44ne1uXMx4Mhh69+N0DcUbRBP5wlygsn30tu
 hA0wVNMjT6H/AFtUGeUbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKjCGNqN9aQ=:4OCCRZ6yOVkWOUuDTdYsdd
 4ItDgizdlZGX+PKDphO+HBFjymNxyMfq5iQMT7m+y46EQz/WLOocZVFdys6DIc6yvFEBq8NkR
 1PEPPIsQ+C/aPYgYDndLnparpbI87W9bD+5cdQ3RjkqO2kMhiYt9t/Cvfcn1j/QCUlltsHSIz
 H9+pqdrYEIBKuQJFbKU+zbmvwIO+T/0cJR9m1PY0nLXSJyj1fgVqiejlsQ+qVss4Z/92Ztw5o
 fTRSUJOBdXUAjKuevujspz5h9FF8MVKB4MAgYa0nz4TFeXq4o0SE8BZvbVt/xI6F8koLv75AD
 DIXSHxUS8oAGoV2iFIWtCBDlxINivP2hEO45HCrfbKGMiIlHr7uNdgY6VnRJecAd7oLovXw19
 wIflGa0BkD4W/l8gSP7zxisvaQZRoiy/Xk473WxxSTKHaJ4sBvju04Ye1bZNtccGuK886JNif
 whQBFSbiE4tM5jUXrzdcqCHOK0ug5T+24DJ2MxtMm9apcSV0teO3k02eeQOKOQBsViwG1GMnA
 Ewm9REB/gOkrmHqWwSHhMMkg7KnXpvQOVQ5bPlnHSt3tBdJbiuXX9qYbq45261ONAuenYT4gV
 OZryUDfGG6MI5PaTqRPLRsOZJ3MwaQWGvJ9Q0FqaMj0CI+vocuswaJaLW6v8h334y3DFv9HgI
 O2tvTNh1+2hkqLAsoI/KJHgNbSN/ee5aJUhLZtPgvLT+vkC0UDArgbbPHsf7/D3WY8YbU7Gsf
 x+MKhNdXBS+MXiW1YPe8fJ//KX6NC38CCmf2AavA/CxngY6yVnmJ5133JGz6n0S0xrzTHqzaa
 g1YTtDFMNZlmhVFKgmyRQiYmedSUiLJJOj/gSCLF41mChCXp+E8nZwK7qmRbYDSCiWl7BpQ
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, James Hartley <james.hartley@sondrel.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 12/12] MIPS: DTS: img: Fix schema warnings
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
