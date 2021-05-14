Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 154353807EA
	for <lists+linux-stm32@lfdr.de>; Fri, 14 May 2021 13:02:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6D3FC57B6F;
	Fri, 14 May 2021 11:02:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1086AC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:02:48 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id k5so5673266pjj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w2B2gYwn3MtKVjip2AWbrWG6iOvfQAn7f6GZqcZIKfs=;
 b=TgbI5fIWdbDixv8fZQJYly0iM+UMF4g0NP2bB7QvRKHOCtekFwFpdwqa2Smm0qieMR
 cQhkcuk6HrL9QzbMUwMKmQ/+iqX9qh8JtB3qI25fYIyVBCfZMjLjJev7LBwGYbLezRBA
 yqN5lgcHsnPgf+Yw7GP9KXRyjblIbqjopBrlYfvUl/XNB28FWqvU/JMeTYw2VEteBZBC
 CzMZrxWr/+sqkZ/SFR+u+tZoysRoNkJ1utyigrNwrPEQhj0Qgj7jycSJyyYgRkhzZhC6
 2Ccz9+PDCY2IRMJNn08L+sLmXJaPYq/2kPBLvSfgbJZp4LzCaorgzrdUE5QdqxnmrUYE
 okbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w2B2gYwn3MtKVjip2AWbrWG6iOvfQAn7f6GZqcZIKfs=;
 b=o2VGGKP0c2TTh/+hulDYWMT5uYAb5YQD21tjt/1oCBvkj3BUN/R/xX4NgDRqtcdYUo
 o39YezWmtoVw53gliTmQmvHf2Xc5n4HekBfi1b1Cs5DOvjCLTO8bEkFtdEFpbErpvs+h
 8NrVCaayDpTS4e4HzK6Z4lioWR54uYJY0kwAqpS+gegSV3SDxHJEkAr2BMqE07YAl8rS
 8q6ShhKT/nuaqQVkbMvA4G63uGWM+zU4mSH0zQeRgzQghqx2tY46gm/5Po1M7waSBPZy
 gu+FoJHuDmbs2O+FjoNcPuzwVuRhKvGA1rO+izHbMiekVQCCVp75mkR47bu/UvfHD1pw
 r2XA==
X-Gm-Message-State: AOAM530h2UmjZJ5w0iPBLWPFIJeHvBQpCzzqJ3c+eTxoz/IlkzExKlb6
 /uKBg0c2aUHwKWOUi3kUHkk=
X-Google-Smtp-Source: ABdhPJyKBOqrBQtdA21EkB22MKpeUJqnWyuTGt2+olXKI7Jp6Mm6RIl7J9Rgxmrr02pM//5pykqqyA==
X-Received: by 2002:a17:90a:b945:: with SMTP id
 f5mr52371098pjw.233.1620990166436; 
 Fri, 14 May 2021 04:02:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 May 2021 04:02:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, mturquette@baylibre.com
Date: Fri, 14 May 2021 19:02:30 +0800
Message-Id: <1620990152-19255-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/4] i2c: stm32f4: Fix stmpe811 get xyz data
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

From: Dillon Min <dillon.minfei@gmail.com>

As stm32f429's internal flash is 2Mbytes and compiled kernel
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

to not bring in side effect, introduce IIC_LAST_BYTE_POS to support xip
kernel or zImage.

Fixes: 62817fc8d282 ("i2c: stm32f4: add driver")
Link: https://lore.kernel.org/lkml/1591709203-12106-5-git-send-email-dillon.minfei@gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 4933fc8ce3fd..2e41231b9037 100644
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
