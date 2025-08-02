Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE012B19C47
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9928EC29087;
	Mon,  4 Aug 2025 07:16:43 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5842C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:33:38 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4D2132D9;
 Sat,  2 Aug 2025 11:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754127173;
 bh=iuKNDwtt8kKRQfGxKCSjEUYPIwMYunyGqFuuiLv3K0Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=etIRH98NKbNN5H2qEksc93SH3XM0T+iHwBiOZ2zIIi9Jz5Nfq8I5gq/qqfZoLaGIf
 jwI5tLaeBjeNOiJimErQ6oMw555d/gVWivBRSyNQPaGhthmghohdU9eW2fyrzXMbKN
 YNAvg3Xt+DbgyFDC+JIZ+7yhFf9U81sDlxpvzS2A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:21 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-59-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3953;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iuKNDwtt8kKRQfGxKCSjEUYPIwMYunyGqFuuiLv3K0Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+3oIZOpPyRnUEOapjuFEBEhE8i4b15dP3j
 TFU3u0Zq82JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PEWzD/wO0yY2ImRGI/xM/rt7O/iVxa6dL1bda4RnoBRoPjDFzI2D/JgAWB88ItgnHwmmeUYyrHD
 aj6Oer2TYNjkhdmVyApjHfcDzEVdnHmj0MCYdbR5oYRULICvDiv+kZJ0aPYK9Vr/rWjwbEbyxu8
 TZoBzFl9CY4bK7bDY6qWTtl1Pv1l9xYj466g0Dez2B/ww/Ei1tJVucCoAdclB61xY0Njd5X0RVN
 D/y29IhK9YmbbIeAYOaN3iOnc67GIwI7A2gJfXZNbXwNrmfs3hTN0onFjIqGYA9CH98qnp8ZFOz
 dgNwNbCS2sscvB/QF+zhd1S+x7O6/818r7a9o1Vu31PLtAllughH3gzfaKL4oIfUJeSXe7uZQKZ
 y1V77hajADut4bY3tNpd4jdT66FUKAnZNVaKkBiiL8iRNSDwrGmsWcArE+SETAqLKrmJz9HkT73
 JvjpNxuC5xbZ+4J/yBgaSlrh1Sd2i+cLtXzNftndJsiE8bsLMw09qnRtgyZtMjiGd7XN2BhbnBR
 RO3qRrFXEwntpdTPzHbs8a+S1xXGCeVbVKgWfkzcuel9H4TGqByb+6zSzkEpxmo38Agt5D/yYIQ
 dELD/16003/RrZ2xtraKeJ72lH62ckXJVyXXwjoQrysiGVxDAhvB+SQ2okXgKbbhWAudP7U5PYh
 qsmZdurZGwpzh6g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:16:21 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mjpeg-users@lists.sourceforge.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 59/65] media: usb: hdpvr: Access v4l2_fh from
	file
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

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 6c6e467f85549e86598e73d29352a84de7df2f4d..8a5c2c5227ebe6f64bf44fff50dd4918f4f5394e 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -52,6 +52,11 @@ struct hdpvr_fh {
 	bool legacy_mode;
 };
 
+static inline struct hdpvr_fh *file_to_hdpvr_fh(struct file *file)
+{
+	return container_of(file_to_v4l2_fh(file), struct hdpvr_fh, fh);
+}
+
 static uint list_size(struct list_head *list)
 {
 	struct list_head *tmp;
@@ -589,7 +594,7 @@ static int vidioc_s_std(struct file *file, void *_fh,
 			v4l2_std_id std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	u8 std_type = 1;
 
 	if (!fh->legacy_mode && dev->options.video_input == HDPVR_COMPONENT)
@@ -609,7 +614,8 @@ static int vidioc_g_std(struct file *file, void *_fh,
 			v4l2_std_id *std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
+
 
 	if (!fh->legacy_mode && dev->options.video_input == HDPVR_COMPONENT)
 		return -ENODATA;
@@ -620,8 +626,8 @@ static int vidioc_g_std(struct file *file, void *_fh,
 static int vidioc_querystd(struct file *file, void *_fh, v4l2_std_id *a)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	struct hdpvr_video_info vid_info;
-	struct hdpvr_fh *fh = _fh;
 	int ret;
 
 	*a = V4L2_STD_UNKNOWN;
@@ -640,7 +646,7 @@ static int vidioc_s_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	int i;
 
 	fh->legacy_mode = false;
@@ -663,7 +669,7 @@ static int vidioc_g_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	if (dev->options.video_input)
@@ -676,7 +682,7 @@ static int vidioc_query_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	struct hdpvr_video_info vid_info;
 	bool interlaced;
 	int ret = 0;
@@ -718,7 +724,7 @@ static int vidioc_enum_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	memset(timings->reserved, 0, sizeof(timings->reserved));
@@ -734,7 +740,7 @@ static int vidioc_dv_timings_cap(struct file *file, void *_fh,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	if (dev->options.video_input)
@@ -994,7 +1000,7 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *_fh,
 				struct v4l2_format *f)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	int ret;
 
 	/*

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
