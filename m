Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4711550C04
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 18:12:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F4D4C56630;
	Sun, 19 Jun 2022 16:12:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 833FBC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 16:12:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA7D5B80D2E;
 Sun, 19 Jun 2022 16:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F15C34114;
 Sun, 19 Jun 2022 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655655140;
 bh=+ZdKPuYReGipTUHwHK+MrO06eN99QYR8e7WNYpKsknw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RVC1sLcrL97eha9NI2Du/DtxnMe6MsoWoH8YWJIJQlVLY1KSLQPBDYW251NT7ujr0
 xRxoKFARuolCAjgHEXeO/OKJfsWLrx/vXu22LGl5HAjz/ES6NmkBVQATGK7+Uy9+TF
 vhCt61ALUcIe6/YPEW/V+ERuVZcDaKcObadqQINpqCW0gPIl+caEVsF3IT6GNXMmhX
 HfZ/Y59O8rFQj5jpYZop+IXyhxCowkwz1mKem9T/n909TDrSQ0x3whg78GvVXgMHzk
 eF26SP46QCx2DmWShpxW++/vvYM18fSrYcntH0eSfdit50dGGxjkOhcREIWC9Vo1T2
 /khQQ++vRFlMQ==
Date: Sun, 19 Jun 2022 17:21:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <20220619172137.1d5c7de2@jic23-huawei>
In-Reply-To: <20220514154436.721f9cdd@jic23-huawei>
References: <YnuYoQIzJoFIyEJY@linutronix.de>
 <20220514154436.721f9cdd@jic23-huawei>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Use
	generic_handle_domain_irq()
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

On Sat, 14 May 2022 15:44:36 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Wed, 11 May 2022 13:06:09 +0200
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> 
> > The call chain
> > 	generic_handle_irq(irq_find_mapping(domain, x));
> > 
> > could be replaced with
> > 	generic_handle_domain_irq(domain, x);
> > 
> > which looks up the struct irq_desc for the interrupt and handles it with
> > handle_irq_desc().
> > This is a slight optimisation given that the driver invokes only one
> > function and the struct irq_desc is used directly instead being looked
> > up via irq_to_desc().
> > 
> > Use generic_handle_domain_irq().
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>  
> 
> +CC Fabrice, 
> 
> Fun following through the different checks in the two functions, but looks fine
> to me.
> 
> Applied to the togreg branch of iio.git and pushed out as testing for
> 0-day to see if it can find any problems.

oops. I applied this to the fixes-togreg branch of iio.git.  Will have
to rebase that to drop it.

Now applied to the togreg branch of iio.git

Thanks,

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> 
> > ---
> >  drivers/iio/adc/stm32-adc-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index 1426562321575..c8fc97e52fef4 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -356,7 +356,7 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
> >  		if ((status & priv->cfg->regs->eoc_msk[i] &&
> >  		     stm32_adc_eoc_enabled(priv, i)) ||
> >  		     (status & priv->cfg->regs->ovr_msk[i]))
> > -			generic_handle_irq(irq_find_mapping(priv->domain, i));
> > +			generic_handle_domain_irq(priv->domain, i);
> >  	}
> >  
> >  	chained_irq_exit(chip, desc);  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
