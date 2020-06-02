Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F08151EB7B3
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 10:54:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98ED6C36B22;
	Tue,  2 Jun 2020 08:54:49 +0000 (UTC)
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DF15C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 08:54:47 +0000 (UTC)
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id B113D257B5EFB95BE55A;
 Tue,  2 Jun 2020 09:54:46 +0100 (IST)
Received: from localhost (10.47.95.180) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Jun 2020
 09:54:46 +0100
Date: Tue, 2 Jun 2020 09:54:06 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Message-ID: <20200602095406.00005add@Huawei.com>
In-Reply-To: <a0253d719a4390f65668789e5fc182ec19355f17.camel@analog.com>
References: <20200525113855.178821-1-alexandru.ardelean@analog.com>
 <20200525113855.178821-3-alexandru.ardelean@analog.com>
 <20200531164020.765822dc@archlinux>
 <a0253d719a4390f65668789e5fc182ec19355f17.camel@analog.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.95.180]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: "lars@metafoo.de" <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "songqiang1304521@gmail.com" <songqiang1304521@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] iio: remove
 iio_triggered_buffer_postenable()/iio_triggered_buffer_predisable()
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

On Tue, 2 Jun 2020 07:50:23 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Sun, 2020-05-31 at 16:40 +0100, Jonathan Cameron wrote:
> > On Mon, 25 May 2020 14:38:55 +0300
> > Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:
> >   
> > > From: Lars-Peter Clausen <lars@metafoo.de>
> > > 
> > > This patch should be squashed into the first one, as the first one is
> > > breaking the build (intentionally) to make the IIO core files easier to
> > > review.
> > > 
> > > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> > > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > > ---  
> > 
> > Friend poke.  Version log?  
> 
> Version log is in the first patch.
> I was wondering if I omitted it.
> Seems, this time I didn't. But I admit, it probably would have been better
> here.
Ah fair enough.  That works fine if there is a cover letter but not
so much just putting things in the first patch!
> 
> > 
> > Other than the wistful comment below (which I'm not expecting you to
> > do anything about btw!) whole series looks good to me.
> > 
> > These are obviously no functional changes (I think) so it's only really
> > patch 2 that
> > could do with more eyes and acks.
> > 
> > Far as I can tell that case is fine as well because of the protections
> > on being in the right mode, but more eyes on that would be great.
> > 
> > So assuming that's fine, what commit message do you want me to use for
> > the fused single patch?  
> 
> Commit message-wise: I think the message in the first commit would be
> mostly sufficient.
> No idea what other description would be needed.
> 
> So, maybe something like:
> 
> ----------------------------------------------------------------------
> All devices using a triggered buffer need to attach and detach the trigger
> to the device in order to properly work. Instead of doing this in each and
> every driver by hand move this into the core.
> 
> At this point in time, all drivers should have been resolved to
> attach/detach the poll-function in the same order.
> 
> This patch removes all explicit calls of iio_triggered_buffer_postenable()
> & iio_triggered_buffer_predisable() in all drivers, since the core handles
> now the pollfunc attach/detach.
> 
> The more peculiar change is for the 'at91-sama5d2_adc' driver, since it's
> not obvious that removing the hooks doesn't break anything**
> ----------------------------------------------------------------------
> 

Looks good.

> ** for the comment about 'at91-sama5d2_adc', we really do need to get some
> testing; otherwise this risks breaking it.

Agreed.  

> 
> 
> > 
> > Thanks,
> > 
> > Jonathan
> >   
> > >  static const struct iio_trigger_ops atlas_interrupt_trigger_ops = {
> > > diff --git a/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > > b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > > index 17606eca42b4..8e13c53d4360 100644
> > > --- a/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > > +++ b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > > @@ -99,20 +99,6 @@ static irqreturn_t iio_simple_dummy_trigger_h(int
> > > irq, void *p)
> > >  }
> > >  
> > >  static const struct iio_buffer_setup_ops
> > > iio_simple_dummy_buffer_setup_ops = {
> > > -	/*
> > > -	 * iio_triggered_buffer_postenable:
> > > -	 * Generic function that simply attaches the pollfunc to the
> > > trigger.
> > > -	 * Replace this to mess with hardware state before we attach the
> > > -	 * trigger.
> > > -	 */
> > > -	.postenable = &iio_triggered_buffer_postenable,
> > > -	/*
> > > -	 * iio_triggered_buffer_predisable:
> > > -	 * Generic function that simple detaches the pollfunc from the
> > > trigger.
> > > -	 * Replace this to put hardware state back again after the trigger
> > > is
> > > -	 * detached but before userspace knows we have disabled the ring.
> > > -	 */
> > > -	.predisable = &iio_triggered_buffer_predisable,
> > >  };
> > >    
> > Hmm. Guess we should probably 'invent' a reason to illustrate the bufer
> > ops in the dummy example.  Anyone feeling creative?  
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
