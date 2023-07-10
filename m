Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7474D354
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 12:28:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56411C6B45D;
	Mon, 10 Jul 2023 10:28:01 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1FD8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688984879; x=1720520879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+Jmb8Ni5ZNMBB74vGh9B4SucNYBPaQ0rpIJBqbWbw0=;
 b=Ixj/wKbtri4qxahqVVvv7fG1l+I8s3hN9JH7F6M7A4XYtHJySjn6k3ZA
 jOzdYCF90fa7suWrIs74NzQu6FMIquQJcQsVbepfiOj3DRjDpIzEod7Di
 Y4tM/HnR2VP89iiAF/TzATG59gqo8eeeWakmezeCrA1RceN30RjG2+Qyy
 7FGqMQbjoTtAW6qXQ/7Ybn4Hslg0yqgY8hX2mqz4em7Q8ug7d/5RIABzq
 JhomHJUGv78wiRnkCKVdPN92R41PeXGnLchmc0yvHBy7rfOmUilfcn86n
 +Hf32Hgos3RNteHjqaBH/lp6Tu4BDSdjY3hJGFb/vn3krB50vUKOClDgs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345424"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="364345424"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297524"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="865297524"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 18E8C3E3; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Date: Mon, 10 Jul 2023 13:27:46 +0300
Message-Id: <20230710102751.83314-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Richard Cochran <richardcochran@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v1 3/8] spi: Use sysfs_emit() to instead of
	s*printf()
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

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6d74218cf38e..0f05773c277c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -64,7 +64,7 @@ modalias_show(struct device *dev, struct device_attribute *a, char *buf)
 	if (len != -ENODEV)
 		return len;
 
-	return sprintf(buf, "%s%s\n", SPI_MODULE_PREFIX, spi->modalias);
+	return sysfs_emit(buf, "%s%s\n", SPI_MODULE_PREFIX, spi->modalias);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -89,7 +89,7 @@ static ssize_t driver_override_show(struct device *dev,
 	ssize_t len;
 
 	device_lock(dev);
-	len = snprintf(buf, PAGE_SIZE, "%s\n", spi->driver_override ? : "");
+	len = sysfs_emit(buf, "%s\n", spi->driver_override ? : "");
 	device_unlock(dev);
 	return len;
 }
@@ -2814,8 +2814,7 @@ static ssize_t slave_show(struct device *dev, struct device_attribute *attr,
 	struct device *child;
 
 	child = device_find_any_child(&ctlr->dev);
-	return sprintf(buf, "%s\n",
-		       child ? to_spi_device(child)->modalias : NULL);
+	return sysfs_emit(buf, "%s\n", child ? to_spi_device(child)->modalias : NULL);
 }
 
 static ssize_t slave_store(struct device *dev, struct device_attribute *attr,
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
