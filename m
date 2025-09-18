Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC00B1C3A6
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 11:45:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01ACBC3F93B;
	Wed,  6 Aug 2025 09:45:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91FF5C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 08:17:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24059A56969;
 Wed,  6 Aug 2025 08:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657BBC4CEE7;
 Wed,  6 Aug 2025 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754468219;
 bh=mSezG6NRkxDtJlYf/ZFsHjMGCJmUaCUPnrgkbL+HJRE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=mBlcnILQJQ8itwowSPTjPYWtbmq0X3J4O4tViHMM3acfOo0gkxWlN1i8bih8TRk/D
 QEK88TYFCCAgRdFf8N2vcHquOSOUzegVf8WhW/Lsok7t83wbntVOKbt/9YhJ0whgx3
 5Pw9TjucRRgCke06GxlfRg3jM6WSnxmB2mHB5KAF2EmEO8hgceOt4Z1OmiUmUg2AaV
 FwUr0faqAjE7o5R8MImS6WtgvVuPDjdbXIJiJkaVw/SZsYXDBQgOf6d9ctuBZbPmCU
 dj5qL0frPJSAHC86jkv/ZZcGOlf7y8hBVfvg5g40mjFEZISVqZUlox2uPFHVojc+hd
 jTKUIqp5zZJRg==
Message-ID: <49e753f4-f626-49ae-bf23-d2aecfcc6282@kernel.org>
Date: Wed, 6 Aug 2025 10:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
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
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
X-Mailman-Approved-At: Wed, 06 Aug 2025 09:45:37 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 11/65] media: Replace file->private_data
 access with custom functions
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

On 02/08/2025 11:22, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Accessing file->private_data manually to retrieve the v4l2_fh pointer is
> error-prone, as the field is a void * and will happily cast implicitly
> to any pointer type.
> 
> Replace all remaining locations that read the v4l2_fh pointer directly
> from file->private_data and cast it to driver-specific file handle
> structures with driver-specific functions that use file_to_v4l2_fh() and
> perform the same cast.
> 
> No functional change is intended, this only paves the way to remove
> direct accesses to file->private_data and make V4L2 drivers safer.
> Other accesses to the field will be addressed separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/pci/ivtv/ivtv-driver.h               |  5 ++++
>  drivers/media/pci/ivtv/ivtv-fileops.c              | 10 +++----
>  drivers/media/pci/ivtv/ivtv-ioctl.c                |  8 +++---
>  drivers/media/platform/allegro-dvt/allegro-core.c  |  7 ++++-
>  drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  8 ++++--
>  .../media/platform/chips-media/coda/coda-common.c  |  7 ++++-
>  .../platform/chips-media/wave5/wave5-helper.c      |  2 +-
>  .../media/platform/chips-media/wave5/wave5-vpu.h   |  5 ++++
>  drivers/media/platform/m2m-deinterlace.c           |  7 ++++-
>  .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 ++++-
>  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  7 ++++-
>  .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  7 ++++-
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |  2 +-
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  5 ++++
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |  2 +-
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |  5 ++++
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  7 ++++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  7 ++++-
>  drivers/media/platform/nxp/mx2_emmaprp.c           |  7 ++++-
>  drivers/media/platform/renesas/rcar_fdp1.c         |  7 ++++-
>  drivers/media/platform/renesas/rcar_jpu.c          |  7 ++++-
>  drivers/media/platform/rockchip/rga/rga.c          |  3 +--
>  drivers/media/platform/rockchip/rga/rga.h          |  5 ++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  2 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  5 ++++
>  .../media/platform/samsung/exynos-gsc/gsc-core.h   |  6 +++++
>  .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  6 ++---
>  .../media/platform/samsung/exynos4-is/fimc-core.h  |  5 ++++
>  .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  2 +-
>  drivers/media/platform/samsung/s5p-g2d/g2d.c       |  7 +++--
>  .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  9 +++++--
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  6 ++---
>  .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  6 +++++
>  drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  7 ++++-
>  drivers/media/platform/st/sti/delta/delta-v4l2.c   | 26 +++++++++++-------
>  drivers/media/platform/st/sti/hva/hva-v4l2.c       | 31 ++++++++++++----------
>  drivers/media/platform/st/sti/hva/hva.h            |  2 --
>  drivers/media/platform/st/stm32/dma2d/dma2d.c      |  7 +++--
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  3 +--
>  .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  3 +--
>  drivers/media/platform/ti/omap3isp/ispvideo.c      |  4 +--
>  drivers/media/platform/ti/omap3isp/ispvideo.h      |  6 +++++
>  drivers/media/platform/verisilicon/hantro.h        |  5 ++++
>  drivers/media/platform/verisilicon/hantro_drv.c    |  3 +--
>  drivers/staging/media/imx/imx-media-csc-scaler.c   |  7 ++++-
>  drivers/staging/media/meson/vdec/vdec.c            | 24 ++++++-----------
>  drivers/staging/media/meson/vdec/vdec.h            |  5 ++++
>  drivers/staging/media/sunxi/cedrus/cedrus.c        |  3 +--
>  drivers/staging/media/sunxi/cedrus/cedrus.h        |  5 ++++
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  5 ----
>  50 files changed, 237 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
> index a6ffa99e16bc64a5b7d3e48c1ab32b49a7989242..cad548b28e360ecfe2bcb9fcb5d12cd8823c3727 100644
> --- a/drivers/media/pci/ivtv/ivtv-driver.h
> +++ b/drivers/media/pci/ivtv/ivtv-driver.h
> @@ -388,6 +388,11 @@ static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
>  	return container_of(fh, struct ivtv_open_id, fh);
>  }
>  
> +static inline struct ivtv_open_id *file2id(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct ivtv_open_id, fh);

Why not write:

	return fh2id(file_to_v4l2_fh(filp));

Same for all other drivers that do this. I prefer to have the contained_of()
in just one place.

> +}
> +
>  struct yuv_frame_info
>  {
>  	u32 update;

<snip>

> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 1f134e08923a528cc676f825da68951c97ac2f25..74977f3ae4844022c04de877f31b4fc6aaac0749 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -302,6 +302,11 @@ struct allegro_channel {
>  	unsigned int error;
>  };
>  
> +static inline struct allegro_channel *file_to_channel(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct allegro_channel, fh);
> +}
> +
>  static inline int
>  allegro_channel_get_i_frame_qp(struct allegro_channel *channel)
>  {
> @@ -3229,7 +3234,7 @@ static int allegro_open(struct file *file)
>  
>  static int allegro_release(struct file *file)
>  {
> -	struct allegro_channel *channel = fh_to_channel(file->private_data);
> +	struct allegro_channel *channel = file_to_channel(file);

So a file_to_channel inline function was added, but it is used in just one
place.

I would prefer to just drop the inline function and instead write:

	struct allegro_channel *channel = fh_to_channel(file_to_v4l2_fh(file));

If this is needed in two or more places, then the extra inline makes sense,
but it is a fairly common pattern that it is only needed in the release function.

Adding a new inline just for that seems overkill to me.

>  
>  	v4l2_m2m_ctx_release(channel->fh.m2m_ctx);
>  

Regards,

	Hans
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
