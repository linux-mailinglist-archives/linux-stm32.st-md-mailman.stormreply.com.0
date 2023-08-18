Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7E780322
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 03:24:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 345D9C6B476;
	Fri, 18 Aug 2023 01:24:31 +0000 (UTC)
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1F36C6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 01:24:29 +0000 (UTC)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
 by cmsmtp with ESMTP
 id WmuKqjqxJyYOwWoE1qzmVe; Fri, 18 Aug 2023 01:24:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id WoE0qi2a1D5qiWoE1qd29T; Fri, 18 Aug 2023 01:24:29 +0000
X-Authority-Analysis: v=2.4 cv=dMe1JcVb c=1 sm=1 tr=0 ts=64dec84d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=phlkwaE_AAAA:8
 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=PQxDlO0rh1wi_DnxKH8A:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EwBdW62PPBMZVf78eVBfrCIfGvyXuF9Ofx4kjw6wwVU=; b=PINaxgXl8Chxqc5houvaG4bVzG
 KziTmKnq9L+37ydcZjmi5Az2P4nZyitbdg9RGfEoK8IwCtRVXPIqgL7AuCMPnevwzdnfu8rfp0Kjx
 UFOllsZDWvTfaa8AlsylGuKEdMMpFOJ5/01nXxZWTTr7hYqIM+Dz5jgGrkuCfmgEn9Kafr1xkwe8K
 F9v2e4iKqRl1v0Z5AhLucqAev4X7YlwK+ju2EhtgfZdyMFg73VaOGEwKn3vslu+/gZws2AOEuMZCH
 hpgY+ywIBBXq4XGyRIzjT+7NHCZWaeGKBZRFCt8THw/ZoOXDtOK2rGheOvfKhW5jLWroXKWhTjhHC
 oCAH982w==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:55258
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qWoDy-000XHo-0J;
 Thu, 17 Aug 2023 20:24:26 -0500
Message-ID: <be53a6d3-9cac-0bc2-c659-68bea6034073@embeddedor.com>
Date: Thu, 17 Aug 2023 19:25:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-12-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-12-keescook@chromium.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWoDy-000XHo-0J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:55258
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 415
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMJ3Oy/LFyjcCnNvYA869TBydAePNcNHnl+9nYhQcNWOnkiCorw9GEsDodD4lUBedXkhYpQsWWx9YzEpdMUXQ1AcLX2VYBbp84lFSuV8AIC2Y5DolF4L
 l99iCJgA2CGODjaRnBFDCDlbiaRRCqiBtJf2mgvDHIR+LN1YrCTNbdiVQOWzoxwG1w4h30+7VBEfow3K392Y/TwNjg6BNc3GdxHcGMA+rcyHtleoJuR7D5hn
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, asahi@lists.linux.dev,
 Jie Hai <haijie1@huawei.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Kuai <yukuai3@huawei.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 12/21] dmaengine: stm32-dma: Annotate
 struct stm32_dma_desc with __counted_by
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



On 8/17/23 17:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct stm32_dma_desc.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/stm32-dma.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> index 5c36811aa134..a732b3807b11 100644
> --- a/drivers/dma/stm32-dma.c
> +++ b/drivers/dma/stm32-dma.c
> @@ -191,7 +191,7 @@ struct stm32_dma_desc {
>   	struct virt_dma_desc vdesc;
>   	bool cyclic;
>   	u32 num_sgs;
> -	struct stm32_dma_sg_req sg_req[];
> +	struct stm32_dma_sg_req sg_req[] __counted_by(num_sgs);
>   };
>   
>   /**
> @@ -1105,6 +1105,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
>   	desc = kzalloc(struct_size(desc, sg_req, sg_len), GFP_NOWAIT);
>   	if (!desc)
>   		return NULL;
> +	desc->num_sgs = sg_len;
>   
>   	/* Set peripheral flow controller */
>   	if (chan->dma_sconfig.device_fc)
> @@ -1141,8 +1142,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
>   			desc->sg_req[i].chan_reg.dma_sm1ar += sg_dma_len(sg);
>   		desc->sg_req[i].chan_reg.dma_sndtr = nb_data_items;
>   	}
> -
> -	desc->num_sgs = sg_len;
>   	desc->cyclic = false;
>   
>   	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
> @@ -1216,6 +1215,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
>   	desc = kzalloc(struct_size(desc, sg_req, num_periods), GFP_NOWAIT);
>   	if (!desc)
>   		return NULL;
> +	desc->num_sgs = num_periods;
>   
>   	for (i = 0; i < num_periods; i++) {
>   		desc->sg_req[i].len = period_len;
> @@ -1232,8 +1232,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
>   		if (!chan->trig_mdma)
>   			buf_addr += period_len;
>   	}
> -
> -	desc->num_sgs = num_periods;
>   	desc->cyclic = true;
>   
>   	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
> @@ -1254,6 +1252,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
>   	desc = kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT);
>   	if (!desc)
>   		return NULL;
> +	desc->num_sgs = num_sgs;
>   
>   	threshold = chan->threshold;
>   
> @@ -1283,8 +1282,6 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
>   		desc->sg_req[i].chan_reg.dma_sndtr = xfer_count;
>   		desc->sg_req[i].len = xfer_count;
>   	}
> -
> -	desc->num_sgs = num_sgs;
>   	desc->cyclic = false;
>   
>   	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
