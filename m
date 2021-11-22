Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0444459074
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 15:45:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA0BDC5A4FD;
	Mon, 22 Nov 2021 14:45:05 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEE7CC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 14:45:04 +0000 (UTC)
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HyVQZ0wGkz6H7s9;
 Mon, 22 Nov 2021 22:44:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 22 Nov 2021 15:45:03 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 22 Nov
 2021 14:45:02 +0000
Date: Mon, 22 Nov 2021 14:45:01 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20211122144501.000014a3@Huawei.com>
In-Reply-To: <2ca4ad17-d7e5-f4be-1596-7c7de0fa5661@pengutronix.de>
References: <20211122143809.2332-1-olivier.moysan@foss.st.com>
 <2ca4ad17-d7e5-f4be-1596-7c7de0fa5661@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml737-chm.china.huawei.com (10.201.108.187) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 Wan Jiabing <wanjiabing@vivo.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Xu Wang <vulab@iscas.ac.cn>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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

On Mon, 22 Nov 2021 15:41:10 +0100
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> On 22.11.21 15:38, Olivier Moysan wrote:
> > dev_err_probe() calls __device_set_deferred_probe_reason()
> > on -EPROBE_DEFER error. If device pointer to driver core
> > private structure is not initialized, an null pointer error occurs.
> > This pointer is set on iio_device_register() call for iio device.
> > 
> > dev_err_probe() must be called with the device which is probing.
> > Replace iio device by its parent device.
> > 
> > Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")
> > 

I'll fix it when applying, but no blank line between Fixes tag and the others.

> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>  
> 
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> > ---
> > Changes in v2:
> > - Use parent device from indio_dev instead of private structure
> > ---
> >  drivers/iio/adc/stm32-adc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index 7f1fb36c747c..341afdd342cc 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -1986,7 +1986,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
> >  			/* Get calibration data for vrefint channel */
> >  			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
> >  			if (ret && ret != -ENOENT) {
> > -				return dev_err_probe(&indio_dev->dev, ret,
> > +				return dev_err_probe(indio_dev->dev.parent, ret,
> >  						     "nvmem access error\n");
> >  			}
> >  			if (ret == -ENOENT)
> >   
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
