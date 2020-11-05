Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 490052A851C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 18:39:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0988BC3FAD4;
	Thu,  5 Nov 2020 17:39:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 016F5C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 17:39:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5HM74i017207; Thu, 5 Nov 2020 18:39:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vsR5ldt560beF0b1zd/ViQ5vBMqLihhw3wpz3tsDQzE=;
 b=NgwFkJrR13eJCbOeQncy7/0EXsyN/EBNRijv6a1KwAv83uRCZAvr3jX52ikSGpQunsHo
 wCOf1TU6eey4DZzyjeqvMf+RGIxoP1JeP/qJLUOWKkd2EgI2p9lUC7GYBRWbkRpmGFSm
 QMkUcXDwExZajkjboejUENQHdp+qIMSm1z79tl48CAfRtfv4Q2rwo91k5r/yv1HTaNIQ
 mzaFDQ81/y0ZHmkzURRFSeCM2XROgWCVU+KwpANXJl9jcW0j3QxuFRAzGGh1d1Jog94J
 qOXRtONZwHKoHZc/wRBxNU68MfCN/4jxt/C19vusUyY5CLFeLgQAtgwB7AaDbO01pWXb lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywr9fa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 18:39:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C5D310002A;
 Thu,  5 Nov 2020 18:39:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA2602255CE;
 Thu,  5 Nov 2020 18:39:24 +0100 (CET)
Received: from [10.211.7.187] (10.75.127.44) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 18:38:28 +0100
To: Olivier Moysan <olivier.moysan@st.com>, <jic23@kernel.org>,
 <knaack.h@gmx.de>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <alexandre.torgue@st.com>
References: <20201105142941.27301-1-olivier.moysan@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <8ed73130-57e7-4073-cdf2-5f31596e728c@st.com>
Date: Thu, 5 Nov 2020 18:38:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105142941.27301-1-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_11:2020-11-05,
 2020-11-05 signatures=0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: dma transfers cleanup
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

On 11/5/20 3:29 PM, Olivier Moysan wrote:
> - Remove processing related to DMA in irq handler as this
> data transfer is managed directly in DMA callback.
> - Update comment in stm32_adc_set_watermark() function.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>

Hi Olivier,

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> ---
>  drivers/iio/adc/stm32-adc.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index b3f31f147347..08be826f1462 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1310,7 +1310,7 @@ static int stm32_adc_set_watermark(struct iio_dev *indio_dev, unsigned int val)
>  	 * dma cyclic transfers are used, buffer is split into two periods.
>  	 * There should be :
>  	 * - always one buffer (period) dma is working on
> -	 * - one buffer (period) driver can push with iio_trigger_poll().
> +	 * - one buffer (period) driver can push data.
>  	 */
>  	watermark = min(watermark, val * (unsigned)(sizeof(u16)));
>  	adc->rx_buf_sz = min(rx_buf_sz, watermark * 2 * adc->num_conv);
> @@ -1573,31 +1573,14 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
>  
>  	dev_dbg(&indio_dev->dev, "%s bufi=%d\n", __func__, adc->bufi);
>  
> -	if (!adc->dma_chan) {
> -		/* reset buffer index */
> -		adc->bufi = 0;
> -		iio_push_to_buffers_with_timestamp(indio_dev, adc->buffer,
> -						   pf->timestamp);
> -	} else {
> -		int residue = stm32_adc_dma_residue(adc);
> -
> -		while (residue >= indio_dev->scan_bytes) {
> -			u16 *buffer = (u16 *)&adc->rx_buf[adc->bufi];
> -
> -			iio_push_to_buffers_with_timestamp(indio_dev, buffer,
> -							   pf->timestamp);
> -			residue -= indio_dev->scan_bytes;
> -			adc->bufi += indio_dev->scan_bytes;
> -			if (adc->bufi >= adc->rx_buf_sz)
> -				adc->bufi = 0;
> -		}
> -	}
> -
> +	/* reset buffer index */
> +	adc->bufi = 0;
> +	iio_push_to_buffers_with_timestamp(indio_dev, adc->buffer,
> +					   pf->timestamp);
>  	iio_trigger_notify_done(indio_dev->trig);
>  
>  	/* re-enable eoc irq */
> -	if (!adc->dma_chan)
> -		stm32_adc_conv_irq_enable(adc);
> +	stm32_adc_conv_irq_enable(adc);
>  
>  	return IRQ_HANDLED;
>  }
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
