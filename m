Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A2780324
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 03:24:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46622C6B476;
	Fri, 18 Aug 2023 01:24:45 +0000 (UTC)
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48142C6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 01:24:44 +0000 (UTC)
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
 by cmsmtp with ESMTP
 id WIWCqWPMKEoVsWoEFqGRtT; Fri, 18 Aug 2023 01:24:43 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id WoEEqQO8ki8uRWoEEq7ZTv; Fri, 18 Aug 2023 01:24:42 +0000
X-Authority-Analysis: v=2.4 cv=JOsoDuGb c=1 sm=1 tr=0 ts=64dec85a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=phlkwaE_AAAA:8
 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AqieMOIgktxvBo8GBaNhs4Rq0vAOt4KL0VhES5aYsCM=; b=K1zZu/5hYlyfu/445Kt5jUu61c
 2n+YMmumLFyMUGsx2R6zrgIH90c8OeFQfPPlCtYkmPuD1kdYaBKL8AmSbbC09aYuoDUYX5KgBVpBw
 +Glqy434Dp3KX8eJNc5xhy3rUq9P+pGo+dtQ1PRDMLKOW5lPPspAbrRi2aN4IiVUT3eMSP1Wjuuze
 P5ZlknrUfMB3D6galG8FjDa4fAexxvT2FN79vkZ0D+fTibDzuBC51y2QI09OIXWjA7gx18kDhaNpe
 DYn5z5vK/oRMOg57ZbqEe+xkZLEj17g+AoboD7/OxSDK9wWHgIR2GeFohwSsaXkUYOxXCu+xfp4xC
 njZ1SmWw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:42946
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qWoEB-000XeZ-0x;
 Thu, 17 Aug 2023 20:24:39 -0500
Message-ID: <37a8baae-02da-9a1a-2a02-d63f9e212aa1@embeddedor.com>
Date: Thu, 17 Aug 2023 19:25:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-13-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-13-keescook@chromium.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWoEB-000XeZ-0x
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:42946
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 457
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLV2FXUu5eQphvXvG26Yg4dp2B6JR8078kaZigrZmyipNxAViXmax0sFyDAhiZTaI8xf/KNe/jSBBI5KVYVbLJ7pUCh+QAw/Y91qMFyDTVR1yB9Lp+iJ
 uD0WNlWuZblLtZm3vUH9qzBF5KAZG8u8Hrvd0uXEc2HdQdMr8NECvoF00zTWtqTrjPjRyP6y9Ta3Cg0f9+tUv/WvwS86MmnxtlCtQvjIYJK6n9zr+eJmG4fG
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
Subject: Re: [Linux-stm32] [PATCH 13/21] dmaengine: stm32-mdma: Annotate
 struct stm32_mdma_desc with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct stm32_mdma_desc.
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
>   drivers/dma/stm32-mdma.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
> index 0de234022c6d..926d6ecf1274 100644
> --- a/drivers/dma/stm32-mdma.c
> +++ b/drivers/dma/stm32-mdma.c
> @@ -224,7 +224,7 @@ struct stm32_mdma_desc {
>   	u32 ccr;
>   	bool cyclic;
>   	u32 count;
> -	struct stm32_mdma_desc_node node[];
> +	struct stm32_mdma_desc_node node[] __counted_by(count);
>   };
>   
>   struct stm32_mdma_dma_config {
> @@ -321,6 +321,7 @@ static struct stm32_mdma_desc *stm32_mdma_alloc_desc(
>   	desc = kzalloc(struct_size(desc, node, count), GFP_NOWAIT);
>   	if (!desc)
>   		return NULL;
> +	desc->count = count;
>   
>   	for (i = 0; i < count; i++) {
>   		desc->node[i].hwdesc =
> @@ -330,8 +331,6 @@ static struct stm32_mdma_desc *stm32_mdma_alloc_desc(
>   			goto err;
>   	}
>   
> -	desc->count = count;
> -
>   	return desc;
>   
>   err:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
