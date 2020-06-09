Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DB1F3C55
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 15:27:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6D16C36B21;
	Tue,  9 Jun 2020 13:27:06 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2BC3C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:27:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e9so10285272pgo.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kSIhf0lGTJhWcv+DccCkvFsMqMLpno9qIeBkBoJLMSQ=;
 b=miEUbzjcd4ryUuKvQRtvf6dPM1igWZ99p8Q6FEwRjbx4OnKVBKqoYcgFbYQa5F0CiQ
 rad6clrM7rHVgJjWaSGo+06n0jk3qugJoFhZ4uC0qWxdyIT7OsuLI2/YDruuF8Z4O1tE
 3XN5SBV4IyX/VaBuWAY0GE0AqxS6UYPKNE6P36cTd2+X9MqvjpDifrfLKMc7i/xQMqjI
 0Jpz/z0K3veRZWdMO4osYMwcAjH9FlU16JqTA5cQjsc0gOOqUvfPxAU2tZRhWde0L8Zi
 TU7lbJxux9j2OvqpbG0zJUIieSCW7zCWuGtwSDwgsR2FLhku1pZlyh+CPVWh2iayMnyj
 JFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kSIhf0lGTJhWcv+DccCkvFsMqMLpno9qIeBkBoJLMSQ=;
 b=cfJQ2mh1MlSGahlqGD1ap/moFmva0UdZXaqM7VWZGMBs0BqkmAb4ze2iIdmrgLLQsu
 gjbLsjQtDXzATN5GPq++x2W3jcNegPhMm4gr1ZZQTIv6SnQdDgEluJOJz0IjSklx6ZQQ
 XQ0g45o/J4aCl/VZwFGK4SmdiIFL393HawgLJyz+AzUwnbeVEb5kJEXqo7iI1600nZcD
 /WPIFKiU8CeqdgY8sfmNsjPvxRkfj2EjheEapfiu/FEQ0H1fL88iN0CMeQFbEFhnJJR/
 f+ajZbfdHzrHQ1w387zorDboLlfK6Y0WZVVdPmelvmUP+0QuhgS5tdCdN7KJFg5T/p2C
 vUNQ==
X-Gm-Message-State: AOAM530mVdrpXQkcggAd4y3jHDg2XHQ2SSykbQwErGyIXrCihaHivrKh
 g1mWiXdgrIGAu4J5a49SbPE=
X-Google-Smtp-Source: ABdhPJygotx9ln59z0STkYKtMU1xO9pxH7iXYS1GxlB8u1JiD2/tkQhL5M40gjWnv1oxbN80JE9mRA==
X-Received: by 2002:a63:a36e:: with SMTP id v46mr23872632pgn.378.1591709222448; 
 Tue, 09 Jun 2020 06:27:02 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:27:02 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
 philippe.schenker@toradex.com
Date: Tue,  9 Jun 2020 21:26:43 +0800
Message-Id: <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz
	data timeout issue
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

as stm32f429's internal flash is 2Mbytes and compiled kernel
image bigger than 2Mbytes, so we have to load kernel image
to sdram on stm32f429-disco board which has 8Mbytes sdram space.

based on above context, as you knows kernel running on external
sdram is more slower than internal flash. besides, we need read 4
bytes to get touch screen xyz(x, y, pressure) coordinate data in
stmpe811 interrupt.

so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
in xip mode, have to adjust 'STOP/START bit set position' from last
two bytes to last one bytes. else, will get i2c timeout in reading
touch screen coordinate.

to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
kernel or has mmu platform.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot

 drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index d6a69dfcac3f..97cf42ae7fa0 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -93,6 +93,12 @@
 #define STM32F4_I2C_MAX_FREQ		46U
 #define HZ_TO_MHZ			1000000
 
+#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
+#define IIC_LAST_BYTE_POS 1
+#else
+#define IIC_LAST_BYTE_POS 2
+#endif
+
 /**
  * struct stm32f4_i2c_msg - client specific data
  * @addr: 8-bit slave addr, including r/w bit
@@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 	int i;
 
 	switch (msg->count) {
-	case 2:
+	case IIC_LAST_BYTE_POS:
 		/*
 		 * In order to correctly send the Stop or Repeated Start
 		 * condition on the I2C bus, the STOP/START bit has to be set
@@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 		else
 			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 
-		for (i = 2; i > 0; i--)
+		for (i = IIC_LAST_BYTE_POS; i > 0; i--)
 			stm32f4_i2c_read_msg(i2c_dev);
 
 		reg = i2c_dev->base + STM32F4_I2C_CR2;
@@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 		complete(&i2c_dev->complete);
 		break;
-	case 3:
+	case (IIC_LAST_BYTE_POS+1):
 		/*
 		 * In order to correctly generate the NACK pulse after the last
 		 * received data byte, we have to enable NACK before reading N-2
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
