Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46094859D61
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 08:48:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B95CAC6DD69;
	Mon, 19 Feb 2024 07:48:17 +0000 (UTC)
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEBC7C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Feb 2024 22:21:06 +0000 (UTC)
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 92A2E140406; Sun, 18 Feb 2024 23:21:06 +0100 (CET)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sun, 18 Feb 2024 23:20:36 +0100
Message-Id: <20240218222039.822040-4-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240218222039.822040-1-lk@c--e.de>
References: <20240218222039.822040-1-lk@c--e.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Feb 2024 07:48:15 +0000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Prashanth K <quic_prashk@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>, Luca Weiss <luca.weiss@fairphone.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Haotien Hsu <haotienh@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
 Utkarsh Patel <utkarsh.h.patel@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Min-Hua Chen <minhuadotchen@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>,
 Saranya Gopal <saranya.gopal@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [Linux-stm32] [RFC PATCH 3/6] usb: typec: ucsi: Make Version a
	parameter to ucsi_register
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

Reading UCSI_VERSION is a special case as there is no
notification that syncs the data into host memory.

Read UCSI_VERSION only once during initialization and provide
it as a parameter to ucsi_register().

Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 drivers/usb/typec/ucsi/ucsi.c         | 13 ++++---------
 drivers/usb/typec/ucsi/ucsi.h         |  2 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c    |  8 +++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 12 ++++++++++--
 drivers/usb/typec/ucsi/ucsi_glink.c   | 11 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 26 ++++++++++++++++++++++----
 6 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ae105383e69e..eb630447ba80 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1581,18 +1581,13 @@ EXPORT_SYMBOL_GPL(ucsi_destroy);
 /**
  * ucsi_register - Register UCSI interface
  * @ucsi: UCSI instance
+ * @version: The revision of the UCSI spec
  */
-int ucsi_register(struct ucsi *ucsi)
+int ucsi_register(struct ucsi *ucsi, u16 version)
 {
-	int ret;
-
-	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
-			      sizeof(ucsi->version));
-	if (ret)
-		return ret;
-
-	if (!ucsi->version)
+	if (!version)
 		return -ENODEV;
+	ucsi->version = version;
 
 	/*
 	 * Version format is JJ.M.N (JJ = Major version, M = Minor version,
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 7e35ffbe0a6f..100e16b49814 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -77,7 +77,7 @@ struct ucsi_operations {
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
 void ucsi_destroy(struct ucsi *ucsi);
-int ucsi_register(struct ucsi *ucsi);
+int ucsi_register(struct ucsi *ucsi, u16 version);
 void ucsi_unregister(struct ucsi *ucsi);
 void *ucsi_get_drvdata(struct ucsi *ucsi);
 void ucsi_set_drvdata(struct ucsi *ucsi, void *data);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 928eacbeb21a..710ddfc03ed0 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -226,6 +226,7 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	const struct dmi_system_id *id;
 	struct ucsi_acpi *ua;
 	struct resource *res;
+	u16 version;
 	acpi_status status;
 	int ret;
 
@@ -272,7 +273,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = ucsi_register(ua->ucsi);
+	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+	if (ret)
+		return ret;
+	version = le16_to_cpu(*(__le16 *)(ua->base + UCSI_VERSION));
+
+	ret = ucsi_register(ua->ucsi, version);
 	if (ret) {
 		acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
 					   ACPI_DEVICE_NOTIFY,
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 709295948c65..d47f5e31c98a 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1356,7 +1356,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
-	status = ucsi_register(uc->ucsi);
+	status = ucsi_register(uc->ucsi, uc->ucsi->version);
 	if (status) {
 		dev_err(uc->dev, "failed to register the interface\n");
 		return status;
@@ -1422,6 +1422,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	struct ucsi_ccg *uc;
 	const char *fw_name;
 	int status;
+	__le16 version;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
 	if (!uc)
@@ -1477,7 +1478,14 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 		goto out_ucsi_destroy;
 	}
 
-	status = ucsi_register(uc->ucsi);
+	status = ccg_read(uc, CCGX_RAB_UCSI_DATA_BLOCK(UCSI_VERSION),
+			  (u8 *)&version, sizeof(version));
+	if (status < 0) {
+		dev_err(uc->dev, "cannot read UCSI version - %d\n", status);
+		return status;
+	}
+
+	status = ucsi_register(uc->ucsi, le16_to_cpu(version));
 	if (status)
 		goto out_free_irq;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 0a0d08467c56..7a0b28536abd 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -255,8 +255,17 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 static void pmic_glink_ucsi_register(struct work_struct *work)
 {
 	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, register_work);
+	__le16 version;
+	int ret;
+
+	ret = pmic_glink_ucsi_read(ucsi->ucsi, UCSI_VERSION, &version,
+				   sizeof(version));
+	if (ret < 0) {
+		dev_err(ucsi->dev, "cannot read version: %d\n", ret);
+		return;
+	}
 
-	ucsi_register(ucsi->ucsi);
+	ucsi_register(ucsi->ucsi, le16_to_cpu(version));
 }
 
 static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 93d7806681cf..112692c7a158 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -325,10 +325,10 @@ static int ucsi_stm32g0_fw_rcv(struct ucsi *ucsi, void *data, size_t len)
 	return ucsi_stm32g0_bl_rcv_woack(ucsi, data, len);
 }
 
-/* UCSI ops */
-static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t len)
+static int ucsi_stm32g0_read_from_hw(struct ucsi_stm32g0 *g0,
+				     unsigned int offset,
+				     void *val, size_t len)
 {
-	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
 	struct i2c_client *client = g0->client;
 	u8 reg = offset;
 	struct i2c_msg msg[] = {
@@ -357,6 +357,15 @@ static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val,
 	return 0;
 }
 
+/* UCSI ops */
+static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset,
+			     void *val, size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+
+	return ucsi_stm32g0_read_from_hw(g0, offset, val, len);
+}
+
 static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
 				    size_t len)
 {
@@ -445,6 +454,7 @@ static int ucsi_stm32g0_register(struct ucsi *ucsi)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
 	struct i2c_client *client = g0->client;
+	__le16 version;
 	int ret;
 
 	/* Request alert interrupt */
@@ -455,7 +465,15 @@ static int ucsi_stm32g0_register(struct ucsi *ucsi)
 		return ret;
 	}
 
-	ret = ucsi_register(ucsi);
+	ret = ucsi_stm32g0_read_from_hw(g0, UCSI_VERSION, &version,
+					sizeof(version));
+	if (ret) {
+		dev_err(g0->dev, "failed to read version number: %d\n", ret);
+		free_irq(client->irq, g0);
+		return ret;
+	}
+
+	ret = ucsi_register(ucsi, le16_to_cpu(version));
 	if (ret) {
 		dev_err_probe(g0->dev, ret, "ucsi_register failed\n");
 		free_irq(client->irq, g0);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
