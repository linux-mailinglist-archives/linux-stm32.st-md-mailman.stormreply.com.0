Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A6198CCB
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 09:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8091CC36B0B;
	Tue, 31 Mar 2020 07:17:56 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D71E5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 07:17:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 867CC296952
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
In-Reply-To: <246bf7c71620021258355c2fc32dd38ac6b0cc45.camel@collabora.com>
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
 <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
 <4a9d2d6e5cecbe296c14119d27a8793a7dbed7b2.camel@collabora.com>
 <877dz134xf.fsf@collabora.com>
 <246bf7c71620021258355c2fc32dd38ac6b0cc45.camel@collabora.com>
Date: Tue, 31 Mar 2020 10:19:00 +0300
Message-ID: <874ku52dqz.fsf@collabora.com>
MIME-Version: 1.0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host
	platform driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 31 Mar 2020, Ezequiel Garcia <ezequiel@collabora.com> 
wrote:
> On Tue, 2020-03-31 at 00:31 +0300, Adrian Ratiu wrote: 
>> On Mon, 30 Mar 2020, Ezequiel Garcia <ezequiel@collabora.com> 
>> wrote: 
>> > Hello Fabio, Adrian:   On Mon, 2020-03-30 at 08:49 -0300, 
>> > Fabio Estevam wrote:  
>> > > Hi Adrian,  On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu 
>> > > <adrian.ratiu@collabora.com> wrote:  
>> > > > This adds support for the Synopsis DesignWare MIPI DSI 
>> > > > v1.01  host controller which is embedded in i.MX 6 SoCs. 
>> > > > Based on  following patches, but updated/extended to work 
>> > > > with existing  support found in the kernel:  - drm: imx: 
>> > > > Support Synopsys  DesignWare MIPI DSI host controller  
>> > > >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>  
>> > > >  - ARM: dtsi: imx6qdl: Add support for MIPI DSI host  
>> > > > controller  
>> > > >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>  
>> > >  This one looks like a devicetree patch, but this patch 
>> > >  does  
>> > > not touch devicetree.   
>> > > > +       ret = clk_prepare_enable(dsi->pllref_clk); + 
>> > > > if  (ret) { +               dev_err(dev, "%s: Failed to 
>> > > > enable  pllref_clk\n", __func__); +               return 
>> > > > ret; +  } + +       dsi->mux_sel = 
>> > > > syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr"); 
>> > > > +  if (IS_ERR(dsi->mux_sel)) { +               ret = 
>> > > > PTR_ERR(dsi->mux_sel); +               dev_err(dev, "%s: 
>> > > > Failed to get GPR regmap: %d\n", +  __func__, ret); + 
>> > > > return ret;  
>> > >  You should disable the dsi->pllref_clk clock prior to  
>> > > returning the error.   
>> >  Another approach could be moving the clock on and off to to 
>> > component_ops.{bind,unbind} (as rockhip driver does).    What 
>> > exactly is the PLL clock needed for? Would it make sense to 
>> > move it some of the PHY power on/off? (Maybe not, but it's 
>> > worthing checking).    Also, it seems the other IP blocks 
>> > have this PLL clock, so maybe  it could be moved to the 
>> > dw_mipi_dsi core? This could be  something for a follow-up, 
>> > to avoid creeping this series. 
>>  Hi Ezequiel,  pll is the video reference clock which drives 
>> the data lanes and  yes all drivers have it as it's a basic 
>> requirement, so moving it  to the common bridge is indeed a 
>> good idea, however this kind of  driver refactoring is out of 
>> scope for this specific patch series,  because, for now, I'd 
>> like to get the regmap and the imx6 driver  in, once that is 
>> done we can think how to further abstract away  common logic 
>> and slim down the existing drivers further.   Basically I just 
>> want to avoid feature creep as I expect v6 to be  ~ 8 patches 
>> big and the series is already over 1200 lines.  
> 
> Oh, absolutely: if there's one thing I try to avoid is feature 
> creep -- together with bikeshedding! 
> 
> Do note however, that you could move the PLL clock handling to 
> component_ops.{bind,unbind} and maybe simplify the error 
> handling. 
> 
> (BTW, great work!)

Thanks! I'll do the bind/unbind move for the new imx6 driver which 
I'm
adding in this series to make it resemble the existing rockchip 
driver a bit more, then I'll stop short of further driver 
refactorings.

>
> Cheers,
> Ezequiel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
