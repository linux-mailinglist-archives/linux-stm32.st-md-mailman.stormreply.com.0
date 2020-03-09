Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5817DDC9
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Mar 2020 11:40:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 296ECC36B0B;
	Mon,  9 Mar 2020 10:40:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9E35C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 10:39:57 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029AScac025793; Mon, 9 Mar 2020 11:39:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iqtz+8jVUcIa98vBWaQrx9xYUGQQ4Q8iCdRJjvFbN7g=;
 b=G6+lcIPLfe/fl3LP3qkR7/r+NE9RTxcXW7XSciIUVUQSJK3eE9FScRHwmTpU5LH1/sVJ
 2RyQ/++eefGINPkMcxZeB86JDPwRqhBF1jxYqFag5ePmd04XpK04F8pYOfiBqzAIei0h
 jr6i1PCprE/vHVfsajmuVXlb/lfOUiu18r7n0EEABc4zJp2WqPTCQhh5Z5Cv1g3drOwy
 VIXy8OkskezCz1fbFhoUJwp9FfOJ2eEWNvG3T1EilpM3tkGqnLZKpJYR+jxt0ySQjlXC
 FJEkVp1/YA15p8ghk3FyltBAr1//TZ7LGj06u/HP1/+BFfXg198qs6rQeO9koPoSgY0q IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym2923gbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 11:39:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8235A100034;
 Mon,  9 Mar 2020 11:39:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5112E2AE6B7;
 Mon,  9 Mar 2020 11:39:33 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.46) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Mar
 2020 11:39:32 +0100
To: Olivier Moysan <olivier.moysan@st.com>, <jic23@kernel.org>,
 <knaack.h@gmx.de>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <alexandre.torgue@st.com>, <benjamin.gaignard@st.com>
References: <20200309100212.16499-1-olivier.moysan@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <288fb604-16c6-da52-533f-7f1440ed9daa@st.com>
Date: Mon, 9 Mar 2020 11:39:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200309100212.16499-1-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: fix sleep in
	atomic context
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

On 3/9/20 11:02 AM, Olivier Moysan wrote:
> This commit fixes the following error:
> "BUG: sleeping function called from invalid context at kernel/irq/chip.c"
> 
> In DMA mode suppress the trigger irq handler, and make the buffer
> transfers directly in DMA callback, instead.
> 
> Fixes: 2763ea0585c9 ("iio: adc: stm32: add optional dma support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>

Hi Olivier,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice

> ---
> Changes in v2:
> - Add "Fixes" tag in commit message
> 
> This solution has been already discussed in the thread
> https://lkml.org/lkml/2019/3/30/171, and applied in STM32 DFSDM driver:
> e19ac9d9a978 ("iio: adc: stm32-dfsdm: fix sleep in atomic context")
> ---
>  drivers/iio/adc/stm32-adc.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 80c3f963527b..ae622ee6d08c 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1418,8 +1418,30 @@ static unsigned int stm32_adc_dma_residue(struct stm32_adc *adc)
>  static void stm32_adc_dma_buffer_done(void *data)
>  {
>  	struct iio_dev *indio_dev = data;
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	int residue = stm32_adc_dma_residue(adc);
> +
> +	/*
> +	 * In DMA mode the trigger services of IIO are not used
> +	 * (e.g. no call to iio_trigger_poll).
> +	 * Calling irq handler associated to the hardware trigger is not
> +	 * relevant as the conversions have already been done. Data
> +	 * transfers are performed directly in DMA callback instead.
> +	 * This implementation avoids to call trigger irq handler that
> +	 * may sleep, in an atomic context (DMA irq handler context).
> +	 */
> +	dev_dbg(&indio_dev->dev, "%s bufi=%d\n", __func__, adc->bufi);
>  
> -	iio_trigger_poll_chained(indio_dev->trig);
> +	while (residue >= indio_dev->scan_bytes) {
> +		u16 *buffer = (u16 *)&adc->rx_buf[adc->bufi];
> +
> +		iio_push_to_buffers(indio_dev, buffer);
> +
> +		residue -= indio_dev->scan_bytes;
> +		adc->bufi += indio_dev->scan_bytes;
> +		if (adc->bufi >= adc->rx_buf_sz)
> +			adc->bufi = 0;
> +	}
>  }
>  
>  static int stm32_adc_dma_start(struct iio_dev *indio_dev)
> @@ -1845,6 +1867,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev;
>  	struct device *dev = &pdev->dev;
> +	irqreturn_t (*handler)(int irq, void *p) = NULL;
>  	struct stm32_adc *adc;
>  	int ret;
>  
> @@ -1911,9 +1934,11 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!adc->dma_chan)
> +		handler = &stm32_adc_trigger_handler;
> +
>  	ret = iio_triggered_buffer_setup(indio_dev,
> -					 &iio_pollfunc_store_time,
> -					 &stm32_adc_trigger_handler,
> +					 &iio_pollfunc_store_time, handler,
>  					 &stm32_adc_buffer_setup_ops);
>  	if (ret) {
>  		dev_err(&pdev->dev, "buffer setup failed\n");
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
