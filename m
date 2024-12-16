Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A99F33B8
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 15:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648E3C7129D;
	Mon, 16 Dec 2024 14:54:19 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DBEFC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 14:54:12 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7b6fc3e9e4aso287420985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1734360851; x=1734965651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xrDI54RrtTH587z61yGqvhuIg5ioNpJ5JcTwNcL7S14=;
 b=ohtZ9nQvam/qjzSgWXL+UqXcAJuZzB4tHhBo6njvxPKWJTTJER092jHYto2+BX2eoQ
 LIyyJjG7BdIp7s2G5did9I+8y+uDChhZgZN456HjitJF76p+/eU4jmxHTScf3jl1EJ+N
 eJPrrRBpNGRvY5H3GtHzIHdLqWd0dEtsSsbZdhSyTawrP/pG15YXHO0LdspK2iW2LiyR
 OVD58WzOSXqqKzx2RfMgqSSUlbAxY9RszmuVcqqjqOkaaWqjNyOAWavEF60OH8JDHIT/
 gHqWKuZ8UqG2JIejoQ61tuYj6YdLRj8d5q1HPaXu+yZ+vC1ckkcUIzDVkYD0PJLDsvtW
 kWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734360851; x=1734965651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xrDI54RrtTH587z61yGqvhuIg5ioNpJ5JcTwNcL7S14=;
 b=EmnGzWEYy8dv6EK97JqU3jrmuw6+zw1KIsNpnrkJfg3gQf8tui/+3sPe6aw197yVN+
 qwbGC9q4T6BMdZMAeM1qH8h2fh4dA6HbM8Zd169SmyS2UddnIUPQdko0zvyPt7/vBwjm
 kU0ZgcveHuoOQeP6ZhhBi3kJNxXfa5ueNmz9D0z9tkRvp4HXk4KMABkOE5yvOLPwz+CP
 BbsIsNKeG6qwhhvEDqaiV6LBI4bmkiS9XOzZSku9swbwo9N6sNnMiYR2MkYNADBs7DOn
 luswKsyrKXGxSH2vH0M0FKHqaTEfPLojTFsvi6J8UNoGYWmcn5XH9O95rGzvKzkOt2fq
 9MAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ8a4qnkWAQmT4OcckAvndJ1YcwuqUmxlQqpk5LzP16/0XzZhYNNzXN2UzUF+4v2X4CCnXpje0ySoWZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzV+7EwpeOpO1kRp9Ya16OlIE/FAo/i/W1NBGtFuZTRq3R+Iu9Y
 oKHVucBTl3Ke/mUyVb8wEG39izIyN9La2fdG03vJZAtKqY+0/QEHi6kJH8pao14=
X-Gm-Gg: ASbGncuXHiCT3tA+8qdtnzkwasRn86J+wpijxGGQZoo+LeQbOM8O/lO2GJXuBdo3WNK
 9mS8mgbqBXFtRW/D+jQggor+RqbscrWmAp4jYN4YTTcFSzsg08zKNrhy0MDBrwlo9Wu/0adegTM
 DHH5N6oBJrHFw5sYpTiJzB526IrFmPqJr34Hl6cVA/ZkPPheFrnrTqsdjvmlCx7aUdM0lVWAFnp
 XgGjTbMhfAatoLgt3oIY/mDu8Aqynv2dqPL0l8R3BmRGFer+feXp4wsVOoYrkHwo+vJbscskKMQ
X-Google-Smtp-Source: AGHT+IEejh93L0FZI+AsvKAjo6R6QN8N65ppACXanwMRaMhjPpRdaO8GmKLrZ1p3hnkSIvCPYIc0vQ==
X-Received: by 2002:a05:620a:4889:b0:7b6:d939:f958 with SMTP id
 af79cd13be357-7b6fbee8df9mr2384495685a.25.1734360851084; 
 Mon, 16 Dec 2024 06:54:11 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7047aa633sm230461085a.10.2024.12.16.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:54:10 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2024 09:53:23 -0500
Message-ID: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] serial: stm32: use port lock wrappers for
	break control
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

Commit 30e945861f3b ("serial: stm32: add support for break control")
added another usage of the port lock, but was merged on the same day as
c5d06662551c ("serial: stm32: Use port lock wrappers"), therefore the
latter did not update this usage to use the port lock wrappers.

Fixes: c5d06662551c ("serial: stm32: Use port lock wrappers")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/tty/serial/stm32-usart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 7dc254546075..1ec5d8c3aef8 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1051,14 +1051,14 @@ static void stm32_usart_break_ctl(struct uart_port *port, int break_state)
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	if (break_state)
 		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_SBKRQ);
 	else
 		stm32_usart_clr_bits(port, ofs->rqr, USART_RQR_SBKRQ);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int stm32_usart_startup(struct uart_port *port)
-- 
2.46.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
