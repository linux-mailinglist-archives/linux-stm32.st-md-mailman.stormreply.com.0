Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A48129B4E
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2019 22:59:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E1DC36B0B;
	Mon, 23 Dec 2019 21:59:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5A86C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2019 21:59:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNLwtxn036585;
 Mon, 23 Dec 2019 15:58:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1577138335;
 bh=9TpDm7eS6HN2w04yodlknk3nngqfWC6wufnnQos0dn8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pzWn7xR9jggLLSJ1p74hAr0iXOs8Z4PWDBDA5hQk78buN009lG4KyBOoU6xKYt8yn
 d+0z9vhv8dOAi7x7y8b+duDf0cs5ZlgVr/4PJf8TnWvrH+E7Q92bXZh37VG/Lf1Wv0
 FOu4kuLIFczvflXWPFn9qhvvZAqKc0lrNG0uhvOU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNLwtAl096172;
 Mon, 23 Dec 2019 15:58:55 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 15:58:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 15:58:53 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNLwpqH086181;
 Mon, 23 Dec 2019 15:58:52 -0600
To: Jonathan Cameron <jic23@kernel.org>
References: <20191217075221.23895-1-peter.ujfalusi@ti.com>
 <20191223154538.74a76f94@archlinux>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <66c0d161-007f-5c92-01c8-d73ebca9f2cc@ti.com>
Date: Tue, 24 Dec 2019 00:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191223154538.74a76f94@archlinux>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Use
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

Hi Jonathan,

On 12/23/19 5:45 PM, Jonathan Cameron wrote:
> On Tue, 17 Dec 2019 09:52:21 +0200
> Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> 
>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>> eating up the error code.
>>
>> By using dma_request_chan() directly the driver can support deferred
>> probing against DMA.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> I don't think this one goes far enough.  
> 
> One of the paths does:
> 
> 	/* Optionally request DMA */
> 	if (stm32_dfsdm_dma_request(indio_dev)) {
> 		dev_dbg(&indio_dev->dev, "No DMA support\n");
> 		return 0;
> 	}
> 
> That needs specific handling for deferred probing.

Right, I have checked the stm32_dfsdm_audio_init() path, via that the
error is propagated correctly.

I'll send an update next year ;)

> 
>> ---
>>  drivers/iio/adc/stm32-dfsdm-adc.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
>> index e493242c266e..3aac1a21f9d0 100644
>> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
>> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
>> @@ -1383,9 +1383,9 @@ static int stm32_dfsdm_dma_request(struct iio_dev *indio_dev)
>>  {
>>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>>  
>> -	adc->dma_chan = dma_request_slave_channel(&indio_dev->dev, "rx");
>> -	if (!adc->dma_chan)
>> -		return -EINVAL;
>> +	adc->dma_chan = dma_request_chan(&indio_dev->dev, "rx");
>> +	if (IS_ERR(adc->dma_chan))
>> +		return PTR_ERR(adc->dma_chan);
>>  
>>  	adc->rx_buf = dma_alloc_coherent(adc->dma_chan->device->dev,
>>  					 DFSDM_DMA_BUFFER_SIZE,
> 

- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
