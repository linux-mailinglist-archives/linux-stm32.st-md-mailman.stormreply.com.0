Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024276C13F
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 01:52:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40FCAC6A5E6;
	Tue,  1 Aug 2023 23:52:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69008C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 23:52:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 247C76172C;
 Tue,  1 Aug 2023 23:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14966C433C7;
 Tue,  1 Aug 2023 23:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690933950;
 bh=FbBie7f8Ak5baPz3jl5nqWc3Zkl5vg8At/LcSILAFWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQXyTbrvh3WcrlIVevcmc8pihTxluE0YJcl9wlEvUdQgSHCs8S2KDYK+HlJo9HIUt
 5w5ZQ5hU675bvb5TjATKzJP8V76jkN3rUXr6r1oMF8cVePvXWUUDJxLmUEyHr99Vdb
 Izfpjujh15z8TtrArB0r4Qao/nLeTY9SnVLb4C25nRq3dIXdJMZQQdxX5nhI3GAW3c
 7OwmJnaTs/42CfUINDkQ4S73XSLxFBUCjnyDqn2w4wezuF94m8ZPz/pRcYJthAXPOd
 OXUEPN1ipUnBd2NyzZQZWqcsGBQlbNi9Q2s41DUbSP0ljWI/5yGj/R8UMPrkCgS/Ua
 dZBMZCUK05LKw==
Date: Wed, 2 Aug 2023 01:52:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Message-ID: <20230801235227.swouzgtcro4p4itv@intel.intel>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <20230801233603.iztyd2wqhcogr72r@intel.intel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801233603.iztyd2wqhcogr72r@intel.intel>
Cc: linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
 handle for platform_get_irq()
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

Hi Ruan,

Just a nitpick here that does not affect my r-b...

> On Mon, Jul 31, 2023 at 07:27:55PM +0800, Ruan Jinjie wrote:
> > There is no possible for platform_get_irq() to return 0,
> > and the return value of platform_get_irq() is more sensible
> > to show the error reason.

can we rephrase the whole commit to:

  i2c: stm32: Do not check for 0 return after calling platform_get_irq()
  
  It is not possible for platform_get_irq() to return 0. Use the
  return value from platform_get_irq().

Two notes on the commit log:

 - Use capital letter after "i2c: stm32: Fix..."
 - This is not a fix, so that we shouldn't use the word "fix" in
   the title.

just little notes for future patches :)

Thanks,
Andi

> > Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> > ---
> >  drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > index e897d9101434..579b30581725 100644
> > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > @@ -2121,12 +2121,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
> >  	phy_addr = (dma_addr_t)res->start;
> >  
> >  	irq_event = platform_get_irq(pdev, 0);
> > -	if (irq_event <= 0)
> > -		return irq_event ? : -ENOENT;
> > +	if (irq_event < 0)
> > +		return irq_event;
> >  
> >  	irq_error = platform_get_irq(pdev, 1);
> > -	if (irq_error <= 0)
> > -		return irq_error ? : -ENOENT;
> > +	if (irq_error < 0)
> > +		return irq_error;
> 
> Correct, from patch ce753ad1549cbe ("platform: finally disallow
> IRQ0 in platform_get_irq() and its ilk") this check is already
> done inside platform_get_irq();
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
> 
> Andi
> 
> >  
> >  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
> >  						    "wakeup-source");
> > -- 
> > 2.34.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
