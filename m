Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A53916B1E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4AB2C7801A;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15AB4C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cdebf9f6fso4106687e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327273; x=1719932073;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+KB8pq5NQAZ6n/rTI4y8OIrQXRuJ/BDLkN3YelnKCzI=;
 b=NMkzu1q444Xv83B2MuK4WLCcVFoh2/9OvQA+VCDEv+sTXZhrbk5/DAlbX7wnpqWWM7
 8pgwbu7XhWcCad1a8TmJmV+eEJ0O09zaU0q62WTkutKy2EiALZVcXZ7dBrUl/1WO/aMo
 6YJQvnxSs98WFFZbXm+uqavwSf/gMfTtmb1+eyp6wm8Dr3MQsTZIdEL/FDmrjxQHELTg
 Us/3WAHRZS+A9jv2Ne8tF1/eNC6jQTxsxC3oQtey/37xz6msrq7IOAhEXfR1YP937zKR
 nvOFIb3kJ0dLg7/6Ah9kn2/pFJ8V13SiZoov/44DzfX4BTaojE0wXsCijJGyOGztrfDg
 TKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327273; x=1719932073;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KB8pq5NQAZ6n/rTI4y8OIrQXRuJ/BDLkN3YelnKCzI=;
 b=KxAISJ+bgYwC8NzJIb3K43pet6fz9/H7Xl2cQapDM0q5qfSqDmFrEdI7VjoJ0UbMqQ
 7htaXE5HCKLg1NRR7WCenesUaFyX/Vfu+nWK+FU95h2sKkHFb7FjLgRPkS3u5MLgDY6c
 2n1F6TaJdkh0SUI37GOWqeALMPlztOyMjuCBdodeApqtnhxqAZQRt1SrDwPsd0XbLd6x
 wVmBMtAvFCR/GtRkh6OmlacGkfZjKiZzVErwyzbzlDfl1pcAOLnEPUkm28KpwmiVVvH/
 C6MSImv4/pnKFyWNv2OE1shrBXc6lv9x40Sj+X58CS0/GNkvzyehIjJUsE7MRDwMm8ZQ
 061w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsipFbvuTzr8+TarGv2sO/SkZl47QE0AdJWvSsDLou3C+tz2Oq9it62daxS9oSafRO5/rC2K4GOt/jXVJE/eqojeNXSCDUJompx5jfneCViMcrmrZRMJli
X-Gm-Message-State: AOJu0Yz262j+8EC40IMAssscjcZu+YajDptxw2ul1trwSNV9pIZ/5vsv
 mChvOeItzNoAk0mlfdNV0er5pyXruUw5LuUrmiawr/B1LZXEyw6J4YTuKgilpyk=
X-Google-Smtp-Source: AGHT+IGtQxo5jV6cMwfXqOOOPD8YZNEebt3pWP+GVzXLpNydBk0U1gGSF/EvGWsWZGvWy6VumzOMyA==
X-Received: by 2002:ac2:58f4:0:b0:52c:dacf:e5ac with SMTP id
 2adb3069b0e04-52ce185d218mr5415211e87.54.1719327273412; 
 Tue, 25 Jun 2024 07:54:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:29 +0300
MIME-Version: 1.0
Message-Id: <20240625-ucsi-rework-interface-v3-4-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iGz/1CTodFFLxhp6bKYq0V9qXiKSF7JlfOGZtn0n3AI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojsGNpr741Om5LXvH7sB4VKPc9Jwl3kjr86
 7L8QXP96iqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1WCzCACcWhUjxOL5ffytSZW+F/ypklLcxsDF6YxBlJcdE7up+io2SCqomp/iKmX+5dY/ORLmd66
 lJuECdbPx9ngWe/pTO+CJNJYrH/dMWh81YM5i2PFb8n73II9/yqhxJmdrhlsw2LgK7If03UgJ2+
 k+iO+dPgvCxceKi4Y0cN36dzDSztbdn1k2lHng2/DUhrTuUPscI8g120u9GusllZQ+D8YZjhBuo
 rUBkA3HL1EDs5Z0URtChJIRQ7i6Vots9o3vGO35gdat2BHFsIzzFeHrLvwp8vV5bQ0mLZVCxQ95
 jS/FEKz7Q4a/a0K7/6AjoUN9hZ3Uf0r86rV6mYKJDAiL2jh5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/7] usb: typec: ucsi: rework command
 execution functions
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

Rework command execution code to remove recursive calls of
ucsi_exec_command. This also streamlines the sync_control / read(CCI)
read (MESSAGE_IN) sequence, allowing further rework of the command code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 134 ++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 70 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index db25f51ff71d..5f8e5ed9e0f9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -63,25 +63,74 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 	return ucsi->ops->sync_control(ucsi, ctrl);
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
-
-static int ucsi_read_error(struct ucsi *ucsi)
+static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size, bool conn_ack)
 {
-	u16 error;
 	int ret;
 
-	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
-	if (ret < 0)
+	*cci = 0;
+
+	ret = ucsi->ops->sync_control(ucsi, command);
+	if (ret)
 		return ret;
 
-	ret = ucsi_read_message_in(ucsi, &error, sizeof(error));
+	ret = ucsi->ops->read_cci(ucsi, cci);
 	if (ret)
 		return ret;
 
-	ret = ucsi_acknowledge(ucsi, false);
+	if (*cci & UCSI_CCI_BUSY)
+		return -EBUSY;
+
+	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
+		return -EIO;
+
+	if (*cci & UCSI_CCI_NOT_SUPPORTED) {
+		if (ucsi_acknowledge(ucsi, false) < 0)
+			dev_err(ucsi->dev,
+				"ACK of unsupported command failed\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (*cci & UCSI_CCI_ERROR) {
+		/* Acknowledge the command that failed */
+		ret = ucsi_acknowledge(ucsi, false);
+		return ret ? ret : -EIO;
+	}
+
+	if (data) {
+		ret = ucsi_read_message_in(ucsi, data, size);
+		if (ret)
+			return ret;
+	}
+
+	ret = ucsi_acknowledge(ucsi, conn_ack);
 	if (ret)
 		return ret;
 
+	return 0;
+}
+
+static int ucsi_read_error(struct ucsi *ucsi)
+{
+	u16 error;
+	u32 cci;
+	int ret;
+
+	ret = ucsi_run_command(ucsi, UCSI_GET_ERROR_STATUS, &cci,
+			       &error, sizeof(error), false);
+
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
+
+		return ret ? ret : -EBUSY;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (cci & UCSI_CCI_ERROR)
+		return -EIO;
+
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
@@ -121,78 +170,23 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	return -EIO;
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
-{
-	u32 cci;
-	int ret;
-
-	ret = ucsi->ops->sync_control(ucsi, cmd);
-	if (ret)
-		return ret;
-
-	ret = ucsi->ops->read_cci(ucsi, &cci);
-	if (ret)
-		return ret;
-
-	if (cmd != UCSI_CANCEL && cci & UCSI_CCI_BUSY)
-		return ucsi_exec_command(ucsi, UCSI_CANCEL);
-
-	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
-		return -EIO;
-
-	if (cci & UCSI_CCI_NOT_SUPPORTED) {
-		if (ucsi_acknowledge(ucsi, false) < 0)
-			dev_err(ucsi->dev,
-				"ACK of unsupported command failed\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (cci & UCSI_CCI_ERROR) {
-		/* Acknowledge the command that failed */
-		ret = ucsi_acknowledge(ucsi, false);
-		if (ret)
-			return ret;
-
-		if (cmd == UCSI_GET_ERROR_STATUS)
-			return -EIO;
-
-		return ucsi_read_error(ucsi);
-	}
-
-	if (cmd == UCSI_CANCEL && cci & UCSI_CCI_CANCEL_COMPLETE) {
-		ret = ucsi_acknowledge(ucsi, false);
-		return ret ? ret : -EBUSY;
-	}
-
-	return UCSI_CCI_LENGTH(cci);
-}
-
 static int ucsi_send_command_common(struct ucsi *ucsi, u64 command,
 				    void *data, size_t size, bool conn_ack)
 {
-	u8 length;
+	u32 cci;
 	int ret;
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_exec_command(ucsi, command);
-	if (ret < 0)
-		goto out;
-
-	length = ret;
-
-	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
-		if (ret)
-			goto out;
+	ret = ucsi_run_command(ucsi, command, &cci, data, size, conn_ack);
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
+		return ret ? ret : -EBUSY;
 	}
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
-	if (ret)
-		goto out;
+	if (cci & UCSI_CCI_ERROR)
+		return ucsi_read_error(ucsi);
 
-	ret = length;
-out:
 	mutex_unlock(&ucsi->ppm_lock);
 	return ret;
 }

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
