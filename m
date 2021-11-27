Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA146000B
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Nov 2021 17:05:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA384C5C83D;
	Sat, 27 Nov 2021 16:05:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A97C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Nov 2021 16:05:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED4D60EC1;
 Sat, 27 Nov 2021 16:05:30 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 61591C53FBF;
 Sat, 27 Nov 2021 16:05:25 +0000 (UTC)
Date: Sat, 27 Nov 2021 16:10:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Message-ID: <20211127161026.2e725d5a@jic23-huawei>
In-Reply-To: <20211122144501.000014a3@Huawei.com>
References: <20211122143809.2332-1-olivier.moysan@foss.st.com>
 <2ca4ad17-d7e5-f4be-1596-7c7de0fa5661@pengutronix.de>
 <20211122144501.000014a3@Huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Xu Wang <vulab@iscas.ac.cn>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wan Jiabing <wanjiabing@vivo.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32: fix null pointer on
 defer_probe error
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

On Mon, 22 Nov 2021 14:45:01 +0000
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Mon, 22 Nov 2021 15:41:10 +0100
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
> > On 22.11.21 15:38, Olivier Moysan wrote:  
> > > dev_err_probe() calls __device_set_deferred_probe_reason()
> > > on -EPROBE_DEFER error. If device pointer to driver core
> > > private structure is not initialized, an null pointer error occurs.
> > > This pointer is set on iio_device_register() call for iio device.
> > > 
> > > dev_err_probe() must be called with the device which is probing.
> > > Replace iio device by its parent device.
> > > 
> > > Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")
> > >   
> 
> I'll fix it when applying, but no blank line between Fixes tag and the others.
Applied to the fixes-togreg branch of iio.git.

I'll probably do a pull request later this week,

Jonathan

> 
> > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>    
> > 
> > Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >   
> > > ---
> > > Changes in v2:
> > > - Use parent device from indio_dev instead of private structure
> > > ---
> > >  drivers/iio/adc/stm32-adc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > > index 7f1fb36c747c..341afdd342cc 100644
> > > --- a/drivers/iio/adc/stm32-adc.c
> > > +++ b/drivers/iio/adc/stm32-adc.c
> > > @@ -1986,7 +1986,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
> > >  			/* Get calibration data for vrefint channel */
> > >  			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
> > >  			if (ret && ret != -ENOENT) {
> > > -				return dev_err_probe(&indio_dev->dev, ret,
> > > +				return dev_err_probe(indio_dev->dev.parent, ret,
> > >  						     "nvmem access error\n");
> > >  			}
> > >  			if (ret == -ENOENT)
> > >     
> > 
> >   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
