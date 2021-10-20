Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 341DE43493E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 12:45:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDA4CC5C856;
	Wed, 20 Oct 2021 10:45:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFF0C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 10:45:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KAOVfX018155; 
 Wed, 20 Oct 2021 12:45:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MlxYuucZ3hZA3qvuKEJnxNhi1CYH/kqnrHAjiFr79Po=;
 b=Hs14Rn5RB7KO632z6fryOsvT+wyNnBwekph0ayCGJavFI4brgsuQ/2llb3Af1xqPod9m
 w9q74e18eoN60W8CH2UsOps2rZ3uyl8Q+sIwgJuM/vbDSq1dSyaO6LQ7kF1GmbYgQLe2
 4DrBYgmIpYEXgikLK81erL5nuwDWObAWDLrf46lrVd+72X9rBEgGqWCMQRvbE5IhZQE7
 XEZ4Yqn4upavnnEK8kggCO443cnP5UZtu9E0ebURc9oXqiUMwICpQHLLlu4MZ7lvul4d
 2M7YXGceErpGogWh3jKSq9Mbo/lyVdO4cqShCzkDvlFMa+h9fNuPYm7Tsl0vuLGI89xH FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btdkya26d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 12:45:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7833710002A;
 Wed, 20 Oct 2021 12:45:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A46A21A230;
 Wed, 20 Oct 2021 12:45:05 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 20 Oct
 2021 12:45:04 +0200
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20211019153532.366429-1-arnd@kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <da5ceaac-a123-06a9-c5a9-d0b16cb4d6e5@foss.st.com>
Date: Wed, 20 Oct 2021 12:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019153532.366429-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_04,2021-10-20_01,2020-04-07_01
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: avoid 64-bit
 division in stm32_dma_get_max_width
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

Hi Arnd,

Thanks for your patch.

On 10/19/21 5:35 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using the % operator on a 64-bit variable is expensive and can
> cause a link failure:
> 
> arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_get_max_width':
> stm32-dma.c:(.text+0x170): undefined reference to `__aeabi_uldivmod'
> arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_set_xfer_param':
> stm32-dma.c:(.text+0x1cd4): undefined reference to `__aeabi_uldivmod'
> 
> As we know that we just want to check the alignment in
> stm32_dma_get_max_width(), there is no need for a full division, and
> using a simple mask is a faster replacement.
> 
> In stm32_dma_set_xfer_param(), it is possible to pass a non-power-of-two
> length, so this does not work. I assume this would in fact be a mistake,
> and the hardware does not work correctly with a burst of e.g. 5 bytes
> on a five-byte aligned address. Change this to only allow burst
> transfers if the address is a multiple of the length, and that length
> is a power-of-two number.
> 
> Fixes: b20fd5fa310c ("dmaengine: stm32-dma: fix stm32_dma_get_max_width")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/dma/stm32-dma.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> index 2283c500f4ce..102278f7d13e 100644
> --- a/drivers/dma/stm32-dma.c
> +++ b/drivers/dma/stm32-dma.c
> @@ -280,7 +280,7 @@ static enum dma_slave_buswidth stm32_dma_get_max_width(u32 buf_len,
>   	       max_width > DMA_SLAVE_BUSWIDTH_1_BYTE)
>   		max_width = max_width >> 1;
>   
> -	if (buf_addr % max_width)
> +	if (buf_addr & (max_width - 1))
>   		max_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
>   
>   	return max_width;
> @@ -757,7 +757,7 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
>   		 * Set memory burst size - burst not possible if address is not aligned on
>   		 * the address boundary equal to the size of the transfer
>   		 */
> -		if (buf_addr % buf_len)
> +		if (!is_power_of_2(buf_len) || (buf_addr & (buf_len -1)))

No need to check !is_power_of_2(buf_len) here.
Just after computing src_maxburst,
	src_best_burst = stm32_dma_get_best_burst(buf_len,
						  src_maxburst,
						  fifoth,
						  src_addr_width);
The configured burst (src_best_best) already take buf_len into account.

So I would remove !is_power_of_2(buf_len) from the if here and fix the 
missing space:

CHECK: spaces preferred around that '-' (ctx:WxV)
#68: FILE: drivers/dma/stm32-dma.c:760:
+		if (!is_power_of_2(buf_len) || (buf_addr & (buf_len -1)))
  		                                                    ^

>   			src_maxburst = 1;
>   		else
>   			src_maxburst = STM32_DMA_MAX_BURST;
> @@ -813,7 +813,7 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
>   		 * Set memory burst size - burst not possible if address is not aligned on
>   		 * the address boundary equal to the size of the transfer
>   		 */
> -		if (buf_addr % buf_len)
> +		if (!is_power_of_2(buf_len) || (buf_addr & (buf_len -1)))

Ditto.

>   			dst_maxburst = 1;
>   		else
>   			dst_maxburst = STM32_DMA_MAX_BURST;
> 

With these fixes, you can add my
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Tested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
