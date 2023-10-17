Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA06C7CCE23
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 22:34:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67516C6C838;
	Tue, 17 Oct 2023 20:34:53 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A49AC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 20:34:52 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6c7bbfb7a73so4175267a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697574891; x=1698179691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3R82hRHMj09jqEYX2MmtO4M63Ms0/gcZZch5hMW3VLM=;
 b=Cu/XaFX2sCYGpQHJVpT5naZlxkoTr/AT1k95TmwnRG/p2CpPoWOo8in4iT6DBvwCi2
 ZlYB2NFHcaUiAAuiIfMZ/3NFQDPO5aEk1miaKvnG80e6V01KNO3tuTc1zHNFhrrIp16R
 pggSabf3zB+aYmM6Ppo9xxAgjJF0sZjugJqHGwKyGxbOukCDtjLph5+Vh8DWO335rS9M
 NBbiJpth3gCpSWYb8s3TVqv3AXCeQhEe1fRLdDgzBbO/R0LNRpynoT9PytTRgmoalrvz
 /oK0e4ZQt9Qd4JgH8v6EDk8NHjEMs80Mo09HsMEslCT5UvTBSv32Q9QEsdEwkdk4XlH5
 /Lag==
X-Gm-Message-State: AOJu0YwDxPVVHPFICbkhyucNpi95Ry9yk1z8Td8+/wnfLIQG7dN1aGN/
 Ch0cUbftgp/F/AU3PxUKSnkZZEMkdw==
X-Google-Smtp-Source: AGHT+IHvwM26Vh++rDXJj0pSEkNFDqoqQWGiOXc5R2+D/QTr5DSZzaBCEKVID382mnAGBicHyqbfZw==
X-Received: by 2002:a05:6830:2647:b0:6bc:a68b:ca44 with SMTP id
 f7-20020a056830264700b006bca68bca44mr3466974otu.6.1697574891187; 
 Tue, 17 Oct 2023 13:34:51 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g20-20020a4adc94000000b0057b38a94f38sm373221oou.12.2023.10.17.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 13:34:50 -0700 (PDT)
Received: (nullmailer pid 2699513 invoked by uid 1000);
 Tue, 17 Oct 2023 20:34:49 -0000
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 17 Oct 2023 15:34:41 -0500
Message-ID: <20231017203442.2699322-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH] regulator: Use device_get_match_data()
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

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/regulator/lochnagar-regulator.c   |  8 ++------
 drivers/regulator/palmas-regulator.c      |  8 ++------
 drivers/regulator/qcom-labibb-regulator.c |  7 +++----
 drivers/regulator/qcom_rpm-regulator.c    |  7 +++----
 drivers/regulator/qcom_spmi-regulator.c   |  7 +++----
 drivers/regulator/stm32-booster.c         |  5 ++---
 drivers/regulator/ti-abb-regulator.c      | 22 +++++++---------------
 7 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/drivers/regulator/lochnagar-regulator.c b/drivers/regulator/lochnagar-regulator.c
index 11b358efbc92..e53911c80719 100644
--- a/drivers/regulator/lochnagar-regulator.c
+++ b/drivers/regulator/lochnagar-regulator.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
@@ -243,7 +242,6 @@ static int lochnagar_regulator_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
 	struct regulator_config config = { };
-	const struct of_device_id *of_id;
 	const struct regulator_desc *desc;
 	struct regulator_dev *rdev;
 	int ret;
@@ -252,12 +250,10 @@ static int lochnagar_regulator_probe(struct platform_device *pdev)
 	config.regmap = lochnagar->regmap;
 	config.driver_data = lochnagar;
 
-	of_id = of_match_device(lochnagar_of_match, dev);
-	if (!of_id)
+	desc = device_get_match_data(dev);
+	if (!desc)
 		return -EINVAL;
 
-	desc = of_id->data;
-
 	rdev = devm_regulator_register(dev, desc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index 076966366b60..e0dc033aae0f 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -19,7 +19,6 @@
 #include <linux/regmap.h>
 #include <linux/mfd/palmas.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/regulator/of_regulator.h>
 
 static const struct linear_range smps_low_ranges[] = {
@@ -1601,16 +1600,13 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	struct palmas_pmic *pmic;
 	const char *pdev_name;
-	const struct of_device_id *match;
 	int ret = 0;
 	unsigned int reg;
 
-	match = of_match_device(of_match_ptr(of_palmas_match_tbl), &pdev->dev);
-
-	if (!match)
+	driver_data = (struct palmas_pmic_driver_data *)device_get_match_data(&pdev->dev);
+	if (!driver_data)
 		return -ENODATA;
 
-	driver_data = (struct palmas_pmic_driver_data *)match->data;
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index a8698ca61143..ba3f9391565f 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -764,7 +764,6 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regulator_config cfg = {};
 	struct device_node *reg_node;
-	const struct of_device_id *match;
 	const struct labibb_regulator_data *reg_data;
 	struct regmap *reg_regmap;
 	unsigned int type;
@@ -776,11 +775,11 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	match = of_match_device(qcom_labibb_match, &pdev->dev);
-	if (!match)
+	reg_data = device_get_match_data(&pdev->dev);
+	if (!reg_data)
 		return -ENODEV;
 
-	for (reg_data = match->data; reg_data->name; reg_data++) {
+	for (; reg_data->name; reg_data++) {
 		char *sc_irq_name;
 		int irq = 0;
 
diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 9366488f0383..2d5fec1457d1 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -937,7 +937,6 @@ MODULE_DEVICE_TABLE(of, rpm_of_match);
 static int rpm_reg_probe(struct platform_device *pdev)
 {
 	const struct rpm_regulator_data *reg;
-	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct qcom_rpm_reg *vreg;
@@ -949,13 +948,13 @@ static int rpm_reg_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	match = of_match_device(rpm_of_match, &pdev->dev);
-	if (!match) {
+	reg = device_get_match_data(&pdev->dev);
+	if (!reg) {
 		dev_err(&pdev->dev, "failed to match device\n");
 		return -ENODEV;
 	}
 
-	for (reg = match->data; reg->name; reg++) {
+	for (; reg->name; reg++) {
 		vreg = devm_kmemdup(&pdev->dev, reg->template, sizeof(*vreg), GFP_KERNEL);
 		if (!vreg)
 			return -ENOMEM;
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index fe32fd53f683..94f9092b29ef 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -2468,7 +2468,6 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 {
 	const struct spmi_regulator_data *reg;
 	const struct spmi_voltage_range *range;
-	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct spmi_regulator *vreg;
@@ -2491,8 +2490,8 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
-	match = of_match_device(qcom_spmi_regulator_match, &pdev->dev);
-	if (!match)
+	reg = device_get_match_data(&pdev->dev);
+	if (!reg)
 		return -ENODEV;
 
 	if (of_find_property(node, "qcom,saw-reg", &lenp)) {
@@ -2503,7 +2502,7 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			dev_err(dev, "ERROR reading SAW regmap\n");
 	}
 
-	for (reg = match->data; reg->name; reg++) {
+	for (; reg->name; reg++) {
 
 		if (saw_regmap) {
 			reg_node = of_get_child_by_name(node, reg->name);
diff --git a/drivers/regulator/stm32-booster.c b/drivers/regulator/stm32-booster.c
index b64dc5a497fa..2cdc7f0474f8 100644
--- a/drivers/regulator/stm32-booster.c
+++ b/drivers/regulator/stm32-booster.c
@@ -4,7 +4,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
@@ -83,8 +83,7 @@ static int stm32_booster_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	desc = (const struct regulator_desc *)
-		of_match_device(dev->driver->of_match_table, dev)->data;
+	desc = device_get_match_data(dev);
 
 	config.regmap = regmap;
 	config.dev = dev;
diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
index 86d2d80b4b41..f48214e2c3b4 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
@@ -688,7 +687,6 @@ MODULE_DEVICE_TABLE(of, ti_abb_of_match);
 static int ti_abb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	struct resource *res;
 	struct ti_abb *abb;
 	struct regulator_init_data *initdata = NULL;
@@ -699,21 +697,15 @@ static int ti_abb_probe(struct platform_device *pdev)
 	char *pname;
 	int ret = 0;
 
-	match = of_match_device(ti_abb_of_match, dev);
-	if (!match) {
-		/* We do not expect this to happen */
-		dev_err(dev, "%s: Unable to match device\n", __func__);
-		return -ENODEV;
-	}
-	if (!match->data) {
-		dev_err(dev, "%s: Bad data in match\n", __func__);
-		return -EINVAL;
-	}
-
 	abb = devm_kzalloc(dev, sizeof(struct ti_abb), GFP_KERNEL);
 	if (!abb)
 		return -ENOMEM;
-	abb->regs = match->data;
+
+	abb->regs = device_get_match_data(dev);
+	if (!abb->regs) {
+		dev_err(dev, "%s: Bad data in match\n", __func__);
+		return -EINVAL;
+	}
 
 	/* Map ABB resources */
 	if (abb->regs->setup_off || abb->regs->control_off) {
@@ -866,7 +858,7 @@ static struct platform_driver ti_abb_driver = {
 	.driver = {
 		   .name = "ti_abb",
 		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		   .of_match_table = of_match_ptr(ti_abb_of_match),
+		   .of_match_table = ti_abb_of_match,
 		   },
 };
 module_platform_driver(ti_abb_driver);
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
