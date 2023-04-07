Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DC6DB1B0
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 19:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C0FBC6B44A;
	Fri,  7 Apr 2023 17:36:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A92DC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680888969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=girDT/3e1iBfq8YfqylLYXxjOSDey8dBT/Mp5wOCRPk=;
 b=UviER/VAxClIrkOFWwi9D7NCrDBJUvSROYGQ1n1GlbcD3eYK1ZOU55gCuQNHuZQd7oCPBA
 JznFj4COT3R6x9pfeprrM/aulUQ+gm53e1u/jv5P/gz7RMZPP0GyNwyvZmHMypdEjhAkeZ
 /gUD83rvSyfJu+sX1GkRajd71gGS5+s=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-y_7t7Z0BNhCMH_fd2MCuuQ-1; Fri, 07 Apr 2023 13:36:08 -0400
X-MC-Unique: y_7t7Z0BNhCMH_fd2MCuuQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 c83-20020a4a4f56000000b0053b4b212346so11747122oob.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Apr 2023 10:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680888967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=girDT/3e1iBfq8YfqylLYXxjOSDey8dBT/Mp5wOCRPk=;
 b=EO8TIPBV2N3ISubi8YKr+t/A+DNXg1JdFj2YstrgGE6YV1sYts6q3RZOmlRxAbLkn5
 fiszeguUsLn6pZNht7uUZdmc1XNoHwIG7TsH9+iyGFKPyFHZ8GKqbTKdmYN9yDqyNacU
 aumNc7LLz5NY4i4iALYkW9tYydE/7NFBhe1JAzubvXYT5D+1uBrnndh7Pj+8/xKt13sS
 a8AjXB/ty1tfroGDe/sXmHTZ228a9z1bfSJabhb4s5Gb58z/rSCzDLMRl49hdzoQ6HXN
 57C5EdhJn9ncqWH6RcUJJbGrIbWHbO2YwNQvH7nO8xjPat68m01jdoIs2cLMZEsZxBYR
 gKmw==
X-Gm-Message-State: AAQBX9caw4puIQmiHP3TMyJwThfygyJSzNtyI6B9DB1xHsVx1FCo7liw
 2o2Toa1ZOQugU7W3m+AtTW3Nm0VzBCA+1PjxGPsgjYalScBScC3DqBc5oPxOJtvc+9b3t5K1u4Z
 FPbfG/oadiNyC5NtOeFjBW9U9+gBmWN32FkQ/losh
X-Received: by 2002:a05:6870:b690:b0:17f:8da0:ce51 with SMTP id
 cy16-20020a056870b69000b0017f8da0ce51mr1898805oab.13.1680888967289; 
 Fri, 07 Apr 2023 10:36:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350aTgPrp2NCi7zwwA49Thy6Fhgfj8/rEUQEZAp6wz3jWRG4d8C8CLe9Z0+wJS8A8Vn22KfosIA==
X-Received: by 2002:a05:6870:b690:b0:17f:8da0:ce51 with SMTP id
 cy16-20020a056870b69000b0017f8da0ce51mr1898768oab.13.1680888966976; 
 Fri, 07 Apr 2023 10:36:06 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 an19-20020a056871b19300b00183fbbe8cdfsm1294396oac.31.2023.04.07.10.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 10:36:06 -0700 (PDT)
Date: Fri, 7 Apr 2023 12:36:03 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230407173603.lyj5fjox23uhn2gb@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-10-ahalaney@redhat.com>
 <ZChGswjgAOkT0jvY@corigine.com>
MIME-Version: 1.0
In-Reply-To: <ZChGswjgAOkT0jvY@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 09/12] net: stmmac: dwmac4:
 Allow platforms to specify some DMA/MTL offsets
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

On Sat, Apr 01, 2023 at 04:58:59PM +0200, Simon Horman wrote:
> On Fri, Mar 31, 2023 at 04:45:46PM -0500, Andrew Halaney wrote:
> > Some platforms have dwmac4 implementations that have a different
> > address space layout than the default, resulting in the need to define
> > their own DMA/MTL offsets.
> > 
> > Extend the functions to allow a platform driver to indicate what its
> > addresses are, overriding the defaults.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > 
> > This patch (and the prior patch) are replacements for
> > https://lore.kernel.org/netdev/20230320204153.21736840@kernel.org/
> > as was requested. Hopefully I was understanding the intent correctly :)
> > 
> > I'm pretty sure further refinement will be requested for this one, but
> > it is the best I could come up with myself! Specifically some of the
> > naming, dealing with spacing in some older spots of dwmac4,
> > where the addresses should live in the structure hierarchy, etc are
> > things I would not be surprised to have to rework if this is still
> > preferred over the wrapper approach.
> > 
> > Changes since v2:
> >     * New, replacing old wrapper approach
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  91 ++++++++--
> >  .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  36 ++--
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 157 ++++++++++--------
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  51 +++---
> >  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  67 +++++---
> >  include/linux/stmmac.h                        |  19 +++
> >  6 files changed, 279 insertions(+), 142 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> > index ccd49346d3b3..a0c0ee1dc13f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> > @@ -336,14 +336,23 @@ enum power_event {
> >  
> >  #define MTL_CHAN_BASE_ADDR		0x00000d00
> >  #define MTL_CHAN_BASE_OFFSET		0x40
> > -#define MTL_CHANX_BASE_ADDR(x)		(MTL_CHAN_BASE_ADDR + \
> > -					(x * MTL_CHAN_BASE_OFFSET))
> > -
> > -#define MTL_CHAN_TX_OP_MODE(x)		MTL_CHANX_BASE_ADDR(x)
> > -#define MTL_CHAN_TX_DEBUG(x)		(MTL_CHANX_BASE_ADDR(x) + 0x8)
> > -#define MTL_CHAN_INT_CTRL(x)		(MTL_CHANX_BASE_ADDR(x) + 0x2c)
> > -#define MTL_CHAN_RX_OP_MODE(x)		(MTL_CHANX_BASE_ADDR(x) + 0x30)
> > -#define MTL_CHAN_RX_DEBUG(x)		(MTL_CHANX_BASE_ADDR(x) + 0x38)
> > +#define MTL_CHANX_BASE_ADDR(addrs, x)  \
> > +({ \
> > +	const struct dwmac4_addrs *__addrs = addrs; \
> > +	const u32 __x = x; \
> > +	u32 __addr; \
> > +	if (__addrs) \
> > +		__addr = __addrs->mtl_chan + (__x * __addrs->mtl_chan_offset); \
> > +	else \
> > +		__addr = MTL_CHAN_BASE_ADDR + (__x * MTL_CHAN_BASE_OFFSET); \
> > +	__addr; \
> > +})
> 
> Could this and similar macros added by this patch be functions?
> From my pov a benefit would be slightly more type safety.
> And as a bonus there wouldn't be any need to handle aliasing of input.
> 

Sure, to be honest I'll be much more comfortable coding that up anyways.
I don't do a ton of macro programming and had to refamiliarize myself of
the pitfalls that comes with it when doing this.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
