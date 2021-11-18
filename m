Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D109A455BF4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 13:51:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81ADCC5E2CC;
	Thu, 18 Nov 2021 12:51:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 577C5C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 12:51:50 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mngtJ-0000oU-Qc; Thu, 18 Nov 2021 13:51:49 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Xu Wang <vulab@iscas.ac.cn>
References: <20211118123952.15383-1-olivier.moysan@foss.st.com>
Message-ID: <45a5129a-c0b1-4a07-aef8-d6e0845c7b1a@pengutronix.de>
Date: Thu, 18 Nov 2021 13:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118123952.15383-1-olivier.moysan@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

Hello Olivier,

On 18.11.21 13:39, Olivier Moysan wrote:
> dev_err_probe() calls __device_set_deferred_probe_reason()
> on -EPROBE_DEFER error.
> If device pointer to driver core private structure is not initialized,
> a null pointer error occurs.
> This pointer is set too late on iio_device_register() call, for iio device.

Even if it were set earlier, you should call dev_err_probe with the dev of
the probe that's currently running. Not any other devices you created since
then.

> So use parent device instead for dev_err_probe() call.
> 
> Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/iio/adc/stm32-adc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 7f1fb36c747c..14c7c9d390e8 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -217,6 +217,7 @@ struct stm32_adc_cfg {
>  
>  /**
>   * struct stm32_adc - private data of each ADC IIO instance
> + * dev:			parent device
>   * @common:		reference to ADC block common data
>   * @offset:		ADC instance register offset in ADC block
>   * @cfg:		compatible configuration data
> @@ -243,6 +244,7 @@ struct stm32_adc_cfg {
>   * @int_ch:		internal channel indexes array
>   */
>  struct stm32_adc {
> +	struct device		*dev;

Can't you use the parent pointer of the indio_dev?

>  	struct stm32_adc_common	*common;
>  	u32			offset;
>  	const struct stm32_adc_cfg	*cfg;
> @@ -1986,8 +1988,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
>  			/* Get calibration data for vrefint channel */
>  			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
>  			if (ret && ret != -ENOENT) {
> -				return dev_err_probe(&indio_dev->dev, ret,
> -						     "nvmem access error\n");
> +				return dev_err_probe(adc->dev, ret, "nvmem access error\n");
>  			}
>  			if (ret == -ENOENT)
>  				dev_dbg(&indio_dev->dev, "vrefint calibration not found\n");
> @@ -2221,6 +2222,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	init_completion(&adc->completion);
>  	adc->cfg = (const struct stm32_adc_cfg *)
>  		of_match_device(dev->driver->of_match_table, dev)->data;
> +	adc->dev = &pdev->dev;

There's struct device *dev = &pdev->dev; defined earlier, so you can use dev instead.

>  
>  	indio_dev->name = dev_name(&pdev->dev);
>  	indio_dev->dev.of_node = pdev->dev.of_node;
> 

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
