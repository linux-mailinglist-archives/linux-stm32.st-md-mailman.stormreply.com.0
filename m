Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54157076F4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 02:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8470FC6B443;
	Thu, 18 May 2023 00:33:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E87FC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 00:33:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1F9C88619F;
 Thu, 18 May 2023 02:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684370001;
 bh=hxaBw3zLHq4nC0LiaZaAIEBAOvcgQ4XJh+parRnKWv4=;
 h=From:To:Cc:Subject:Date:From;
 b=ugvCku3SpM0TfGqNBHoBcjvayZvnC423+pGQIaq7/A3jcy/7TcxfkQGXFWbqvLSwL
 v6NdbkE8XEGXKwu4l5D11ywNUx0LJMez9qKtcmgZyJkMEaaM5OBTMh5kp9/sgB5BhP
 5UosV0L7yqZlJB/eyE7UYVP94HZN6k71num5APVcm3a44ZRE9kWtGncfR0rhvWZ8xg
 hT1Zo2E9F/XYi2rAu8nh4hiALAz9mWATTvkdepEQrWHIpgFGRRB8PhHlsYQ5wMqRi2
 IXRGxCip/rkrYE3DV9k8aVfTcX21yARzaKyrc9GWvVvLpQsRS0ZEbCjBgYr3jED1Zs
 fWaiN3oKJK87w==
From: Marek Vasut <marex@denx.de>
To: linux-rtc@vger.kernel.org
Date: Thu, 18 May 2023 02:33:11 +0200
Message-Id: <20230518003311.415018-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] rtc: stm32: Handle single EXTI IRQ as wake up
	source
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

The arch/arm/boot/dts/stm32mp151.dtsi specifies one interrupt for the
RTC node, while the expectation of the RTC driver is two interrupts on
STM32MP15xx SoC, one connected to GIC interrupt controller and another
one to EXTI. Per STM32MP15xx reference manual, the two interrupts serve
the same purpose, except the EXTI one can also wake the system up. The
EXTI driver already internally handles this GIC and EXTI duality and
maps the EXTI interrupt onto GIC during runtime, and only uses the EXTI
for wake up functionality.

Therefore, fix the driver such that if on STM32MP15xx there is only one
interrupt specified in the DT, use that interrupt as EXTI interrupt and
set it as wake up source.

This fixes the following warning in the kernel log on STM32MP15xx:
"
stm32_rtc 5c004000.rtc: error -ENXIO: IRQ index 1 not found
stm32_rtc 5c004000.rtc: alarm can't wake up the system: -6
"

This also fixes the system wake up via built-in RTC using e.g.:
$ rtcwake -s 5 -m mem

Fixes: b72252b6580c ("rtc: stm32: add stm32mp1 rtc support")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/rtc/rtc-stm32.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 229cb2847cc48..72994b9f95319 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -780,14 +780,15 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 
 	ret = device_init_wakeup(&pdev->dev, true);
 	if (rtc->data->has_wakeirq) {
-		rtc->wakeirq_alarm = platform_get_irq(pdev, 1);
+		rtc->wakeirq_alarm = platform_get_irq_optional(pdev, 1);
 		if (rtc->wakeirq_alarm > 0) {
 			ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
 							    rtc->wakeirq_alarm);
-		} else {
+		} else if (rtc->wakeirq_alarm == -EPROBE_DEFER) {
 			ret = rtc->wakeirq_alarm;
-			if (rtc->wakeirq_alarm == -EPROBE_DEFER)
-				goto err;
+			goto err;
+		} else {
+			ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
 		}
 	}
 	if (ret)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
