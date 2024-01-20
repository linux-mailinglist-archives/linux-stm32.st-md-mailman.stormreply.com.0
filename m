Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9A83358A
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jan 2024 18:36:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E3F9C6C838;
	Sat, 20 Jan 2024 17:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D4EC6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jan 2024 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Dr3AYoemxsJQsUNY4cGcaMUpSAy5oBZ9eLf/W+bCNgs=; b=e4pQPbmUeqhFgfYJRm0ZrXtsEV
 SUFnKtsvKE/LvTZfUfPLzDmQhUg+vbxg6TYUP76oRiaTm0zD4h6UV+I3zYwBjt9X/peWG7iOu2DvM
 O0rX2dGNNJy7W998OPDTMjqJcGheVHa/I08Ep3+Bk1sYV+8kJ1qJQNGAuptTOUBXW306T9K39o/eX
 Hp35p+buRMHCCIdCaCY/xJ+ay7bQnQUr9kHg5Ms7YqPS+s6dVvGT4RuJ8FvAAHIHFLj97trCYDjNp
 ioR6CJk4qGRcbXV7y2WiGzLm2i93QSCgJO5ANxlX5jjvh0jSPUdxgywpABTQ92xXru3i80P27AeIn
 2n/z6OzA==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rRFGS-008A15-20; Sat, 20 Jan 2024 17:36:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 20 Jan 2024 09:36:15 -0800
Message-ID: <20240120173615.14618-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] clocksource: stm32: fix all kernel-doc
	warnings
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
---
 drivers/clocksource/timer-stm32.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -73,7 +73,7 @@ static void stm32_timer_of_bits_set(stru
  * Accessor helper to get the number of bits in the timer-of private
  * structure.
  *
- * Returns an integer corresponding to the number of bits.
+ * Returns: an integer corresponding to the number of bits.
  */
 static int stm32_timer_of_bits_get(struct timer_of *to)
 {
@@ -177,7 +177,7 @@ static irqreturn_t stm32_clock_event_han
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
