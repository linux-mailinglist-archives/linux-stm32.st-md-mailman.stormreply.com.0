Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803DB3421E
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:54:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CFEEC3FAD9;
	Mon, 25 Aug 2025 13:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A5B3C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130065; x=1787666065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U48tPbCIJ9NQaklJSLuRIMf1KS5ihY1cbv332984crM=;
 b=hLmWBgFYBBLj5m+F/K1xkM/JG9rHhoIFWHWG+1Rds3sz8YHeK8s2jUgF
 CpfGWdnXwAFosOmVgDLJpgvazseHrLr2dzhgMU4G+oWvTIwGXJPeOeZ9e
 YsBTa032U5MraO4XKnGHlDBID/lUnY5BwqqgN2S00uJXzxykJNCjYLZnX
 UmOVGR1AxSfZlrrMo/GDIXIlwNkH6fNd+r8QXIXWmsNd3Rg0kH1DRbq4A
 7n24q07DQR9qXrTve1ZphQ/hKMj+jCtv3YOaiumXXegxmjcWxIxIWDzaj
 0G8wit4W0VgBTKsOmqSdSNKlEAR3mCvzhrprgvt/MaZUowxXKjglPlhe5 w==;
X-CSE-ConnectionGUID: M3KvC/ioTL+20TjW9YXySg==
X-CSE-MsgGUID: TL94yuAvRB+bTT6zToRBSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936635"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68936635"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:22 -0700
X-CSE-ConnectionGUID: WpLR7qKETyGhuiOyj7KDiA==
X-CSE-MsgGUID: wzivSFJ4Q5m5VGK2nhbq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168547679"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.7])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id B892E121F65;
 Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1uqXe5-00000007PO2-2rZ4; Mon, 25 Aug 2025 16:54:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
 Waqar Hameed <waqar.hameed@axis.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Bo Liu <liubo03@inspur.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Sean Nyekjaer <sean@geanix.com>,
 Frank Li <Frank.Li@nxp.com>, Han Xu <han.xu@nxp.com>,
 Rayyan Ansari <rayyan@ansari.sh>, Gustavo Vaz <gustavo.vaz@usp.br>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Alexandru Ardelean <aardelean@baylibre.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Abhash Jha <abhashkumarjha123@gmail.com>,
 chuguangqing <chuguangqing@inspur.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Laight <david.laight@aculab.com>, Jakob Hauser <jahau@rocketmail.com>
Date: Mon, 25 Aug 2025 16:53:50 +0300
Message-ID: <20250825135401.1765847-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/12] iio: accel: Remove redundant
	pm_runtime_mark_last_busy() calls
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/iio/accel/bmc150-accel-core.c | 7 ++-----
 drivers/iio/accel/bmi088-accel-core.c | 3 ---
 drivers/iio/accel/fxls8962af-core.c   | 1 -
 drivers/iio/accel/kxcjk-1013.c        | 4 +---
 drivers/iio/accel/kxsd9.c             | 3 ---
 drivers/iio/accel/mma8452.c           | 7 ++-----
 drivers/iio/accel/mma9551_core.c      | 5 +----
 drivers/iio/accel/msa311.c            | 6 ------
 8 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index be5fbb0c5d29..3c5d1560b163 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -332,13 +332,10 @@ static int bmc150_accel_set_power_state(struct bmc150_accel_data *data, bool on)
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
-	if (on) {
+	if (on)
 		ret = pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
+	else
 		ret = pm_runtime_put_autosuspend(dev);
-	}
-
 	if (ret < 0) {
 		dev_err(dev,
 			"Failed: %s for %d\n", __func__, on);
diff --git a/drivers/iio/accel/bmi088-accel-core.c b/drivers/iio/accel/bmi088-accel-core.c
index dea126f993c1..c7da90af0d2d 100644
--- a/drivers/iio/accel/bmi088-accel-core.c
+++ b/drivers/iio/accel/bmi088-accel-core.c
@@ -375,7 +375,6 @@ static int bmi088_accel_read_raw(struct iio_dev *indio_dev,
 	return -EINVAL;
 
 out_read_raw_pm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -419,7 +418,6 @@ static int bmi088_accel_write_raw(struct iio_dev *indio_dev,
 			return ret;
 
 		ret = bmi088_accel_set_scale(data, val, val2);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		return ret;
 	case IIO_CHAN_INFO_SAMP_FREQ:
@@ -428,7 +426,6 @@ static int bmi088_accel_write_raw(struct iio_dev *indio_dev,
 			return ret;
 
 		ret = bmi088_accel_set_sample_freq(data, val);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		return ret;
 	default:
diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index b10a30960e1e..8763e91c63d2 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -222,7 +222,6 @@ static int fxls8962af_power_off(struct fxls8962af_data *data)
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
-	pm_runtime_mark_last_busy(dev);
 	ret = pm_runtime_put_autosuspend(dev);
 	if (ret)
 		dev_err(dev, "failed to power off\n");
diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 6aefe8221296..2823ddde4bf2 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -636,10 +636,8 @@ static int kxcjk1013_set_power_state(struct kxcjk1013_data *data, bool on)
 
 	if (on)
 		ret = pm_runtime_resume_and_get(&data->client->dev);
-	else {
-		pm_runtime_mark_last_busy(&data->client->dev);
+	else
 		ret = pm_runtime_put_autosuspend(&data->client->dev);
-	}
 	if (ret < 0) {
 		dev_err(&data->client->dev,
 			"Failed: %s for %d\n", __func__, on);
diff --git a/drivers/iio/accel/kxsd9.c b/drivers/iio/accel/kxsd9.c
index cfc31265cdd0..4717d80fc24a 100644
--- a/drivers/iio/accel/kxsd9.c
+++ b/drivers/iio/accel/kxsd9.c
@@ -151,7 +151,6 @@ static int kxsd9_write_raw(struct iio_dev *indio_dev,
 		ret = kxsd9_write_scale(indio_dev, val2);
 	}
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return ret;
@@ -199,7 +198,6 @@ static int kxsd9_read_raw(struct iio_dev *indio_dev,
 	}
 
 error_ret:
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return ret;
@@ -250,7 +248,6 @@ static int kxsd9_buffer_postdisable(struct iio_dev *indio_dev)
 {
 	struct kxsd9_state *st = iio_priv(indio_dev);
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return 0;
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index aba444a980d9..15172ba2972c 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -224,13 +224,10 @@ static int mma8452_set_runtime_pm_state(struct i2c_client *client, bool on)
 #ifdef CONFIG_PM
 	int ret;
 
-	if (on) {
+	if (on)
 		ret = pm_runtime_resume_and_get(&client->dev);
-	} else {
-		pm_runtime_mark_last_busy(&client->dev);
+	else
 		ret = pm_runtime_put_autosuspend(&client->dev);
-	}
-
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"failed to change power state to %d\n", on);
diff --git a/drivers/iio/accel/mma9551_core.c b/drivers/iio/accel/mma9551_core.c
index 3e7d9b79ed0e..2ccb1fb19b96 100644
--- a/drivers/iio/accel/mma9551_core.c
+++ b/drivers/iio/accel/mma9551_core.c
@@ -671,11 +671,8 @@ int mma9551_set_power_state(struct i2c_client *client, bool on)
 
 	if (on)
 		ret = pm_runtime_resume_and_get(&client->dev);
-	else {
-		pm_runtime_mark_last_busy(&client->dev);
+	else
 		ret = pm_runtime_put_autosuspend(&client->dev);
-	}
-
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"failed to change power state to %d\n", on);
diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index 2ccb22317bdc..83dc2b97f630 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -607,7 +607,6 @@ static int msa311_read_raw_data(struct iio_dev *indio_dev,
 	err = msa311_get_axis(msa311, chan, &axis);
 	mutex_unlock(&msa311->lock);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	iio_device_release_direct(indio_dev);
@@ -741,7 +740,6 @@ static int msa311_write_scale(struct iio_dev *indio_dev, int val, int val2)
 			break;
 		}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	if (err)
@@ -781,7 +779,6 @@ static int msa311_write_samp_freq(struct iio_dev *indio_dev, int val, int val2)
 			break;
 		}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	iio_device_release_direct(indio_dev);
@@ -832,7 +829,6 @@ static int msa311_debugfs_reg_access(struct iio_dev *indio_dev,
 
 	mutex_unlock(&msa311->lock);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	if (err)
@@ -855,7 +851,6 @@ static int msa311_buffer_postdisable(struct iio_dev *indio_dev)
 	struct msa311_priv *msa311 = iio_priv(indio_dev);
 	struct device *dev = msa311->dev;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -1231,7 +1226,6 @@ static int msa311_probe(struct i2c_client *i2c)
 	if (err)
 		return err;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	err = devm_iio_device_register(dev, indio_dev);
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
