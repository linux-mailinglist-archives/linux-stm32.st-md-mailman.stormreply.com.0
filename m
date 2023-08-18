Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9F78044D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 05:19:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEEA7C6B475;
	Fri, 18 Aug 2023 03:19:47 +0000 (UTC)
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B0A2C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 03:19:46 +0000 (UTC)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTP
 id WgHjq1JY3bK1VWq1ZqmI0X; Fri, 18 Aug 2023 03:19:46 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id Wq1YqNTth0LVOWq1Zqqkym; Fri, 18 Aug 2023 03:19:45 +0000
X-Authority-Analysis: v=2.4 cv=BvCOfKb5 c=1 sm=1 tr=0 ts=64dee351
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=c-n4J4-pAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=L0NDqeB7ZLmQzAogN4cw:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQ30Ovr09Lgt/qeIl/nptDbt/kIRZBZ47Tzj0AxpNF0=; b=l2vTi2kOVga2bMsCnBTxK/Kkr2
 zBfV8oMnGXhoeZeYL01VY59r8sDSAxwET73X/K0vn5vOyPtFhe6CDcYOGRpcnZ3L9ZD2JVVEtVOGr
 dqs9JJ3sq6zbIhsh0ZFoYtAuWu0OWc7A6jN0PS4e7T7GIkc+NSnfNgqNNguHCuk/74dp6Rf+8HEVt
 VUwxza1nVVEMfKe+1fCBvxf1iX/0DpiOyN1H/q+dDIpSjxaq77fVmM2KshKizL64+SBbmikVyi2Ag
 v704SB3dDffPxyyOZ99OjFxKjnnUnGdDS8RSccxVM2Hf1ntVMHJZ3+Wg2B/k4toOqJv2xopf+CVeM
 DCAwUjDg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:53190
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qWp0s-001Dea-1q;
 Thu, 17 Aug 2023 21:14:58 -0500
Message-ID: <3afdda82-052b-69fc-02d8-ef4a9670e481@embeddedor.com>
Date: Thu, 17 Aug 2023 20:15:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-19-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-19-keescook@chromium.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWp0s-001Dea-1q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:53190
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAahuIBHzX6va9KlVS7RZibvB1Hf7f1XOQ8uSZlRGyqtroMjpw6e/RZwUMSCnfBmALSTBfNR3Nh/f4XwKfu7vni6Sj1Vs0OviC25R1YZur/9ZylLse63
 bQQ7UdSnylGwQQ6xDDxySj49FCeFOa7wL00Kgs2WRRx8YEhjeYpdSpuZC4J/QTBIHYFjFLMBbXjOPV+YFigDWC0G9EPN0BKGj2+lZjVWlUacbPCv3MTXxDr8
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
Subject: Re: [Linux-stm32] [PATCH 19/21] dmaengine: uniphier-xdmac: Annotate
 struct uniphier_xdmac_desc with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct uniphier_xdmac_desc.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/uniphier-xdmac.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
> index 290836b7e1be..dd51522879a7 100644
> --- a/drivers/dma/uniphier-xdmac.c
> +++ b/drivers/dma/uniphier-xdmac.c
> @@ -80,7 +80,7 @@ struct uniphier_xdmac_desc {
>   	unsigned int nr_node;
>   	unsigned int cur_node;
>   	enum dma_transfer_direction dir;
> -	struct uniphier_xdmac_desc_node nodes[];
> +	struct uniphier_xdmac_desc_node nodes[] __counted_by(nr_node);
>   };
>   
>   struct uniphier_xdmac_chan {
> @@ -295,6 +295,7 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
>   	xd = kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
>   	if (!xd)
>   		return NULL;
> +	xd->nr_node = nr;
>   
>   	for (i = 0; i < nr; i++) {
>   		burst_size = min_t(size_t, len, XDMAC_MAX_WORD_SIZE);
> @@ -309,7 +310,6 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
>   	}
>   
>   	xd->dir = DMA_MEM_TO_MEM;
> -	xd->nr_node = nr;
>   	xd->cur_node = 0;
>   
>   	return vchan_tx_prep(vc, &xd->vd, flags);
> @@ -351,6 +351,7 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   	xd = kzalloc(struct_size(xd, nodes, sg_len), GFP_NOWAIT);
>   	if (!xd)
>   		return NULL;
> +	xd->nr_node = sg_len;
>   
>   	for_each_sg(sgl, sg, sg_len, i) {
>   		xd->nodes[i].src = (direction == DMA_DEV_TO_MEM)
> @@ -385,7 +386,6 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   	}
>   
>   	xd->dir = direction;
> -	xd->nr_node = sg_len;
>   	xd->cur_node = 0;
>   
>   	return vchan_tx_prep(vc, &xd->vd, flags);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
