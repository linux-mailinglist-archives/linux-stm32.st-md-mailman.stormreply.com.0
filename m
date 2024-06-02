Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90F8D790B
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F9DC78003;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBA4FC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:25:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b9d062526so33666e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370700; x=1717975500;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RS0RRS8kWTy5YtdarUDO9BTC5OYKf3Jm1kS68cq467k=;
 b=G+QjRGsg1tDp3aeiHSyJa16TbxHEgVmS311E18jAg9nMrnSMYR+Xp64iYmA74obYuA
 VNthbAKLI57rHQCTEob7D0dw98Relwdr+10/ORdASUIRl4SaEwYZu0Y8pKX0jYQZ0ok8
 Cb1VB1/NlTsxjfWuwJEMR67OznJVC7gPkc2oNjQRYNInrYYn4SQV1gMEwhVLdsMcXvHM
 76ME6Hdk/F3Pl/p1mEaobMM7PMhzPSSEJYPdoLQG4FdN3yjgAW1MW7G9Ku8DxGFORrPT
 DxJ2UjfyyQg+pouU4rT9+Az0K7U92vmwAb5iyy5TfwpgFQ1eUfayJLF6u93wHgCgrwci
 RcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370700; x=1717975500;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS0RRS8kWTy5YtdarUDO9BTC5OYKf3Jm1kS68cq467k=;
 b=ZJP8dnSW2KsTyGv5gza+Rw2mbBv7uG+UvPyDE0e/XXh4D3WzE7C6YVhsRoApO3iO5/
 Evm57vIkER1+V/LDruH0Xh+AEyQ48vXpIUsd0EidfT3sQ8CTCVm0XeiSRDOJZCQq6a9b
 BAwQfVgVxSrv1Ejm5H1SMPoJ752LKiPA+bJPlhSG2sTuFLf4BoXoLui7BSEYg/a2oTJV
 b0gzEfHSj9LXMTkzqCci7dngrtzdvBO3gASalrHC6KSw52bV3UZkrxppodTJNv5QuYSJ
 ZXQYJSscZ1fB898vhpnf0XL2HUu+WsWZxYUxDdtAzuts/6WUnVcNpSDWIABjDjjz1rW9
 oNzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhVNqeU2VVXB7P5nUfM0BwMVfNBa7UXeEjUZT7v2xNlhgvP9OHqjjkZPHmQYaNuDB2Bx4Y4Y+fy15NuBhVOh+fuI4JHvtB7NBqHpkDtM5VTsbXtszq/833
X-Gm-Message-State: AOJu0YwWrwUPe/I4fSQHDdWMNcnJejqQGkKV9Sai5xDYaqmQCqrze+IR
 Y/LOhlMMb6Sw1sY9SzX9P7V2uYRnQWV6KVlxXlM7x05OI7+wgDHxX4CDqfjfEyU=
X-Google-Smtp-Source: AGHT+IF+7ECElpfPWCZ815PFEw8gDVd7yShai1/+oSnWq0vMjhxFgQHiWSjlGgySRRjvFrPegfiCDA==
X-Received: by 2002:ac2:4296:0:b0:52b:8363:34ef with SMTP id
 2adb3069b0e04-52b8957535amr4327645e87.15.1717370699513; 
 Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:57 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-4-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qlvm0O1XPt3pR+fGT5Ihsrd6DrRUvL18urSNodiPM/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9HRhpoJUkVmxwoBwDeeIJduNwYx81xqhxun
 KdkqwkkPk2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1bUZB/4xcmd1cxqLd8b97oPAYAEfMP/CdrDSsChcE9bqtNRiHX+0qrVNseJxk2CFl+ROSR64LNn
 gKZw+qyiXaDDk+k04/3Y0HJ8fTmy0um3lkCN9mY5Hesh8+FQILSfOLL4+cy4uY/2bVV0vV90jVl
 kBGQrqD/MKruFqGbPxGl6upEXpsHCL4V4Fs3fkzxrq+jmPFCFcIAUFGFsP+3vPX89pqpvHV/xFE
 7w4bCyjn2Wr+lJtHMFX/4pzVTyiMsHgaBIw/H7Xb6XUR5y0AaIjsMHlaYMivSjwnTZIkTL3g85a
 QkfXmhOg5YtUNjAzRk3cO6D+I0uIt0OKIF/Sn+OvRrpYJFMA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 4/7] usb: typec: ucsi: rework command
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
index a3a29ea4e325..54a2c505442f 100644
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
