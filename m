Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13FB3421D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:54:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D879C3FADA;
	Mon, 25 Aug 2025 13:54:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67CC2C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130065; x=1787666065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Dy/OkspVYiSoMZ+GzZiTzasKvueFM0rAj4Y95Riw9Q=;
 b=MQAqqWTgnuAZcBn/W/L5g+n92m70DXtZ5U//0c4SROTY1wYhccVDLpXe
 pLlDJUNk7vooUFBmPWWLDlDdtwkNwFpgB+ut+g/HG1uXU1dRs/Gq+zE05
 fJWeXFQviyvaC5bIZn1MnAhtMUY9jrigWNyzAT2Dud3LGO5XY9BHKveJx
 uzeSejlUqyPthkply9zaFGHtrE8xDQBrBVym36DLgurSfcwXHHBAMJqgk
 3JIsZRDVRIBfpzvxdadF93nyf//+Q1ZnRQT2Doyg1SqYBabpD1Fuvw+11
 sa/mZieebYpHnulzIOxZeYygaUOi7F2fBZCRlOIGh+43g6MAg0YHssIib w==;
X-CSE-ConnectionGUID: NBjEBXCyT3GMzdfKxvzAQA==
X-CSE-MsgGUID: uhNJRBzTQAG8N/RE1/3n0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936619"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68936619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:22 -0700
X-CSE-ConnectionGUID: lZR2EtsBQtqamF6SGFdEKw==
X-CSE-MsgGUID: XJUCpIhgTQO8w9wStaDVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168547676"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.7])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id B7AC8121F62;
 Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1uqXe5-00000007PO6-2x3W; Mon, 25 Aug 2025 16:54:01 +0300
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
Date: Mon, 25 Aug 2025 16:53:51 +0300
Message-ID: <20250825135401.1765847-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 02/12] iio: adc: Remove redundant
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
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/iio/adc/ab8500-gpadc.c     |  1 -
 drivers/iio/adc/at91-sama5d2_adc.c | 13 +------------
 drivers/iio/adc/imx8qxp-adc.c      |  2 --
 drivers/iio/adc/imx93_adc.c        |  1 -
 drivers/iio/adc/rcar-gyroadc.c     |  8 +++-----
 drivers/iio/adc/rzg2l_adc.c        |  2 --
 drivers/iio/adc/stm32-adc-core.c   |  1 -
 drivers/iio/adc/stm32-adc.c        |  7 -------
 drivers/iio/adc/sun4i-gpadc-iio.c  |  2 --
 drivers/iio/adc/ti-ads1015.c       |  6 ++----
 drivers/iio/adc/ti-ads1100.c       |  1 -
 drivers/iio/adc/ti-ads1119.c       |  2 --
 12 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
index f3b057f92310..8eaa1dd6a89b 100644
--- a/drivers/iio/adc/ab8500-gpadc.c
+++ b/drivers/iio/adc/ab8500-gpadc.c
@@ -607,7 +607,6 @@ static int ab8500_gpadc_read(struct ab8500_gpadc *gpadc,
 	}
 
 	/* This eventually drops the regulator */
-	pm_runtime_mark_last_busy(gpadc->dev);
 	pm_runtime_put_autosuspend(gpadc->dev);
 
 	return (high_data << 8) | low_data;
diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index c3450246730e..b4c36e6a7490 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -896,7 +896,6 @@ static int at91_adc_config_emr(struct at91_adc_state *st,
 	emr |= osr | AT91_SAMA5D2_TRACKX(trackx);
 	at91_adc_writel(st, EMR, emr);
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	st->oversampling_ratio = oversampling_ratio;
@@ -971,7 +970,6 @@ static int at91_adc_configure_touch(struct at91_adc_state *st, bool state)
 				AT91_SAMA5D2_IER_PEN | AT91_SAMA5D2_IER_NOPEN);
 		at91_adc_writel(st, TSMR, 0);
 
-		pm_runtime_mark_last_busy(st->dev);
 		pm_runtime_put_autosuspend(st->dev);
 		return 0;
 	}
@@ -1142,10 +1140,8 @@ static int at91_adc_configure_trigger(struct iio_trigger *trig, bool state)
 
 	at91_adc_configure_trigger_registers(st, state);
 
-	if (!state) {
-		pm_runtime_mark_last_busy(st->dev);
+	if (!state)
 		pm_runtime_put_autosuspend(st->dev);
-	}
 
 	return 0;
 }
@@ -1336,7 +1332,6 @@ static int at91_adc_buffer_prepare(struct iio_dev *indio_dev)
 		at91_adc_writel(st, IER, AT91_SAMA5D2_IER_DRDY);
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 	return ret;
 }
@@ -1394,7 +1389,6 @@ static int at91_adc_buffer_postdisable(struct iio_dev *indio_dev)
 	if (st->dma_st.dma_chan)
 		dmaengine_terminate_sync(st->dma_st.dma_chan);
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return 0;
@@ -1603,7 +1597,6 @@ static void at91_adc_setup_samp_freq(struct iio_dev *indio_dev, unsigned freq,
 	mr |= AT91_SAMA5D2_MR_TRACKTIM(tracktim);
 	at91_adc_writel(st, MR, mr);
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	dev_dbg(&indio_dev->dev, "freq: %u, startup: %u, prescal: %u, tracktim=%u\n",
@@ -1809,7 +1802,6 @@ static int at91_adc_read_info_raw(struct iio_dev *indio_dev,
 	at91_adc_readl(st, LCDR);
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 	return ret;
 }
@@ -1890,7 +1882,6 @@ static int at91_adc_read_temp(struct iio_dev *indio_dev,
 restore_config:
 	/* Revert previous settings. */
 	at91_adc_temp_sensor_configure(st, false);
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 	if (ret < 0)
 		return ret;
@@ -2465,7 +2456,6 @@ static int at91_adc_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "version: %x\n",
 		 readl_relaxed(st->base + st->soc_info.platform->layout->VERSION));
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return 0;
@@ -2567,7 +2557,6 @@ static int at91_adc_resume(struct device *dev)
 		at91_adc_configure_trigger_registers(st, true);
 	}
 
-	pm_runtime_mark_last_busy(st->dev);
 	pm_runtime_put_autosuspend(st->dev);
 
 	return 0;
diff --git a/drivers/iio/adc/imx8qxp-adc.c b/drivers/iio/adc/imx8qxp-adc.c
index be13a6ed7e00..d9da24efdcbe 100644
--- a/drivers/iio/adc/imx8qxp-adc.c
+++ b/drivers/iio/adc/imx8qxp-adc.c
@@ -229,7 +229,6 @@ static int imx8qxp_adc_read_raw(struct iio_dev *indio_dev,
 		ret = wait_for_completion_interruptible_timeout(&adc->completion,
 								IMX8QXP_ADC_TIMEOUT);
 
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_sync_autosuspend(dev);
 
 		if (ret == 0) {
@@ -295,7 +294,6 @@ static int imx8qxp_adc_reg_access(struct iio_dev *indio_dev, unsigned int reg,
 
 	*readval = readl(adc->regs + reg);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_sync_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
index 17b0a2548b0a..b0c5bf694a8a 100644
--- a/drivers/iio/adc/imx93_adc.c
+++ b/drivers/iio/adc/imx93_adc.c
@@ -260,7 +260,6 @@ static int imx93_adc_read_raw(struct iio_dev *indio_dev,
 		mutex_lock(&adc->lock);
 		ret = imx93_adc_read_channel_conversion(adc, chan->channel, val);
 		mutex_unlock(&adc->lock);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_sync_autosuspend(dev);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
index cc326f21d398..3a17b3898bf6 100644
--- a/drivers/iio/adc/rcar-gyroadc.c
+++ b/drivers/iio/adc/rcar-gyroadc.c
@@ -163,12 +163,10 @@ static int rcar_gyroadc_set_power(struct rcar_gyroadc *priv, bool on)
 {
 	struct device *dev = priv->dev;
 
-	if (on) {
+	if (on)
 		return pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
-		return pm_runtime_put_autosuspend(dev);
-	}
+
+	return pm_runtime_put_autosuspend(dev);
 }
 
 static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index cadb0446bc29..1010e0511b3e 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -248,7 +248,6 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
 	rzg2l_adc_start_stop(adc, false);
 
 rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
@@ -410,7 +409,6 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
 
 exit_hw_init:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 3d800762c5fc..e39a4c0db25e 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -794,7 +794,6 @@ static int stm32_adc_probe(struct platform_device *pdev)
 		goto err_irq_remove;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index b9f93116e114..2d7f88459c7c 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1528,7 +1528,6 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 
 	stm32_adc_conv_irq_disable(adc);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -1564,7 +1563,6 @@ static int stm32_adc_write_raw(struct iio_dev *indio_dev,
 
 		adc->cfg->set_ovs(indio_dev, idx);
 
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 
 		adc->ovs_idx = idx;
@@ -1759,7 +1757,6 @@ static int stm32_adc_update_scan_mode(struct iio_dev *indio_dev,
 	adc->num_conv = bitmap_weight(scan_mask, iio_get_masklength(indio_dev));
 
 	ret = stm32_adc_conf_scan_seq(indio_dev, scan_mask);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -1808,7 +1805,6 @@ static int stm32_adc_debugfs_reg_access(struct iio_dev *indio_dev,
 	else
 		*readval = stm32_adc_readl(adc, reg);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -1954,7 +1950,6 @@ static int stm32_adc_buffer_postenable(struct iio_dev *indio_dev)
 err_clr_trig:
 	stm32_adc_set_trig(indio_dev, NULL);
 err_pm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -1977,7 +1972,6 @@ static int stm32_adc_buffer_predisable(struct iio_dev *indio_dev)
 	if (stm32_adc_set_trig(indio_dev, NULL))
 		dev_err(&indio_dev->dev, "Can't clear trigger\n");
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -2614,7 +2608,6 @@ static int stm32_adc_probe(struct platform_device *pdev)
 		goto err_hw_stop;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index e4bc2e199a07..479115ea50bf 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -244,7 +244,6 @@ static int sun4i_gpadc_read(struct iio_dev *indio_dev, int channel, int *val,
 		*val = info->temp_data;
 
 	ret = 0;
-	pm_runtime_mark_last_busy(indio_dev->dev.parent);
 
 err:
 	pm_runtime_put_autosuspend(indio_dev->dev.parent);
@@ -271,7 +270,6 @@ static int sun4i_gpadc_temp_read(struct iio_dev *indio_dev, int *val)
 
 		regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
 
-		pm_runtime_mark_last_busy(indio_dev->dev.parent);
 		pm_runtime_put_autosuspend(indio_dev->dev.parent);
 
 		return 0;
diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 48549d617e5f..f2a93c63ca14 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -374,12 +374,10 @@ static int ads1015_set_power_state(struct ads1015_data *data, bool on)
 	int ret;
 	struct device *dev = regmap_get_device(data->regmap);
 
-	if (on) {
+	if (on)
 		ret = pm_runtime_resume_and_get(dev);
-	} else {
-		pm_runtime_mark_last_busy(dev);
+	else
 		ret = pm_runtime_put_autosuspend(dev);
-	}
 
 	return ret < 0 ? ret : 0;
 }
diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index b0790e300b18..aa8946063c7d 100644
--- a/drivers/iio/adc/ti-ads1100.c
+++ b/drivers/iio/adc/ti-ads1100.c
@@ -105,7 +105,6 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
 
 	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
 
-	pm_runtime_mark_last_busy(&data->client->dev);
 	pm_runtime_put_autosuspend(&data->client->dev);
 
 	if (ret < 0) {
diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index 3e4f79dfb078..280e9d450682 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -291,7 +291,6 @@ static int ads1119_single_conversion(struct ads1119_state *st,
 	*val = sign_extend32(sample, chan->scan_type.realbits - 1);
 	ret = IIO_VAL_INT;
 pdown:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
@@ -470,7 +469,6 @@ static int ads1119_triggered_buffer_postdisable(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
