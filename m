Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CA57E8A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F3C9C57B7A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from smtp-good-out-2.t-2.net (smtp-good-out-2.t-2.net
 [84.255.208.44])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69E4FC5DE9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2019 10:54:26 +0000 (UTC)
Received: from smtp-2.t-2.si (smtp-2.t-2.si [84.255.208.31])
 by smtp-good-out-2.t-2.net (Postfix) with ESMTP id 45KztT5kt0z1Zxh;
 Fri,  7 Jun 2019 12:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-2.net;
 s=smtp-out-2; t=1559904865;
 bh=fUk0XkUlQdzlALymuAqAwf9BsyOqku2ixV/KDFYYH2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CkpiVnTHhILcYNM8bLBTKukUMr6kDo6yCevSCHEzZo+skyMw1dXe2t7wZ0xyJkmZf
 leNWDKjtyy3aXHGMlcCxffa/wBktUV7h9BXMT/+Fyn7QGSOPoWtR1Js0T8t5RrJBFS
 bYU6/pa844MSuSvUNrgeKnle4sJu74slghAmVIh8=
Received: from localhost (localhost [127.0.0.1])
 by smtp-2.t-2.si (Postfix) with ESMTP id 45KztT5X2tzMsJG1;
 Fri,  7 Jun 2019 12:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at t-2.si
Received: from smtp-2.t-2.si ([127.0.0.1])
 by localhost (smtp-2.t-2.si [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9GBfN1ATuF1; Fri,  7 Jun 2019 12:54:25 +0200 (CEST)
Received: from localhost.localdomain (unknown [89.212.35.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: borut_seljak@t-2.net)
 by smtp-2.t-2.si (Postfix) with ESMTPSA;
 Fri,  7 Jun 2019 12:53:56 +0200 (CEST)
From: Borut Seljak <borut.seljak@t-2.net>
To: erwan.leray@st.com
Date: Fri,  7 Jun 2019 12:53:06 +0200
Message-Id: <20190607105307.31053-1-borut.seljak@t-2.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <e0f8d4b2-a622-3758-473b-b78bd8949323@st.com>
References: <e0f8d4b2-a622-3758-473b-b78bd8949323@st.com>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4] serial: stm32: fix a recursive locking in
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

Fixes: 1bcda09d291081 ("serial: stm32: add support for RS485 hardware control mode")

Signed-off-by: Borut Seljak <borut.seljak@t-2.net>
---
 drivers/tty/serial/stm32-usart.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index e8d7a7bb4339..5d072ec61071 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -105,9 +105,7 @@ static int stm32_config_rs485(struct uart_port *port,
 	struct stm32_usart_config *cfg = &stm32_port->info->cfg;
 	u32 usartdiv, baud, cr1, cr3;
 	bool over8;
-	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
 	stm32_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 
 	port->rs485 = *rs485conf;
@@ -147,7 +145,6 @@ static int stm32_config_rs485(struct uart_port *port,
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
