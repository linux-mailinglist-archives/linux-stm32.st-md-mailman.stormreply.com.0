Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3326C683
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 19:52:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82AA1C3FAE1;
	Wed, 16 Sep 2020 17:52:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1176C3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 17:52:37 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DA05206F7;
 Wed, 16 Sep 2020 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600278755;
 bh=qtv1VH/lpDHNP4K1hT8rAdmDRzl6jlj/EIejRq6sqbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JrVlBOLxNcilm6sLhM9bAJJOwFcJcdsVCk8k8N5S1f2dOztgBjoFniBlVcxNGf07N
 ikMhBD9w4QtsOnVMbBvdBylxMa6WEdZ6zney8xAm8/+iu+wtHo0f4vHzypodHRsz9Y
 O8b76NNvKUPPw+pgOy5YlKh+MBvOVrP/lU5aPFnM=
Date: Wed, 16 Sep 2020 18:52:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200916185230.45c0b7d4@archlinux>
In-Reply-To: <b8d5cbb5-f393-6a5f-19cd-afa983b9f10a@st.com>
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <20200916092349.75647-1-alexandru.ardelean@analog.com>
 <b8d5cbb5-f393-6a5f-19cd-afa983b9f10a@st.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>, mcoquelin.stm32@gmail.com,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dac: Replace
 indio_dev->mlock with own device lock
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

On Wed, 16 Sep 2020 12:18:02 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 9/16/20 11:23 AM, Alexandru Ardelean wrote:
> > From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > 
> > As part of the general cleanup of indio_dev->mlock, this change replaces
> > it with a local lock. The lock protects against potential races when
> > reading the CR reg and then updating, so that the state of pm_runtime
> > is consistent between the two operations.
> > 
> > This is part of a bigger cleanup.
> > Link: https://lore.kernel.org/linux-iio/CA+U=Dsoo6YABe5ODLp+eFNPGFDjk5ZeQEceGkqjxXcVEhLWubw@mail.gmail.com/
> > 
> > Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > ---
> >  drivers/iio/dac/stm32-dac.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)  
> 
> Hi Alexandru,
> 
> Many thanks for this updated patch,
> 
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to poke at it.

Thanks,

Jonathan

> 
> Best regards,
> Fabrice
> 
> > 
> > diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> > index 092c796fa3d9..12dec68c16f7 100644
> > --- a/drivers/iio/dac/stm32-dac.c
> > +++ b/drivers/iio/dac/stm32-dac.c
> > @@ -26,9 +26,12 @@
> >  /**
> >   * struct stm32_dac - private data of DAC driver
> >   * @common:		reference to DAC common data
> > + * @lock:		lock to protect against potential races when reading
> > + *			and update CR, to keep it in sync with pm_runtime
> >   */
> >  struct stm32_dac {
> >  	struct stm32_dac_common *common;
> > +	struct mutex		lock;
> >  };
> >  
> >  static int stm32_dac_is_enabled(struct iio_dev *indio_dev, int channel)
> > @@ -58,10 +61,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >  	int ret;
> >  
> >  	/* already enabled / disabled ? */
> > -	mutex_lock(&indio_dev->mlock);
> > +	mutex_lock(&dac->lock);
> >  	ret = stm32_dac_is_enabled(indio_dev, ch);
> >  	if (ret < 0 || enable == !!ret) {
> > -		mutex_unlock(&indio_dev->mlock);
> > +		mutex_unlock(&dac->lock);
> >  		return ret < 0 ? ret : 0;
> >  	}
> >  
> > @@ -69,13 +72,13 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >  		ret = pm_runtime_get_sync(dev);
> >  		if (ret < 0) {
> >  			pm_runtime_put_noidle(dev);
> > -			mutex_unlock(&indio_dev->mlock);
> > +			mutex_unlock(&dac->lock);
> >  			return ret;
> >  		}
> >  	}
> >  
> >  	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
> > -	mutex_unlock(&indio_dev->mlock);
> > +	mutex_unlock(&dac->lock);
> >  	if (ret < 0) {
> >  		dev_err(&indio_dev->dev, "%s failed\n", en ?
> >  			"Enable" : "Disable");
> > @@ -327,6 +330,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
> >  	indio_dev->info = &stm32_dac_iio_info;
> >  	indio_dev->modes = INDIO_DIRECT_MODE;
> >  
> > +	mutex_init(&dac->lock);
> > +
> >  	ret = stm32_dac_chan_of_init(indio_dev);
> >  	if (ret < 0)
> >  		return ret;
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
