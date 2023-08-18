Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773F780312
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 03:23:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D05E2C6B476;
	Fri, 18 Aug 2023 01:23:31 +0000 (UTC)
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24620C6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 01:23:30 +0000 (UTC)
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
 by cmsmtp with ESMTP
 id WmuLq3U0VQFHRWoD3qtdqy; Fri, 18 Aug 2023 01:23:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id WoD3qBX2qyB3AWoD3qKOqK; Fri, 18 Aug 2023 01:23:29 +0000
X-Authority-Analysis: v=2.4 cv=UZlC9YeN c=1 sm=1 tr=0 ts=64dec811
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4O/pnsMN2mbUZXxNy5kzNXFmPO21hV2JJ/xiQe1qSMo=; b=KMrBMGMXN+OPsPe1WYDiAsg4Xz
 fV0vGm09SDOP8V0o8AD/WiWjeZ/ttYw5oZvtIfro0fjdAoYqSt106U1OpqEYNdrMLk5HVpBqQnGj2
 cjH8H8ft36qOdQ7+UmgvX+ENKt3RKIioeb//n15aDS3YsiAJz8uapZk1MHSacBm1fjkp8vJsqvpq3
 kvKmjG6ryksjNTn6SCDesKpS2dj7hqYPy9VzkMdfDINL0Ky+8d1Xm4treWBRAMr8Ybv7MtUQb1mrr
 CjmD0WecnaY6N0lIo6CRY/NzYGIy9ulPKd3uMI9wOQ5kf6r45IrtuIMz+6dtnhBIUXiHeMrb6y/EC
 q5SlftHg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:48268
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qWoCx-000VYw-1s;
 Thu, 17 Aug 2023 20:23:23 -0500
Message-ID: <cb31dd54-89fc-9eaa-4dc5-3ba51f92842c@embeddedor.com>
Date: Thu, 17 Aug 2023 19:24:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-8-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-8-keescook@chromium.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWoCx-000VYw-1s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:48268
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 214
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfINDk5pmccWXhkghpghNU8tUp7Zsz9X9MkqrAlkEcPVkVLN7WcT8xsIOuJw7KxTuTJyr6c1x1+sOTOy7bcFjAJukwZK43efgzef13QDCwQJGXmBLkbzD
 eSAGgJBZWRYVoPA0QMb+RgA2uuHO2PCF2S3GRvqvJvKx0/5EQTphdYNjxIU7GiyJ0rKE6LsuecX5dHKN66Jg6FmP9dRO5o450zhI+Z8Lh0dWIBbMRXWJDcj6
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
Subject: Re: [Linux-stm32] [PATCH 08/21] dmaengine: sa11x0: Annotate struct
 sa11x0_dma_desc with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct sa11x0_dma_desc.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/sa11x0-dma.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
> index a29c13cae716..e5849622f198 100644
> --- a/drivers/dma/sa11x0-dma.c
> +++ b/drivers/dma/sa11x0-dma.c
> @@ -78,7 +78,7 @@ struct sa11x0_dma_desc {
>   	bool			cyclic;
>   
>   	unsigned		sglen;
> -	struct sa11x0_dma_sg	sg[];
> +	struct sa11x0_dma_sg	sg[] __counted_by(sglen);
>   };
>   
>   struct sa11x0_dma_phy;
> @@ -558,6 +558,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
>   		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
>   		return NULL;
>   	}
> +	txd->sglen = j;
>   
>   	j = 0;
>   	for_each_sg(sg, sgent, sglen, i) {
> @@ -593,7 +594,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
>   
>   	txd->ddar = c->ddar;
>   	txd->size = size;
> -	txd->sglen = j;
>   
>   	dev_dbg(chan->device->dev, "vchan %p: txd %p: size %zu nr %u\n",
>   		&c->vc, &txd->vd, txd->size, txd->sglen);
> @@ -628,6 +628,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
>   		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
>   		return NULL;
>   	}
> +	txd->sglen = sglen;
>   
>   	for (i = k = 0; i < size / period; i++) {
>   		size_t tlen, len = period;
> @@ -653,7 +654,6 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_dma_cyclic(
>   
>   	txd->ddar = c->ddar;
>   	txd->size = size;
> -	txd->sglen = sglen;
>   	txd->cyclic = 1;
>   	txd->period = sgperiod;
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
