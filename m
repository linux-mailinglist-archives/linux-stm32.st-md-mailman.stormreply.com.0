Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC9B34225
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:54:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92D3C3FAD9;
	Mon, 25 Aug 2025 13:54:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE9B7C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130073; x=1787666073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QuDzdgEbhe01RGcDa58j/iJHR5TXAvIxXXDXJUBmrxo=;
 b=BvHsN92yQgRlFW7j/NFJoGx4rRTGmkL2psqx/0w4fzn4yhTuST9smqM/
 c981uKUTILl4r8EjxODFzX7MEuY+kI8jLXT4No4YJNwW/Uw0T+g6+1tLM
 R8FR1U3oYs4F3j0ljQXWAVV+hFGu7GMlJlOB3TsFWYujhcoJC7NAu58Pi
 W8EUBG4o4ZRZ8bXEKCDgZQTamcvmKpkXftzb5VN2o4kffrf9zKnmkv7he
 1/g+A3aaTOE5GraWhpigNrT8LKo8vxo9Tjq8v7Cnv0jvglIcLGfSHindq
 pvfcCAy81NZqXc+/EC/HMf58zTNWlsRHax46E8DCAOgs4Uwnl7vfMjB22 A==;
X-CSE-ConnectionGUID: GrnTbMufSfm2REdlp3i1ww==
X-CSE-MsgGUID: tnfKp5NtTgK1y//vR/Fetw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68936884"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68936884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:29 -0700
X-CSE-ConnectionGUID: GuTPFhU6QaK22cPQ2eEZXA==
X-CSE-MsgGUID: 6lwKuP7jR/KEs0KwCNno2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168547699"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.7])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:54:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id E44C5121F83;
 Mon, 25 Aug 2025 16:54:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1uqXe5-00000007POs-3m4x; Mon, 25 Aug 2025 16:54:01 +0300
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
Date: Mon, 25 Aug 2025 16:54:01 +0300
Message-ID: <20250825135401.1765847-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 12/12] iio: temperature: Remove redundant
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
Acked-by: Crt Mori <cmo@melexis.com>
---
 drivers/iio/temperature/mlx90614.c | 1 -
 drivers/iio/temperature/mlx90632.c | 1 -
 drivers/iio/temperature/mlx90635.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
index 740018d4b3df..8a44a00bfd5e 100644
--- a/drivers/iio/temperature/mlx90614.c
+++ b/drivers/iio/temperature/mlx90614.c
@@ -225,7 +225,6 @@ static void mlx90614_power_put(struct mlx90614_data *data)
 	if (!data->wakeup_gpio)
 		return;
 
-	pm_runtime_mark_last_busy(&data->client->dev);
 	pm_runtime_put_autosuspend(&data->client->dev);
 }
 #else
diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index ae4ea587e7f9..bf689f6143f3 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -1043,7 +1043,6 @@ static int mlx90632_read_raw(struct iio_dev *indio_dev,
 	}
 
 mlx90632_read_raw_pm:
-	pm_runtime_mark_last_busy(&data->client->dev);
 	pm_runtime_put_autosuspend(&data->client->dev);
 	return ret;
 }
diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
index 1175c7887ae1..d7d16a56f90b 100644
--- a/drivers/iio/temperature/mlx90635.c
+++ b/drivers/iio/temperature/mlx90635.c
@@ -749,7 +749,6 @@ static int mlx90635_read_raw(struct iio_dev *indio_dev,
 	}
 
 mlx90635_read_raw_pm:
-	pm_runtime_mark_last_busy(&data->client->dev);
 	pm_runtime_put_autosuspend(&data->client->dev);
 	return ret;
 }
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
