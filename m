Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDBB19C29
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28A6DC424B3;
	Mon,  4 Aug 2025 07:16:26 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4C4FC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:28:49 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 526283C59;
 Sat,  2 Aug 2025 11:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126884;
 bh=uvJNgedmjfRxRB2KK4uHDM5CEa3owfvsuNtv/dXg1mo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OBeOdY71KXuivBYjHPJgVimqGpuOLlDp9yx3lDomohHUG5a7oNWQ0hvXoW69O0kNS
 NYAx54HROgkP695bPQtJ6+Ecd/T7MLt4bvONc/Y0dZA46ll9Mm2L78xgrOkpmJ6k0A
 8PHaFKCiNki5tve7zAVZ45WyVeGD7Vm3ILrEKz8E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:54 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-32-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10324;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=uvJNgedmjfRxRB2KK4uHDM5CEa3owfvsuNtv/dXg1mo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7S/3Fw9ygciMykqOxZ3oq/ihDfFUViWqKi
 5ekTs5Vd8+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 POEiEAC74ewm4UwRerFfJAL8tK4Q4dfsUPWoOIltfCRNJ1oWZqybDtlPV8YdYeLQyI11uX/Y0Qd
 3gtrtoMmI8vcaJUptDw6CuyJeboT6CzFR2Tt2KELXHeOLzjUIh8ZT+teCZq9OZcrjtWXHjkD2Ny
 4vwfiGJ1pPmbrsNVWLGrxqn8cxwJGATdHC3ErwAUIJ3avwjcBz0yoGnAjGaMA+D5DXNmLEZZWzb
 3R3Ud12Gqonq3xtBR8CGHFcBvZeNcPORqEEzJJza4FalTw2nGr65CohPNq3D0VZDOkRHir+qYTX
 XG23CyC/G4jYE1NDrbeTkGYe/iodpC+m6up/5gupugz/DlzBunaRa+tcXzKtfQ+sNZaZx2lpFq2
 5pY45Vh2WLgNv1Xr+q76rvA3O1/Bn/Io4Zv+A7C5j8wXQNQfWpK2j8GKyCJ8aW3e2jR/irOrLF6
 dARDLFGe3XP6LFU5Y4XqKwPczmTfxyHekKMxO0DssGbUttMuqE1qMGb0s336UeYPtPRyWcy7KDk
 T3uhKRB6h6VVTLmxsyaCUwh3KJlVjLNUcVQWzZ2c9xMlt5mHgGTH7Up6OYnBtk9UCjyv/PDbF8Q
 1ETZeraVs8AOHlUnD6RRH7+nlH6yptXdMTIVT5IwSeOOFouJa78kh1G9qXzpu8F3CmG3mrdVdAT
 co8wEuknSM/h/VA==
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
Subject: [Linux-stm32] [PATCH 32/65] media: wave5: Access v4l2_fh from file
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
 .../platform/chips-media/wave5/wave5-helper.c      |  2 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     | 18 ++++++++--------
 .../platform/chips-media/wave5/wave5-vpu-enc.c     | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 0bce62f0c03902ae367182ee04774c79accc4712..f03ad9c0de2215794b2456c39652785fff236966 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -142,7 +142,7 @@ int wave5_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscr
 
 int wave5_vpu_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->src_fmt.width;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 88eb933a51448788373775e423ae2ac5042cf8b6..72af0faa3ef2e6fb83749044eb91a58f39a3a986 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -506,7 +506,7 @@ static int wave5_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
@@ -547,7 +547,7 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -606,7 +606,7 @@ static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->dst_fmt.width;
@@ -630,7 +630,7 @@ static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -647,7 +647,7 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -678,7 +678,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
@@ -727,7 +727,7 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u | target: %u\n", __func__, s->type, s->target);
 
@@ -761,7 +761,7 @@ static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -872,7 +872,7 @@ static int wave5_vpu_dec_start(struct vpu_instance *inst)
 
 static int wave5_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dc)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 322c1498758a0a569eb94cab0d6612ce18cd4c7b..279f23e1304a9e47e31c9a0bdd0efbf4c18622e1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -360,7 +360,7 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -377,7 +377,7 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -411,7 +411,7 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -445,7 +445,7 @@ static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
 
 	f->fmt.pix_mp.width = inst->dst_fmt.width;
@@ -469,7 +469,7 @@ static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 
 	dev_dbg(inst->dev->dev, "%s: index: %u\n", __func__, f->index);
@@ -486,7 +486,7 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 
 static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
@@ -515,7 +515,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
 	const struct v4l2_format_info *info;
 	int i, ret;
@@ -576,7 +576,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 
 static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u | target: %u\n", __func__, s->type, s->target);
 
@@ -605,7 +605,7 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -628,7 +628,7 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *ec)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
@@ -661,7 +661,7 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 
 static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, a->type);
 
@@ -681,7 +681,7 @@ static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamp
 
 static int wave5_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	struct vpu_instance *inst = file_to_vpu_inst(file);
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, a->type);
 

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
