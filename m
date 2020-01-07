Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8850132CC9
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 18:16:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 852EAC36B0B;
	Tue,  7 Jan 2020 17:16:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A5BCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 17:16:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007H3kew001693; Tue, 7 Jan 2020 18:15:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZdllE0Z52H4x4guhjbA8dQk3Mh5olK1KPHIfgCgmdic=;
 b=HgavD/C6uGnl1U0aWLn+F2XXveASexh0qsxQwqzTfILkv4s7dTPS3wJ7bJWSh30iurFc
 2cyCo7fHS5bGx16UpGNPedY6X0L6KRStaBMHLLCniSkoHFCZGzKJjqc9sKRfP9fCSaFI
 9U8cwTlMur71kI2a1PmK7LvJGmkNdQdDtKnmTeYqVazThi4IQi2Fq6Zdtrf9WmoB4Yhb
 nREmzBkgQEhyqPtPtGG3T6+UX3GkP88IGE9bwJvZtxTjdXjTXpuqvCFodnVGwej8idVA
 QuGt2iF4nH1Qa4queQizpckiFbYv7wj0YKALXI4G36IDEL4EnCZtt/C0TPfI+PO76nx1 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkaqn9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 18:15:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56183100034;
 Tue,  7 Jan 2020 18:15:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 455CE21F729;
 Tue,  7 Jan 2020 18:15:50 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 18:15:49 +0100
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, <jic23@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200107114125.6095-1-peter.ujfalusi@ti.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <5146b085-d92d-7230-9a05-87926711dafa@st.com>
Date: Tue, 7 Jan 2020 18:15:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107114125.6095-1-peter.ujfalusi@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-07_05:2020-01-07,
 2020-01-07 signatures=0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Use
 dma_request_chan() instead dma_request_slave_channel()
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

On 1/7/20 12:41 PM, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> Changes since v1:
> - Fall back to IRQ mode only in case of ENODEV
> 
> Regards,
> Peter

Hi Peter,

Thanks for the patch,

In case you send another version... I've just a minor suggestion
regarding the comment (see after). Apart from that, you can add my:

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Best Regards,
Fabrice

> 
>  drivers/iio/adc/stm32-adc.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 3b291d72701c..df5f5d61f9f9 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1746,9 +1746,21 @@ static int stm32_adc_dma_request(struct iio_dev *indio_dev)
>  	struct dma_slave_config config;
>  	int ret;
>  
> -	adc->dma_chan = dma_request_slave_channel(&indio_dev->dev, "rx");
> -	if (!adc->dma_chan)
> +	adc->dma_chan = dma_request_chan(&indio_dev->dev, "rx");
> +	if (IS_ERR(adc->dma_chan)) {
> +		ret = PTR_ERR(adc->dma_chan);
> +		if (ret != -ENODEV) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&indio_dev->dev,
> +					"DMA channel request failed with %d\n",
> +					ret);
> +			return ret;
> +		}
> +
> +		/* Ignore errors to fall back to IRQ mode */
		               ^
		          error
alternate suggestion:
		/* DMA is optional: fall back to IRQ mode */

> +		adc->dma_chan = NULL;
>  		return 0;
> +	}
>  
>  	adc->rx_buf = dma_alloc_coherent(adc->dma_chan->device->dev,
>  					 STM32_DMA_BUFFER_SIZE,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
