Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDBC35C186
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 11:31:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0AF3C57B6F;
	Mon, 12 Apr 2021 09:31:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07BA8C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 09:31:45 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t22so8949648pgu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hnbI4HTxy5h+9wDfXPCcQHa6zzBSTTZbMcq2PaN8c1I=;
 b=HtwrWWFDbFwS9xUN3hU5q5cxt7V3HjRLojvzWMaJ/+Q7zxE0hWxz4n1PDmChYQ/EMq
 Ak3U1MP/lV0CYn9AmEqHZz+ifgkH6I6+/QmhECchXang6IFWQAEHW9A6hD7hagYiMEz4
 H/kK3/agJLcFRlFvNxuYtb9f/xIjVG1zuPoLQ4rMOmw4QWNCSu6I3BWtAO9Dlj8WKL6i
 Co3WFHvM9aygZHnLFYSrk0+EqAdDReQa210+u9fTjB4qfHYT1hB6rb5M7LqBjuj7O1oH
 ZYfP6CC3uCwx2zqZFM5zEWg3FfKqKfRehj1eQNcK8hf4ymWvRwSMr9xzt6ulIU9gqIuD
 seSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hnbI4HTxy5h+9wDfXPCcQHa6zzBSTTZbMcq2PaN8c1I=;
 b=DklOBxWLvDqODeo5Tza+KM5JNBAlu6FV2iLb0mIWNmT+K7q1Ksc4cmpzkNsPTty+Ue
 3sUOi5qVWvdmJx9bbNfWANMnjs6Rejln19XBO/KEm5Ce1hkdL5pGXkFK7d9OM3YtQ2Xc
 rE4OekSG4JLrAtFoDnvkXVUZ5Tri4mbmYPSQwdzG9elYYxJ3MQsRAOzcxsLeW0uhfYvH
 JMbWRlgN2jfDzgsEeN0V1CUllAM/qvec7BJdt+eFfNZJDy1z6uSYb2a1up8d1lBL4SSj
 RgJhAI644Yu2HBMc2Od+hDuBHATi2dkkrMFQW8TqUYCrtvZJ7O2DWdgZ1XkwOYGhG7DM
 c4Tg==
X-Gm-Message-State: AOAM531i94dI1P6e+ojF4GpJOWHAu3EQJpQD4UwcF7Sh5AaD5MeUuIVG
 8gdemnAWWpUOPBdWt4XyEcc=
X-Google-Smtp-Source: ABdhPJwrTzAtgMMxUCRMcseHM+9n719hVrbqnEqDcTiqRlECpevvVYQUFcWEy8URy2tQJXlZxa0hxg==
X-Received: by 2002:a65:68d9:: with SMTP id k25mr9891189pgt.236.1618219904290; 
 Mon, 12 Apr 2021 02:31:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id r6sm10511879pgp.64.2021.04.12.02.31.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Apr 2021 02:31:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, lkp@intel.com
Date: Mon, 12 Apr 2021 17:31:38 +0800
Message-Id: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-serial@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

From: dillon min <dillon.minfei@gmail.com>

To avoid potential deadlock in spin_lock usage, use spin_lock_irqsave,
spin_trylock_irqsave(), spin_unlock_irqrestore() in process context.

remove unused local_irq_save/restore call.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>
Cc: Erwan Le Ray <erwan.leray@foss.st.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v2: remove unused code from stm32_usart_threaded_interrupt() according from
    Greg's review.

 drivers/tty/serial/stm32-usart.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index b3675cf25a69..b1ba5e36e36e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1354,13 +1354,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
 	u32 old_cr1, new_cr1;
 	int locked = 1;
 
-	local_irq_save(flags);
 	if (port->sysrq)
 		locked = 0;
 	else if (oops_in_progress)
-		locked = spin_trylock(&port->lock);
+		locked = spin_trylock_irqsave(&port->lock, flags);
 	else
-		spin_lock(&port->lock);
+		spin_lock_irqsave(&port->lock, flags);
 
 	/* Save and disable interrupts, enable the transmitter */
 	old_cr1 = readl_relaxed(port->membase + ofs->cr1);
@@ -1374,8 +1373,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
 	writel_relaxed(old_cr1, port->membase + ofs->cr1);
 
 	if (locked)
-		spin_unlock(&port->lock);
-	local_irq_restore(flags);
+		spin_unlock_irqrestore(&port->lock, flags);
 }
 
 static int stm32_usart_console_setup(struct console *co, char *options)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
