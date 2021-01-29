Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE8E30894D
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 14:22:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA24C57183;
	Fri, 29 Jan 2021 13:22:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB137C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 13:22:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10TDLwR6007564; Fri, 29 Jan 2021 14:22:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=tLBYQGPOA0spYh+4ag4lyjglX96cdJe+q4dtA6iMy7w=;
 b=rSlgIzYocrR6xO41XHZEzA6a2gAJ3KTTbPxTlFUls57eqlr56/yBrhvC+CVgCWvPpMHO
 CdmQDFpQM+OfftYNGXt9Dk7zFiffX7Q7X0E5It0yUn4UIW6KLflUtgLAE6rmiySfgFuJ
 QIV4CNZtzdzfVHHO47lSEzj5usHBEgZx1YCOAgSNFoapIHbZnRPiqfOC+xvB8pV/egie
 lL7WFCzdUB7vCXZdTBxeRX8EYXV7zMGuIIZBFLkbp7is4uloDnr0UXyN+QTAR/mcMXHk
 K+hDLIsH4k5As5L5Fr/294b4mG4b+H0osGd2K7NRfI7IkBe/78fbSZreymBiI1n0QESj HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368c16db75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 14:22:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD43210002A;
 Fri, 29 Jan 2021 14:22:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB98A24EE1A;
 Fri, 29 Jan 2021 14:22:46 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan 2021 14:22:46
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <jic23@kernel.org>, <vilhelm.gray@gmail.com>
Date: Fri, 29 Jan 2021 14:22:22 +0100
Message-ID: <1611926542-2490-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_05:2021-01-28,
 2021-01-29 signatures=0
Cc: alexandre.torgue@st.com, linux-doc@vger.kernel.org,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, lukas.bulwahn@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] counter: stm32-lptimer-cnt: remove iio
	counter abi
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

Currently, the STM32 LP Timer counter driver registers into both IIO and
counter subsystems, which is redundant.

Remove the IIO counter ABI and IIO registration from the STM32 LP Timer
counter driver since it's been superseded by the Counter subsystem
as discussed in [1].

Keep only the counter subsystem related part.
Move a part of the ABI documentation into a driver comment.

This also removes a duplicate ABI warning
$ scripts/get_abi.pl validate
...
/sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:
  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100
  ./Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0

[1] https://lkml.org/lkml/2021/1/19/347

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- remove dependency on IIO subsustem, as spotted by William
---
 .../ABI/testing/sysfs-bus-iio-lptimer-stm32        |  62 -----
 drivers/counter/Kconfig                            |   2 +-
 drivers/counter/stm32-lptimer-cnt.c                | 297 +++------------------
 3 files changed, 37 insertions(+), 324 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32
deleted file mode 100644
index 73498ff..00000000
--- a/Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32
+++ /dev/null
@@ -1,62 +0,0 @@
-What:		/sys/bus/iio/devices/iio:deviceX/in_count0_preset
-KernelVersion:	4.13
-Contact:	fabrice.gasnier@st.com
-Description:
-		Reading returns the current preset value. Writing sets the
-		preset value. Encoder counts continuously from 0 to preset
-		value, depending on direction (up/down).
-
-What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
-KernelVersion:	4.13
-Contact:	fabrice.gasnier@st.com
-Description:
-		Reading returns the list possible quadrature modes.
-
-What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
-KernelVersion:	4.13
-Contact:	fabrice.gasnier@st.com
-Description:
-		Configure the device counter quadrature modes:
-
-		- non-quadrature:
-			Encoder IN1 input servers as the count input (up
-			direction).
-
-		- quadrature:
-			Encoder IN1 and IN2 inputs are mixed to get direction
-			and count.
-
-What:		/sys/bus/iio/devices/iio:deviceX/in_count_polarity_available
-KernelVersion:	4.13
-Contact:	fabrice.gasnier@st.com
-Description:
-		Reading returns the list possible active edges.
-
-What:		/sys/bus/iio/devices/iio:deviceX/in_count0_polarity
-KernelVersion:	4.13
-Contact:	fabrice.gasnier@st.com
-Description:
-		Configure the device encoder/counter active edge:
-
-		- rising-edge
-		- falling-edge
-		- both-edges
-
-		In non-quadrature mode, device counts up on active edge.
-
-		In quadrature mode, encoder counting scenarios are as follows:
-
-		+---------+----------+--------------------+--------------------+
-		| Active  | Level on |      IN1 signal    |     IN2 signal     |
-		| edge    | opposite +----------+---------+----------+---------+
-		|         | signal   |  Rising  | Falling |  Rising  | Falling |
-		+---------+----------+----------+---------+----------+---------+
-		| Rising  | High ->  |   Down   |    -    |   Up     |    -    |
-		| edge    | Low  ->  |   Up     |    -    |   Down   |    -    |
-		+---------+----------+----------+---------+----------+---------+
-		| Falling | High ->  |    -     |   Up    |    -     |   Down  |
-		| edge    | Low  ->  |    -     |   Down  |    -     |   Up    |
-		+---------+----------+----------+---------+----------+---------+
-		| Both    | High ->  |   Down   |   Up    |   Up     |   Down  |
-		| edges   | Low  ->  |   Up     |   Down  |   Down   |   Up    |
-		+---------+----------+----------+---------+----------+---------+
diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index 2de53ab..cbdf842 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -41,7 +41,7 @@ config STM32_TIMER_CNT
 
 config STM32_LPTIMER_CNT
 	tristate "STM32 LP Timer encoder counter driver"
-	depends on (MFD_STM32_LPTIMER || COMPILE_TEST) && IIO
+	depends on MFD_STM32_LPTIMER || COMPILE_TEST
 	help
 	  Select this option to enable STM32 Low-Power Timer quadrature encoder
 	  and counter driver.
diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index fd6828e..9374396 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -12,8 +12,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/counter.h>
-#include <linux/iio/iio.h>
 #include <linux/mfd/stm32-lptimer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -107,249 +107,27 @@ static int stm32_lptim_setup(struct stm32_lptim_cnt *priv, int enable)
 	return regmap_update_bits(priv->regmap, STM32_LPTIM_CFGR, mask, val);
 }
 
-static int stm32_lptim_write_raw(struct iio_dev *indio_dev,
-				 struct iio_chan_spec const *chan,
-				 int val, int val2, long mask)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-	int ret;
-
-	switch (mask) {
-	case IIO_CHAN_INFO_ENABLE:
-		if (val < 0 || val > 1)
-			return -EINVAL;
-
-		/* Check nobody uses the timer, or already disabled/enabled */
-		ret = stm32_lptim_is_enabled(priv);
-		if ((ret < 0) || (!ret && !val))
-			return ret;
-		if (val && ret)
-			return -EBUSY;
-
-		ret = stm32_lptim_setup(priv, val);
-		if (ret)
-			return ret;
-		return stm32_lptim_set_enable_state(priv, val);
-
-	default:
-		return -EINVAL;
-	}
-}
-
-static int stm32_lptim_read_raw(struct iio_dev *indio_dev,
-				struct iio_chan_spec const *chan,
-				int *val, int *val2, long mask)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-	u32 dat;
-	int ret;
-
-	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
-		ret = regmap_read(priv->regmap, STM32_LPTIM_CNT, &dat);
-		if (ret)
-			return ret;
-		*val = dat;
-		return IIO_VAL_INT;
-
-	case IIO_CHAN_INFO_ENABLE:
-		ret = stm32_lptim_is_enabled(priv);
-		if (ret < 0)
-			return ret;
-		*val = ret;
-		return IIO_VAL_INT;
-
-	case IIO_CHAN_INFO_SCALE:
-		/* Non-quadrature mode: scale = 1 */
-		*val = 1;
-		*val2 = 0;
-		if (priv->quadrature_mode) {
-			/*
-			 * Quadrature encoder mode:
-			 * - both edges, quarter cycle, scale is 0.25
-			 * - either rising/falling edge scale is 0.5
-			 */
-			if (priv->polarity > 1)
-				*val2 = 2;
-			else
-				*val2 = 1;
-		}
-		return IIO_VAL_FRACTIONAL_LOG2;
-
-	default:
-		return -EINVAL;
-	}
-}
-
-static const struct iio_info stm32_lptim_cnt_iio_info = {
-	.read_raw = stm32_lptim_read_raw,
-	.write_raw = stm32_lptim_write_raw,
-};
-
-static const char *const stm32_lptim_quadrature_modes[] = {
-	"non-quadrature",
-	"quadrature",
-};
-
-static int stm32_lptim_get_quadrature_mode(struct iio_dev *indio_dev,
-					   const struct iio_chan_spec *chan)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	return priv->quadrature_mode;
-}
-
-static int stm32_lptim_set_quadrature_mode(struct iio_dev *indio_dev,
-					   const struct iio_chan_spec *chan,
-					   unsigned int type)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	if (stm32_lptim_is_enabled(priv))
-		return -EBUSY;
-
-	priv->quadrature_mode = type;
-
-	return 0;
-}
-
-static const struct iio_enum stm32_lptim_quadrature_mode_en = {
-	.items = stm32_lptim_quadrature_modes,
-	.num_items = ARRAY_SIZE(stm32_lptim_quadrature_modes),
-	.get = stm32_lptim_get_quadrature_mode,
-	.set = stm32_lptim_set_quadrature_mode,
-};
-
-static const char * const stm32_lptim_cnt_polarity[] = {
-	"rising-edge", "falling-edge", "both-edges",
-};
-
-static int stm32_lptim_cnt_get_polarity(struct iio_dev *indio_dev,
-					const struct iio_chan_spec *chan)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	return priv->polarity;
-}
-
-static int stm32_lptim_cnt_set_polarity(struct iio_dev *indio_dev,
-					const struct iio_chan_spec *chan,
-					unsigned int type)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	if (stm32_lptim_is_enabled(priv))
-		return -EBUSY;
-
-	priv->polarity = type;
-
-	return 0;
-}
-
-static const struct iio_enum stm32_lptim_cnt_polarity_en = {
-	.items = stm32_lptim_cnt_polarity,
-	.num_items = ARRAY_SIZE(stm32_lptim_cnt_polarity),
-	.get = stm32_lptim_cnt_get_polarity,
-	.set = stm32_lptim_cnt_set_polarity,
-};
-
-static ssize_t stm32_lptim_cnt_get_ceiling(struct stm32_lptim_cnt *priv,
-					   char *buf)
-{
-	return snprintf(buf, PAGE_SIZE, "%u\n", priv->ceiling);
-}
-
-static ssize_t stm32_lptim_cnt_set_ceiling(struct stm32_lptim_cnt *priv,
-					   const char *buf, size_t len)
-{
-	int ret;
-
-	if (stm32_lptim_is_enabled(priv))
-		return -EBUSY;
-
-	ret = kstrtouint(buf, 0, &priv->ceiling);
-	if (ret)
-		return ret;
-
-	if (priv->ceiling > STM32_LPTIM_MAX_ARR)
-		return -EINVAL;
-
-	return len;
-}
-
-static ssize_t stm32_lptim_cnt_get_preset_iio(struct iio_dev *indio_dev,
-					      uintptr_t private,
-					      const struct iio_chan_spec *chan,
-					      char *buf)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	return stm32_lptim_cnt_get_ceiling(priv, buf);
-}
-
-static ssize_t stm32_lptim_cnt_set_preset_iio(struct iio_dev *indio_dev,
-					      uintptr_t private,
-					      const struct iio_chan_spec *chan,
-					      const char *buf, size_t len)
-{
-	struct stm32_lptim_cnt *priv = iio_priv(indio_dev);
-
-	return stm32_lptim_cnt_set_ceiling(priv, buf, len);
-}
-
-/* LP timer with encoder */
-static const struct iio_chan_spec_ext_info stm32_lptim_enc_ext_info[] = {
-	{
-		.name = "preset",
-		.shared = IIO_SEPARATE,
-		.read = stm32_lptim_cnt_get_preset_iio,
-		.write = stm32_lptim_cnt_set_preset_iio,
-	},
-	IIO_ENUM("polarity", IIO_SEPARATE, &stm32_lptim_cnt_polarity_en),
-	IIO_ENUM_AVAILABLE("polarity", &stm32_lptim_cnt_polarity_en),
-	IIO_ENUM("quadrature_mode", IIO_SEPARATE,
-		 &stm32_lptim_quadrature_mode_en),
-	IIO_ENUM_AVAILABLE("quadrature_mode", &stm32_lptim_quadrature_mode_en),
-	{}
-};
-
-static const struct iio_chan_spec stm32_lptim_enc_channels = {
-	.type = IIO_COUNT,
-	.channel = 0,
-	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
-			      BIT(IIO_CHAN_INFO_ENABLE) |
-			      BIT(IIO_CHAN_INFO_SCALE),
-	.ext_info = stm32_lptim_enc_ext_info,
-	.indexed = 1,
-};
-
-/* LP timer without encoder (counter only) */
-static const struct iio_chan_spec_ext_info stm32_lptim_cnt_ext_info[] = {
-	{
-		.name = "preset",
-		.shared = IIO_SEPARATE,
-		.read = stm32_lptim_cnt_get_preset_iio,
-		.write = stm32_lptim_cnt_set_preset_iio,
-	},
-	IIO_ENUM("polarity", IIO_SEPARATE, &stm32_lptim_cnt_polarity_en),
-	IIO_ENUM_AVAILABLE("polarity", &stm32_lptim_cnt_polarity_en),
-	{}
-};
-
-static const struct iio_chan_spec stm32_lptim_cnt_channels = {
-	.type = IIO_COUNT,
-	.channel = 0,
-	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
-			      BIT(IIO_CHAN_INFO_ENABLE) |
-			      BIT(IIO_CHAN_INFO_SCALE),
-	.ext_info = stm32_lptim_cnt_ext_info,
-	.indexed = 1,
-};
-
 /**
  * enum stm32_lptim_cnt_function - enumerates LPTimer counter & encoder modes
  * @STM32_LPTIM_COUNTER_INCREASE: up count on IN1 rising, falling or both edges
  * @STM32_LPTIM_ENCODER_BOTH_EDGE: count on both edges (IN1 & IN2 quadrature)
+ *
+ * In non-quadrature mode, device counts up on active edge.
+ * In quadrature mode, encoder counting scenarios are as follows:
+ * +---------+----------+--------------------+--------------------+
+ * | Active  | Level on |      IN1 signal    |     IN2 signal     |
+ * | edge    | opposite +----------+---------+----------+---------+
+ * |         | signal   |  Rising  | Falling |  Rising  | Falling |
+ * +---------+----------+----------+---------+----------+---------+
+ * | Rising  | High ->  |   Down   |    -    |   Up     |    -    |
+ * | edge    | Low  ->  |   Up     |    -    |   Down   |    -    |
+ * +---------+----------+----------+---------+----------+---------+
+ * | Falling | High ->  |    -     |   Up    |    -     |   Down  |
+ * | edge    | Low  ->  |    -     |   Down  |    -     |   Up    |
+ * +---------+----------+----------+---------+----------+---------+
+ * | Both    | High ->  |   Down   |   Up    |   Up     |   Down  |
+ * | edges   | Low  ->  |   Up     |   Down  |   Down   |   Up    |
+ * +---------+----------+----------+---------+----------+---------+
  */
 enum stm32_lptim_cnt_function {
 	STM32_LPTIM_COUNTER_INCREASE,
@@ -484,7 +262,7 @@ static ssize_t stm32_lptim_cnt_ceiling_read(struct counter_device *counter,
 {
 	struct stm32_lptim_cnt *const priv = counter->priv;
 
-	return stm32_lptim_cnt_get_ceiling(priv, buf);
+	return snprintf(buf, PAGE_SIZE, "%u\n", priv->ceiling);
 }
 
 static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *counter,
@@ -493,8 +271,22 @@ static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *counter,
 					     const char *buf, size_t len)
 {
 	struct stm32_lptim_cnt *const priv = counter->priv;
+	unsigned int ceiling;
+	int ret;
+
+	if (stm32_lptim_is_enabled(priv))
+		return -EBUSY;
+
+	ret = kstrtouint(buf, 0, &ceiling);
+	if (ret)
+		return ret;
+
+	if (ceiling > STM32_LPTIM_MAX_ARR)
+		return -EINVAL;
+
+	priv->ceiling = ceiling;
 
-	return stm32_lptim_cnt_set_ceiling(priv, buf, len);
+	return len;
 }
 
 static const struct counter_count_ext stm32_lptim_cnt_ext[] = {
@@ -630,32 +422,19 @@ static int stm32_lptim_cnt_probe(struct platform_device *pdev)
 {
 	struct stm32_lptimer *ddata = dev_get_drvdata(pdev->dev.parent);
 	struct stm32_lptim_cnt *priv;
-	struct iio_dev *indio_dev;
-	int ret;
 
 	if (IS_ERR_OR_NULL(ddata))
 		return -EINVAL;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*priv));
-	if (!indio_dev)
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	priv = iio_priv(indio_dev);
 	priv->dev = &pdev->dev;
 	priv->regmap = ddata->regmap;
 	priv->clk = ddata->clk;
 	priv->ceiling = STM32_LPTIM_MAX_ARR;
 
-	/* Initialize IIO device */
-	indio_dev->name = dev_name(&pdev->dev);
-	indio_dev->dev.of_node = pdev->dev.of_node;
-	indio_dev->info = &stm32_lptim_cnt_iio_info;
-	if (ddata->has_encoder)
-		indio_dev->channels = &stm32_lptim_enc_channels;
-	else
-		indio_dev->channels = &stm32_lptim_cnt_channels;
-	indio_dev->num_channels = 1;
-
 	/* Initialize Counter device */
 	priv->counter.name = dev_name(&pdev->dev);
 	priv->counter.parent = &pdev->dev;
@@ -673,10 +452,6 @@ static int stm32_lptim_cnt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_iio_device_register(&pdev->dev, indio_dev);
-	if (ret)
-		return ret;
-
 	return devm_counter_register(&pdev->dev, &priv->counter);
 }
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
