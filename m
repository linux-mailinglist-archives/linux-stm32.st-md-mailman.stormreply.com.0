Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AAB19C38
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D5EC29081;
	Mon,  4 Aug 2025 07:16:35 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F3F3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:31:00 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1273442A8;
 Sat,  2 Aug 2025 11:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754127014;
 bh=Zf/YF3LmVEiKTVMxhxN0Gc3jRXrBb3FeFalAScFj6mo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YPXEsqU+w5BHs2YjAiEdi9Om4cBHZlvX9Eujp4q56v0+VTiJPEhylI/ND2mDx+g56
 HaO3XrJCv0FpZqsUki4cZrhfVPyfjn/UI5Xx7uqpalKNp5RiY75mnWGs+tk1l/zFK6
 zopdbV1n9Z7K07TR/Ze4XWK1UeA0MeTKcHg4DeUY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:08 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-46-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3270;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Zf/YF3LmVEiKTVMxhxN0Gc3jRXrBb3FeFalAScFj6mo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj99+qGA9flCQyC0++cheYFVG3MraszyTga5
 d8jaXvn40aJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/QAKCRByNAaPFqFW
 PD+MEACYV0w7+ed4A0+Uo+tBCjNKgzmO9oF6JqADv7iHNudn42HhFykLdXyiqpLvzF6gyhoDnB6
 6L2bJ5NdgwQhQU8kd6jXjAuWCDD47AvAWGJ3V/J9MR/iMk6KHBQiOj33HbBhyX2KMn2y6tdms2C
 RoOvQGhJm1b0dqHD0Zr/wD5YXKZwADh+Q56rqQDe/qe+lPFPG5Ninkbw9tgYRok43YSUF1fX0c+
 ZTGz+YOlqi0Mq+8u/Bbp+svfhyL/JE5OHosRFcPyIAbNsfb3bojLWbIA3ge6yVBS00hhwNGgmDK
 LNUaCOcL0tyYkJwna8zv4df3i9FYGaLKabR50yMu59Db0iRnsKVetY3Q72r9opleDRyQmhPTFHE
 HvugiIJ9lmcjKuZpRjJRUcLU/8rdoNTUgj2UUYTT7bkQb5F98sUeexN04EySlWp49oElL+aSqM8
 Q4ZMmB2m0fOmdEStlAcqGQ9FBO/Uxy8698vqbNX7y5Qbz33JwsdbCN25DkUi+YSVBtexCKevBqB
 wBXQyyP6iqnuvCUsn8ujdk6JitPJkPQWrD+/LRKVBS0T7EsM1p9DCk6qMzNMzbtqQIX9aL9Ezy2
 823yvwOJotRBYc7vRV6EDSHmodGV0Kaq5g4JTSF4z1rw0Dyh5gPW2Xezvyr4ppe7lXloMWmVpDo
 lNwfgwGbMF+bYTA==
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
Subject: [Linux-stm32] [PATCH 46/65] media: exynos4-is: Access v4l2_fh from
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
 drivers/media/platform/samsung/exynos4-is/fimc-core.h |  2 --
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c  | 10 +++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 25711df062e79eb2066f0f6eab1c1733f16c9c2d..c23cbdee7afcdfedf1a2ef0433b98af6b4478eef 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -496,8 +496,6 @@ struct fimc_ctx {
 	struct fimc_ctrls	ctrls;
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
-
 static inline struct fimc_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct fimc_ctx, fh);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 609fd84f89d4ad189d0f367bb37693f15f3a618e..562c57f186c61546175b4f902f1da18fbb2f25fe 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -249,7 +249,7 @@ static int fimc_m2m_enum_fmt(struct file *file, void *priv,
 static int fimc_m2m_g_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame = ctx_get_frame(ctx, f->type);
 
 	if (IS_ERR(frame))
@@ -308,7 +308,7 @@ static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, struct v4l2_format *f)
 static int fimc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	return fimc_try_fmt_mplane(ctx, f);
 }
 
@@ -337,7 +337,7 @@ static void __set_frame_format(struct fimc_frame *frame,
 static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	const struct fimc_fmt *fmt;
 	struct vb2_queue *vq;
@@ -376,7 +376,7 @@ static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int fimc_m2m_g_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	const struct fimc_frame *frame;
 
 	frame = ctx_get_frame(ctx, s->type);
@@ -484,7 +484,7 @@ static int fimc_m2m_try_selection(struct fimc_ctx *ctx,
 static int fimc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(fh);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	struct fimc_frame *f;
 	int ret;

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
