Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91DEB1AB8C
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 01:52:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF31C3089E;
	Mon,  4 Aug 2025 23:51:59 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90C5FC3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Aug 2025 23:51:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B72432FD;
 Tue,  5 Aug 2025 01:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754351467;
 bh=zrpGKuWeQK0S9TRd2/Kg7CrpjpN0Af6Bc1LVC3rkfJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKLfG1lqK2PPXLjLJhZ/Wty2yVy9+P3BkRh+DykETDA4LCFTUf911rSaO6qT+QKO7
 wRdg/H2eRsEY6wy4MGWg5U57U5+Jrerp7zplL0nB707kdVUDUTwWAHa4Hphoow2+vz
 YoO9D6fRkIKHNccFuia9pEsNbAUn8jx2Kons6sjM=
Date: Tue, 5 Aug 2025 02:51:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <20250804235140.GB12087@pendragon.ideasonboard.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
 <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <Frank.li@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-i2c@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
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
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
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
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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

On Sat, Aug 02, 2025 at 02:37:54PM +0200, Konrad Dybcio wrote:
> On 8/1/25 2:00 PM, Laurent Pinchart wrote:
> > On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
> >> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
> >>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
> >>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> >>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> The DMA subsystem attempts to make it theoretically possible to pair
> >>>>> any DMA block with any user. While that's convenient from a
> >>>>> codebase sanity perspective, some blocks are more intertwined.
> >>>>>
> >>>>> One such case is the Qualcomm GENI, where each wrapper contains a
> >>>>> number of Serial Engine instances, each one of which can be programmed
> >>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
> >>>>>
> >>>>> The GPI DMA it's designed together with, needs to receive the ID of the
> >>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
> >>>>> that's done through passing that ID through device tree, with each
> >>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> >>>>> dt-bindings that are full of useless copypasta.
> >>>>>
> >>>>> In a step to cut down on that, let the DMA user give the engine driver
> >>>>> a hint at request time.
> >>>>>
> >>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>> ---
> 
> [...]
> 
> >>>>> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> >>>>> index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> >>>>> --- a/include/linux/of_dma.h
> >>>>> +++ b/include/linux/of_dma.h
> >>>>> @@ -19,7 +19,7 @@ struct of_dma {
> >>>>>  	struct list_head	of_dma_controllers;
> >>>>>  	struct device_node	*of_node;
> >>>>>  	struct dma_chan		*(*of_dma_xlate)
> >>>>> -				(struct of_phandle_args *, struct of_dma *);
> >>>>> +				(struct of_phandle_args *, struct of_dma *, void *);
> >>>>
> >>>> I suggest pass down more informaiton, like client's dev point. So we can
> >>>> auto create device link between client's dev and dma chan's device.
> >>>
> >>> Is .of_dma_xlate() really the right place to do that ? If you want to
> >>> create a device link for PM reasons, isn't it better created when the
> >>> channel is requested ? It should also be removed when the channel is
> >>> freed.
> >>
> >> I remember just need record client device pointer here.
> >>
> >>>>
> >>>> DMA Engineer device
> >>>>    DMA chan device
> >>>>        consumer clients' device.
> >>>>
> >>>> If consumer device runtime pm suspend can auto trigger DMA chan's device's
> >>>> runtime pm function.
> >>>>
> >>>> It will simplifly DMA engine's run time pm manage. Currently many DMA run
> >>>> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
> >>>> free channel.  But many devices request dma channel at probe, which make
> >>>> dma engine work at always 'on' state.
> >>>>
> >>>> But ideally, dma chan should be resume only when it is used to transfer.
> >>>
> >>> This is exactly what I was going to mention after reading the last
> >>> paragraph. Is there anything that prevents a DMA engine driver to
> >>> perform a rutime PM get() when a transfer is submitted
> >>
> >> DMA description is a queue, It is hard to track each descriptor submit and
> >> finished. espcially cycle buffer case.
> >>
> >> And according to dma engine API defination, submit a descriptor not
> >> neccessary to turn on clock, maybe just pure software operation, such as
> >> enqueue it to a software list.
> >>
> >> Many driver call dmaengine_submit() in irq context,  submit new descriptor
> >> when previous descriptor finished. runtime_pm_get() can NOT be called in
> >> atomic context.
> >>
> >> And some driver submit many descripor advance. Only issue_transfer() is
> >> actually trigger hardware to start transfer.
> >>
> >> Some client use cycle descripor, such audio devices.  Some audio devices
> >> have not free descriptor at their run time suspend function, just disable
> >> audio devices's clocks.  Audio devices run time suspend, which means no
> >> one use this dma channel, dma channel can auto suspend if built device link
> >> between audio device and dma chan devices.
> >>
> >> Some DMA client have not devices, such as memory to memory. for this kind
> >> case, it need keep chan always on.
> >>
> >> issue_transfer() can be call in atomic context. but trigger hardware transfer
> >> need clock and runtime_pm_get() can't be called in atomic context.
> >>
> >> Most case issue_transfer() is call in irq handle, which means device should
> >> already be in runtime resume statue.  DMA engine can safely access their
> >> register if using device link.
> > 
> > You have good points there, in particular the fact the issue_transfer()
> > can be called in interrupt context.
> > 
> > For me this calls for new DMA engine operations to "start/stop" the DMA
> > engine (better names are likely needed) from a client perspective.
> > 
> >>> and a put() when
> >>> it completes ? (Logically speaking, the actual implementation would
> >>> likely be a bit different in drivers, but the result would be similar.)
> 
> So.. do you folks want me to alter the patch in any way?

I think the runtime PM issue is orthogonal to the problem this series
addresses. It can be addressed separately.

That being said, I'm not a big fan of passing a void pointer to
.of_xlate() to carry device-specific information, in a device-specific
format. This seems prone to mismatch between clients and DMA engines.
.of_xlate() also seems the wrong place to do this. It would be cleaner
if we could use another operation, such as dmaengine_slave_config() for
instance.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
