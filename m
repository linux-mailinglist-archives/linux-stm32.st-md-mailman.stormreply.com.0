Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0E8BCD65
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 14:05:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DEDAC78001;
	Mon,  6 May 2024 12:05:37 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E577C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714663444;
 bh=a+soNMe5USE1GQBlDsV+4YZguHdogyVWApppvQ4TJrM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Sjz2gSx2OQjAOH/LqLEJfS7R7htORJpiw4njKWt2DQHU9kB+y9JmGDKmbVdJVy2+d
 qW/qENKrytt+rE3a7KTfehkzcGE1EsnNGXrvPCh5fHqUfftqVxe6tW2TT3Z3PyeL3i
 Q7t0ENCo4gBZqTTlFBe7AqdKkZx/ADUV++QVzYVmC/rC0gTa74gJD8d/oIqbMf/ycJ
 kolMoqpGITSG4OLU9fa0DNNOA6FBmAgbQEW/GinMMDrknd/9byWwiErAV+Bg0LLm8y
 4Q1qr2P/44JXUczSfwv+mWqBvuaesLEBIWuVdvm1ZsSaNcBNkjWwFbG5Adh/TJRWoz
 IOaylIvw8+2NA==
Received: from apertis.home (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: jmassot)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 745C93782113;
 Thu,  2 May 2024 15:24:01 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 02 May 2024 17:22:21 +0200
MIME-Version: 1.0
Message-Id: <20240502-master-v1-1-8bd109c6a3ba@collabora.com>
References: <20240502-master-v1-0-8bd109c6a3ba@collabora.com>
In-Reply-To: <20240502-master-v1-0-8bd109c6a3ba@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Dan Scally <djrscally@gmail.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Ripard <mripard@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Benoit Parrot <bparrot@ti.com>, Jai Luthra <j-luthra@ti.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Mon, 06 May 2024 12:05:30 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Julien Massot <julien.massot@collabora.com>, linux-arm-msm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] media: v4l: async: Add
 v4l2_async_nf_unregister_cleanup
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

Many drivers are calling v4l2_async_nf_unregister, and
v4l2_async_nf_cleanup, add a function to do it.

Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 include/media/v4l2-async.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c96..cdbe63c26779 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -304,6 +304,23 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier);
  */
 void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier);
 
+/**
+ * v4l2_async_nf_unregister_cleanup - unregister and clean up notifier resources
+ * @notifier: the notifier  the notifier to unregister and for which
+ *            the resources are to be cleaned up
+ *
+ * Unregister a subdevice asynchronous device and release memory resources
+ * related to a notifier.
+ * Convenient function to call v4l2_async_nf_unregister() and
+ * v4l2_async_nf_cleanup().
+ */
+static inline void
+v4l2_async_nf_unregister_cleanup(struct v4l2_async_notifier *notifier)
+{
+	v4l2_async_nf_unregister(notifier);
+	v4l2_async_nf_cleanup(notifier);
+};
+
 /**
  * v4l2_async_register_subdev - registers a sub-device to the asynchronous
  *	subdevice framework

-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
