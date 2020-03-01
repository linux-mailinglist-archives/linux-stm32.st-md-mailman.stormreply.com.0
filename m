Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E3174F9F
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Mar 2020 21:45:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D7E2C36B0B;
	Sun,  1 Mar 2020 20:45:35 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61466C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2020 20:45:32 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y1so3342813plp.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2020 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=rKTRr7gH/H3erxMOjX8RHhnD0WNXnZrb4KZ5NXj3rVs=;
 b=ED+21RTy6uFrUbhqFAJUvVt0+8PRGDmN4LkSicuW7WxsAJ1k5PUH9cHXRzHlzUhLRe
 UUryCb7SvyQ06BK3HRT6U4qc/rMWFHRxqAqQOoqXmW5gCKRQrqaqH2Se1t/uYts2G6wW
 wQJw4WF16qD0t7P7nJbTPak36k7X6Rj8KHH5saMV9X+4WBEysjSNGxPF28Vn6U61l+Py
 73M0xYa5eAUeOg+kJx4NgxnfVF8McUoG0nSZBghGgX1gH+60tZKM5aBihMesy01KEVs2
 OaXq69FKFk6wGGuxFHeTGZutUEmr6jIusGIjZpE33U8U/gTvvL/vxrPdbhsG7O/jTwu9
 yBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=rKTRr7gH/H3erxMOjX8RHhnD0WNXnZrb4KZ5NXj3rVs=;
 b=fmZxKvMpCmXwIiWM+oX8n6NdCuL5BnQSYAVns4E0y0vNP3YZAQoBt8lqFCzy1ZSpon
 yyxaFePYtf4WvAD7FYW2VxIuL9D3MLnvTyWg6SpkKriqDiI90jN/3BOMLkeNH+26N5lJ
 5k+W0LFbuEwJpxrJn71SpWGWRy3E2Xv7X5jnOv+kRrniuW6rVvwzwpRnSlZlGySO2Aqs
 V2/d3la5BuAwaTPcn/NjnJ941gHLC6/GAIxKur/nwfB0NolGIPlDeHqGVXppvJ5ZXjW2
 zRhrjkpafZ3UDFWcAiFvfFy9fMypONE9qj8zC6Urqvk9sjYLotTQcC9r7Z0SHRfImaJd
 gZOw==
X-Gm-Message-State: APjAAAWUkNKAuIz80J5H+GqghwqP7kM8/XwOr28LhFx3BE+etk4PJLJH
 8kYZKV8+T0v4nGRjjFy/wfw=
X-Google-Smtp-Source: APXvYqzTomvywQgBmsA0iDTcN1YhecACD1PW6HLIrDNCKUMpcYT/bZOHQr1NmKuRvn/iMLmXYazJ7A==
X-Received: by 2002:a17:902:ab95:: with SMTP id
 f21mr13470060plr.188.1583095530670; 
 Sun, 01 Mar 2020 12:45:30 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id h10sm18127494pfo.181.2020.03.01.12.45.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 12:45:30 -0800 (PST)
Date: Mon, 2 Mar 2020 02:15:21 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Barry Song <baohua@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Joe Perches <joe@perches.com>
Message-ID: <20200301204517.GA10368@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] tty: serial: Use the correct style for SPDX
 License Identifier
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

This patch corrects the SPDX License Identifier style in
header files related to tty serial drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/tty/serial/8250/8250.h         | 2 +-
 drivers/tty/serial/8250/8250_dwlib.h   | 2 +-
 drivers/tty/serial/atmel_serial.h      | 2 +-
 drivers/tty/serial/cpm_uart/cpm_uart.h | 2 +-
 drivers/tty/serial/icom.h              | 2 +-
 drivers/tty/serial/ifx6x60.h           | 2 +-
 drivers/tty/serial/jsm/jsm.h           | 2 +-
 drivers/tty/serial/pic32_uart.h        | 2 +-
 drivers/tty/serial/serial_mctrl_gpio.h | 2 +-
 drivers/tty/serial/sirfsoc_uart.h      | 2 +-
 drivers/tty/serial/stm32-usart.h       | 2 +-
 drivers/tty/serial/timbuart.h          | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 33ad9d6de532..32881e21b0c8 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  *  Driver for 8250/16550-type serial ports
  *
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 87a4db2a8aba..9a12953832d3 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /* Synopsys DesignWare 8250 library header file. */
 
 #include <linux/types.h>
diff --git a/drivers/tty/serial/atmel_serial.h b/drivers/tty/serial/atmel_serial.h
index d811d4f2d0c0..0d8a0f9cc5c3 100644
--- a/drivers/tty/serial/atmel_serial.h
+++ b/drivers/tty/serial/atmel_serial.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * include/linux/atmel_serial.h
  *
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
index 9f175a92fb5d..0de77c18c475 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart.h
+++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *  Driver for CPM (SCC/SMC) serial ports
  *
diff --git a/drivers/tty/serial/icom.h b/drivers/tty/serial/icom.h
index 8a77e739b333..26e3aa7b01e2 100644
--- a/drivers/tty/serial/icom.h
+++ b/drivers/tty/serial/icom.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * icom.h
  *
diff --git a/drivers/tty/serial/ifx6x60.h b/drivers/tty/serial/ifx6x60.h
index c5a2514212ff..cacca5be7390 100644
--- a/drivers/tty/serial/ifx6x60.h
+++ b/drivers/tty/serial/ifx6x60.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /****************************************************************************
  *
  * Driver for the IFX spi modem.
diff --git a/drivers/tty/serial/jsm/jsm.h b/drivers/tty/serial/jsm/jsm.h
index 7a128aaa3a66..8489c07f4cd5 100644
--- a/drivers/tty/serial/jsm/jsm.h
+++ b/drivers/tty/serial/jsm/jsm.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /************************************************************************
  * Copyright 2003 Digi International (www.digi.com)
  *
diff --git a/drivers/tty/serial/pic32_uart.h b/drivers/tty/serial/pic32_uart.h
index 2f2b56927dc6..b15639cc336b 100644
--- a/drivers/tty/serial/pic32_uart.h
+++ b/drivers/tty/serial/pic32_uart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * PIC32 Integrated Serial Driver.
  *
diff --git a/drivers/tty/serial/serial_mctrl_gpio.h b/drivers/tty/serial/serial_mctrl_gpio.h
index 1b2ff503b2c2..b134a0ffc894 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.h
+++ b/drivers/tty/serial/serial_mctrl_gpio.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Helpers for controlling modem lines via GPIO
  *
diff --git a/drivers/tty/serial/sirfsoc_uart.h b/drivers/tty/serial/sirfsoc_uart.h
index 637b09d3fe79..fb88ac565227 100644
--- a/drivers/tty/serial/sirfsoc_uart.h
+++ b/drivers/tty/serial/sirfsoc_uart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Drivers for CSR SiRFprimaII onboard UARTs.
  *
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index a175c1094dc8..db8bf0d4982d 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) Maxime Coquelin 2015
  * Copyright (C) STMicroelectronics SA 2017
diff --git a/drivers/tty/serial/timbuart.h b/drivers/tty/serial/timbuart.h
index fb00b172117d..007e59af636d 100644
--- a/drivers/tty/serial/timbuart.h
+++ b/drivers/tty/serial/timbuart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * timbuart.c timberdale FPGA GPIO driver
  * Copyright (c) 2009 Intel Corporation
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
