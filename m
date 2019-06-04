Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237857E86
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A75FC57B64
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from smtp-good-out-2.t-2.net (smtp-good-out-2.t-2.net
 [84.255.208.44])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86003C57DFD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 16:15:30 +0000 (UTC)
Received: from smtp-2.t-2.si (smtp-2.t-2.si [IPv6:2a01:260:1:4::1f])
 by smtp-good-out-2.t-2.net (Postfix) with ESMTP id 45JH8K75cCzZC9;
 Tue,  4 Jun 2019 18:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-2.net;
 s=smtp-out-2; t=1559664930;
 bh=Nm0CTY9O9Jph9TjFeOTe73ck/7qXqL8hFmMf283KJ4Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=opCDLjuLS51OPR3oIklcGovEgUBHiRmMSNHg38Aacg6q2bxv9U+uCKPRv9+kSaPhh
 QAUf4mwhn3C1WNJ2lxzKodcYA26ZLlUAD2+WjuaBAGXsjy3auN7t6lCFjxLmS/eIrk
 ftutAhUXES57MzBc+xndD4ElCZ6bAeAYn8gBfnrA=
Received: from localhost (localhost [127.0.0.1])
 by smtp-2.t-2.si (Postfix) with ESMTP id 45JH8K6rmFzMs33d;
 Tue,  4 Jun 2019 18:15:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at t-2.si
Received: from smtp-2.t-2.si ([127.0.0.1])
 by localhost (smtp-2.t-2.si [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRqyCHxikLg0; Tue,  4 Jun 2019 18:15:29 +0200 (CEST)
Received: from localhost.localdomain (unknown [89.212.35.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: borut_seljak@t-2.net)
 by smtp-2.t-2.si (Postfix) with ESMTPSA;
 Tue,  4 Jun 2019 18:15:03 +0200 (CEST)
From: Borut Seljak <borut.seljak@t-2.net>
To: borut.seljak@t-2.net
Date: Tue,  4 Jun 2019 18:14:44 +0200
Message-Id: <20190604161444.8819-1-borut.seljak@t-2.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604095452.6360-1-borut.seljak@t-2.net>
References: <20190604095452.6360-1-borut.seljak@t-2.net>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] serial: stm32: fix a recursive locking in
	stm32_config_rs485
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

Remove spin_lock_irqsave in stm32_config_rs485, it cause recursive locking.
Already locked in uart_set_rs485_config.

fixes: 1bcda09d291081 ("serial: stm32: add support for RS485 hardware control mode")

Signed-off-by: Borut Seljak <borut.seljak@t-2.net>
---
 drivers/tty/serial/stm32-usart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index e8d7a7bb4339..da373a465f51 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -107,7 +107,6 @@ static int stm32_config_rs485(struct uart_port *port,
 	bool over8;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
 	stm32_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 
 	port->rs485 = *rs485conf;
@@ -147,7 +146,6 @@ static int stm32_config_rs485(struct uart_port *port,
 	}
 
 	stm32_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
-	spin_unlock_irqrestore(&port->lock, flags);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
