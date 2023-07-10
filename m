Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B43D768DA2
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE55C6C842;
	Mon, 31 Jul 2023 07:16:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85C95C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688984883; x=1720520883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8VTp2VvPftW0K82t/UQGFNBKatn1Y+wh44m0tYwuY/M=;
 b=Nf0I1IIMR1HFHKszExi5nQov1OzQXaSb4oakD2wxGnU02fx5cG0fJbrR
 xFlOynpUlFpci+vVXjYunebIXX4ratlccKe0QKBsvttCbQ5C9mjZk3H9O
 bPMjFQ61d/+sDeX6jot2leXnxyxEfhJ6b3wUnAbpnt21scmkodFhkCiUj
 kjr6QO7C5l4yO7s7YPTruxtQ34kqucx4UVb4xHDrGLFUpXnLXmjmPWv3Y
 VlTiKNp9mV49UWacHdFzovZEpUUT1Wc8LcCNcTWx4PSXGBe1V1Q/IzDUR
 IwsgmbRLV2A4r76caRtfRaEYQozRCTbhtZvBB1VNJG7hgn5PPSvm2MCU+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="367803794"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="367803794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755956019"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755956019"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 03:27:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6D8A169F; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
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
Date: Mon, 10 Jul 2023 13:27:51 +0300
Message-Id: <20230710102751.83314-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
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
Subject: [Linux-stm32] [PATCH v1 8/8] spi: Use struct_size() helper
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

Prefer struct_size() over open-coded versions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e9fb96016dc1..d4d686af76bd 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -17,6 +17,7 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
@@ -1100,6 +1101,8 @@ struct spi_transfer {
  * @state: for use by whichever driver currently owns the message
  * @resources: for resource management when the SPI message is processed
  * @prepared: spi_prepare_message was called for the this message
+ * @t: for use with spi_message_alloc() when memory has message and transfers
+ *	together
  *
  * A @spi_message is used to execute an atomic sequence of data transfers,
  * each represented by a struct spi_transfer.  The sequence is "atomic"
@@ -1154,6 +1157,9 @@ struct spi_message {
 
 	/* List of spi_res resources when the SPI message is processed */
 	struct list_head        resources;
+
+	/* For embedding transfers into the memory of the message */
+	struct spi_transfer	t[];
 };
 
 static inline void spi_message_init_no_memset(struct spi_message *m)
@@ -1214,16 +1220,13 @@ static inline struct spi_message *spi_message_alloc(unsigned ntrans, gfp_t flags
 {
 	struct spi_message *m;
 
-	m = kzalloc(sizeof(struct spi_message)
-			+ ntrans * sizeof(struct spi_transfer),
-			flags);
+	m = kzalloc(struct_size(m, t, ntrans), flags);
 	if (m) {
 		unsigned i;
-		struct spi_transfer *t = (struct spi_transfer *)(m + 1);
 
 		spi_message_init_no_memset(m);
-		for (i = 0; i < ntrans; i++, t++)
-			spi_message_add_tail(t, m);
+		for (i = 0; i < ntrans; i++)
+			spi_message_add_tail(&m->t[i], m);
 	}
 	return m;
 }
-- 
2.40.0.1.gaa8946217a0b

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
