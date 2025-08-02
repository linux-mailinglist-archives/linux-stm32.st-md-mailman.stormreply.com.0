Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB977B19C4C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 987AAC2908D;
	Mon,  4 Aug 2025 07:16:44 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90AD4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:34:33 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E440F472E;
 Sat,  2 Aug 2025 11:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754127227;
 bh=MrdfBuiJDJdoBv4b751iBqFa9M+7Xv1MvZGdO8+lnsg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=psjuyqMBRmDLNxP0IbxVTmyJevSFVbJIIUJQLgEg3gAWBSRg51n61EimOOnJLwU+k
 Lt1n5scq+Wt3bF9NYQCGXKu6eCTDWGz/iXZn/QawP4/LJbpxnyS1m/M2br02bHBVdy
 gBn1GluYkG0cc7OR4hEguBVPrXgRcBmA3zKok/bU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:27 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-65-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21492;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VTiw2so+SRK4TLTBQ53Fo3MhY/lo6PzNuza3pazMdL0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj/f5wCMdSH0vVY1Y7OlgvshETBYqe+XacX6
 xT+775tH4SJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/wAKCRByNAaPFqFW
 PHsnEACLr+gDJL9vZAkKrpe29fhBYt13xAnLsFvEFTlkxrJJ9U2KWg0U9bntFmMJrrNu27Nu31F
 55mTivoaN/tzzNR4J0cra3HySA/fyoNX6ZpoPd7xyJtF6HYwXxzBaL+WQKNFBY4OSwiVjh6KD3w
 SLO36flHE4zXwhsp+a6X/fMWh5VmvESSEBMcGD5FnBoApzizkEZrebl/VA4xN9+e0ftuIdUoG4p
 PSiuusvVRSdQ/d1raXArwUL6R/Fifsv3Zqrwo1HxUFqAxDkclS3QiPHXQ4+EeH5WKvKPFd1+xyw
 8zPu+k/jy3RR1awMEATVHjkRj2dqXwXpm7hF+fdFP+T9x9s9ThxcKuiI+U+uMTwG6xWNfyhxW+Y
 Fk72UStjWaKWm32MoHFIO2Xc/BirLt1gd8IypmfjA0uFZyWwOcXVKA7B4IlRE6uYBb++mKQ2/Fq
 +52K2oPkJDKD8Dd7/gYUdpu6nCa3IvFpyiBaXmStyZMnybeS5xOrZAIC0iI/XiGhs5EpDB97hU8
 jPGz+SCjbgF0KXFLvnFTd4EtUGUvVk7snJ0oPgeNyWQJEnCkCGIXD0BHSuvQzxnVoHyLb809SRU
 tBWAZUqcUtJEtcg8TziQVZ+H11IDieNETbiTTNnAwlwPHWe+Hc6DrwoKe3D8NYZEKqdf99tKBvM
 wbvDLMjOt1CyO2A==
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
Subject: [Linux-stm32] [PATCH 65/65] media: v4l2-ioctl: Stop passing fh
 pointer to ioctl handlers
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

Now that all drivers access the v4l2_fh from the file structure, there
is no need to pass it as an explicit argument to ioctl handlers. Set the
argument to NULL in the w__video_do_ioctl(), and drop the name of the
void *fh argument in the ioctl handler declarations to indicate it is
not used.

The argument could be removed altogether with a mechanical change
(probably using coccinelle), but there are plans to pass a new argument
to the ioctl handlers in the near future. The tree-wide change to remove
the argument, only to add another one soon after, would be too much
churn.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
 include/media/v4l2-ioctl.h           | 236 +++++++++++++++++------------------
 2 files changed, 120 insertions(+), 121 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 44c2f5ef3dae407d9786c5278d13efc982be2ff0..248a0b5b56ec7a09f2d4c61114f81aa5a9b8b041 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3078,7 +3078,6 @@ static long __video_do_ioctl(struct file *file,
 	bool write_only = false;
 	struct v4l2_ioctl_info default_info;
 	const struct v4l2_ioctl_info *info;
-	void *fh = file_to_v4l2_fh(file);
 	struct v4l2_fh *vfh = NULL;
 	int dev_debug = vfd->dev_debug;
 	long ret = -ENOTTY;
@@ -3140,11 +3139,11 @@ static long __video_do_ioctl(struct file *file,
 
 	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
 	if (info != &default_info) {
-		ret = info->func(ops, file, fh, arg);
+		ret = info->func(ops, file, NULL, arg);
 	} else if (!ops->vidioc_default) {
 		ret = -ENOTTY;
 	} else {
-		ret = ops->vidioc_default(file, fh,
+		ret = ops->vidioc_default(file, NULL,
 			vfh ? v4l2_prio_check(vfd->prio, vfh->prio) >= 0 : 0,
 			cmd, arg);
 	}
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 82695c3a300a73219f262fb556ed61a8f09d273e..223e2c7a3516fc96fb486ab64226163e52f775a6 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -293,144 +293,144 @@ struct v4l2_ioctl_ops {
 	/* ioctl callbacks */
 
 	/* VIDIOC_QUERYCAP handler */
-	int (*vidioc_querycap)(struct file *file, void *fh,
+	int (*vidioc_querycap)(struct file *file, void *,
 			       struct v4l2_capability *cap);
 
 	/* VIDIOC_ENUM_FMT handlers */
-	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *,
 					   struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *,
 					struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *,
 					struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
-	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *,
 					struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *,
 					    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *,
 				     struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_out)(struct file *file, void *,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
-	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *,
 					struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *,
 					    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *,
 				     struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_out)(struct file *file, void *,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
-	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *,
 					  struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *,
 				       struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_out)(struct file *file, void *,
 				       struct v4l2_format *f);
 
 	/* Buffer handlers */
-	int (*vidioc_reqbufs)(struct file *file, void *fh,
+	int (*vidioc_reqbufs)(struct file *file, void *,
 			      struct v4l2_requestbuffers *b);
-	int (*vidioc_querybuf)(struct file *file, void *fh,
+	int (*vidioc_querybuf)(struct file *file, void *,
 			       struct v4l2_buffer *b);
-	int (*vidioc_qbuf)(struct file *file, void *fh,
+	int (*vidioc_qbuf)(struct file *file, void *,
 			   struct v4l2_buffer *b);
-	int (*vidioc_expbuf)(struct file *file, void *fh,
+	int (*vidioc_expbuf)(struct file *file, void *,
 			     struct v4l2_exportbuffer *e);
-	int (*vidioc_dqbuf)(struct file *file, void *fh,
+	int (*vidioc_dqbuf)(struct file *file, void *,
 			    struct v4l2_buffer *b);
 
-	int (*vidioc_create_bufs)(struct file *file, void *fh,
+	int (*vidioc_create_bufs)(struct file *file, void *,
 				  struct v4l2_create_buffers *b);
-	int (*vidioc_prepare_buf)(struct file *file, void *fh,
+	int (*vidioc_prepare_buf)(struct file *file, void *,
 				  struct v4l2_buffer *b);
-	int (*vidioc_remove_bufs)(struct file *file, void *fh,
+	int (*vidioc_remove_bufs)(struct file *file, void *,
 				  struct v4l2_remove_buffers *d);
 
-	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
-	int (*vidioc_g_fbuf)(struct file *file, void *fh,
+	int (*vidioc_overlay)(struct file *file, void *, unsigned int i);
+	int (*vidioc_g_fbuf)(struct file *file, void *,
 			     struct v4l2_framebuffer *a);
-	int (*vidioc_s_fbuf)(struct file *file, void *fh,
+	int (*vidioc_s_fbuf)(struct file *file, void *,
 			     const struct v4l2_framebuffer *a);
 
 		/* Stream on/off */
-	int (*vidioc_streamon)(struct file *file, void *fh,
+	int (*vidioc_streamon)(struct file *file, void *,
 			       enum v4l2_buf_type i);
-	int (*vidioc_streamoff)(struct file *file, void *fh,
+	int (*vidioc_streamoff)(struct file *file, void *,
 				enum v4l2_buf_type i);
 
 		/*
@@ -438,135 +438,135 @@ struct v4l2_ioctl_ops {
 		 *
 		 * Note: ENUMSTD is handled by videodev.c
 		 */
-	int (*vidioc_g_std)(struct file *file, void *fh, v4l2_std_id *norm);
-	int (*vidioc_s_std)(struct file *file, void *fh, v4l2_std_id norm);
-	int (*vidioc_querystd)(struct file *file, void *fh, v4l2_std_id *a);
+	int (*vidioc_g_std)(struct file *file, void *, v4l2_std_id *norm);
+	int (*vidioc_s_std)(struct file *file, void *, v4l2_std_id norm);
+	int (*vidioc_querystd)(struct file *file, void *, v4l2_std_id *a);
 
 		/* Input handling */
-	int (*vidioc_enum_input)(struct file *file, void *fh,
+	int (*vidioc_enum_input)(struct file *file, void *,
 				 struct v4l2_input *inp);
-	int (*vidioc_g_input)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_input)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_input)(struct file *file, void *, unsigned int *i);
+	int (*vidioc_s_input)(struct file *file, void *, unsigned int i);
 
 		/* Output handling */
-	int (*vidioc_enum_output)(struct file *file, void *fh,
+	int (*vidioc_enum_output)(struct file *file, void *,
 				  struct v4l2_output *a);
-	int (*vidioc_g_output)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_output)(struct file *file, void *, unsigned int *i);
+	int (*vidioc_s_output)(struct file *file, void *, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
+	int (*vidioc_query_ext_ctrl)(struct file *file, void *,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_g_ext_ctrls)(struct file *file, void *,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_s_ext_ctrls)(struct file *file, void *,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_try_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_try_ext_ctrls)(struct file *file, void *,
 				    struct v4l2_ext_controls *a);
-	int (*vidioc_querymenu)(struct file *file, void *fh,
+	int (*vidioc_querymenu)(struct file *file, void *,
 				struct v4l2_querymenu *a);
 
 	/* Audio ioctls */
-	int (*vidioc_enumaudio)(struct file *file, void *fh,
+	int (*vidioc_enumaudio)(struct file *file, void *,
 				struct v4l2_audio *a);
-	int (*vidioc_g_audio)(struct file *file, void *fh,
+	int (*vidioc_g_audio)(struct file *file, void *,
 			      struct v4l2_audio *a);
-	int (*vidioc_s_audio)(struct file *file, void *fh,
+	int (*vidioc_s_audio)(struct file *file, void *,
 			      const struct v4l2_audio *a);
 
 	/* Audio out ioctls */
-	int (*vidioc_enumaudout)(struct file *file, void *fh,
+	int (*vidioc_enumaudout)(struct file *file, void *,
 				 struct v4l2_audioout *a);
-	int (*vidioc_g_audout)(struct file *file, void *fh,
+	int (*vidioc_g_audout)(struct file *file, void *,
 			       struct v4l2_audioout *a);
-	int (*vidioc_s_audout)(struct file *file, void *fh,
+	int (*vidioc_s_audout)(struct file *file, void *,
 			       const struct v4l2_audioout *a);
-	int (*vidioc_g_modulator)(struct file *file, void *fh,
+	int (*vidioc_g_modulator)(struct file *file, void *,
 				  struct v4l2_modulator *a);
-	int (*vidioc_s_modulator)(struct file *file, void *fh,
+	int (*vidioc_s_modulator)(struct file *file, void *,
 				  const struct v4l2_modulator *a);
 	/* Crop ioctls */
-	int (*vidioc_g_pixelaspect)(struct file *file, void *fh,
+	int (*vidioc_g_pixelaspect)(struct file *file, void *,
 				    int buf_type, struct v4l2_fract *aspect);
-	int (*vidioc_g_selection)(struct file *file, void *fh,
+	int (*vidioc_g_selection)(struct file *file, void *,
 				  struct v4l2_selection *s);
-	int (*vidioc_s_selection)(struct file *file, void *fh,
+	int (*vidioc_s_selection)(struct file *file, void *,
 				  struct v4l2_selection *s);
 	/* Compression ioctls */
-	int (*vidioc_g_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_g_jpegcomp)(struct file *file, void *,
 				 struct v4l2_jpegcompression *a);
-	int (*vidioc_s_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_s_jpegcomp)(struct file *file, void *,
 				 const struct v4l2_jpegcompression *a);
-	int (*vidioc_g_enc_index)(struct file *file, void *fh,
+	int (*vidioc_g_enc_index)(struct file *file, void *,
 				  struct v4l2_enc_idx *a);
-	int (*vidioc_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_encoder_cmd)(struct file *file, void *,
 				  struct v4l2_encoder_cmd *a);
-	int (*vidioc_try_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_encoder_cmd)(struct file *file, void *,
 				      struct v4l2_encoder_cmd *a);
-	int (*vidioc_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_decoder_cmd)(struct file *file, void *,
 				  struct v4l2_decoder_cmd *a);
-	int (*vidioc_try_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_decoder_cmd)(struct file *file, void *,
 				      struct v4l2_decoder_cmd *a);
 
 	/* Stream type-dependent parameter ioctls */
-	int (*vidioc_g_parm)(struct file *file, void *fh,
+	int (*vidioc_g_parm)(struct file *file, void *,
 			     struct v4l2_streamparm *a);
-	int (*vidioc_s_parm)(struct file *file, void *fh,
+	int (*vidioc_s_parm)(struct file *file, void *,
 			     struct v4l2_streamparm *a);
 
 	/* Tuner ioctls */
-	int (*vidioc_g_tuner)(struct file *file, void *fh,
+	int (*vidioc_g_tuner)(struct file *file, void *,
 			      struct v4l2_tuner *a);
-	int (*vidioc_s_tuner)(struct file *file, void *fh,
+	int (*vidioc_s_tuner)(struct file *file, void *,
 			      const struct v4l2_tuner *a);
-	int (*vidioc_g_frequency)(struct file *file, void *fh,
+	int (*vidioc_g_frequency)(struct file *file, void *,
 				  struct v4l2_frequency *a);
-	int (*vidioc_s_frequency)(struct file *file, void *fh,
+	int (*vidioc_s_frequency)(struct file *file, void *,
 				  const struct v4l2_frequency *a);
-	int (*vidioc_enum_freq_bands)(struct file *file, void *fh,
+	int (*vidioc_enum_freq_bands)(struct file *file, void *,
 				      struct v4l2_frequency_band *band);
 
 	/* Sliced VBI cap */
-	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *,
 				       struct v4l2_sliced_vbi_cap *a);
 
 	/* Log status ioctl */
-	int (*vidioc_log_status)(struct file *file, void *fh);
+	int (*vidioc_log_status)(struct file *file, void *);
 
-	int (*vidioc_s_hw_freq_seek)(struct file *file, void *fh,
+	int (*vidioc_s_hw_freq_seek)(struct file *file, void *,
 				     const struct v4l2_hw_freq_seek *a);
 
 	/* Debugging ioctls */
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	int (*vidioc_g_register)(struct file *file, void *fh,
+	int (*vidioc_g_register)(struct file *file, void *,
 				 struct v4l2_dbg_register *reg);
-	int (*vidioc_s_register)(struct file *file, void *fh,
+	int (*vidioc_s_register)(struct file *file, void *,
 				 const struct v4l2_dbg_register *reg);
 
-	int (*vidioc_g_chip_info)(struct file *file, void *fh,
+	int (*vidioc_g_chip_info)(struct file *file, void *,
 				  struct v4l2_dbg_chip_info *chip);
 #endif
 
-	int (*vidioc_enum_framesizes)(struct file *file, void *fh,
+	int (*vidioc_enum_framesizes)(struct file *file, void *,
 				      struct v4l2_frmsizeenum *fsize);
 
-	int (*vidioc_enum_frameintervals)(struct file *file, void *fh,
+	int (*vidioc_enum_frameintervals)(struct file *file, void *,
 					  struct v4l2_frmivalenum *fival);
 
 	/* DV Timings IOCTLs */
-	int (*vidioc_s_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_s_dv_timings)(struct file *file, void *,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_g_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_g_dv_timings)(struct file *file, void *,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_query_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_query_dv_timings)(struct file *file, void *,
 				       struct v4l2_dv_timings *timings);
-	int (*vidioc_enum_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_enum_dv_timings)(struct file *file, void *,
 				      struct v4l2_enum_dv_timings *timings);
-	int (*vidioc_dv_timings_cap)(struct file *file, void *fh,
+	int (*vidioc_dv_timings_cap)(struct file *file, void *,
 				     struct v4l2_dv_timings_cap *cap);
-	int (*vidioc_g_edid)(struct file *file, void *fh,
+	int (*vidioc_g_edid)(struct file *file, void *,
 			     struct v4l2_edid *edid);
-	int (*vidioc_s_edid)(struct file *file, void *fh,
+	int (*vidioc_s_edid)(struct file *file, void *,
 			     struct v4l2_edid *edid);
 
 	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
@@ -575,7 +575,7 @@ struct v4l2_ioctl_ops {
 					const struct v4l2_event_subscription *sub);
 
 	/* For other private ioctls */
-	long (*vidioc_default)(struct file *file, void *fh,
+	long (*vidioc_default)(struct file *file, void *,
 			       bool valid_prio, unsigned int cmd, void *arg);
 };
 

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
