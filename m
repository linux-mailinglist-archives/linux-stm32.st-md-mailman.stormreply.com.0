Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D1B34223
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:54:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB1AEC3FADD;
	Mon, 25 Aug 2025 13:54:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB137C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130072; x=1787666072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRR0plu8SYXqyVRth71qqQ/aAQawpUOpDZtM4lvjubk=;
 b=L+qrTd9HqsC4SsKfpHlYHwfpzA3FoD3GW5aaeOxCg+pS3E/BiDD1WPHq
 YY+xTWov2w7JhQJeZ1BnKU1ZZPSI3WyWxObefJZw5uojnbtxo+Llg5imj
 r7TlBShjw7kwC2Su8EZWMeubkMYKqfD2q1AtxhpoV7n5X22mH3/nO6awI
 jPDz1PCU1/jAzC7gbhcQkGDob6jMFVZS9YBr8AL5bC+JDNLuTttrRByY4
 Cx0MgqbuLgOPsQUeFsUpwQUf9hLhYXflVfkPk3uNU2eG3mFPoz6KEwQ3F
 N+MM+oYZGoAspekguXYdhzA2UL7oY3iaDT+EIbmYrY0iHnMq/4qrV9ZuW Q==;
X-CSE-ConnectionGUID: Uw7CFeSOSRGtAAdWN7uOXQ==
X-CSE-MsgGUID: hjY+rm+hT7Gw/9V6IOdhPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936840"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68936840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:29 -0700
X-CSE-ConnectionGUID: NSethckKQ/e9N5zzLrUNbQ==
X-CSE-MsgGUID: 6o58nIBvQX2dZ/CRqIrXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168547693"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.7])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id D0299121F73;
 Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1uqXe5-00000007POZ-3Rcg; Mon, 25 Aug 2025 16:54:01 +0300
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
Date: Mon, 25 Aug 2025 16:53:57 +0300
Message-ID: <20250825135401.1765847-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 08/12] iio: light: Remove redundant
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/iio/light/apds9306.c   |  2 --
 drivers/iio/light/apds9960.c   |  1 -
 drivers/iio/light/bh1780.c     |  1 -
 drivers/iio/light/gp2ap002.c   |  2 --
 drivers/iio/light/isl29028.c   | 11 +++--------
 drivers/iio/light/ltrf216a.c   |  1 -
 drivers/iio/light/pa12203001.c | 11 +++--------
 drivers/iio/light/rpr0521.c    |  6 ++----
 drivers/iio/light/tsl2583.c    | 12 +++---------
 drivers/iio/light/tsl2591.c    |  2 --
 drivers/iio/light/us5182d.c    | 12 +++---------
 drivers/iio/light/vcnl4000.c   | 11 +++--------
 drivers/iio/light/vcnl4035.c   | 11 +++--------
 13 files changed, 20 insertions(+), 63 deletions(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index 5eb33e8e3ad9..389125675caa 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -537,7 +537,6 @@ static int apds9306_read_data(struct apds9306_data *data, int *val, int reg)
 
 	*val = get_unaligned_le24(&buff);
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return 0;
@@ -1121,7 +1120,6 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
 			if (ret)
 				return ret;
 
-			pm_runtime_mark_last_busy(data->dev);
 			pm_runtime_put_autosuspend(data->dev);
 
 			return 0;
diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index b92d0fce5aec..79b202c59a0f 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -495,7 +495,6 @@ static int apds9960_set_power_state(struct apds9960_data *data, bool on)
 			usleep_range(data->als_adc_int_us,
 				     APDS9960_MAX_INT_TIME_IN_US);
 	} else {
-		pm_runtime_mark_last_busy(dev);
 		ret = pm_runtime_put_autosuspend(dev);
 	}
 
diff --git a/drivers/iio/light/bh1780.c b/drivers/iio/light/bh1780.c
index c7c877d2fe67..5d3c6d5276ba 100644
--- a/drivers/iio/light/bh1780.c
+++ b/drivers/iio/light/bh1780.c
@@ -111,7 +111,6 @@ static int bh1780_read_raw(struct iio_dev *indio_dev,
 			value = bh1780_read_word(bh1780, BH1780_REG_DLOW);
 			if (value < 0)
 				return value;
-			pm_runtime_mark_last_busy(&bh1780->client->dev);
 			pm_runtime_put_autosuspend(&bh1780->client->dev);
 			*val = value;
 
diff --git a/drivers/iio/light/gp2ap002.c b/drivers/iio/light/gp2ap002.c
index 42859e5b1089..a0d8a58f2704 100644
--- a/drivers/iio/light/gp2ap002.c
+++ b/drivers/iio/light/gp2ap002.c
@@ -271,7 +271,6 @@ static int gp2ap002_read_raw(struct iio_dev *indio_dev,
 	}
 
 out:
-	pm_runtime_mark_last_busy(gp2ap002->dev);
 	pm_runtime_put_autosuspend(gp2ap002->dev);
 
 	return ret;
@@ -353,7 +352,6 @@ static int gp2ap002_write_event_config(struct iio_dev *indio_dev,
 		pm_runtime_get_sync(gp2ap002->dev);
 		gp2ap002->enabled = true;
 	} else {
-		pm_runtime_mark_last_busy(gp2ap002->dev);
 		pm_runtime_put_autosuspend(gp2ap002->dev);
 		gp2ap002->enabled = false;
 	}
diff --git a/drivers/iio/light/isl29028.c b/drivers/iio/light/isl29028.c
index 0e4284823d44..374bccad9119 100644
--- a/drivers/iio/light/isl29028.c
+++ b/drivers/iio/light/isl29028.c
@@ -336,16 +336,11 @@ static int isl29028_ir_get(struct isl29028_chip *chip, int *ir_data)
 static int isl29028_set_pm_runtime_busy(struct isl29028_chip *chip, bool on)
 {
 	struct device *dev = regmap_get_device(chip->regmap);
-	int ret;
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
-		ret = pm_runtime_put_autosuspend(dev);
-	}
+	if (on)
+		return pm_runtime_resume_and_get(dev);
 
-	return ret;
+	return pm_runtime_put_autosuspend(dev);
 }
 
 /* Channel IO */
diff --git a/drivers/iio/light/ltrf216a.c b/drivers/iio/light/ltrf216a.c
index 61f57a82b872..5f27f754fe1c 100644
--- a/drivers/iio/light/ltrf216a.c
+++ b/drivers/iio/light/ltrf216a.c
@@ -208,7 +208,6 @@ static int ltrf216a_set_power_state(struct ltrf216a_data *data, bool on)
 			return ret;
 		}
 	} else {
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 
diff --git a/drivers/iio/light/pa12203001.c b/drivers/iio/light/pa12203001.c
index 8885852bef22..98a1f1624c75 100644
--- a/drivers/iio/light/pa12203001.c
+++ b/drivers/iio/light/pa12203001.c
@@ -185,15 +185,10 @@ static int pa12203001_set_power_state(struct pa12203001_data *data, bool on,
 		mutex_unlock(&data->lock);
 	}
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(&data->client->dev);
+	if (on)
+		return pm_runtime_resume_and_get(&data->client->dev);
 
-	} else {
-		pm_runtime_mark_last_busy(&data->client->dev);
-		ret = pm_runtime_put_autosuspend(&data->client->dev);
-	}
-
-	return ret;
+	return pm_runtime_put_autosuspend(&data->client->dev);
 
 err:
 	mutex_unlock(&data->lock);
diff --git a/drivers/iio/light/rpr0521.c b/drivers/iio/light/rpr0521.c
index fbd116272921..9341c1d58cbe 100644
--- a/drivers/iio/light/rpr0521.c
+++ b/drivers/iio/light/rpr0521.c
@@ -358,12 +358,10 @@ static int rpr0521_set_power_state(struct rpr0521_data *data, bool on,
 	 * Note: If either measurement is re-enabled before _suspend(),
 	 * both stay enabled until _suspend().
 	 */
-	if (on) {
+	if (on)
 		ret = pm_runtime_resume_and_get(&data->client->dev);
-	} else {
-		pm_runtime_mark_last_busy(&data->client->dev);
+	else
 		ret = pm_runtime_put_autosuspend(&data->client->dev);
-	}
 	if (ret < 0) {
 		dev_err(&data->client->dev,
 			"Failed: rpr0521_set_power_state for %d, ret %d\n",
diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
index fc3b0c4226be..8801a491de77 100644
--- a/drivers/iio/light/tsl2583.c
+++ b/drivers/iio/light/tsl2583.c
@@ -641,16 +641,10 @@ static const struct iio_chan_spec tsl2583_channels[] = {
 
 static int tsl2583_set_pm_runtime_busy(struct tsl2583_chip *chip, bool on)
 {
-	int ret;
+	if (on)
+		return pm_runtime_resume_and_get(&chip->client->dev);
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(&chip->client->dev);
-	} else {
-		pm_runtime_mark_last_busy(&chip->client->dev);
-		ret = pm_runtime_put_autosuspend(&chip->client->dev);
-	}
-
-	return ret;
+	return pm_runtime_put_autosuspend(&chip->client->dev);
 }
 
 static int tsl2583_read_raw(struct iio_dev *indio_dev,
diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index 08476f193a44..c5557867ea43 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -772,7 +772,6 @@ static int tsl2591_read_raw(struct iio_dev *indio_dev,
 err_unlock:
 	mutex_unlock(&chip->als_mutex);
 
-	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
@@ -995,7 +994,6 @@ static int tsl2591_write_event_config(struct iio_dev *indio_dev,
 		pm_runtime_get_sync(&client->dev);
 	} else if (!state && chip->events_enabled) {
 		chip->events_enabled = false;
-		pm_runtime_mark_last_busy(&client->dev);
 		pm_runtime_put_autosuspend(&client->dev);
 	}
 
diff --git a/drivers/iio/light/us5182d.c b/drivers/iio/light/us5182d.c
index 61a0957317a1..d2f5a44892a8 100644
--- a/drivers/iio/light/us5182d.c
+++ b/drivers/iio/light/us5182d.c
@@ -361,19 +361,13 @@ static int us5182d_shutdown_en(struct us5182d_data *data, u8 state)
 
 static int us5182d_set_power_state(struct us5182d_data *data, bool on)
 {
-	int ret;
-
 	if (data->power_mode == US5182D_ONESHOT)
 		return 0;
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(&data->client->dev);
-	} else {
-		pm_runtime_mark_last_busy(&data->client->dev);
-		ret = pm_runtime_put_autosuspend(&data->client->dev);
-	}
+	if (on)
+		return pm_runtime_resume_and_get(&data->client->dev);
 
-	return ret;
+	return pm_runtime_put_autosuspend(&data->client->dev);
 }
 
 static int us5182d_read_value(struct us5182d_data *data,
diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index cc81a30b7c70..4dbb2294a843 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -576,16 +576,11 @@ static bool vcnl4010_is_in_periodic_mode(struct vcnl4000_data *data)
 static int vcnl4000_set_pm_runtime_state(struct vcnl4000_data *data, bool on)
 {
 	struct device *dev = &data->client->dev;
-	int ret;
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
-		ret = pm_runtime_put_autosuspend(dev);
-	}
+	if (on)
+		return pm_runtime_resume_and_get(dev);
 
-	return ret;
+	return pm_runtime_put_autosuspend(dev);
 }
 
 static int vcnl4040_read_als_it(struct vcnl4000_data *data, int *val, int *val2)
diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
index 01bc99564f98..963747927425 100644
--- a/drivers/iio/light/vcnl4035.c
+++ b/drivers/iio/light/vcnl4035.c
@@ -141,17 +141,12 @@ static const struct iio_trigger_ops vcnl4035_trigger_ops = {
 
 static int vcnl4035_set_pm_runtime_state(struct vcnl4035_data *data, bool on)
 {
-	int ret;
 	struct device *dev = &data->client->dev;
 
-	if (on) {
-		ret = pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
-		ret = pm_runtime_put_autosuspend(dev);
-	}
+	if (on)
+		return pm_runtime_resume_and_get(dev);
 
-	return ret;
+	return pm_runtime_put_autosuspend(dev);
 }
 
 static int vcnl4035_read_info_raw(struct iio_dev *indio_dev,
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
