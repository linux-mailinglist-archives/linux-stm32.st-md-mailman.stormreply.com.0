Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A7575591
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jul 2022 21:02:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4933DC06F81;
	Thu, 14 Jul 2022 19:02:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DE85C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jul 2022 19:02:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CD5F082068;
 Thu, 14 Jul 2022 21:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657825324;
 bh=aHmjHaJxJBZMe6BIMPN1PX2HZAmaQsSLKb6ocrjbf3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yl0WFHSWcyzjqkYmmGxvcYT9IkqHlCFo/Vzp8L1XW6DvWMLiuD3nvagHfsLKNApH6
 AZai81nV1jWaSP4M97fg9V3nA2VSBRUym6mn9YgycnoSLQQrwo5nwmrzN4ohS8skfw
 lfwTvGxOgG1FYCHi1gWc22+N/Q5Mv+LiVbVWmAgb/vp+6y1mO0fvvjNY/tneSkYQ0n
 eByjnH8O0A/AFM0T5TL32MpGM45uNAEpEMtXOikPOAfjcqWECj//PByJokGRgSs0S0
 x41m6qKyCndwEwip16B2S4FH1p5esMAz8ijeIvaPMbNHr0kWhy5v71TvxV3I6FfhbD
 z9+NyyXCvocng==
Message-ID: <e1fbf7cf-1bb7-6583-3713-7dbd58a4898e@denx.de>
Date: Thu, 14 Jul 2022 21:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220713142148.239253-1-amelie.delaunay@foss.st.com>
 <20220713142148.239253-4-amelie.delaunay@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220713142148.239253-4-amelie.delaunay@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dmaengine: stm32-dma: add support
 to trigger STM32 MDMA
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

On 7/13/22 16:21, Amelie Delaunay wrote:

[...]

> diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> index adb25a11c70f..3916295fe154 100644
> --- a/drivers/dma/stm32-dma.c
> +++ b/drivers/dma/stm32-dma.c
> @@ -142,6 +142,8 @@
>   #define STM32_DMA_DIRECT_MODE_GET(n)	(((n) & STM32_DMA_DIRECT_MODE_MASK) >> 2)
>   #define STM32_DMA_ALT_ACK_MODE_MASK	BIT(4)
>   #define STM32_DMA_ALT_ACK_MODE_GET(n)	(((n) & STM32_DMA_ALT_ACK_MODE_MASK) >> 4)
> +#define STM32_DMA_MDMA_STREAM_ID_MASK	GENMASK(19, 16)
> +#define STM32_DMA_MDMA_STREAM_ID_GET(n) (((n) & STM32_DMA_MDMA_STREAM_ID_MASK) >> 16)

Try FIELD_GET() from include/linux/bitfield.h

[...]

> @@ -1630,6 +1670,20 @@ static int stm32_dma_probe(struct platform_device *pdev)
>   		chan->id = i;
>   		chan->vchan.desc_free = stm32_dma_desc_free;
>   		vchan_init(&chan->vchan, dd);
> +
> +		chan->mdma_config.ifcr = res->start;
> +		chan->mdma_config.ifcr += (chan->id & 4) ? STM32_DMA_HIFCR : STM32_DMA_LIFCR;
> +
> +		chan->mdma_config.tcf = STM32_DMA_TCI;
> +		/*
> +		 * bit0 of chan->id represents the need to left shift by 6
> +		 * bit1 of chan->id represents the need to extra left shift by 16
> +		 * TCIF0, chan->id = b0000; TCIF4, chan->id = b0100: left shift by 0*6 + 0*16
> +		 * TCIF1, chan->id = b0001; TCIF5, chan->id = b0101: left shift by 1*6 + 0*16
> +		 * TCIF2, chan->id = b0010; TCIF6, chan->id = b0110: left shift by 0*6 + 1*16
> +		 * TCIF3, chan->id = b0011; TCIF7, chan->id = b0111: left shift by 1*6 + 1*16
> +		 */
> +		chan->mdma_config.tcf <<= (6 * (chan->id & 0x1) + 16 * ((chan->id & 0x2) >> 1));

Some sort of symbolic macros instead of open-coded constants could help 
readability here.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
