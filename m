Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D001B19C27
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8D33C424AF;
	Mon,  4 Aug 2025 07:16:25 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF20CC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:28:32 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 876C73C5C;
 Sat,  2 Aug 2025 11:27:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126867;
 bh=T3nnvKTfBwctCb2KRCzrOOTSYhCcGLTV59+/l2e0jic=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Dkkumh4LvxiuD8hNn3xqAjWcNyloSHLSyCVxEPeN03ejtzn2UG2VxVNhAnRssFn5b
 F2/F6FTzFRh9zHyOicYH+CITNw2ZAfi/45abmodAsDOnwXOXQkS8HI/S/Tn7OIRfWQ
 pXWkRYmhrYm2juFG6mt5ZWW34am6MecwMRht3TvU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:52 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-30-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=T3nnvKTfBwctCb2KRCzrOOTSYhCcGLTV59+/l2e0jic=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7Fyaa+k6kJNktEpScDTtiWPy/zaeBwHz9r
 DJi8voptXKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PKVRD/9hNjf7I/ZFLIZiasLup5gsgyNwUHVXZkHcmovAL8TIvnofdZ5VhpAM3eJ++8/l9qxMSuE
 MXKsXSR9XFbtftKtXz4+Y1tvz1FJ79z64WHGMs0xneU5nu2CpLKfX8ZvYAEKy58fxuSIHHSLLX0
 hWA9E5Fa7k7kpVg4KT9CBQm2zTWNGW9Ucy6Pjt8HofFZT82URpYm6/fVN1NtXpbxqwV2unaH27Z
 oZOtB6292Z/G5zI8p4nl8eeeYxXn8egPLXef91fozHfsAdabGC/yL+Z5sWeOAGKv9D5s36TUoFQ
 w/lxJXYhMlOSk5+Q5WYei14Z/iOhIb6lbVl7JMQTaEIwgHpcBoodDYNyP3Z6Mnu8yc53Kj/FD6X
 razFUGu3uX1tU0YKS/TVeN2DYYJHlDUdDyvHf0Q+4z2LW1WWWpflBIncqJcoJarL8aeqsmJwDrU
 E8e4biI29YK7NJRZQ31JDbhuVIuwBjoYzkSOYA9bI+E0ftdCi+f0uGW9qiy/caNDTeXipY7xKTt
 zP3Uu36adc8AcaxdNLQtKM7zr7fCg/ssFemih19ULbECnJCfI85T8acrRKM4Z6OGo0iNB5jksc+
 JPboZIQKZLhoLoTqDOBdSIg3MEs1Jh69sAhZu6nnVAT3asyNA/WNjkgnPPP4IYjOb2kxH08TA7Y
 VEIR3oTqjNmorVQ==
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
Subject: [Linux-stm32] [PATCH 30/65] media: meson-ge2d: Access v4l2_fh from
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
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index b1b0b6535fb1931c74ae9b2da28bea579cd1bc4c..5744853a40035e9973e605dd3ffec508641470f2 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -457,7 +457,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct ge2d_frame *f;
 	bool use_frame = false;
 
@@ -507,7 +507,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct ge2d_frame *f;
 	int ret = 0;
@@ -574,8 +574,8 @@ static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f
 
 static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	const struct ge2d_fmt *fmt = find_fmt(f);
-	struct ge2d_ctx *ctx = priv;
 	struct v4l2_pix_format fmt_cap;
 
 	vidioc_setup_cap_fmt(ctx, &fmt_cap);
@@ -595,7 +595,7 @@ static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
@@ -631,7 +631,7 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
@@ -670,7 +670,7 @@ static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format
 
 static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct ge2d_ctx *ctx = priv;
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 	struct vb2_queue *vq;
 	struct ge2d_frame *frm, *frm_cap;

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
