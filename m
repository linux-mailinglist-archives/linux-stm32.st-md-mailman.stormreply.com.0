Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F24261C83C8
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:47:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA63C3F92E;
	Thu,  7 May 2020 07:47:55 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9663BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:47:54 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d22so2486234pgk.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q5Ur7h/8oNS0E2jiQqG3CicZ1bVNQn1Ydx7PFOHfa0s=;
 b=nNK4mY30ZNBYGbfOU+9i5o2jliUC1LdhvxIJ2ZO87SudcPGAnnFGXbZTMsiXEhwf7m
 Jxa73CekYqgCYnngBhiH1dCEkQZx5geSyKkBb4tD3ed0mreP1TbtJF6I7utnMGZuxlJv
 UODBWl6EmEvGefGxcmQyFBCQHVuBAYlKkj8VIut7+kLcEFiUF9992hEEULeLWFjr8smb
 6fTBJ/6SdubUjWLX2TdgTQd6rFTb7xmuk6po5xbC9TphHS4l5Wu+/tjRoN7j98f/G8n4
 XX7RU/9p/ZlZQR8NDpC6S+VulMYfNZti2D9v2v+LZAwczBAjrT0ZAigxbfSzHUbTgaya
 g8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q5Ur7h/8oNS0E2jiQqG3CicZ1bVNQn1Ydx7PFOHfa0s=;
 b=HiC9CvF86rAoojGTeyxREDs/gSVu6+rc0lPmT82ydMAxJIRAqPIzTO8iW14PryxAd3
 ryV08Fg+sKUc1BnI30Zrnsl5sGhsaCucQUCnEHzQWywBPHnSVfK2TgFdPpopz13Vk/nQ
 2zVkpwh5Z7ywg0QC6ZWZwBbjUWpNpTLyMaBiDrocZis2+Yng6aYCEOPUvz6nOct2bDP+
 hxv+EZ1uFGxEbeqGG/H2Sxg3P+DFv8o6dVh+65vsmBNxS3p9CpzT/EmAYDzXSBve8NT/
 bGzvuiyavOOeM2omXXPmY7vSKO9RPbLLQXzdkzQJBNFEkZ+lRlfBUO2dSmeb/M6JRPr7
 LDDQ==
X-Gm-Message-State: AGi0PuZpNaCtWcgfecRo3vFK2gRXhO5jjGWSU/JL1O8roptB7SRZjvSK
 VYv6EKtCTk7D0lNEF1hTFQs=
X-Google-Smtp-Source: APiQypK4+BjtFPLf7XUZYBks21yWMjx7sY/apqXRD4CHcybnZTffrS+tMmDbVXT+H0leMJa4udLt0A==
X-Received: by 2002:a63:41c2:: with SMTP id
 o185mr10336106pga.139.1588837673184; 
 Thu, 07 May 2020 00:47:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id w192sm1146271pff.126.2020.05.07.00.47.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:47:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 15:47:49 +0800
Message-Id: <1588837669-14362-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/4] i2c: stm32f4: Fix stmpe811 get xyz data
	timeout issue
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

As stm32f429's internal flash is 2Mbytes and compiled kernel
image bigger than 2Mbytes, so we have to load kernel image
to sdram on stm32f429-disco board which has 8Mbytes sdram space.

based on above context, as you knows kernel running on external
sdram is more slower than internal flash. besides, we need read 4
bytes to get touch screen xyz(x, y, pressure) coordinate data in
stmpe811 interrupt.

so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
in xip mode, have to adjust 'STOP/START bit set time' from last two
bytes to last one bytes. else, will get i2c timeout in reading
touch screen coordinate.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index d6a69df..83004f2 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -439,7 +439,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 	int i;
 
 	switch (msg->count) {
-	case 2:
+	case 1:
 		/*
 		 * In order to correctly send the Stop or Repeated Start
 		 * condition on the I2C bus, the STOP/START bit has to be set
@@ -454,7 +454,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 		else
 			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 
-		for (i = 2; i > 0; i--)
+		for (i = 1; i > 0; i--)
 			stm32f4_i2c_read_msg(i2c_dev);
 
 		reg = i2c_dev->base + STM32F4_I2C_CR2;
@@ -463,7 +463,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 		complete(&i2c_dev->complete);
 		break;
-	case 3:
+	case 2:
 		/*
 		 * In order to correctly generate the NACK pulse after the last
 		 * received data byte, we have to enable NACK before reading N-2
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
