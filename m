Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B338CFBC7
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 10:43:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 421E8C6DD6E;
	Mon, 27 May 2024 08:43:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90F61C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 08:43:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R7ngef001861;
 Mon, 27 May 2024 10:42:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6AnobvcNV97i8iFUvBNwuiEKTpyPMiYIxIFeLbFOdkw=; b=3BdRH5XLnrewL5so
 Kr/L58+B7ZtPWRY50TJSXXKjX1m8Va3iqx/WDPdeAhgOY3PY0hPd/NrelHF2Yt50
 12ZL/LX3ui3IsOaaS2uUp69XSB5O9oy0Cg/yzAKXHUpcQ1cYhenuoWgIkFDBl5xY
 DYB2mZgsASeyjNqWiPKp5l9fHY00LmxR5UPlGRU6HRJ690KplFu0lh4s/72G9yL/
 9liKbdzFhcAwjqX8/jBA+00bcVW61dPNHycAmdiTRiMy8unpBcbIu6Y0GoFDOY7u
 Q23OEzKU59CeDn2rLYEYX2ezUy9O0EdKhCbV1xFGQ79F5AyxK91xxPJUlYyZ4BN1
 C0iPaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba51nxgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 May 2024 10:42:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98E4E4002D;
 Mon, 27 May 2024 10:42:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C90220E02F;
 Mon, 27 May 2024 10:41:52 +0200 (CEST)
Received: from [10.48.86.143] (10.48.86.143) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 10:41:51 +0200
Message-ID: <0b9a47c3-9064-4439-a0d8-08087b524534@foss.st.com>
Date: Mon, 27 May 2024 10:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Li <Frank.li@nxp.com>
References: <20240520154948.690697-1-amelie.delaunay@foss.st.com>
 <20240520154948.690697-7-amelie.delaunay@foss.st.com>
 <ZkuZb2I83Q29kW6s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <ZkuZb2I83Q29kW6s@lizhi-Precision-Tower-5810>
X-Originating-IP: [10.48.86.143]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 06/12] dmaengine: stm32-dma3: add
	DMA_CYCLIC capability
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 5/20/24 20:41, Frank Li wrote:
> On Mon, May 20, 2024 at 05:49:42PM +0200, Amelie Delaunay wrote:
>> Add DMA_CYCLIC capability and relative device_prep_dma_cyclic ops with
>> stm32_dma3_prep_dma_cyclic(). It reuses stm32_dma3_chan_prep_hw() and
>> stm32_dma3_chan_prep_hwdesc() helpers.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   drivers/dma/stm32/stm32-dma3.c | 77 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
>> index 134c08a7ee96..aae9fc018b1d 100644
>> --- a/drivers/dma/stm32/stm32-dma3.c
>> +++ b/drivers/dma/stm32/stm32-dma3.c
>> @@ -1021,6 +1021,81 @@ static struct dma_async_tx_descriptor *stm32_dma3_prep_slave_sg(struct dma_chan
>>   	return NULL;
>>   }
>>   
>> +static struct dma_async_tx_descriptor *stm32_dma3_prep_dma_cyclic(struct dma_chan *c,
>> +								  dma_addr_t buf_addr,
>> +								  size_t buf_len, size_t period_len,
>> +								  enum dma_transfer_direction dir,
>> +								  unsigned long flags)
>> +{
>> +	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
>> +	struct stm32_dma3_swdesc *swdesc;
>> +	dma_addr_t src, dst;
>> +	u32 count, i, ctr1, ctr2;
>> +	int ret;
>> +
>> +	if (!buf_len || !period_len || period_len > STM32_DMA3_MAX_BLOCK_SIZE) {
>> +		dev_err(chan2dev(chan), "Invalid buffer/period length\n");
>> +		return NULL;
>> +	}
>> +
>> +	if (buf_len % period_len) {
>> +		dev_err(chan2dev(chan), "Buffer length not multiple of period length\n");
>> +		return NULL;
>> +	}
>> +
>> +	count = buf_len / period_len;
>> +	swdesc = stm32_dma3_chan_desc_alloc(chan, count);
>> +	if (!swdesc)
>> +		return NULL;
>> +
>> +	if (dir == DMA_MEM_TO_DEV) {
>> +		src = buf_addr;
>> +		dst = chan->dma_config.dst_addr;
>> +
>> +		ret = stm32_dma3_chan_prep_hw(chan, DMA_MEM_TO_DEV, &swdesc->ccr, &ctr1, &ctr2,
>> +					      src, dst, period_len);
>> +	} else if (dir == DMA_DEV_TO_MEM) {
>> +		src = chan->dma_config.src_addr;
>> +		dst = buf_addr;
>> +
>> +		ret = stm32_dma3_chan_prep_hw(chan, DMA_DEV_TO_MEM, &swdesc->ccr, &ctr1, &ctr2,
>> +					      src, dst, period_len);
>> +	} else {
>> +		dev_err(chan2dev(chan), "Invalid direction\n");
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	if (ret)
>> +		goto err_desc_free;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		if (dir == DMA_MEM_TO_DEV) {
>> +			src = buf_addr + i * period_len;
>> +			dst = chan->dma_config.dst_addr;
>> +		} else { /* (dir == DMA_DEV_TO_MEM || dir == DMA_MEM_TO_MEM) */
> 
> look like comment is wrong.
> 
> DMA_MEM_TO_MEM will return -EINVAL at previous check.
> 

Indeed. I'll fix it in v4.

>> +			src = chan->dma_config.src_addr;
>> +			dst = buf_addr + i * period_len;
>> +		}
>> +
>> +		stm32_dma3_chan_prep_hwdesc(chan, swdesc, i, src, dst, period_len,
>> +					    ctr1, ctr2, i == (count - 1), true);
>> +	}
>> +
>> +	/* Enable Error interrupts */
>> +	swdesc->ccr |= CCR_USEIE | CCR_ULEIE | CCR_DTEIE;
>> +	/* Enable Transfer state interrupts */
>> +	swdesc->ccr |= CCR_TCIE;
>> +
>> +	swdesc->cyclic = true;
>> +
>> +	return vchan_tx_prep(&chan->vchan, &swdesc->vdesc, flags);
>> +
>> +err_desc_free:
>> +	stm32_dma3_chan_desc_free(chan, swdesc);
>> +
>> +	return NULL;
>> +}
>> +
>>   static void stm32_dma3_caps(struct dma_chan *c, struct dma_slave_caps *caps)
>>   {
>>   	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
>> @@ -1255,6 +1330,7 @@ static int stm32_dma3_probe(struct platform_device *pdev)
>>   
>>   	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
>>   	dma_cap_set(DMA_PRIVATE, dma_dev->cap_mask);
>> +	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
>>   	dma_dev->dev = &pdev->dev;
>>   	/*
>>   	 * This controller supports up to 8-byte buswidth depending on the port used and the
>> @@ -1277,6 +1353,7 @@ static int stm32_dma3_probe(struct platform_device *pdev)
>>   	dma_dev->device_alloc_chan_resources = stm32_dma3_alloc_chan_resources;
>>   	dma_dev->device_free_chan_resources = stm32_dma3_free_chan_resources;
>>   	dma_dev->device_prep_slave_sg = stm32_dma3_prep_slave_sg;
>> +	dma_dev->device_prep_dma_cyclic = stm32_dma3_prep_dma_cyclic;
>>   	dma_dev->device_caps = stm32_dma3_caps;
>>   	dma_dev->device_config = stm32_dma3_config;
>>   	dma_dev->device_terminate_all = stm32_dma3_terminate_all;
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
