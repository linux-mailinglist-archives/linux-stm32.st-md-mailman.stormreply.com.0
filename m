Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9AC361DC9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 12:10:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36EEAC57B78;
	Fri, 16 Apr 2021 10:10:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF109C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 10:10:52 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so10157322pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A/7hIeNkh74sMxQ2VoT+6Wb/XxhlYBDSbBqmEWtFsMs=;
 b=c79qb3AjMlo1Z8G/mAYAiOnq/4a7c+i4Jom/W81ehb6DnIfKOzIBQiUIq9mKKAMARo
 PBgsd5rq5IVVGzuy+V+5HUabNdELc1rtuVP90E+ITMmpLsPr068Gm2BwTtIawqmQmTjU
 3kGxB3pPrbDah9+K2vEpCT2zbIa6t37VjzbTyDflz0xamHlE3yIH4p56JjyKWMt6+ZHQ
 Sj038Cnp4xo42nLHZmmlscTOzj7i4VXMk/FMmGDRy5R6rcrkSzwN6EEJDya0bQTq0GjG
 jhKRIa2iimZW61QRHZ5y/TVUt3OugdR/nI/2MkOGBVk3AxNaedM3opJpguEh1Hbmwudg
 beog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A/7hIeNkh74sMxQ2VoT+6Wb/XxhlYBDSbBqmEWtFsMs=;
 b=KRR6149vd1XiWdCF7uwuWQl19BMP6hZGHhP/2QC2sl1d1XVlsAQXMje97E5Sm9lkg5
 VF0qeY9FP9DIeCvYzWwjU6Om4i84iG5JGqrInJPt0D2ATdZGA4Yh8ArLbof1fNzujqDj
 SsUQECaxrbWy4U8ZkmAN+qhkki5hiFc1lapsgUUuMS17cF/20b7RUduVYHX87VNcgkPS
 I7BEou995phU/zEFm8Xg8h3H1xehLfQA5X0nJZbMw+aZjnzyLTxeWPBanpLyR0ODkfnh
 jaJn2490ivh1bCiHozBMdvLN0msLj9O3NL3wA2yWFceoT3az+WVl61sl12i68i3VVbjJ
 N8Gw==
X-Gm-Message-State: AOAM533OlGubY/iuZrTD736O49kbTMpg/MrwypX3PlMNBgsGu4czsK4z
 hruFCXLtHYWd/l5iXixAAOE=
X-Google-Smtp-Source: ABdhPJyL6O0IvkWzDC0x4hnKmxrsWJIdNewo78CdAaYdxeGULaN/XIlJR3v96Xo95TfHQscGqhU7Qw==
X-Received: by 2002:a17:90b:4a46:: with SMTP id
 lb6mr9025629pjb.45.1618567851417; 
 Fri, 16 Apr 2021 03:10:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id t67sm4601440pfb.210.2021.04.16.03.10.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Apr 2021 03:10:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, lkp@intel.com,
 johan@kernel.org, gerald.baeza@foss.st.com, erwan.leray@foss.st.com
Date: Fri, 16 Apr 2021 18:10:41 +0800
Message-Id: <1618567841-18546-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-serial@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] serial: stm32: optimize spin lock usage
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

This patch aims to fix two potential bug:
- no lock to protect uart register in this case

  stm32_usart_threaded_interrupt()
     spin_lock(&port->lock);
     ...
     stm32_usart_receive_chars()
       uart_handle_sysrq_char();
       sysrq_function();
       printk();
         stm32_usart_console_write();
           locked = 0; //since port->sysrq is not zero,
                         no lock to protect forward register
                         access.

- if add spin_trylock_irqsave() to protect uart register for sysrq = 1 case,
  that might got recursive locking under UP.
  So, use uart_prepare_sysrq_char(), uart_unlock_and_check_sysrq()
  move sysrq handler position to irq/thread_d handler, just record
  sysrq_ch in stm32_usart_receive_chars() by uart_prepare_sysrq_char()
  delay the sysrq process to next interrupt handler.

  new flow:

  stm32_usart_threaded_interrupt()/stm32_usart_interrupt()
  spin_lock_irqsave(&port->lock);
  ...
  uart_unlock_and_check_sysrq();
     spin_unlock_irqrestore();
     handle_sysrq(sysrq_ch);
  stm32_usart_threaded_interrupt()//stm32_usart_interrupt() return

Cc: Johan Hovold <johan@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>
Cc: Erwan Le Ray <erwan.leray@foss.st.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v3: add uart_prepare_sysrq_char(), uart_unlock_and_check_sysrq() to move
    sysrq handler inside interrupt routinei to avoid recursive locking,
    according to Johan Hovold suggestion, thanks.

 drivers/tty/serial/stm32-usart.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index b3675cf25a69..981f50ec784e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -271,7 +271,7 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
 			}
 		}
 
-		if (uart_handle_sysrq_char(port, c))
+		if (uart_prepare_sysrq_char(port, c))
 			continue;
 		uart_insert_char(port, sr, USART_SR_ORE, c, flag);
 	}
@@ -457,9 +457,10 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	struct uart_port *port = ptr;
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+	unsigned long flags;
 	u32 sr;
 
-	spin_lock(&port->lock);
+	spin_lock_irqsave(&port->lock, flags);
 
 	sr = readl_relaxed(port->membase + ofs->isr);
 
@@ -477,7 +478,7 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
 	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch))
 		stm32_usart_transmit_chars(port);
 
-	spin_unlock(&port->lock);
+	uart_unlock_and_check_sysrq(port, flags);
 
 	if (stm32_port->rx_ch)
 		return IRQ_WAKE_THREAD;
@@ -489,13 +490,14 @@ static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct stm32_port *stm32_port = to_stm32_port(port);
+	unsigned long flags;
 
-	spin_lock(&port->lock);
+	spin_lock_irqsave(&port->lock, flags);
 
 	if (stm32_port->rx_ch)
 		stm32_usart_receive_chars(port, true);
 
-	spin_unlock(&port->lock);
+	uart_unlock_and_check_sysrq(port, flags);
 
 	return IRQ_HANDLED;
 }
@@ -1354,13 +1356,10 @@ static void stm32_usart_console_write(struct console *co, const char *s,
 	u32 old_cr1, new_cr1;
 	int locked = 1;
 
-	local_irq_save(flags);
-	if (port->sysrq)
-		locked = 0;
-	else if (oops_in_progress)
-		locked = spin_trylock(&port->lock);
+	if (oops_in_progress)
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
