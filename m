Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59768B19C21
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278E4C3FAD5;
	Mon,  4 Aug 2025 07:16:25 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A541C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:27:21 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60F9E3B4D;
 Sat,  2 Aug 2025 11:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126795;
 bh=rizlCTL3Kt0Hf0axm/Qmz2Cg8LZmpWFMmM2fmmL3vuU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=h56Mr/7tp64+ZUhXR58WHpxs6lTXlvIdWjSre1q0GxY0AMddJguHdhZYEOteHkdeS
 CBgbgSTk/vlVrlmR0hdREsQR6fwfP5gkZc9sUwWCIPIUHQcbqSPnfLz/3itJS7qh03
 keO6FDaO/hOqJ+zbi8EnAsSQX573NZTL3KgY3IRE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:45 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-23-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VFmrROMakbnqJAC4dcjyTjUYRV1GRcf+sO37WGrNLcg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj6i6wiSBh9v/UN9HA32pPRH6ApLAr4OEu5V
 Jmtrtm6bUSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+gAKCRByNAaPFqFW
 PP3WD/9aG4apNvm9piPJBuxrdRZiK04I5I+fGvAE8sc6cPA2ebtyKA/1vW4z17ikyaAXLSfj+XZ
 e+QhTIIgGHBQxP95xByIpTkMEJQzV26c3v2FCazou0nFI2a5rlgyDMb80UGI7eDeH2TZV+NuKYm
 3gvu+Z2pvEFpnfPIgPjKHJYuSYR0tTuEkXnOwKuBPASdT9lbdclnSvqENlUB3RYFENXKdDsJV3r
 vEmDioX9y5CbnHaNXZ3bazhmprLRP50X+HnqzPZYPJQ0pwS9NkhoEeIX/gg4My1a81hy0s2rj3p
 QQKtoBkF8ugKa2Cl8vElby1slbn8GWdWhUX6XKj0PF/EbHFoMX0WpL6MNz7627PHesJBFkCSj3V
 pKa928ZrOZlEnqLoCwpNeK0g8trbUg57fCg8+AptrrtOT7Vl4tcbRuseBA2fnm+LNxFhi4jSKFS
 Oy+eHwc3b+O6RWSWp42qu0WvbZ3R5UlgAGG/TxRbys5spBYfEhWS2ea+e7g5QP0X3EC/96IGpwA
 1Aid4Grvx67Ighft5mH6q/oEC3SJWJY/8hy3nfbluwXHzFDxeL6qPSFQ0CkAgijSO3+/MsYF/Om
 3lW783CSzxb/dv4pC/MFVIZzz0HUrusA0EoYhNrW3ctLJ2apvab3fv5V4uJ32uDrR6/F/QNkmDA
 xEw42OCIaIk6GOg==
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
Subject: [Linux-stm32] [PATCH 23/65] media: qcom: iris: Set
 file->private_data in iris_v4l2_fh_(de)init()
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

In preparation for a tree-wide rework automated with coccinelle that
will affect file->private_data, v4l2_fh_add() and v4l2_fh_del(), move
setting file->private_data from the callers to the iris_v4l2_fh_init()
and iris_v4l2_fh_deinit() functions. There is not functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d5f99519def45d1c5859e641eed490ec9ad5784a..73c96498759cbde8e1d9870336023e7773f6f28b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -26,10 +26,12 @@ static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
+	filp->private_data = &inst->fh;
 }
 
 static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 {
+	filp->private_data = NULL;
 	v4l2_fh_del(&inst->fh);
 	inst->fh.ctrl_handler = NULL;
 	v4l2_fh_exit(&inst->fh);
@@ -185,7 +187,6 @@ int iris_open(struct file *filp)
 	iris_add_session(inst);
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
-	filp->private_data = &inst->fh;
 
 	return 0;
 
@@ -269,7 +270,6 @@ int iris_close(struct file *filp)
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
 	kfree(inst);
-	filp->private_data = NULL;
 
 	return 0;
 }

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
