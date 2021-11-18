Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF3456202
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 19:11:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 245E9C5EC57;
	Thu, 18 Nov 2021 18:11:09 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08301C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 18:11:07 +0000 (UTC)
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Hw7BP5mSyz67HxV;
 Fri, 19 Nov 2021 02:10:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Thu, 18 Nov 2021 19:11:06 +0100
Received: from localhost (10.52.127.148) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 18:11:06 +0000
Date: Thu, 18 Nov 2021 18:11:03 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20211118181103.000054c7@Huawei.com>
In-Reply-To: <45a5129a-c0b1-4a07-aef8-d6e0845c7b1a@pengutronix.de>
References: <20211118123952.15383-1-olivier.moysan@foss.st.com>
 <45a5129a-c0b1-4a07-aef8-d6e0845c7b1a@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.127.148]
X-ClientProxiedBy: lhreml749-chm.china.huawei.com (10.201.108.199) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 Wan Jiabing <wanjiabing@vivo.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Xu Wang <vulab@iscas.ac.cn>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: fix null pointer on
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

On Thu, 18 Nov 2021 13:51:44 +0100
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hello Olivier,
> 
> On 18.11.21 13:39, Olivier Moysan wrote:
> > dev_err_probe() calls __device_set_deferred_probe_reason()
> > on -EPROBE_DEFER error.
> > If device pointer to driver core private structure is not initialized,
> > a null pointer error occurs.
> > This pointer is set too late on iio_device_register() call, for iio device.  
> 
> Even if it were set earlier, you should call dev_err_probe with the dev of
> the probe that's currently running. Not any other devices you created since
> then.

+1 on that

> 
> > So use parent device instead for dev_err_probe() call.
> > 
> > Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")
> > 

No line break between these two tags.  Greg will reject a pull if there
is one (and 0-day probably complain about it...)

Jonathan


> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > ---
> >  drivers/iio/adc/stm32-adc.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index 7f1fb36c747c..14c7c9d390e8 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -217,6 +217,7 @@ struct stm32_adc_cfg {
> >  
> >  /**
> >   * struct stm32_adc - private data of each ADC IIO instance
> > + * dev:			parent device
> >   * @common:		reference to ADC block common data
> >   * @offset:		ADC instance register offset in ADC block
> >   * @cfg:		compatible configuration data
> > @@ -243,6 +244,7 @@ struct stm32_adc_cfg {
> >   * @int_ch:		internal channel indexes array
> >   */
> >  struct stm32_adc {
> > +	struct device		*dev;  
> 
> Can't you use the parent pointer of the indio_dev?
> 
> >  	struct stm32_adc_common	*common;
> >  	u32			offset;
> >  	const struct stm32_adc_cfg	*cfg;
> > @@ -1986,8 +1988,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
> >  			/* Get calibration data for vrefint channel */
> >  			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
> >  			if (ret && ret != -ENOENT) {
> > -				return dev_err_probe(&indio_dev->dev, ret,
> > -						     "nvmem access error\n");
> > +				return dev_err_probe(adc->dev, ret, "nvmem access error\n");
> >  			}
> >  			if (ret == -ENOENT)
> >  				dev_dbg(&indio_dev->dev, "vrefint calibration not found\n");
> > @@ -2221,6 +2222,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
> >  	init_completion(&adc->completion);
> >  	adc->cfg = (const struct stm32_adc_cfg *)
> >  		of_match_device(dev->driver->of_match_table, dev)->data;
> > +	adc->dev = &pdev->dev;  
> 
> There's struct device *dev = &pdev->dev; defined earlier, so you can use dev instead.
> 
> >  
> >  	indio_dev->name = dev_name(&pdev->dev);
> >  	indio_dev->dev.of_node = pdev->dev.of_node;
> >   
> 
> Cheers,
> Ahmad
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
