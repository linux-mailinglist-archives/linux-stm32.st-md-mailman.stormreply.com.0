Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A24D2B34221
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:54:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 585C1C3FAE0;
	Mon, 25 Aug 2025 13:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D1B4C3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130067; x=1787666067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hwhReidsOY8nwpmo5p1KlATDH8Fd3TRyyKfSbwwZglw=;
 b=lthSYfpQeWBXFxQzfyzgOpU4w2qIdNqYSzcvTwB+Jwr6W5CbyEpfgevk
 viSvjH2tASpWza5AvGCsg10JwxqgnxJZqxBylBOv9j5tPOOrcgDhF7y65
 xRubrP7ypp46z2TfU3FbrwFymzSTQCtb/xoCWi+oY5gHBRQsiBGYdl1Zn
 QV5jNE5np7E5z3wtek6b8u7qrVoc5V6nzuSDmrcfs1coTuLJs2T2YFQwr
 vZE3z/+jmWNklBWZuVC+sL8Ux7cxAxiSt8jIWJzNg+mrdnptKG0aMPsxU
 xXBV5JxrFvnxPCHpSK7ZRhAvHnUKot2WjKvLgBYEY4OOI9AfwqEvtE6gA Q==;
X-CSE-ConnectionGUID: pP9nYBgzR2OpKhJLUP6XUQ==
X-CSE-MsgGUID: yW9zSCidRkiO1NeneZloYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936682"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68936682"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:23 -0700
X-CSE-ConnectionGUID: Gfz4YjagRMyINOe7eIG5KA==
X-CSE-MsgGUID: 2jMcb7TqTUKlVA0zqqIz1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168547685"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.7])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id D9381121F81;
 Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1uqXe5-00000007POj-3aOi; Mon, 25 Aug 2025 16:54:01 +0300
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
Date: Mon, 25 Aug 2025 16:53:59 +0300
Message-ID: <20250825135401.1765847-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 10/12] iio: pressure: Remove redundant
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
 drivers/iio/pressure/bmp280-core.c | 5 -----
 drivers/iio/pressure/icp10100.c    | 1 -
 drivers/iio/pressure/mpl115.c      | 2 --
 drivers/iio/pressure/zpa2326.c     | 2 --
 4 files changed, 10 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index 6cdc8ed53520..48e76d907180 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -752,7 +752,6 @@ static int bmp280_read_raw(struct iio_dev *indio_dev,
 
 	pm_runtime_get_sync(data->dev);
 	ret = bmp280_read_raw_impl(indio_dev, chan, val, val2, mask);
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
@@ -927,7 +926,6 @@ static int bmp280_write_raw(struct iio_dev *indio_dev,
 
 	pm_runtime_get_sync(data->dev);
 	ret = bmp280_write_raw_impl(indio_dev, chan, val, val2, mask);
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
@@ -2255,7 +2253,6 @@ static int bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
 
 	pm_runtime_get_sync(data->dev);
 	ret = bmp580_nvmem_read_impl(priv, offset, val, bytes);
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
@@ -2330,7 +2327,6 @@ static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
 
 	pm_runtime_get_sync(data->dev);
 	ret = bmp580_nvmem_write_impl(priv, offset, val, bytes);
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
@@ -3120,7 +3116,6 @@ static int bmp280_buffer_postdisable(struct iio_dev *indio_dev)
 {
 	struct bmp280_data *data = iio_priv(indio_dev);
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return 0;
diff --git a/drivers/iio/pressure/icp10100.c b/drivers/iio/pressure/icp10100.c
index 1951c1cc84cf..3d83d0098a57 100644
--- a/drivers/iio/pressure/icp10100.c
+++ b/drivers/iio/pressure/icp10100.c
@@ -265,7 +265,6 @@ static int icp10100_get_measures(struct icp10100_state *st,
 			(be16_to_cpu(measures[1]) >> 8);
 	*temperature = be16_to_cpu(measures[2]);
 
-	pm_runtime_mark_last_busy(&st->client->dev);
 error_measure:
 	pm_runtime_put_autosuspend(&st->client->dev);
 	return ret;
diff --git a/drivers/iio/pressure/mpl115.c b/drivers/iio/pressure/mpl115.c
index 71beb28b7f2c..830a5065c008 100644
--- a/drivers/iio/pressure/mpl115.c
+++ b/drivers/iio/pressure/mpl115.c
@@ -108,7 +108,6 @@ static int mpl115_read_raw(struct iio_dev *indio_dev,
 		ret = mpl115_comp_pressure(data, val, val2);
 		if (ret < 0)
 			return ret;
-		pm_runtime_mark_last_busy(data->dev);
 		pm_runtime_put_autosuspend(data->dev);
 
 		return IIO_VAL_INT_PLUS_MICRO;
@@ -118,7 +117,6 @@ static int mpl115_read_raw(struct iio_dev *indio_dev,
 		ret = mpl115_read_temp(data);
 		if (ret < 0)
 			return ret;
-		pm_runtime_mark_last_busy(data->dev);
 		pm_runtime_put_autosuspend(data->dev);
 		*val = ret >> 6;
 
diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 6eef37c0952d..4923a558a26a 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -697,7 +697,6 @@ static void zpa2326_suspend(struct iio_dev *indio_dev)
 
 	zpa2326_sleep(indio_dev);
 
-	pm_runtime_mark_last_busy(parent);
 	pm_runtime_put_autosuspend(parent);
 }
 
@@ -708,7 +707,6 @@ static void zpa2326_init_runtime(struct device *parent)
 	pm_runtime_enable(parent);
 	pm_runtime_set_autosuspend_delay(parent, 1000);
 	pm_runtime_use_autosuspend(parent);
-	pm_runtime_mark_last_busy(parent);
 	pm_runtime_put_autosuspend(parent);
 }
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
