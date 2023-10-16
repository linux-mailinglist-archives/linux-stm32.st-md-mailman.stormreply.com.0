Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B67CA64D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Oct 2023 13:11:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D562C6B452;
	Mon, 16 Oct 2023 11:11:05 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C18C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Oct 2023 11:11:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2A7A2B811D6;
 Mon, 16 Oct 2023 11:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128F2C433C8;
 Mon, 16 Oct 2023 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697454663;
 bh=lVB3Zy9EHqhxD+7XTnrniBL/mRSy6WczNg24vNkvBcc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=NgcyglY9QC5upCi7f7lr2wW18jKwF0fCzlqrPjMUJXth7LhMKOWBUU9klax5RYlZu
 Yt5uPzLb3XZjPlSCsLcF+ZfQn1Ve4oEMf6DDAqcO9U4L7wxvnEGZArpA7qy6TPn2mv
 M4I5XAQXmz/8+NuMYzxjQZdBFEjn6tp+L85sJ42ucrDGLgP+Ii/wA5HNUbuy47WKhv
 R9wIqRRGDK917H0Ai7C9WpNiv1L4Vr7TohZ9DEEwPWVLQKDpbh5tqznz+mq4DMwlGh
 9DNONA/aDFkS2K5L7BsbOjNpWqHJfXMj+WyIC4lXEC8qCDNlRjAzdO4PxCOfYR0L9z
 CDQPX97RLrGXg==
Date: Mon, 16 Oct 2023 16:41:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 stable@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <ZS0aREGECQ7G+fry@matsya>
References: <20231009082450.452877-1-amelie.delaunay@foss.st.com>
 <20231009090213.GA1547647@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009090213.GA1547647@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: correct desc prep
 when channel running
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 09-10-23, 11:02, Alain Volmat wrote:
> Hi Am=E9lie,
> =

> thanks a lot.
> =

> Tested-by: Alain Volmat <alain.volmat@foss.st.com>

Please **do ** not ** top post!

> =

> Regards,
> Alain
> =

> On Mon, Oct 09, 2023 at 10:24:50AM +0200, Amelie Delaunay wrote:
> > From: Alain Volmat <alain.volmat@foss.st.com>
> > =

> > In case of the prep descriptor while the channel is already running, the
> > CCR register value stored into the channel could already have its EN bit
> > set.  This would lead to a bad transfer since, at start transfer time,
> > enabling the channel while other registers aren't yet properly set.
> > To avoid this, ensure to mask the CCR_EN bit when storing the ccr value
> > into the mdma channel structure.
> > =

> > Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/dma/stm32-mdma.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
> > index bae08b3f55c7..f414efdbd809 100644
> > --- a/drivers/dma/stm32-mdma.c
> > +++ b/drivers/dma/stm32-mdma.c
> > @@ -489,7 +489,7 @@ static int stm32_mdma_set_xfer_param(struct stm32_m=
dma_chan *chan,
> >  	src_maxburst =3D chan->dma_config.src_maxburst;
> >  	dst_maxburst =3D chan->dma_config.dst_maxburst;
> >  =

> > -	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id));
> > +	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id)) & ~STM32_MD=
MA_CCR_EN;
> >  	ctcr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTCR(chan->id));
> >  	ctbr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTBR(chan->id));
> >  =

> > @@ -965,7 +965,7 @@ stm32_mdma_prep_dma_memcpy(struct dma_chan *c, dma_=
addr_t dest, dma_addr_t src,
> >  	if (!desc)
> >  		return NULL;
> >  =

> > -	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id));
> > +	ccr =3D stm32_mdma_read(dmadev, STM32_MDMA_CCR(chan->id)) & ~STM32_MD=
MA_CCR_EN;
> >  	ctcr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTCR(chan->id));
> >  	ctbr =3D stm32_mdma_read(dmadev, STM32_MDMA_CTBR(chan->id));
> >  	cbndtr =3D stm32_mdma_read(dmadev, STM32_MDMA_CBNDTR(chan->id));
> > -- =

> > 2.25.1
> > =


-- =

~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
