Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72B87FDAB
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Mar 2024 13:37:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADFB4C6DD60;
	Tue, 19 Mar 2024 12:37:14 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5132C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Mar 2024 10:07:44 +0000 (UTC)
Date: Mon, 18 Mar 2024 10:07:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1710756464;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Md1VP8kiIpnNH9Nd9C6ilbLntoy7J6ypnrNQQAukM=;
 b=sOSBWNmNU0UYW5tIuBgx/OYUK+1InjbMd1Ycx4ahi/W2D6VIb6l1eQIHyX+UoYgsGmZIvh
 cnRYycR+MHIaM2mgaVzTIPu6OtjgKOIU2XXvZPYItAanU6DxigKLHUfNYwgnJ7jh9U2tux
 IllNSw+LgeM5lUHnxlcC6ErnBdq3aPnWPdaIoiRSu0kNIcJziDTIKL0UP1mgjcZlAYR6iL
 18VvJA1dXkTcfAebOToLOebFkaJMeSdI+8ucE2rZcQAJVLz84phZv7u6jqH+TlPomCde+s
 20oR2Ox2gZF2B+V2JPmEdQjgmC3FhGRab9K6spFlhTu7hE75EtKcir3rDoMPkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1710756464;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Md1VP8kiIpnNH9Nd9C6ilbLntoy7J6ypnrNQQAukM=;
 b=59tst1XKHmDS1GiygM0q2wj2bHfuxzSKZ1idg7qhOIUH8QG/RUXuhqPIzrrsI6Ygn7j92H
 HXspyszkvGSmvtDg==
From: "tip-bot2 for Randy Dunlap" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <20240120173615.14618-1-rdunlap@infradead.org>
References: <20240120173615.14618-1-rdunlap@infradead.org>
MIME-Version: 1.0
Message-ID: <171075646340.12214.5162192204726393181.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Mailman-Approved-At: Tue, 19 Mar 2024 12:37:13 +0000
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [tip: timers/core] clocksource/drivers/stm32: Fix all
	kernel-doc warnings
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     906fed29f4527e60db30d4eaa4b5b06a92447c69
Gitweb:        https://git.kernel.org/tip/906fed29f4527e60db30d4eaa4b5b06a92447c69
Author:        Randy Dunlap <rdunlap@infradead.org>
AuthorDate:    Sat, 20 Jan 2024 09:36:15 -08:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Mon, 22 Jan 2024 13:15:38 +01:00

clocksource/drivers/stm32: Fix all kernel-doc warnings

Add a "Returns:" section in one function description.
Use the correct function name in another function description.

These changes prevent 2 warnings:

timer-stm32.c:79: warning: No description found for return value of 'stm32_timer_of_bits_get'
timer-stm32.c:189: warning: expecting prototype for stm32_timer_width(). Prototype was for stm32_timer_set_width() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20240120173615.14618-1-rdunlap@infradead.org
---
 drivers/clocksource/timer-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index c9a753f..0a4ea32 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -73,7 +73,7 @@ static void stm32_timer_of_bits_set(struct timer_of *to, int bits)
  * Accessor helper to get the number of bits in the timer-of private
  * structure.
  *
- * Returns an integer corresponding to the number of bits.
+ * Returns: an integer corresponding to the number of bits.
  */
 static int stm32_timer_of_bits_get(struct timer_of *to)
 {
@@ -177,7 +177,7 @@ static irqreturn_t stm32_clock_event_handler(int irq, void *dev_id)
 }
 
 /**
- * stm32_timer_width - Sort out the timer width (32/16)
+ * stm32_timer_set_width - Sort out the timer width (32/16)
  * @to: a pointer to a timer-of structure
  *
  * Write the 32-bit max value and read/return the result. If the timer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
