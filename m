Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 212928D7907
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9CF7C71292;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6083C7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:25:02 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b962c4bb6so1208443e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370701; x=1717975501;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r8Iq+3RgEig8Cx0iz/mpoUKg07pqVjSqpR5cr51J2sg=;
 b=HBB5Rgdns+FXkfqJi1MlRJ0kedGCI56ZLXEBKFWqu3OY7kx4fwQNAHYu4tP6CAeUPd
 x0l9lnv+DUFof6YYuqIwRYHSMOtdhJyy+9rSj3A+Lm73KCXC/556YGcWsqivWv6MwPLD
 drTLqcOOkZf9AZa42HCM6hDet+fOGVVs8DUxsi3C+NLJbSDUh06GYSsBtj7TWMHNBe9U
 20dzEuj9wTJNgpxS3IhqiOLGfNgZsXILAGBCcKxbjBL0aUMwHJD2NFY49BbYgJr7JeSS
 3IiXl4Wsp31RIob42Yni5HjXqazok3m78Lg5F5HJfcwF/xKZwHXGiFGiTQQp5AFU4Vj8
 Pbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370701; x=1717975501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8Iq+3RgEig8Cx0iz/mpoUKg07pqVjSqpR5cr51J2sg=;
 b=nfIId9gmRBf77iwt+htZIvgwX1J2Pwc5B4SpAHgf+fuJk/V+Y0eolWLju8maWaT/kF
 8nmPfL/MIgbWvacZ8VmDHbUQm1ltIrqGnnxbh+CNwIfd/5EMG3OHqWomIrOChI0w5QKq
 sXj9qz+LRJqqsfUcDGSzmfasbfV+NA9aMMlnVOwR77ENFfoKR3ql3lJMWygXdfX7KT1b
 YTdjztz5I7yXcRULcV1JHC9kFMo1zSoyQk0AHvbhV9iEI8CxQrvhGp/nxE0H/r/dvA9x
 MQHDJGkCM6fCIlyxQx3fU71XqJzULPj9Geu0k9RU/r2TtbKBkKmUWLYVIQI0U4PEAA+E
 kyUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgfMW1fTcs05uepgzR7O99EVB3mWY/MlERpIQbSzR/Dy8XOzZnxWbKMHJX3fBd4PQonjCM6+U362UO22kNb5ZsRlpgXy5CHKk0x5MJdPW1TYX/D4k1gt6r
X-Gm-Message-State: AOJu0YxGnk5DhEmxB6l/COwZcMQ0cdrzNwXZaSiaQq5VOW8r/aKzJAqc
 fv84+Bwc3tPwmvvQp5ln4W38SkFLX/UNeipk0bpU32XgNctJBv0tV58fYRUnUi4=
X-Google-Smtp-Source: AGHT+IERXsZJtbptbub4OPpmYt4izzdy6vVE3d9VwxncjVETVSXMGoMmwAAaAqx2FFQoGX/3InI1uA==
X-Received: by 2002:ac2:58e7:0:b0:52b:88ba:da88 with SMTP id
 2adb3069b0e04-52b8954ea17mr5935410e87.26.1717370701481; 
 Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:25:00 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-7-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qwhd20pcT6mKmuOmdJvReDADwvss13IfbnCS0P5O90U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9I9UoE+huJlSrwgEUi7zxKYLl7ib9SuXtkX
 fxqsDm1/vWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/SAAKCRCLPIo+Aiko
 1ZPnB/wJiXKUWKNGHNVrmNmaiYUeTXAzLFk/CckWZubxbjYiTn17Iv99ejxUhjRVFoYE2cwU8lE
 SxN7gerADf7/9A3HXwgOOU40QkmSFfc+FAo2sjoBUw8Nq7Lisst2c7LvRypbflv6wXu44KyYh+R
 cq4NC5KGZPlvD1io3PThZep4n5w7OrgFBl2deD0gg14CCl9W6NvMoYWarHh6jGN3G3t9Xez6JjP
 8iQ8r/aWZvXmBySF+7nS+Ohc6U0dC6AE4R3VSB8FCKMUUEACMEVU0mQlf4693IcOC0KvJRopr3x
 KVVbA1SK1EL9fbV1BpZSHlFPziFH+A+NPxqCFOlMsw/GUGwy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 7/7] usb: typec: ucsi: reorder operations
 in ucsi_run_command()
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

Streamline control stream of ucsi_run_command(). Reorder operations so
that there is only one call to ucsi_acknowledge(), making sure that all
complete commands are acknowledged. This also makes sure that the
command is acknowledged even if reading MESSAGE_IN data returns an
error.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4d36a04dc63b..4666dec005a6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -95,7 +95,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size, bool conn_ack)
 {
-	int ret;
+	int ret, err;
 
 	*cci = 0;
 
@@ -120,30 +120,24 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
-	if (*cci & UCSI_CCI_NOT_SUPPORTED) {
-		if (ucsi_acknowledge(ucsi, false) < 0)
-			dev_err(ucsi->dev,
-				"ACK of unsupported command failed\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (*cci & UCSI_CCI_ERROR) {
-		/* Acknowledge the command that failed */
-		ret = ucsi_acknowledge(ucsi, false);
-		return ret ? ret : -EIO;
-	}
+	if (*cci & UCSI_CCI_NOT_SUPPORTED)
+		err = -EOPNOTSUPP;
+	else if (*cci & UCSI_CCI_ERROR)
+		err = -EIO;
+	else
+		err = 0;
 
-	if (data) {
-		ret = ucsi->ops->read_message_in(ucsi, data, size);
-		if (ret)
-			return ret;
-	}
+	if (!err && data && UCSI_CCI_LENGTH(*cci))
+		err = ucsi->ops->read_message_in(ucsi, data, size);
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
+	/*
+	 * Don't ACK connection change if there was an error.
+	 */
+	ret = ucsi_acknowledge(ucsi, err ? false : conn_ack);
 	if (ret)
 		return ret;
 
-	return 0;
+	return err;
 }
 
 static int ucsi_read_error(struct ucsi *ucsi)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
