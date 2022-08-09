Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6359538D
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Aug 2022 09:17:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92ACCC640F2;
	Tue, 16 Aug 2022 07:17:07 +0000 (UTC)
Received: from mail.nfschina.com (unknown [124.16.136.209])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B9E0C04000
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 08:41:12 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id C4FF01E80CD2;
 Tue,  9 Aug 2022 16:39:25 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOF1J5ecP-AZ; Tue,  9 Aug 2022 16:39:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
 (Authenticated sender: lvqian@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 425EB1E80CC5;
 Tue,  9 Aug 2022 16:39:23 +0800 (CST)
From: Lv qian <lvqian@nfschina.com>
To: daniel.lezcano@linaro.org, tglx@linutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Tue,  9 Aug 2022 16:41:05 +0800
Message-Id: <20220809084105.3891-1-lvqian@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:17:07 +0000
Cc: Lv qian <lvqian@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] clocksource/timer-stm32: Remove unnecessary
	(void*) conversions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

	Remove unnecessary (void*) conversions

Signed-off-by: Lv qian <lvqian@nfschina.com>
---
 drivers/clocksource/timer-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index c9a753f96ba1..3a8bb07469a8 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -161,7 +161,7 @@ static int stm32_clock_event_set_oneshot(struct clock_event_device *clkevt)
 
 static irqreturn_t stm32_clock_event_handler(int irq, void *dev_id)
 {
-	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *clkevt = dev_id;
 	struct timer_of *to = to_timer_of(clkevt);
 
 	writel_relaxed(0, timer_of_base(to) + TIM_SR);
-- 
2.18.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
