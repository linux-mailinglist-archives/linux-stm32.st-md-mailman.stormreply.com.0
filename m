Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9558B19C44
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84520C424C5;
	Mon,  4 Aug 2025 07:16:34 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F047C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:29:56 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D13D93EE9;
 Sat,  2 Aug 2025 11:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126950;
 bh=QMXN795g4JQ02dbn34MUgI1SrXfUXWeSvy7JvnRGT/4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=a6yKtLO3p3dptqs8nDpC4CTqf6f17ThWt2kAQ1RtjLbHys7ZhKQtBaxqQGSFM14hJ
 lo2so0O2XgjC9oyqujkhkQVVJ41fDYV4TE+DbxU0VOqJKvsFvw9M/9U/KkF7+/glzq
 Xda2N5WbvBrVab8G1DXb+S/ilReE23HpnougskVQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:01 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-39-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6555;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=QMXN795g4JQ02dbn34MUgI1SrXfUXWeSvy7JvnRGT/4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj8/oWIIARD+dfkmFv/taMUYIiUf/KYJk9vV
 f7+9cr+2++JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/AAKCRByNAaPFqFW
 PKtxD/0WLPIL/mL1eF89kxSMM9GwOxEKdo8GLGfT13RWpduaSJTQpP/edD44lwWuTCc/Ppgs83F
 u9bd6x4dOVwYfaPQIN5wij1VrkrZ6Bukd6h598tHgoKq0LmK6g9AS6SSJyKCVG8ETu/fpF0ARpW
 1oq1soPH+lkWm2YsCf88hjEAeLKuLe6T2CZB8MolKhAQOKNFewTMquWE8SfXrpMELAUh97npU/h
 GzVOcyJRfI+Me9QDMgov6AQRy+qGdm2K6R0aK8XaHuDSUkdPw4breQtXzbxvHJujLsZ3Ylt4IrG
 5pTN90+UngJ1pYigkyC8u8WI8bF5BcOxKx+gjGXuO+zcdr++UiIKHU/iOzkeJvdSnBPE6XjtZEW
 DBYFVMgrlvKkBQ9pjwJIsek4GgkDSCUoTnyXtR5YpjSZLIOP2Hkxg/MYLR1K00HzGwNykLZfmwU
 gvHiAygX/esogRpR/rFyA6SnjaCLLoy/9Dak8v/a15IEWnRsw8DD6LGJGELTh5E3YGkkeFfBkWQ
 nk9hYsCX5zLegyyQZ6tjuv6HJc53gqm0Mq3KtJl8V5t46D4VXt+WsPiGrcRHyyYD8ibuJBlaHs2
 ocOq1NEyVZ4BCdDoTWV7kqUn46e9u4uWM6Owwwggr8iOtxOn3o1mz5KuPz3wd7z2Oc1LrqSZ3Ry
 yexlpARHGjG1bXg==
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
Subject: [Linux-stm32] [PATCH 39/65] media: imx-jpeg: Access v4l2_fh from
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

While at it, remove the now unused mxc_jpeg_fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 33 +++++++++++---------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index fa7d74d8c1aabd3bf74482e214165d8c1a7e89da..df3ccdf767baf0bf6687808e2c017063181a7220 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -644,11 +644,6 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 	}
 }
 
-static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mxc_jpeg_ctx, fh);
-}
-
 static inline struct mxc_jpeg_ctx *mxc_jpeg_file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mxc_jpeg_ctx, fh);
@@ -1610,7 +1605,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	unsigned long flags;
 	int ret;
 
@@ -1643,7 +1638,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 				struct v4l2_encoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	unsigned long flags;
 	int ret;
 
@@ -2260,7 +2255,7 @@ static int mxc_jpeg_querycap(struct file *file, void *priv,
 static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, f->type);
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE) {
@@ -2300,7 +2295,7 @@ static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	u32 type = ctx->mxc_jpeg->mode == MXC_JPEG_DECODE ?  MXC_JPEG_FMT_TYPE_ENC :
 							     MXC_JPEG_FMT_TYPE_RAW;
 	int ret;
@@ -2441,7 +2436,7 @@ static int mxc_jpeg_try_fmt(struct v4l2_format *f,
 static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct mxc_jpeg_q_data tmp_q;
@@ -2460,7 +2455,7 @@ static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct mxc_jpeg_q_data tmp_q;
@@ -2512,20 +2507,20 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
+	return mxc_jpeg_s_fmt(mxc_jpeg_file_to_ctx(file), f);
 }
 
 static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	int ret;
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct vb2_queue *dst_vq;
 	struct mxc_jpeg_q_data *q_data_cap;
 	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	struct v4l2_format fc;
 
-	ret = mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
+	ret = mxc_jpeg_s_fmt(ctx, f);
 	if (ret)
 		return ret;
 
@@ -2554,7 +2549,7 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct v4l2_pix_format_mplane   *pix_mp = &f->fmt.pix_mp;
@@ -2592,7 +2587,7 @@ static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
 
 static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_cap;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE && s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -2621,7 +2616,7 @@ static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_sel
 
 static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_out;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -2649,7 +2644,7 @@ static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_sel
 
 static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE)
 		return mxc_jpeg_dec_g_selection(file, fh, s);
@@ -2659,7 +2654,7 @@ static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selecti
 
 static int mxc_jpeg_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_out;
 
 	if (ctx->mxc_jpeg->mode != MXC_JPEG_ENCODE)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
