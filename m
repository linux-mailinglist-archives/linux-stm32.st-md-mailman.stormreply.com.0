Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F7B19C13
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC7FC3F943;
	Mon,  4 Aug 2025 07:16:23 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F074C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:24:27 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47C052F92;
 Sat,  2 Aug 2025 11:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126621;
 bh=Q7uNkMZiUR/bAyP4ReuiDNkh5bQApW2xlrBUgmJ6QKo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qt496vmQr+qgRMEyIl/SE5sDskG6fnGheHq330f4+774KPf1LlMV6RbdNuJemqYqG
 X7RsbLsmtdNfm5DTLA3eAM1LHQYhURvKCf7WCrdPCz2daf9D16QJi8hfMMMcPN/sxp
 b+t4QKddTrOPi6Gw761qhfKA91B7QpjLKRcr2Ci0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:28 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-6-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, 
 Zhou Peng <eagle.zhou@nxp.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3116;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=k2a8LQETJyWR2lrXA5s/EIpHnltWb4lK+Y+yCXeLDbQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj3Cd24ST01biVMwBnhdcgc4JexWZ1RRHGt6
 aNTUJytO6yJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y9wAKCRByNAaPFqFW
 PIrWEADEzYQUUXusyN/5PWZduwqYASEKZjv3DhemKWy8omxWHHGL3V9ygO/Zol0UXvAoIY9izDS
 hr345GKKuuTwjhpINb5X5WA4+XF2HALGBUqjz6HitPEAMfpIcgoY5YIKgXGr+AnFt8ek/O5XpPq
 xROsipH50X/KAV4TQvzwZ5uAd8jdhhp6ZaE0urbSbMnjXsUsPo9Gv/gV8U67dscDYaGZRWPgOWh
 wONEr4lo12lq8KatT2n4sCh3wwTrnZdZ7j+aFIr5RRQgk0X0FktXVvP54fkYznShPJweiwzsdNc
 0BfieQ+5ILTSxHpg4rUYUuCg7pffwRYZqZeiPA64J1dPt+F9w5cbsuosMjmv2Mmv/+boOXoedVI
 w14RJpIVw5Dk1DJVu8M/6cPCnVByEEur0OLw/5I3s4/Mbj5ETl5DGnxrbKAsvOk9QmlvLzcgRRy
 mNr7LP5r4VJvrlJpr06z1ySN664lNIxPVlHvSVtSHmPCDhi8k48ls7XU5eKOJLwRsTg2icjuNXw
 lSy/pVjVukWETb7QUZQgc9UCzsmzSM7LTMyAHMbG/n+GWLokosseFjabHRBRhH9O5W7u9hpnrnf
 96tc/uGLksh7ycinpXbc9zMBpKWIeTZGLVlIplk84LyM4vrwot3YFdmKPdK8EdTnZ9pD0MN3NPq
 ZeGWw2RI7zpMoLQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:16:20 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mjpeg-users@lists.sourceforge.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 06/65] media: usb: uvcvideo: Store v4l2_fh
 pointer in file->private_data
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
uvcvideo driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 +++++-----
 drivers/media/usb/uvc/uvcvideo.h |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..6dd329a972fda5c2574231b8526105676df3d4a1 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -603,14 +603,14 @@ static int uvc_v4l2_open(struct file *file)
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	file->private_data = handle;
+	file->private_data = &handle->vfh;
 
 	return 0;
 }
 
 static int uvc_v4l2_release(struct file *file)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -626,7 +626,7 @@ static int uvc_v4l2_release(struct file *file)
 static int uvc_ioctl_querycap(struct file *file, void *fh,
 			      struct v4l2_capability *cap)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_streaming *stream = handle->stream;
 
@@ -1170,7 +1170,7 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 static long uvc_v4l2_compat_ioctl32(struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	union {
 		struct uvc_xu_control_mapping xmap;
 		struct uvc_xu_control_query xqry;
@@ -1221,7 +1221,7 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..8b56252030480b8a5d2ef6de24902b544357ff02 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -637,6 +637,11 @@ struct uvc_fh {
 	unsigned int pending_async_ctrls;
 };
 
+static inline struct uvc_fh *to_uvc_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct uvc_fh, vfh);
+}
+
 /* ------------------------------------------------------------------------
  * Debugging, printing and logging
  */

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
