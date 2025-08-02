Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BFB19C28
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Aug 2025 09:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8403C3FAFE;
	Mon,  4 Aug 2025 07:16:25 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF57DC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 09:28:22 +0000 (UTC)
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it
 [5.90.138.121])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3DB13BFA;
 Sat,  2 Aug 2025 11:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754126857;
 bh=EupQNZwVDEWPV0lRXOPIWwyqRXZFDT974pCYxdDmFr4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hpY78CmkVv74nSpWm7mIQCCiDoYD4+PYB95WVTP4W7eZHiEy+SV4qDjjuyt3l55ad
 Wo1Jomg7/kuakxont8Lj75UEoyxO/gXWRVep1Pym+B5WryRO5Bf/nqQHWEQxxF549z
 O+SKZiZJEXIhWbrbWhqqK7Mujk0z12AkXw6FIywc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:51 +0200
MIME-Version: 1.0
Message-Id: <20250802-media-private-data-v1-29-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=EupQNZwVDEWPV0lRXOPIWwyqRXZFDT974pCYxdDmFr4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj6938RTcCW3JLF7q2TU/zTQB1aW4uCXzbSl
 KRPGOpR5M2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+gAKCRByNAaPFqFW
 PPEoEACtOVVZcE0Jno+wySkwxbtRcY7fcEkuzlP+5mpC4ISfqOV+gM1G/t+jhOBOQxI2V/sx6dj
 NffRk/kDtQ0yQ4OGn75YP9PwPU1u9Ho0ABWevDJPGYy5zNzO1Ho6BvS55kDKWQhWVZUBNHaX5q7
 ydYl8Kklpn3uECXV2WO4sJhJcOUYT1yZ4VZ7O6wNgmZjaL+XavqFPr05yLv4ATGvhCQK1zttCLo
 ZuyM2KYvgb2RWYqOlshgBkBj6Ry5xxAPHBGJltaqSdAms5rji4stoNX+CGpKTz/eZCE1XaM8lec
 KfphPeP6gNXjr4erndbjbZ5ZG4SszKQ0+yLymE6Wdj+DQvrPjHGjJCx1xRLzDG4PzvA3ILsaB2E
 cmu6TARWAS4IXzftMkQ7UsHq3BLGTqd1B/BroBVisfe+SI5XaE8KQyW7YdgWWMUPmgD6IqaQ0D8
 NG5HUaRIsNxYllVZYKG+EbXmU0cfD3ELrYPOBtInFkGy717UK1q8BcTX6XcC+G8qhbJZBsiGM6w
 SqUODvlIMVAPmeAe8idoPhTsaqG0rZJ6GHa13M4scN3OICYwSQoh2HrXwVz5Fs+X8Z993R2hRiR
 UuwCyI5NZ+aiwhmLknbWCncfbc/sPJStc5Q8ddqgjMoRv47AcoNqw7tZnQ+l3zMnhzdNFYcsO4x
 6BSqqLyKW3RHXBA==
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
Subject: [Linux-stm32] [PATCH 29/65] media: allegro: Access v4l2_fh from file
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

While at it remove the only left user of fh_to_channel() and remove
the macro completely.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 5e3b1f5d7206d84b8ccb9ea3b3f3f1fe75becf99..81c6afcf2d06f9e39015e49d355346238c5033d8 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -197,8 +197,6 @@ static const struct regmap_config allegro_sram_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-#define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
-
 struct allegro_channel {
 	struct allegro_dev *dev;
 	struct v4l2_fh fh;
@@ -3284,7 +3282,7 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
 static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 	f->fmt.pix.width = channel->width;
@@ -3326,7 +3324,7 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct vb2_queue *vq;
 	int err;
 
@@ -3350,7 +3348,7 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 static int allegro_g_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
@@ -3397,7 +3395,7 @@ static int allegro_try_fmt_vid_out(struct file *file, void *fh,
 static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	err = allegro_try_fmt_vid_out(file, fh, f);
@@ -3438,7 +3436,7 @@ static int allegro_channel_cmd_start(struct allegro_channel *channel)
 static int allegro_encoder_cmd(struct file *file, void *fh,
 			       struct v4l2_encoder_cmd *cmd)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
@@ -3488,7 +3486,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
 				  enum v4l2_buf_type type)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -3503,7 +3501,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
 static int allegro_g_parm(struct file *file, void *fh,
 			  struct v4l2_streamparm *a)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct v4l2_fract *timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -3520,7 +3518,7 @@ static int allegro_g_parm(struct file *file, void *fh,
 static int allegro_s_parm(struct file *file, void *fh,
 			  struct v4l2_streamparm *a)
 {
-	struct allegro_channel *channel = fh_to_channel(fh);
+	struct allegro_channel *channel = file_to_channel(file);
 	struct v4l2_fract *timeperframe;
 	int div;
 

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
