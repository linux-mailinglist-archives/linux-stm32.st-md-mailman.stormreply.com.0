Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CAB19C2A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09BFAC424B1;
	Mon,  4 Aug 2025 07:16:26 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCC34C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:28:41 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 645743C5B;
 Sat,  2 Aug 2025 11:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126876;
 bh=TlJ3vfBE6eOXaSzRlSNwTu3lbTFE43IxxanDcdfmWg0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=duA3dJ50CGqSubEiUb6tH6brol9dIsXMNSvO5O1wlKHkbM+t1cYXYoYHvBjqEVQAU
 6T1vr8defZLDQwNlsGvBZefSOJNBplJQwBGAtvnWmJFpJVKgGIuG4A95kPSRxfhFj0
 VVyGPA3wQV5hmg0owRykgfvRnsuwd0UOntPRaAk0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:53 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-31-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7087;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=TlJ3vfBE6eOXaSzRlSNwTu3lbTFE43IxxanDcdfmWg0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7+KFlHPr1a0isCkNZoxK5D1IytunS6QznA
 Xx0PkUP/LeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PMEgD/4oWPtUHoRU6cbURgatIsy/ggO5IP5Eby7JaGzgNGqFvbfVZBfBsvDvSk0XId2Yf6AKLaS
 +FnRBa487AwS51rHE8fKzm3XDGnBJoVM4HfBTvt7MRRtyjJtWkwz9n6drkQCgqwHre/wM1QeZ7g
 CKdpnv3dwheDBseF0afNkwkXfaSuK5Zxhv3bQDQjEmA+LcxstpnzmxIrDVGnjzIx2ny3t1jXc5d
 iWlUbuGhe76FyZFlBx1AwZxWRWGDXCdZWYPgaSJl4uK2nyOufJh+11XC3vPJ1ZOJiEd+MU3Kwa9
 uqKFs4IJYj5LqufRjjiFOJI2vh8LGRztTEiMrIZtpBAIYFffQeJvrqX/OYHA62UPzzhHZNOcNQn
 ihlqj30ly755JApJzOsKzNqHKR8R5O+L6btO4Os2yfBAHOc8hRP7ixaXaizgcAyUiTzH9h2qoBO
 P5vnAw3fGKJzlvn0KLjeBwFS5Ns/r3FlUap2KSGwjVPs6IWAn7xuSwiDhbHpvhDRvcn/6yMyB4U
 Q+VLMIRK/oMhvdkTNeQ+c/w4rvt7rnFpwlVIoMHlmQST3eR+hUSY6reLy4f2bShB6sCRz2CFyDC
 Jz5Z1jNqk3XX477veKLSaJth6f34LbD8yLZ9w5wn/6+xHIh56leHJqnoJ7OLe8iwOqOAIny23Ow
 KRl8vbIQCATC15A==
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
Subject: [Linux-stm32] [PATCH 31/65] media: coda: Access v4l2_fh from file
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
 .../media/platform/chips-media/coda/coda-common.c  | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index a27d5a261a27fb78d4c7ca008146780698386333..a10576f702127ba6014799e7d3190c2785afd2a2 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -427,7 +427,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
 static int coda_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	strscpy(cap->driver, CODA_NAME, sizeof(cap->driver));
 	strscpy(cap->card, coda_product_name(ctx->dev->devtype->product),
@@ -447,7 +447,7 @@ static int coda_enum_fmt(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	const struct coda_video_device *cvd = to_coda_video_device(vdev);
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const u32 *formats;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -497,7 +497,7 @@ static int coda_g_fmt(struct file *file, void *priv,
 		      struct v4l2_format *f)
 {
 	struct coda_q_data *q_data;
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
@@ -658,7 +658,7 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct vb2_queue *src_vq;
@@ -764,7 +764,7 @@ static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
 static int coda_try_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	const struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
@@ -858,7 +858,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct v4l2_rect r;
@@ -910,7 +910,7 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 static int coda_s_fmt_vid_out(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	const struct coda_codec *codec;
 	struct v4l2_format f_cap;
 	struct vb2_queue *dst_vq;
@@ -966,7 +966,7 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 static int coda_reqbufs(struct file *file, void *priv,
 			struct v4l2_requestbuffers *rb)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_reqbufs(file, ctx->fh.m2m_ctx, rb);
@@ -986,7 +986,7 @@ static int coda_reqbufs(struct file *file, void *priv,
 static int coda_qbuf(struct file *file, void *priv,
 		     struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->inst_type == CODA_INST_DECODER &&
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -997,7 +997,7 @@ static int coda_qbuf(struct file *file, void *priv,
 
 static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct coda_ctx *ctx = fh_to_ctx(priv);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_dqbuf(file, ctx->fh.m2m_ctx, buf);
@@ -1025,7 +1025,7 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 static int coda_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	struct v4l2_rect r, *rsel;
 
@@ -1071,7 +1071,7 @@ static int coda_g_selection(struct file *file, void *fh,
 static int coda_s_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 
 	switch (s->target) {
@@ -1126,7 +1126,7 @@ static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
 static int coda_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
@@ -1207,7 +1207,7 @@ static bool coda_mark_last_dst_buf(struct coda_ctx *ctx)
 static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *buf;
 	struct vb2_queue *dst_vq;
@@ -1286,7 +1286,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 static int coda_enum_framesizes(struct file *file, void *fh,
 				struct v4l2_frmsizeenum *fsize)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data_dst;
 	const struct coda_codec *codec;
 
@@ -1319,7 +1319,7 @@ static int coda_enum_framesizes(struct file *file, void *fh,
 static int coda_enum_frameintervals(struct file *file, void *fh,
 				    struct v4l2_frmivalenum *f)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct coda_q_data *q_data;
 	const struct coda_codec *codec;
 
@@ -1358,7 +1358,7 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
 
 static int coda_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -1441,7 +1441,7 @@ static uint32_t coda_timeperframe_to_frate(struct v4l2_fract *timeperframe)
 
 static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
