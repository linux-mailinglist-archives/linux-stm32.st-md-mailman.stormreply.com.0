Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E91006D3124
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 15:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B419C6A5F7;
	Sat,  1 Apr 2023 13:49:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB4F2C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Apr 2023 13:49:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9101260B55;
 Sat,  1 Apr 2023 13:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87440C433EF;
 Sat,  1 Apr 2023 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680356987;
 bh=Bglj6s3hC2A4Jat0iWcKmXuE9VRM7vxUoKqNUIt6jbU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FSm+hfJpWo8ul/1DnYBxTueeOLd/NMYMH6EEJaOCUqqehZiKxwpJHk+CHJb5Wufyq
 YrP5YK5XSxelo3mW6RylnbM5JrilmCoadjeoA8hVD/QLQVoSAq/mSQ6ucMKN26nEj3
 CO4ln81T0tfAqWwwXmV8yN6Y8PHnr5zq20Yhh5UJ9fhfjHkpdLZ+CIyI/lSYGzzV58
 uMzxuYYx8k1Ha4jG119Da2A+6c4FYh/d1Y6chm7qse61g6C49a6Cl/HwmLy6t8I4AY
 7dH4pE1YtuzhScKWjNH/+8qX/QeRTGkiCpt4/V5oVaWIhGoBcWpK5vAF8Vg2qsjd8Y
 kIzzH95oHSnhg==
Date: Sat, 1 Apr 2023 15:04:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20230401150455.3e426d1e@jic23-huawei>
In-Reply-To: <56c019d4-832e-17e1-19f8-7d8bd927c1bb@foss.st.com>
References: <20230327083449.1098174-1-sean@geanix.com>
 <56c019d4-832e-17e1-19f8-7d8bd927c1bb@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, nuno.sa@analog.com,
 Sean Nyekjaer <sean@geanix.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] iio: adc: stm32-adc: warn if dt uses
 legacy channel config
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

On Thu, 30 Mar 2023 17:30:32 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 3/27/23 10:34, Sean Nyekjaer wrote:
> > Since nearly all stm32 dt's are using the legacy adc channel config,
> > we should warn users about using it.
> > 
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  drivers/iio/adc/stm32-adc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index 1aadb2ad2cab..d8e755d0cc52 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -1993,6 +1993,8 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
> >  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
> >  	int num_channels = 0, ret;
> >  
> > +	dev_warn(&indio_dev->dev, "using legacy channel config\n");
> > +  
> 
> Hi Sean,
> 
> I'd recommend to avoid adding a dev_warn() on a per driver basis, for
> depreacted DT properties. Still I'm not sure if there's some policy in
> this area.
> 
> IMHO, deprecated properties should be checked by using dt tools
> (dt_binding_check / dtbs_check or other mean?). But I have no idea if
> this is going to report warnings and when. Purpose would be to avoid
> introducing no dts files with these. As commented by Olivier on Patch 3,
> we've some downstream patches to adopt the generic bindings (not
> upstream 'yet').
> 
> Another downside is regarding backward compatibility. In case an old dtb
> is used to boot the kernel, as long as there's no functionality loss,
> I'd advise not to use any warning here. That's a valid use of an old dt.
> 
> In all case, thanks for pointing issues (e.g. Patch 2 & 3), regarding
> this patch, I'd nack adding this warning. Please drop this change if you
> re-submit or turn this into a dev_dbg().
> 

Agreed. Better to change to dev_dbg().

Other two patches look good to me, but will leave a bit more time for others
to comment before I pick them up.  As a small side note. They are fixes and
this first patch is not, so they should have been before it in the series
so I can route them to mainline faster than the non fix.

Jonathan

> Best Regards,
> Fabrice
> 
> >  	ret = device_property_count_u32(dev, "st,adc-channels");
> >  	if (ret > adc_info->max_channels) {
> >  		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
