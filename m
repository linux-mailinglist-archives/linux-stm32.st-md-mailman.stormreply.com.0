Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383411DF1F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2019 09:09:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1231AC36B0E;
	Fri, 13 Dec 2019 08:09:28 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63067C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 00:09:26 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so356381pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2sVyEICGfKf72nEjPqSRaSmfvJt+VQfuvvM6oc7m9s=;
 b=MwyEdNtFfmjQZoB27Q0dIhnKa/eRsscBYXgN6mThQHZ0xuN2ZLNKi6ckLFpOQcPk+I
 NEzKUZY20I58iWtE45s2LmQvI8w3hNRVu//WpT5ZtNqDzUOxrG64HmkEASgMeCHQTYsF
 BERyiqKnSCv+Ntjq+29FADDKOnA7VRMDTnxpTxarc8+nLThS9SCFZDQDKEgOxRraWxtc
 mDUv5ABTRatRqAX5ufBfjct3CXHzkTHAAHIy1M6tlMHU59duHo5mn7JSUfcm8cmLplf2
 wmacPO5wGfnv2SXChdmY0aR2WF1f1/LIscRo2PIXHQtebaWsP6SCeTlACqAjfLxoowH2
 7pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2sVyEICGfKf72nEjPqSRaSmfvJt+VQfuvvM6oc7m9s=;
 b=uBV7SolzOZhGmnz+RLUUqvrzMIeSukFe8Uu2zzGEEkhhKA0iXO9vLqL9ulGOnsjSp4
 t+1T3SMLPLsnO27TtXr7oYtgzt1kRap2VaYSvaW1Gvm+XbX6MrtIB4kjlJx6pfmmiEbh
 SEVOYY7I2B00HMh5e7ZvvCcsCGwWexsBLYpXU4NwLsqoK3te4M1XDio7sZH21I+K0jMy
 yvcvmmiLosV/ksQ5ZhHV8KLKlzYcT7nI+s8MgK3Qk1io1Efs1fbANH6OyzM1hPYtVDS+
 AujilIpT3XJfS5JSIAYdz2D3ClFxl+Q1skcljprWQSZnSXXktdsrJidhoE3CleXbS7G1
 +H3w==
X-Gm-Message-State: APjAAAXI3bQexwvEacQW5/H0XEZcbSElUjmmaXTMK38+1QeimcwwGNLl
 tbcVDsBuGzeInwplpT0TgKOnDg==
X-Google-Smtp-Source: APXvYqyKleyWMddswHphitVEN0hVZKzYGZZEyMMWwvlQN495NyB0mhwoFp63U+7Ic280YNH9xNzNyQ==
X-Received: by 2002:a17:90a:e291:: with SMTP id
 d17mr13557645pjz.116.1576195764822; 
 Thu, 12 Dec 2019 16:09:24 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:09:23 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 13 Dec 2019 00:06:43 +0000
Message-Id: <20191213000657.931618-45-dima@arista.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
References: <20191213000657.931618-1-dima@arista.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:09:26 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Dmitry Safonov <dima@arista.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 44/58] tty/serial: Migrate stm32-usart to use
	has_sysrq
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

The SUPPORT_SYSRQ ifdeffery is not nice as:
- May create misunderstanding about sizeof(struct uart_port) between
  different objects
- Prevents moving functions from serial_core.h
- Reduces readability (well, it's ifdeffery - it's hard to follow)

In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
Initialise it in driver's probe and remove ifdeffery.

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/tty/serial/stm32-usart.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 2f72514d63ed..5e93e8d40f59 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -8,10 +8,6 @@
  * Inspired by st-asc.c from STMicroelectronics (c)
  */
 
-#if defined(CONFIG_SERIAL_STM32_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/delay.h>
@@ -926,6 +922,7 @@ static int stm32_init_port(struct stm32_port *stm32port,
 	port->ops	= &stm32_uart_ops;
 	port->dev	= &pdev->dev;
 	port->fifosize	= stm32port->info->cfg.fifosize;
+	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_STM32_CONSOLE);
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0)
-- 
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
