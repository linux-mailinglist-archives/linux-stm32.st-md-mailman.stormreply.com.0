Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE62B19C2F
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE76C424BB;
	Mon,  4 Aug 2025 07:16:33 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 400A2C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:29:18 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC5683C6D;
 Sat,  2 Aug 2025 11:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126912;
 bh=Yp1jjNiETSRS2rD3cxKSnrkZYfH6FttVwhmOY8Rcezk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oK65F9MO8UcjP/6hNhgPAYoZhlvkq+dE7764WQSpH/hkcjX6Rb/KkkY+fdKSTjt/w
 vphJVC/FyJaBkl11e29u1Z0eoaSgGKTIkW1Jj3s18ZoJGyaAy73X9YcFntU/aVGsMH
 /iZO1twyf28r7e1D1UCrv+Y0xTXqjwXq+IpXKl2Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:57 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-35-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Yp1jjNiETSRS2rD3cxKSnrkZYfH6FttVwhmOY8Rcezk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj7JJ72BFggMdAsaEou9LTKKektiwy1ugItg
 8aerb8YmN2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+wAKCRByNAaPFqFW
 PJHtD/9WyqYuwWJOfh5g1VWiGjbVTpkIX1b5Uy2x8MLlx18cgSLdj6+x0f3DRopLkV84ATY/RtQ
 SK5fk+ANG0EEnfKcLyRzCTvwxZxWeHrA1GEK3tL8oLQ2K4D8Wdagi+UKvyGctv1Bf3dWz6/yEB/
 +w5HKX+Lzcu05OXTc/1vscZyEtMlghlNRqXnUAHnqNpPHfGIce5jL35BdelLLgMnkrBGHR3KmVD
 4kMad1YfWVBYAHWYaQ67XSrnW+gBZfVJ7wARnBFv7ty6GzdLgLaWTg4j26wUUScYyIoDmVRwiw5
 nu0iMGSqrJVJQoKr6v/RQLJKnzG61raDiylsrMrnqyc/J9WaqyvraNo4aqlu2UMFJwZgKFKXDtV
 R9oYbRdEIMmkD6MOkJO9E54OrbDgACoNAPBbpqOu3YUxs0aaSGh1Yk+qlV4uF517fqQ+CnUj1Qo
 OYwd67H7yXEFNYBtND7I79bBFukORypozZATF7RHkA8N/cI4aR1f6hKGdPxpqDN0J5sZKTeA601
 uKd/AtqDWuNgOmlehluKCWwIuJDAHQZWX/YAXbsZAMVRWOHNuazhbs9VRgk0s3Csk6g956oz/oP
 w95XKEOp39XUgt08MC/mLmzTY/mCwS1I5rOl5p4mDsb2Y2OpI11ZzG8bidnmbz6do8Q57zSEqKH
 htnfly2T+xeCKBQ==
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
Subject: [Linux-stm32] [PATCH 35/65] media: mtk_mdp_m2m: Access v4l2_fh from
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

While at it, remove the now unused fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 3d836b5efa3807e4dc882956040014e244eeb660..03c07948dfdd07c6395c391ccad1788b08b1a867 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -348,11 +348,6 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	return 0;
 }
 
-static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_mdp_ctx, fh);
-}
-
 static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct mtk_mdp_ctx, fh);
@@ -594,7 +589,7 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
 				struct v4l2_capability *cap)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 
 	strscpy(cap->driver, MTK_MDP_MODULE_NAME, sizeof(cap->driver));
@@ -632,7 +627,7 @@ static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
 static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 	int i;
@@ -671,7 +666,7 @@ static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				      struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	if (!mtk_mdp_try_fmt_mplane(ctx, f))
 		return -EINVAL;
@@ -681,7 +676,7 @@ static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
@@ -727,7 +722,7 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 			       struct v4l2_requestbuffers *reqbufs)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
@@ -735,7 +730,7 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -773,8 +768,8 @@ static inline bool mtk_mdp_is_target_crop(u32 target)
 static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 				       struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	bool valid = false;
 
 	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -840,8 +835,8 @@ static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_rect new_r;
 	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
