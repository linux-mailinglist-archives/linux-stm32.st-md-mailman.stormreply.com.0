Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475B27F953
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 08:11:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AA50C424BD;
	Thu,  1 Oct 2020 06:11:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B6D8C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:47:46 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtO06-1khDwh18e6-00utdP; Thu, 01 Oct 2020 01:47:41 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlox-0007Zd-0j; Thu, 01 Oct 2020 01:47:39 +0200
Received: (nullmailer pid 7778 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:38 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Date: Thu,  1 Oct 2020 01:46:34 +0200
Message-Id: <20200930234637.7573-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:kNQzKotdRff+jmTK4enfW2P8VC+lN5Mm6sK3dTcCWyI7KqF5K0w
 hs9y5hvIdZxbvwjGV6d1MbjwF+93wWztobk2nTO8bv4NKOk4hYWJzlm7+DToWFTqnOe+mK2
 bMDeUKjAMcccYMA6iDl3Pt9XXvtPQp57BkpOH8Ls3rFw2QjTLF+FnfU+Bqyjox9GG0VbD2f
 VwLnWtvbe25tfrYuE59KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbIVF+xv/VE=:Uz+vC7sq3WUaBiE4lhNcJj
 XwQJ7oHB2rlKtXrmOi4tlJ7hNuFYngnRC3TcDhVMUZZY/YJbHyhMnyR97klNea19PuQDQ4PAT
 HcW6hE6/JqViZM3GvQH/TCJADKdACqyekIbabzFUJir55DytD7v3vQaWBOTBEVNugVDjptxGQ
 eHF1+M8C3h6pZ47Dq8bThNyhotzI0PxPkCXS/7EM3yfT0yzhiLK+0GNJukaE2rAKkGCjMec/c
 0mvyopgCZlaSrnyZa7w0Eg3+1jVr9Yk3QQbI/RlngGQAvAXGhKpbKxHDXet4cmF5t+IaWk7Rj
 22d8aMSIFlQg2ESPrKYwI7p3VI4I7xnU6wDZ3WXkC4HlC4xoONey6XXDG7b86vYgys2iZFzzo
 +Qs3SknH4RmXhIiUwqtvBRdMwXlvjld6TOgkIPVhkoyB3TySHNwUrEXuMPQ1ec7sBWKtVr/yo
 I73Jpk2S5V9fJhN5PKPtklzlMbjvxlPl+wX5lq543st5Bkfa7H1YjL4yLDdvrHQndqZcp0d7D
 qXoVsq+fJlBQIUcJEnEj2+JF1RLI9uooYf3/FNrlQuMQXgUxC/EqGYUoE6VgvOrZBctfLYeO8
 T8jDFI2KphUWZdAGb1toGoycOaMbmbE12pR1145ibXYBInCVw+/uXZDNQKJ6izVqVQV7aB5bz
 WR5QGq+gnDtHt9znqX8/puUZvN5BRG55kRynLEqIBR5Ju/2vFGmi8Ax1t7vL/SlrYC1uvFU9K
 MJrN5ngcABLcteXK5E8NDMhkDj3H+N1L54+IhT4uD1IpSMDXiZ/1z0uO3XJ8DoyydAYRQU5I+
 N9iXWIIMT3DZD/4tzrRnAEtDxkBZRoqbbfgGkJvehDi89Jz5A9pr3uBfY/FYRioJZNNOPi0
X-Mailman-Approved-At: Thu, 01 Oct 2020 06:11:08 +0000
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [Linux-stm32] [PATCH v6 4/7] ARM: dts: at91: smartkiz: Reference
	led node directly
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

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-smartkiz.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
index 106f23ba4a3b..b76a6b5ac464 100644
--- a/arch/arm/boot/dts/at91-smartkiz.dts
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -84,10 +84,8 @@
 	status = "okay";
 };
 
-&leds {
-	blue {
-		status = "okay";
-	};
+&led_blue {
+	status = "okay";
 };
 
 &adc0 {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
