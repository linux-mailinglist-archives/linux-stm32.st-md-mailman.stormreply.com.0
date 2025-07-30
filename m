Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251CB165F4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 20:04:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76FA3C30883;
	Wed, 30 Jul 2025 18:04:30 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28231C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 18:04:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B2602C7A;
 Wed, 30 Jul 2025 20:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1753898623;
 bh=cbMS9OmeSERInvl7UM9IzHA/1kYbIyujkvyTsarEoyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0KP4RwvjhhMCHmYAsXZhPvBAliHVBXvGmTOFn0QRy/xgBYQ37WjvUeDdDfOF8VqJ
 4w+3CldYfOmcc+CTzsXf9EPW11/nspDIDvbpl3dvSt3rXoNsvxPu72ajfhRG3E6BLo
 X1Fx2sy170lQ7HQmW8yy5kK+kVNDpQpNmz8aiJ2o=
Date: Wed, 30 Jul 2025 21:04:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <20250730180417.GC21430@pendragon.ideasonboard.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Janne Grunau <j@jannau.net>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH RFC 2/6] dmaengine: Make
 of_dma_request_slave_channel pass a cookie to of_xlate
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

On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The DMA subsystem attempts to make it theoretically possible to pair
> > any DMA block with any user. While that's convenient from a
> > codebase sanity perspective, some blocks are more intertwined.
> >
> > One such case is the Qualcomm GENI, where each wrapper contains a
> > number of Serial Engine instances, each one of which can be programmed
> > to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
> >
> > The GPI DMA it's designed together with, needs to receive the ID of the
> > protocol that's in use, to adjust its behavior accordingly. Currently,
> > that's done through passing that ID through device tree, with each
> > Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> > dt-bindings that are full of useless copypasta.
> >
> > In a step to cut down on that, let the DMA user give the engine driver
> > a hint at request time.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/dma/amba-pl08x.c                       |  3 ++-
> >  drivers/dma/apple-admac.c                      |  3 ++-
> >  drivers/dma/at_hdmac.c                         |  6 ++++--
> >  drivers/dma/at_xdmac.c                         |  3 ++-
> >  drivers/dma/bcm2835-dma.c                      |  3 ++-
> >  drivers/dma/dma-jz4780.c                       |  3 ++-
> >  drivers/dma/dmaengine.c                        | 20 +++++++++++++++++---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  3 ++-
> >  drivers/dma/dw/of.c                            |  3 ++-
> >  drivers/dma/ep93xx_dma.c                       |  6 ++++--
> >  drivers/dma/fsl-edma-main.c                    |  6 ++++--
> >  drivers/dma/img-mdc-dma.c                      |  3 ++-
> >  drivers/dma/imx-dma.c                          |  3 ++-
> >  drivers/dma/imx-sdma.c                         |  3 ++-
> >  drivers/dma/lgm/lgm-dma.c                      |  3 ++-
> >  drivers/dma/milbeaut-hdmac.c                   |  4 +++-
> >  drivers/dma/mmp_pdma.c                         |  3 ++-
> >  drivers/dma/mmp_tdma.c                         |  3 ++-
> >  drivers/dma/moxart-dma.c                       |  3 ++-
> >  drivers/dma/mxs-dma.c                          |  3 ++-
> >  drivers/dma/nbpfaxi.c                          |  3 ++-
> >  drivers/dma/of-dma.c                           | 18 +++++++++++-------
> >  drivers/dma/owl-dma.c                          |  3 ++-
> >  drivers/dma/pl330.c                            |  3 ++-
> >  drivers/dma/pxa_dma.c                          |  3 ++-
> >  drivers/dma/qcom/bam_dma.c                     |  3 ++-
> >  drivers/dma/qcom/gpi.c                         |  3 ++-
> >  drivers/dma/qcom/qcom_adm.c                    |  3 ++-
> >  drivers/dma/sh/rcar-dmac.c                     |  3 ++-
> >  drivers/dma/sh/rz-dmac.c                       |  3 ++-
> >  drivers/dma/sh/usb-dmac.c                      |  3 ++-
> >  drivers/dma/st_fdma.c                          |  3 ++-
> >  drivers/dma/ste_dma40.c                        |  3 ++-
> >  drivers/dma/stm32/stm32-dma.c                  |  3 ++-
> >  drivers/dma/stm32/stm32-dma3.c                 |  4 +++-
> >  drivers/dma/stm32/stm32-mdma.c                 |  3 ++-
> >  drivers/dma/sun4i-dma.c                        |  3 ++-
> >  drivers/dma/sun6i-dma.c                        |  3 ++-
> >  drivers/dma/tegra186-gpc-dma.c                 |  3 ++-
> >  drivers/dma/tegra20-apb-dma.c                  |  3 ++-
> >  drivers/dma/tegra210-adma.c                    |  3 ++-
> >  drivers/dma/ti/cppi41.c                        |  3 ++-
> >  drivers/dma/ti/edma.c                          |  3 ++-
> >  drivers/dma/ti/k3-udma.c                       |  3 ++-
> >  drivers/dma/uniphier-xdmac.c                   |  3 ++-
> >  drivers/dma/xilinx/xilinx_dma.c                |  3 ++-
> >  drivers/dma/xilinx/xilinx_dpdma.c              |  3 ++-
> >  drivers/dma/xilinx/zynqmp_dma.c                |  3 ++-
> >  include/linux/dmaengine.h                      |  7 +++++++
> >  include/linux/of_dma.h                         | 16 +++++++++-------
> >  sound/soc/apple/mca.c                          |  2 +-
> >  sound/soc/renesas/rcar/dma.c                   |  2 +-
> >  52 files changed, 146 insertions(+), 68 deletions(-)
> >
> > diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> 
> ...
> 
> >  						const char *name)
> >  {
> > diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> > index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> > --- a/include/linux/of_dma.h
> > +++ b/include/linux/of_dma.h
> > @@ -19,7 +19,7 @@ struct of_dma {
> >  	struct list_head	of_dma_controllers;
> >  	struct device_node	*of_node;
> >  	struct dma_chan		*(*of_dma_xlate)
> > -				(struct of_phandle_args *, struct of_dma *);
> > +				(struct of_phandle_args *, struct of_dma *, void *);
> 
> I suggest pass down more informaiton, like client's dev point. So we can
> auto create device link between client's dev and dma chan's device.

Is .of_dma_xlate() really the right place to do that ? If you want to
create a device link for PM reasons, isn't it better created when the
channel is requested ? It should also be removed when the channel is
freed.

> 
> DMA Engineer device
>    DMA chan device
>        consumer clients' device.
> 
> If consumer device runtime pm suspend can auto trigger DMA chan's device's
> runtime pm function.
> 
> It will simplifly DMA engine's run time pm manage. Currently many DMA run
> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
> free channel.  But many devices request dma channel at probe, which make
> dma engine work at always 'on' state.
> 
> But ideally, dma chan should be resume only when it is used to transfer.

This is exactly what I was going to mention after reading the last
paragraph. Is there anything that prevents a DMA engine driver to
perform a rutime PM get() when a transfer is submitted and a put() when
it completes ? (Logically speaking, the actual implementation would
likely be a bit different in drivers, but the result would be similar.)

> >  	void			*(*of_dma_route_allocate)
> >  				(struct of_phandle_args *, struct of_dma *);
> >  	struct dma_router	*dma_router;
> > @@ -34,7 +34,7 @@ struct of_dma_filter_info {
> >  #ifdef CONFIG_DMA_OF
> >  extern int of_dma_controller_register(struct device_node *np,
> >  		struct dma_chan *(*of_dma_xlate)
> > -		(struct of_phandle_args *, struct of_dma *),
> > +		(struct of_phandle_args *, struct of_dma *, void *),
> >  		void *data);
> >  extern void of_dma_controller_free(struct device_node *np);
> >
> > @@ -45,16 +45,17 @@ extern int of_dma_router_register(struct device_node *np,
> >  #define of_dma_router_free of_dma_controller_free
> >
> >  extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > -						     const char *name);
> > +						     const char *name,
> > +						     void *data);
> >  extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
> > -		struct of_dma *ofdma);
> > +		struct of_dma *ofdma, void *data);
> >  extern struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
> > -		struct of_dma *ofdma);
> > +		struct of_dma *ofdma, void *data);
> >
> >  #else
> >  static inline int of_dma_controller_register(struct device_node *np,
> >  		struct dma_chan *(*of_dma_xlate)
> > -		(struct of_phandle_args *, struct of_dma *),
> > +		(struct of_phandle_args *, struct of_dma *, void *),
> >  		void *data)
> >  {
> >  	return -ENODEV;
> > @@ -75,7 +76,8 @@ static inline int of_dma_router_register(struct device_node *np,
> >  #define of_dma_router_free of_dma_controller_free
> >
> >  static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > -						     const char *name)
> > +							    const char *name,
> > +							    void *data)
> >  {
> >  	return ERR_PTR(-ENODEV);
> >  }
> > diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> > index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..43d48e4ac8161ee9955120fe64f7b911bfdfe1ca 100644
> > --- a/sound/soc/apple/mca.c
> > +++ b/sound/soc/apple/mca.c
> > @@ -926,7 +926,7 @@ static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned
> >  	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
> >  				    is_tx ? "tx%da" : "rx%db", cl->no);
> >  #endif
> > -	return of_dma_request_slave_channel(cl->host->dev->of_node, name);
> > +	return of_dma_request_slave_channel(cl->host->dev->of_node, name, NULL);
> >
> >  }
> >
> > diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> > index 2035ce06fe4c4aeaa8620d817910a5319732fa58..dcbff2fc61a0472adea226371016a128563b3cd0 100644
> > --- a/sound/soc/renesas/rcar/dma.c
> > +++ b/sound/soc/renesas/rcar/dma.c
> > @@ -204,7 +204,7 @@ struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *nam
> >  		}
> >
> >  		if (i == rsnd_mod_id_raw(mod) && (!chan))
> > -			chan = of_dma_request_slave_channel(np, x);
> > +			chan = of_dma_request_slave_channel(np, x, NULL);
> >  		i++;
> >  	}
> >

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
