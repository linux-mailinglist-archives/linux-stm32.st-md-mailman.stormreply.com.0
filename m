Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8B7AB58C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 18:08:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E44C6A5EF;
	Fri, 22 Sep 2023 16:08:08 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A280CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 16:08:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7715EB53;
 Fri, 22 Sep 2023 18:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695398787;
 bh=Xs3HJJWVKmjQFBtIkxcpfdhvwl2YfTPFfT5f3BfS2P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t73D12u6qC9MwrL4EN+MJkqQgp8Rs+xx1TrYWHeuwHkDYx6/IRBk+tcFmwEQp2yDF
 xUu+ANq5DNzWHpse7/U/0k6LIx7krIxAb3UQ9SblPw+J9fqW5N8uET3qKi1EKGQDcG
 hGHEk39Slm/akpi8hzrc/Gc9BJSt4dU8Yipks9ns=
Date: Fri, 22 Sep 2023 19:08:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20230922160818.GJ19112@pendragon.ideasonboard.com>
References: <20230901155732.252436-1-alain.volmat@foss.st.com>
 <20230901155732.252436-5-alain.volmat@foss.st.com>
 <20230905090258.GC31594@pendragon.ideasonboard.com>
 <20230922160227.GA608616@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922160227.GA608616@gnbcxd0016.gnb.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] ARM: dts: stm32: add dcmipp
	support to stm32mp135
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

On Fri, Sep 22, 2023 at 06:02:27PM +0200, Alain Volmat wrote:
> On Tue, Sep 05, 2023 at 12:02:58PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 01, 2023 at 05:57:23PM +0200, Alain Volmat wrote:
> > > From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > 
> > > Add dcmipp support to STM32MP135.
> > > 
> > > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > > ---
> > >  arch/arm/boot/dts/st/stm32mp135.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
> > > index abf2acd37b4e..beee9ec7ed0d 100644
> > > --- a/arch/arm/boot/dts/st/stm32mp135.dtsi
> > > +++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
> > > @@ -8,5 +8,13 @@
> > >  
> > >  / {
> > >  	soc {
> > > +		dcmipp: dcmipp@5a000000 {
> > > +			compatible = "st,stm32mp13-dcmipp";
> > > +			reg = <0x5a000000 0x400>;
> > > +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > > +			resets = <&rcc DCMIPP_R>;
> > > +			clocks = <&rcc DCMIPP_K>;
> > > +			status = "disabled";
> > 
> > This needs a port, as it's marked as required in the bindings. You can
> > leave the endpoint out.
> 
> I first agreed with your comment but, having done the check (make
> CHECK_DTBS=y  ...) this doesn't seem to be required because the dcmipp
> node is kept disabled within our dtsi.

Interesting.

> (it is later on only enabled in dts file which as well have the port
> property).
> Indeed, to check this I changed it to okay and DTC_CHK complained about
> missing port property.
> 
> Hence, I'd think that port doesn't have to be added in this dtsi file.
> Would you agree with that ?

I still think the port belongs here, as it's an intrinsic property of
the dcmipp, not a property of the board. Does it cause any issue to add
a port in the .dtsi ?

> > With this fixed,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > +		};
> > >  	};
> > >  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
