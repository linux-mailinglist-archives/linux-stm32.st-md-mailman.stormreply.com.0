Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 487D68D7909
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2EC2C712A2;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C4EC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:24:59 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b8e0e98adso2862322e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370699; x=1717975499;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xABSaJig708zsQYcdtLiZTJ10Q7uZbqt3rPdrspBKnQ=;
 b=hvdJiCEF1qNBvFo+U2yJjqXcXOzZ2DYSWr7A16KACwC0wZMtfRjaU3V1a2GzKK7zuL
 OaFhkl+gESu1ayqwPZZBnL0XhX/aP9xs29CBPOtghP83smI8OhPmk/StAwL5D45ErSX4
 NO5eN1WrXe9wy5E6c8VZat5gi2t0g70vl+eKJKYKYhlp/Lej0Gyrgq3h91z3BnJ8CoWu
 dCoINCI1T92fXwBQow/54GZQkqSVs0+bobtPepcPYNCraSUD6yvuvfDomTJThnMskhZe
 7YlEcKocSKCtvVqHEd6D8iawdGTQ/Ll7O04QY5+fPS61DaSmfedyL96ujL0wZT2pfLEF
 eO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370699; x=1717975499;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xABSaJig708zsQYcdtLiZTJ10Q7uZbqt3rPdrspBKnQ=;
 b=bHvaYY0ba+vYDL/TtyuLiY0U8zD+AO+F/WnzTCfKUMcwV3u2xMKJ2AVEB7Vcuon4gD
 cX8318ddHA92DoA2ea+zYRL0KS6MWLZHIVuM950/tF8/w0sPwaiEK4XJdKwiFsFnbjxQ
 Qi3Ue05QL7jmuADp5/0CUqfTkFhBXXUvascEGWRvD/on9FODKEH90iZH4NHRdoyf71iQ
 pSLkuzVccclfdiVfp0Tf/XMRJQTC8BXcfiJr1lwXKRRNeYYGg1EIcIEiNAydcXqAsyAt
 wcLmhco5jBYzd5e2bFbGnxNiYg04AXP7K5PW7COvun4j5zrU9Nv+tpT19Sd6Iut7P/gY
 PuGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl94LayGYKX72/MPs41CM21NlA1GJXCAtQbHe9WErEH3XmpGp675mMY9rJZsuiLEvM5cKeEVizZe2bdaD9z0efSnenqRw2CGF/oSWbMGPPhUibS0y3+/n8
X-Gm-Message-State: AOJu0YwEGn0kN/rZ7BKLIq/pnF1jUt2U3BJFpcSm31kbTHZGOVJ+2crU
 cvTCr5YYzBc7Gi3s+SF8I5BCONQbfq0azd9tAMQy7uwmLYFivBjXJBT5ZSWPT5I=
X-Google-Smtp-Source: AGHT+IESdwnWd/AeFs2C1vWz2zVCpBQMzXyc/yU/VLJnkNC5D664gUK44ENV/NgiVlgM4czIZjNqMQ==
X-Received: by 2002:a05:6512:3599:b0:52b:825d:7b71 with SMTP id
 2adb3069b0e04-52b89576a5bmr4989638e87.16.1717370698873; 
 Sun, 02 Jun 2024 16:24:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:56 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-3-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13058;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wSWkqsUHUlMJRLwQ6jCjMEtugMyxWzK8PjGp0/lysG8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9HGMv+GJ1xoq0DFfiAtBojgEr4/bewOc7dD
 2LOyh22kW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1XlRB/4tJwOm93LS5SCn6vEEzKibvBsK4/Wq3umcPpXRt7Xq/5XQXZ4Ki4iL2UEXOek+AQQe/ZS
 TQcc/e7qMy3GsO2ASokhwy0lYCQ91tlIRXXzyWHUPHLluq/JlIWyEiTSzia3K7WjSrMEZjzHvSl
 EvYhD1J8GELyhAaP1x7PZzig3VdeU6L5nEaBctzKQR00PEVsKOLqT1fCujzLRnKClb+2daWltwe
 ZvM/rFJeKCIMLI9k9NIN8QFLkPQxzwC93/1QMk3/t087wlJQpkJI2JiD4PoucBl3zzEogjQ/1jK
 QM0o3m16l4sOH7dooo23Lfsto3xlw3Zw0RgvGXSgJy9fIqVN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 3/7] usb: typec: ucsi: split read operation
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

The read operation is only used to read fixed data at fixed offsets
(UCSI_VERSION, UCSI_CCI, UCSI_MESSAGE_IN). In some cases drivers apply
offset-specific overrides. Split the read() operation into three
operations, read_version(), read_cci(), read_message_in().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c         | 20 ++++++------
 drivers/usb/typec/ucsi/ucsi.h         |  9 ++++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 60 +++++++++++++++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 50 +++++++++++++++--------------
 drivers/usb/typec/ucsi/ucsi_glink.c   | 19 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 19 ++++++++++-
 6 files changed, 130 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f58908a76e1d..a3a29ea4e325 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -46,7 +46,7 @@ static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
 	if (ucsi->version <= UCSI_VERSION_1_2)
 		buf_size = clamp(buf_size, 0, 16);
 
-	return ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, buf, buf_size);
+	return ucsi->ops->read_message_in(ucsi, buf, buf_size);
 }
 
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
@@ -130,7 +130,7 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (ret)
 		return ret;
 
-	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ucsi->ops->read_cci(ucsi, &cci);
 	if (ret)
 		return ret;
 
@@ -1294,7 +1294,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ucsi->ops->read_cci(ucsi, &cci);
 	if (ret < 0)
 		goto out;
 
@@ -1312,8 +1312,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
 		do {
-			ret = ucsi->ops->read(ucsi, UCSI_CCI,
-					      &cci, sizeof(cci));
+			ret = ucsi->ops->read_cci(ucsi, &cci);
 			if (ret < 0)
 				goto out;
 			if (cci & UCSI_CCI_COMMAND_COMPLETE)
@@ -1342,7 +1341,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 		/* Give the PPM time to process a reset before reading CCI */
 		msleep(20);
 
-		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+		ret = ucsi->ops->read_cci(ucsi, &cci);
 		if (ret)
 			goto out;
 
@@ -1745,7 +1744,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	ucsi->ntfy = ntfy;
 
 	mutex_lock(&ucsi->ppm_lock);
-	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ucsi->ops->read_cci(ucsi, &cci);
 	mutex_unlock(&ucsi->ppm_lock);
 	if (ret)
 		return ret;
@@ -1859,7 +1858,9 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 {
 	struct ucsi *ucsi;
 
-	if (!ops || !ops->read || !ops->sync_control || !ops->async_control)
+	if (!ops ||
+	    !ops->read_version || !ops->read_cci || !ops->read_message_in ||
+	    !ops->sync_control || !ops->async_control)
 		return ERR_PTR(-EINVAL);
 
 	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
@@ -1895,8 +1896,7 @@ int ucsi_register(struct ucsi *ucsi)
 {
 	int ret;
 
-	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
-			      sizeof(ucsi->version));
+	ret = ucsi->ops->read_version(ucsi, &ucsi->version);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 94ea54d3d47d..f770e1070424 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -56,7 +56,9 @@ struct dentry;
 
 /**
  * struct ucsi_operations - UCSI I/O operations
- * @read: Read operation
+ * @read_version: Read implemented UCSI version
+ * @read_cci: Read CCI register
+ * @read_message_in: Read message data from UCSI
  * @sync_control: Blocking control operation
  * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
@@ -68,8 +70,9 @@ struct dentry;
  * return immediately after sending the data to the PPM.
  */
 struct ucsi_operations {
-	int (*read)(struct ucsi *ucsi, unsigned int offset,
-		    void *val, size_t val_len);
+	int (*read_version)(struct ucsi *ucsi, u16 *version);
+	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
+	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index feccbfc8acbe..61dd28dae3a4 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -45,8 +45,7 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
 	return 0;
 }
 
-static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
-			  void *val, size_t val_len)
+static int ucsi_acpi_read_version(struct ucsi *ucsi, u16 *version)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
@@ -55,7 +54,35 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
 	if (ret)
 		return ret;
 
-	memcpy(val, ua->base + offset, val_len);
+	memcpy(version, ua->base + UCSI_VERSION, sizeof(*version));
+
+	return 0;
+}
+
+static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+	if (ret)
+		return ret;
+
+	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
+
+	return 0;
+}
+
+static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+	if (ret)
+		return ret;
+
+	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
 
 	return 0;
 }
@@ -98,30 +125,45 @@ static int ucsi_acpi_sync_control(struct ucsi *ucsi, u64 command)
 }
 
 static const struct ucsi_operations ucsi_acpi_ops = {
-	.read = ucsi_acpi_read,
+	.read_version = ucsi_acpi_read_version,
+	.read_cci = ucsi_acpi_read_cci,
+	.read_message_in = ucsi_acpi_read_message_in,
 	.sync_control = ucsi_acpi_sync_control,
 	.async_control = ucsi_acpi_async_control
 };
 
 static int
-ucsi_zenbook_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t val_len)
+ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	if (offset == UCSI_VERSION || UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
+	if (UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) {
 		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
 		if (ret)
 			return ret;
 	}
 
-	memcpy(val, ua->base + offset, val_len);
+	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
+
+	return 0;
+}
+
+static int
+ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+
+	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return stored data */
+	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
 
 	return 0;
 }
 
 static const struct ucsi_operations ucsi_zenbook_ops = {
-	.read = ucsi_zenbook_read,
+	.read_version = ucsi_acpi_read_version,
+	.read_cci = ucsi_zenbook_read_cci,
+	.read_message_in = ucsi_zenbook_read_message_in,
 	.sync_control = ucsi_acpi_sync_control,
 	.async_control = ucsi_acpi_async_control
 };
@@ -143,7 +185,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 	u32 cci;
 	int ret;
 
-	ret = ua->ucsi->ops->read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ua->ucsi->ops->read_cci(ua->ucsi, &cci);
 	if (ret)
 		return;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 76b39bb9762d..6ccc394f268e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -556,32 +556,34 @@ static void ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
 	}
 }
 
-static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
-			 void *val, size_t val_len)
+static int ucsi_ccg_read_version(struct ucsi *ucsi, u16 *version)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
-	struct ucsi_capability *cap;
-	struct ucsi_altmode *alt;
-	int ret = 0;
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_VERSION);
 
-	if (offset == UCSI_CCI) {
-		spin_lock(&uc->op_lock);
-		memcpy(val, &(uc->op_data).cci, val_len);
-		spin_unlock(&uc->op_lock);
-	} else if (offset == UCSI_MESSAGE_IN) {
-		spin_lock(&uc->op_lock);
-		memcpy(val, &(uc->op_data).message_in, val_len);
-		spin_unlock(&uc->op_lock);
-	} else {
-		ret = ccg_read(uc, reg, val, val_len);
-	}
+	return ccg_read(uc, reg, (u8 *)version, sizeof(*version));
+}
 
-	if (ret)
-		return ret;
+static int ucsi_ccg_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 
-	if (offset != UCSI_MESSAGE_IN)
-		return ret;
+	spin_lock(&uc->op_lock);
+	*cci = uc->op_data.cci;
+	spin_unlock(&uc->op_lock);
+
+	return 0;
+}
+
+static int ucsi_ccg_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
+	struct ucsi_capability *cap;
+	struct ucsi_altmode *alt;
+
+	spin_lock(&uc->op_lock);
+	memcpy(val, uc->op_data.message_in, val_len);
+	spin_unlock(&uc->op_lock);
 
 	switch (UCSI_COMMAND(uc->last_cmd_sent)) {
 	case UCSI_GET_CURRENT_CAM:
@@ -607,7 +609,7 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 	}
 	uc->last_cmd_sent = 0;
 
-	return ret;
+	return 0;
 }
 
 static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
@@ -663,7 +665,9 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 }
 
 static const struct ucsi_operations ucsi_ccg_ops = {
-	.read = ucsi_ccg_read,
+	.read_version = ucsi_ccg_read_version,
+	.read_cci = ucsi_ccg_read_cci,
+	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
 	.update_altmodes = ucsi_ccg_update_altmodes
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 047998f33274..7f6a48624ee5 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -114,6 +114,21 @@ static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
 	return ret;
 }
 
+static int pmic_glink_ucsi_read_version(struct ucsi *ucsi, u16 *version)
+{
+	return pmic_glink_ucsi_read(ucsi, UCSI_VERSION, version, sizeof(*version));
+}
+
+static int pmic_glink_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	return pmic_glink_ucsi_read(ucsi, UCSI_CCI, cci, sizeof(*cci));
+}
+
+static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	return pmic_glink_ucsi_read(ucsi, UCSI_MESSAGE_IN, val, val_len);
+}
+
 static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
 					const void *val, size_t val_len)
 {
@@ -214,7 +229,9 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 }
 
 static const struct ucsi_operations pmic_glink_ucsi_ops = {
-	.read = pmic_glink_ucsi_read,
+	.read_version = pmic_glink_ucsi_read_version,
+	.read_cci = pmic_glink_ucsi_read_cci,
+	.read_message_in = pmic_glink_ucsi_read_message_in,
 	.sync_control = pmic_glink_ucsi_sync_control,
 	.async_control = pmic_glink_ucsi_async_control,
 	.update_connector = pmic_glink_ucsi_update_connector,
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index f97dc5a075e2..e3cfcb258e43 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -359,6 +359,21 @@ static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val,
 	return 0;
 }
 
+static int ucsi_stm32g0_read_version(struct ucsi *ucsi, u16 *version)
+{
+	return ucsi_stm32g0_read(ucsi, UCSI_VERSION, version, sizeof(*version));
+}
+
+static int ucsi_stm32g0_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	return ucsi_stm32g0_read(ucsi, UCSI_CCI, cci, sizeof(*cci));
+}
+
+static int ucsi_stm32g0_read_message_in(struct ucsi *ucsi, void *val, size_t len)
+{
+	return ucsi_stm32g0_read(ucsi, UCSI_MESSAGE_IN, val, len);
+}
+
 static int ucsi_stm32g0_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
@@ -446,7 +461,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 }
 
 static const struct ucsi_operations ucsi_stm32g0_ops = {
-	.read = ucsi_stm32g0_read,
+	.read_version = ucsi_stm32g0_read_version,
+	.read_cci = ucsi_stm32g0_read_cci,
+	.read_message_in = ucsi_stm32g0_read_message_in,
 	.sync_control = ucsi_stm32g0_sync_control,
 	.async_control = ucsi_stm32g0_async_control,
 };

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
