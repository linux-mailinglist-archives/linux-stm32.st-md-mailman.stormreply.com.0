Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A78476BB
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 18:56:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4542C71280;
	Fri,  2 Feb 2024 17:56:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D39C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 17:56:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D841B62778;
 Fri,  2 Feb 2024 17:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93CCC433F1;
 Fri,  2 Feb 2024 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706896578;
 bh=xQdrcH5A8lS5nkpqdWRHj3iy+HYu6WHXpSprNhL18UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2CV4Vs8NwjSqfiNsg00uiOUdnJJuA7G6PBrsuSCuxbv159o1b4ZRSuF7OyTOhtXg
 woENTE2tEZiFG6VnssVe1AxW7cvrV8xCAzqix43Te7abvn9q8+RF6SOXtZyIcnOd3y
 EMYamJE3kVbXgwiLkfmAorueG9GOYjnbUGjmWYicmeuDQb7yE/HCvCrsZEp9qL20tc
 M3BgLxNOK490xXJIWbzOX+llq2joPitSar6Z8ot+4L7yd75BSNC4fGtERsbpSjDrtn
 NnsQy+ONyY/VxQ31aLDNyN4L0XbrqNwwIQMDBndcSSeplbKpdbTRz0G4RiT6I92gnA
 3v9r2pn+G8JZQ==
Date: Fri, 2 Feb 2024 11:56:16 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20240202175616.GB310089-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87frye6qjl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87frye6qjl.wl-kuninori.morimoto.gx@renesas.com>
Cc: dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Saravana Kannan <saravanak@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?iso-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Harvey <tharvey@gateworks.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Todor Tomov <todor.too@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-sound@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Leo Yan <leo.yan@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 06/24] media: platform: switch to use
 of_graph_get_next_device_endpoint()
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

On Wed, Jan 31, 2024 at 05:05:34AM +0000, Kuninori Morimoto wrote:
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/atmel/atmel-isi.c                 | 4 ++--
>  drivers/media/platform/intel/pxa_camera.c                | 2 +-
>  drivers/media/platform/microchip/microchip-sama5d2-isc.c | 2 +-
>  drivers/media/platform/microchip/microchip-sama7g5-isc.c | 2 +-
>  drivers/media/platform/qcom/camss/camss.c                | 2 +-
>  drivers/media/platform/renesas/renesas-ceu.c             | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c      | 2 +-
>  drivers/media/platform/samsung/exynos4-is/mipi-csis.c    | 2 +-
>  drivers/media/platform/st/stm32/stm32-dcmi.c             | 4 ++--
>  drivers/media/platform/ti/am437x/am437x-vpfe.c           | 2 +-
>  drivers/media/platform/ti/davinci/vpif.c                 | 3 +--
>  drivers/media/platform/ti/davinci/vpif_capture.c         | 3 +--
>  drivers/media/platform/video-mux.c                       | 2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c              | 2 +-
>  14 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 4046212d48b4..4317750d05ad 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -831,7 +831,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
>  	isi->pdata.full_mode = 1;
>  	isi->pdata.frate = ISI_CFG1_FRATE_CAPTURE_ALL;
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);

Same comment on using of_graph_get_endpoint_by_regs().


>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -EINVAL;
> @@ -1155,7 +1155,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(isi->dev->of_node, NULL);
> +	ep = of_graph_get_next_device_endpoint(isi->dev->of_node, NULL);
>  	if (!ep)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index 59b89e421dc2..f2175c03502b 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
>  		pcdev->mclk = mclk_rate;
>  	}
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);
>  	if (!np) {
>  		dev_err(dev, "could not find endpoint\n");
>  		return -EINVAL;
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 5ac149cf3647..201049c047b0 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -363,7 +363,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  	while (1) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> +		epn = of_graph_get_next_device_endpoint(np, epn);

Looks like this should use the iterator?


>  		if (!epn)
>  			return 0;
>  
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index 73445f33d26b..b617a9bcd398 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -349,7 +349,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
>  	while (1) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> +		epn = of_graph_get_next_device_endpoint(np, epn);
>  		if (!epn)
>  			return 0;
>  
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 8e78dd8d5961..cbb6f88cfe4a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1136,7 +1136,7 @@ static int camss_of_parse_ports(struct camss *camss)
>  	struct device_node *remote = NULL;
>  	int ret, num_subdevs = 0;
>  
> -	for_each_endpoint_of_node(dev->of_node, node) {
> +	for_each_device_endpoint_of_node(dev->of_node, node) {
>  		struct camss_async_subdev *csd;
>  
>  		if (!of_device_is_available(node))
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index 2562b30acfb9..929d17de4ac9 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1526,7 +1526,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
>  	int num_ep;
>  	int ret;
>  
> -	num_ep = of_graph_get_endpoint_count(of);
> +	num_ep = of_graph_get_device_endpoint_count(of);
>  	if (!num_ep)
>  		return -ENODEV;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index a08c87ef6e2d..5ab0399b7718 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
>  		return -EINVAL;
>  	}
>  
> -	ep = of_graph_get_next_endpoint(node, NULL);
> +	ep = of_graph_get_next_device_endpoint(node, NULL);
>  	if (!ep)
>  		return -ENXIO;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> index 686ca8753ba2..a332b4bd76f2 100644
> --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> @@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
>  				 &state->max_num_lanes))
>  		return -EINVAL;
>  
> -	node = of_graph_get_next_endpoint(node, NULL);
> +	node = of_graph_get_next_device_endpoint(node, NULL);
>  	if (!node) {
>  		dev_err(&pdev->dev, "No port node at %pOF\n",
>  				pdev->dev.of_node);
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 8cb4fdcae137..320101f4ad40 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1856,7 +1856,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
> +	ep = of_graph_get_next_device_endpoint(dcmi->dev->of_node, NULL);
>  	if (!ep) {
>  		dev_err(dcmi->dev, "Failed to get next endpoint\n");
>  		return -EINVAL;
> @@ -1915,7 +1915,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	/* Get bus characteristics from devicetree */
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);
>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -ENODEV;
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 5fa2ea9025d9..46876865ec6a 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2309,7 +2309,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> +		endpoint = of_graph_get_next_device_endpoint(dev->of_node, endpoint);
>  		if (!endpoint)
>  			break;
>  
> diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
> index 63cdfed37bc9..021ca79e832b 100644
> --- a/drivers/media/platform/ti/davinci/vpif.c
> +++ b/drivers/media/platform/ti/davinci/vpif.c
> @@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
>  	 * so their devices need to be registered manually here
>  	 * for their legacy platform_drivers to work.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -					      endpoint);
> +	endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
>  	if (!endpoint)
>  		return 0;
>  	of_node_put(endpoint);
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..805c313b41dc 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1521,8 +1521,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  		unsigned int flags;
>  		int err;
>  
> -		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -						      endpoint);
> +		endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
>  		if (!endpoint)
>  			break;
>  
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index 5de6b6694f53..61d84ade7155 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -408,7 +408,7 @@ static int video_mux_probe(struct platform_device *pdev)
>  	 * The largest numbered port is the output port. It determines
>  	 * total number of pads.
>  	 */
> -	for_each_endpoint_of_node(np, ep) {
> +	for_each_device_endpoint_of_node(np, ep) {
>  		struct of_endpoint endpoint;
>  
>  		of_graph_parse_endpoint(ep, &endpoint);
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 996684a73038..9230931d6d7a 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -207,7 +207,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
>  
>  	while (1) {
>  		/* Get the next endpoint and parse its link. */
> -		ep = of_graph_get_next_endpoint(node, ep);
> +		ep = of_graph_get_next_device_endpoint(node, ep);

The rest of this file uses fwnode versions including the very next 
function. This should be fwnode_graph_get_next_endpoint(). But then it's 
a loop, so should be a loop iterator instead.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
