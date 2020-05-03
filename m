Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8A1C2CB3
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 15:17:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0244FC36B13;
	Sun,  3 May 2020 13:17:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB7CBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 13:17:32 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CB112084D;
 Sun,  3 May 2020 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588511851;
 bh=c41wwaPkMaPx/AbXYXAvHUbp8vk80alaoAI0zA7NCnc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lp9ZTBlCE+wgj799vIc0GTuXkNxuIRSOL5IdIK2d+0gt4Ekgk7z8vrOWCIlxqyPSG
 QwOxMYR+YGl0Fg1MuRgRFvGjmf45V982vxk/Ye96NHuz2VsDn3iQjCmRKWIaHioSKN
 ZPhyr1ub+1OSTRFeiQEIcEcutXxUSqdLEQqSLE0c=
Date: Sun, 3 May 2020 14:17:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200503141727.13269ac2@archlinux>
In-Reply-To: <1588238926-23964-2-git-send-email-fabrice.gasnier@st.com>
References: <1588238926-23964-1-git-send-email-fabrice.gasnier@st.com>
 <1588238926-23964-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: fix device used to
	request dma
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

On Thu, 30 Apr 2020 11:28:46 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> DMA channel request should use device struct from platform device struct.
> Currently it's using iio device struct. But at this stage when probing,
> device struct isn't yet registered (e.g. device_register is done in
> iio_device_register). Since commit 71723a96b8b1 ("dmaengine: Create
> symlinks between DMA channels and slaves"), a warning message is printed
> as the links in sysfs can't be created, due to device isn't yet registered:
> - Cannot create DMA slave symlink
> - Cannot create DMA dma:rx symlink
> 
> Fix this by using device struct from platform device to request dma chan.
> 
> Fixes: eca949800d2d ("IIO: ADC: add stm32 DFSDM support for PDM microphone")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Both applied to the fixes-togreg branch of iio.git and marked for stable.

THanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 76a60d9..506bf51 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -62,7 +62,7 @@ enum sd_converter_type {
>  
>  struct stm32_dfsdm_dev_data {
>  	int type;
> -	int (*init)(struct iio_dev *indio_dev);
> +	int (*init)(struct device *dev, struct iio_dev *indio_dev);
>  	unsigned int num_channels;
>  	const struct regmap_config *regmap_cfg;
>  };
> @@ -1365,11 +1365,12 @@ static void stm32_dfsdm_dma_release(struct iio_dev *indio_dev)
>  	}
>  }
>  
> -static int stm32_dfsdm_dma_request(struct iio_dev *indio_dev)
> +static int stm32_dfsdm_dma_request(struct device *dev,
> +				   struct iio_dev *indio_dev)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>  
> -	adc->dma_chan = dma_request_chan(&indio_dev->dev, "rx");
> +	adc->dma_chan = dma_request_chan(dev, "rx");
>  	if (IS_ERR(adc->dma_chan)) {
>  		int ret = PTR_ERR(adc->dma_chan);
>  
> @@ -1425,7 +1426,7 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
>  					  &adc->dfsdm->ch_list[ch->channel]);
>  }
>  
> -static int stm32_dfsdm_audio_init(struct iio_dev *indio_dev)
> +static int stm32_dfsdm_audio_init(struct device *dev, struct iio_dev *indio_dev)
>  {
>  	struct iio_chan_spec *ch;
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> @@ -1452,10 +1453,10 @@ static int stm32_dfsdm_audio_init(struct iio_dev *indio_dev)
>  	indio_dev->num_channels = 1;
>  	indio_dev->channels = ch;
>  
> -	return stm32_dfsdm_dma_request(indio_dev);
> +	return stm32_dfsdm_dma_request(dev, indio_dev);
>  }
>  
> -static int stm32_dfsdm_adc_init(struct iio_dev *indio_dev)
> +static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
>  {
>  	struct iio_chan_spec *ch;
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> @@ -1499,17 +1500,17 @@ static int stm32_dfsdm_adc_init(struct iio_dev *indio_dev)
>  	init_completion(&adc->completion);
>  
>  	/* Optionally request DMA */
> -	ret = stm32_dfsdm_dma_request(indio_dev);
> +	ret = stm32_dfsdm_dma_request(dev, indio_dev);
>  	if (ret) {
>  		if (ret != -ENODEV) {
>  			if (ret != -EPROBE_DEFER)
> -				dev_err(&indio_dev->dev,
> +				dev_err(dev,
>  					"DMA channel request failed with %d\n",
>  					ret);
>  			return ret;
>  		}
>  
> -		dev_dbg(&indio_dev->dev, "No DMA support\n");
> +		dev_dbg(dev, "No DMA support\n");
>  		return 0;
>  	}
>  
> @@ -1622,7 +1623,7 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
>  		adc->dfsdm->fl_list[adc->fl_id].sync_mode = val;
>  
>  	adc->dev_data = dev_data;
> -	ret = dev_data->init(iio);
> +	ret = dev_data->init(dev, iio);
>  	if (ret < 0)
>  		return ret;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
