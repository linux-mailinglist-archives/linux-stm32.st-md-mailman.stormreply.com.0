Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD335B984
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 06:34:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9743EC57B6F;
	Mon, 12 Apr 2021 04:34:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A2C7C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 04:34:28 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i190so8367749pfc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Apr 2021 21:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=K4FzIBSzTsQ26tiQe4PAL44Y27//vbAmCEDS6LTwbEM=;
 b=DgBvVHftT42xTT0vc6hT9qUxbNBbvXuy/qYZYanVEzW5vP2DYbBKl5L2SB/sWFGveQ
 KdGhyuY+fVTMgL/mi6ZA1z6XEFH5rpiOSPJCwmCPJvCCaazANz7hfPN9j4jjYTLtStMP
 lK37lB6hjgeIyFvcS8vuqDpj0gCMks6fdZcS/E6kGqxdUOsrkRIcVxIJj+UzJVyQwr34
 dHGI9bohVJwepdoQIKA7m3vLiCuzSqtihSDBau9BueMbZC/p+U8yUUI/wWVh2NrJx1Mv
 1t8eYmIcpt1ZgJRa/ncPIqNPBWqYrwvrzZVpO5HwZT4hyOueX3EYiaajuVdyYSkb5sIj
 ZMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K4FzIBSzTsQ26tiQe4PAL44Y27//vbAmCEDS6LTwbEM=;
 b=DY9aduw1JnaD2PDT30Mff1RjJrHITww1uX4FBMcP3Svza1Coxpo7Gz+5o7sAdIjUbS
 fwmWKGoHYVtSEDOcvq5tUw/w8+IzakVOxnSGJFB5o5dC6pZfau+QEyDKJCE9jiO/0ENl
 zsKLrST4SqispYIiz+mJfmHq89B7BzNjKo0RJ2nxIeuUtsNwuyo7q4csi6JKd67QjFF9
 1UtxMRhhJcbw9071KTMqJi/nzD8Ai+z4foges5/R6e+7jWzd5NFsrE2vkh7KTtJaJg0B
 UieCmsT/rXxBDXXvCPruU+Qzi5ziBsXFtAkRcZP6lT7A93Bf713dUIP8sEtRNKna+AlG
 jP8g==
X-Gm-Message-State: AOAM5330Zf2f5lTACT9NTwEmcUsSmEx2ceO45KalHh5RgbFgGLsheBIo
 lDMRPHJLRxU/Z6E1OMMIVRU=
X-Google-Smtp-Source: ABdhPJyC9TZOi5ElW12Bo8Vkj6uRwcHCKeSZXzF3Rubx1D6zPTP1D29tM+y7o5O0TK3VlvylLTYESQ==
X-Received: by 2002:a63:dd14:: with SMTP id t20mr24986189pgg.258.1618202067450; 
 Sun, 11 Apr 2021 21:34:27 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id o13sm9777411pgv.40.2021.04.11.21.34.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Apr 2021 21:34:26 -0700 (PDT)
From: dillon.minfei@gmail.com
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 12 Apr 2021 12:34:21 +0800
Message-Id: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-arm-kernel@lists.infradead.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] serial: stm32: optimize spin lock usage
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

To avoid potential deadlock in spin_lock usage, change to use
spin_lock_irqsave(), spin_unlock_irqrestore() in process(thread_fn) context.
spin_lock(), spin_unlock() under handler context.

remove unused local_irq_save/restore call.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
Was verified on stm32f469-disco board. need more test on stm32mp platform.

 drivers/tty/serial/stm32-usart.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index b3675cf25a69..c4c859b34367 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -214,7 +214,7 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
 	struct tty_port *tport = &port->state->port;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
-	unsigned long c;
+	unsigned long c, flags;
 	u32 sr;
 	char flag;
 
@@ -276,9 +276,17 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
 		uart_insert_char(port, sr, USART_SR_ORE, c, flag);
 	}
 
-	spin_unlock(&port->lock);
+	if (threaded)
+		spin_unlock_irqrestore(&port->lock, flags);
+	else
+		spin_unlock(&port->lock);
+
 	tty_flip_buffer_push(tport);
-	spin_lock(&port->lock);
+
+	if (threaded)
+		spin_lock_irqsave(&port->lock, flags);
+	else
+		spin_lock(&port->lock);
 }
 
 static void stm32_usart_tx_dma_complete(void *arg)
@@ -489,13 +497,14 @@ static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct stm32_port *stm32_port = to_stm32_port(port);
+	unsigned long flags;
 
-	spin_lock(&port->lock);
+	spin_lock_irqsave(&port->lock, flags);
 
 	if (stm32_port->rx_ch)
 		stm32_usart_receive_chars(port, true);
 
-	spin_unlock(&port->lock);
+	spin_unlock_irqrestore(&port->lock, flags);
 
 	return IRQ_HANDLED;
 }
@@ -1354,13 +1363,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
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
@@ -1374,8 +1382,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
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
