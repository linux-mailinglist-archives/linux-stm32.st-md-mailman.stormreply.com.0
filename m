Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCD916B19
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3197FC7128F;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AACCC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so2923996e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327272; x=1719932072;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JHzYKHNjBXf+9UzjvIdsaqBY3cbTBbTnQBUGbCvbkus=;
 b=XN/0sBoSrzLga5wboc1uiOc2l5MZqD0NbRuOSTX5Qntpi7ZzqQUWWROoPaZiFFohgF
 bOWUUlM5m+xSFENRzjMn5aeIrh4FLHHfkqJVMGijm8rXdx4gmDuo7tSXAgnh7xcNwWwY
 GwAkXc4dynPDA50xtKHXOvOgY30Ezrk3xf5uRhbOuajSD1NB9IbI0+vuhc9xRG+EGRMb
 RfH7gPZPzQKhTIiPKpAEXpcr8jlIGgrEwREAFGibH5GdEf8x2icjUiN8MUI45VQcbz9V
 SgtFBKv3gmh3D8UPFYzvUHJNZwrQdg9jreVa2kPOFAPedXMdKR9B6ILbOGsf0y1snl2h
 JT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327272; x=1719932072;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHzYKHNjBXf+9UzjvIdsaqBY3cbTBbTnQBUGbCvbkus=;
 b=LtKEsXAvM/tg7TI6QGOVLUKkDG7zYtRxebZgsbS6AaTUihOs9rDehaTrtH7IG7jrZN
 6z0FH6v4mkqKfH9mlOZqD4r2x5FQrcu6P/fxKUwUad4mklh1t412e40V7J6RH1N2eJm4
 GpX/xDlM8X6PbcnVUOVwujuDCkBMCIsyvXD5ZFdc8U25pMEbiUPVUbESzJCVfANQcPa6
 snNU3VXSSRYqBAWtiX4kUgmASK3i/UzSfjFwVvvjRCkeQoHXnUWtvCDbw78c/JrwYNF0
 GBvRZxZmbJnIbmOeGDO/Ji89EQ42MePpkhJsN3XIpvKTNP3Z2SzIxaS60CZIRWdFzzBR
 JU8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXufT9tRXpTih8ixnUbq1f143XHMp/ULj4eUUFSV9iZULU7VIuqXwUnb/9r8ZfsfNt32DJnc1UIhK61mxIYumlWl/dIK0DV6Di4SfkXYaBVlXPasLl2U+oR
X-Gm-Message-State: AOJu0YzYbSLojgEHin2UWbsmo3OALBFJX/tdGVeGimszlntBq9YKzJm/
 FlhDIRQo0A/I/yf32UBYm7llQl2zzHL5ooluk/7bwFjc/WuQEPJZFDNuT812q3s=
X-Google-Smtp-Source: AGHT+IGhqQ+VBKIxaQ2lp2Pfy14XvRHw9UB90ZVR4jtUgoXS1297PMq+RIWx0NHafF59+uQIKs23DQ==
X-Received: by 2002:ac2:550d:0:b0:52c:e126:3d50 with SMTP id
 2adb3069b0e04-52ce183bf44mr4231354e87.36.1719327271692; 
 Tue, 25 Jun 2024 07:54:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:28 +0300
MIME-Version: 1.0
Message-Id: <20240625-ucsi-rework-interface-v3-3-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16964;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4wZHRHUTLDa+Ajur4pcLq9kjg9ZZkfOeNHnW5AjdB+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojz5ODXJomc1rapxF2ktWVUz9a/WEel79T5
 OixCXVC8qKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1YChB/9blK+zkNFOWhPUzE/TGHcI/2rtvvJI4F2Rg9lNVf8REPX01zLsxS7WGfj3I0CoSHjDJBm
 KvwwE/ZRjiTrLYdW4RxTF97d6LJQF2O6lWpXemKOfr/teiJav76MobxTQia8x/EV2Zlgw2e0KHi
 9z5a9a8P1IsN6lAYlX2k9C75bn249CnAHnvCvqwfoa5Ea42VBS0ytYxLq5AdJ8x1/fFSV/vDBKt
 JiXwyITWCxjt4AN96lIs+zUBXxZL7ty0pIT7AtSQHgtftxRsDc5+qQfO38CHTsQaSGoorM6fsqH
 zKb88YD2sw/SYq0opHpHiOeYUzEe1mykDNGcDbICfvbWdB03
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/7] usb: typec: ucsi: split read operation
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
 drivers/usb/typec/ucsi/ucsi.c           | 20 ++++-----
 drivers/usb/typec/ucsi/ucsi.h           |  9 +++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 72 ++++++++++++++++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 50 ++++++++++++-----------
 drivers/usb/typec/ucsi/ucsi_glink.c     | 19 ++++++++-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   | 19 ++++++++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 52 +++++++++++++++---------
 7 files changed, 169 insertions(+), 72 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 52903eea7274..db25f51ff71d 100644
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
 
@@ -1309,7 +1309,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ucsi->ops->read_cci(ucsi, &cci);
 	if (ret < 0)
 		goto out;
 
@@ -1327,8 +1327,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
 		do {
-			ret = ucsi->ops->read(ucsi, UCSI_CCI,
-					      &cci, sizeof(cci));
+			ret = ucsi->ops->read_cci(ucsi, &cci);
 			if (ret < 0)
 				goto out;
 			if (cci & UCSI_CCI_COMMAND_COMPLETE)
@@ -1357,7 +1356,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 		/* Give the PPM time to process a reset before reading CCI */
 		msleep(20);
 
-		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+		ret = ucsi->ops->read_cci(ucsi, &cci);
 		if (ret)
 			goto out;
 
@@ -1777,7 +1776,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	ucsi->ntfy = ntfy;
 
 	mutex_lock(&ucsi->ppm_lock);
-	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ucsi->ops->read_cci(ucsi, &cci);
 	mutex_unlock(&ucsi->ppm_lock);
 	if (ret)
 		return ret;
@@ -1891,7 +1890,9 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 {
 	struct ucsi *ucsi;
 
-	if (!ops || !ops->read || !ops->sync_control || !ops->async_control)
+	if (!ops ||
+	    !ops->read_version || !ops->read_cci || !ops->read_message_in ||
+	    !ops->sync_control || !ops->async_control)
 		return ERR_PTR(-EINVAL);
 
 	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
@@ -1927,8 +1928,7 @@ int ucsi_register(struct ucsi *ucsi)
 {
 	int ret;
 
-	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
-			      sizeof(ucsi->version));
+	ret = ucsi->ops->read_version(ucsi, &ucsi->version);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 3ad64acffda1..5c5a8c63090d 100644
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
index f54e4722d8f6..3660dc3e6d32 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -46,8 +46,7 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
 	return 0;
 }
 
-static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
-			  void *val, size_t val_len)
+static int ucsi_acpi_read_version(struct ucsi *ucsi, u16 *version)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
@@ -56,7 +55,35 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
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
@@ -99,36 +126,50 @@ static int ucsi_acpi_sync_control(struct ucsi *ucsi, u64 command)
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
 
-static int ucsi_gram_read(struct ucsi *ucsi, unsigned int offset,
-			  void *val, size_t val_len)
+static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
@@ -136,13 +177,12 @@ static int ucsi_gram_read(struct ucsi *ucsi, unsigned int offset,
 	struct ucsi_connector_status *status;
 	int ret;
 
-	ret = ucsi_acpi_read(ucsi, offset, val, val_len);
+	ret = ucsi_acpi_read_message_in(ucsi, val, val_len);
 	if (ret < 0)
 		return ret;
 
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
-	    test_bit(UCSI_ACPI_CHECK_BOGUS_EVENT, &ua->flags) &&
-	    offset == UCSI_MESSAGE_IN) {
+	    test_bit(UCSI_ACPI_CHECK_BOGUS_EVENT, &ua->flags)) {
 		status = (struct ucsi_connector_status *)val;
 
 		/* Clear the bogus change */
@@ -173,7 +213,9 @@ static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command)
 }
 
 static const struct ucsi_operations ucsi_gram_ops = {
-	.read = ucsi_gram_read,
+	.read_version = ucsi_acpi_read_version,
+	.read_cci = ucsi_acpi_read_cci,
+	.read_message_in = ucsi_gram_read_message_in,
 	.sync_control = ucsi_gram_sync_control,
 	.async_control = ucsi_acpi_async_control
 };
@@ -203,7 +245,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
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
index ebd76257c4fc..56bad054e78f 100644
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
index 396e2090e7c3..14737ca3724c 100644
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
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index e5e8ba0c0eaa..95a333ad5496 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -27,8 +27,16 @@ struct yoga_c630_ucsi {
 	u16 version;
 };
 
-static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
-			       void *val, size_t val_len)
+static int yoga_c630_ucsi_read_version(struct ucsi *ucsi, u16 *version)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+
+	*version = uec->version;
+
+	return 0;
+}
+
+static int yoga_c630_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
 {
 	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
 	u8 buf[YOGA_C630_UCSI_READ_SIZE];
@@ -38,22 +46,26 @@ static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
 	if (ret)
 		return ret;
 
-	if (offset == UCSI_VERSION) {
-		memcpy(val, &uec->version, min(val_len, sizeof(uec->version)));
-		return 0;
-	}
+	memcpy(cci, buf, sizeof(*cci));
 
-	switch (offset) {
-	case UCSI_CCI:
-		memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
-		return 0;
-	case UCSI_MESSAGE_IN:
-		memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
-		       min(val_len, YOGA_C630_UCSI_DATA_SIZE));
-		return 0;
-	default:
-		return -EINVAL;
-	}
+	return 0;
+}
+
+static int yoga_c630_ucsi_read_message_in(struct ucsi *ucsi,
+					  void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[YOGA_C630_UCSI_READ_SIZE];
+	int ret;
+
+	ret = yoga_c630_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
+	       min(val_len, YOGA_C630_UCSI_DATA_SIZE));
+
+	return 0;
 }
 
 static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
@@ -93,7 +105,9 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi, u64 command)
 }
 
 const struct ucsi_operations yoga_c630_ucsi_ops = {
-	.read = yoga_c630_ucsi_read,
+	.read_version = yoga_c630_ucsi_read_version,
+	.read_cci = yoga_c630_ucsi_read_cci,
+	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 };
@@ -126,7 +140,7 @@ static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 		return NOTIFY_OK;
 
 	case LENOVO_EC_EVENT_UCSI:
-		ret = uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, sizeof(cci));
+		ret = uec->ucsi->ops->read_cci(uec->ucsi, &cci);
 		if (ret)
 			return NOTIFY_DONE;
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
