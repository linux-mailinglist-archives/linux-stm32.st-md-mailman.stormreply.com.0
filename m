Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAAE78030A
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 03:22:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1A1C6B472;
	Fri, 18 Aug 2023 01:22:00 +0000 (UTC)
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ECDDC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 01:21:59 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
 by cmsmtp with ESMTP
 id WcMGqbqlmEoVsWoBZqGNrp; Fri, 18 Aug 2023 01:21:58 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id WoBZq6j1eHSofWoBZqzzZg; Fri, 18 Aug 2023 01:21:57 +0000
X-Authority-Analysis: v=2.4 cv=HbEH8wI8 c=1 sm=1 tr=0 ts=64dec7b5
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4qj0EaSxUo2+DCTF/hymWHxE6YXJwkpWmEuGBo/Dmbc=; b=n+XJDOIpS3chhDQvGjusg83aqL
 kotuJV5YiiK7mhcxygIaK8gdEM36MVhuQumYgfktIfM4pIfdSPHgO69oI+LdslniQgvuflhAVhsvz
 xTXwA4g2mz7+3cP/vlCYfRUJRbeRp/lvUHGyz7Xt/PLQ1/Me2V1ZLKkEyJTiBRdSjL1a8IYIXz+bn
 4hVFZYiEiosfCDz5DC5dGVY/bVDGQd9vKe5ii60dGxZswHz+UohqjZc4Yxvo3LTSAGMDiEQGGLi+3
 CD935yKR04s/TRMESuoUI6TgTU7RYtcs6eqnbgLFnUOZzubddNm6hANkkI26WoiVkc9I+mm5N0gEu
 JaN4KC1Q==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:40700
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qWoBR-000THf-37;
 Thu, 17 Aug 2023 20:21:50 -0500
Message-ID: <1e22a311-0cb4-f31c-4439-65421147a50e@embeddedor.com>
Date: Thu, 17 Aug 2023 19:22:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-1-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-1-keescook@chromium.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWoBR-000THf-37
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:40700
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGA9Ds+pIKNCLvITDLOLUHzDs7X3/EFNNLtdRnr5xfHhLQMQtGco5N84O9nxXwduACAjTS3SgN2YwBz4H4fcXnPbIPLY2bGkvxr9qNAHi/BA2bvpUspm
 /zejWFejgnGtwP22Ipa5kKQqtPezWntC5LemkiPmZB43gkH08exPsrfWWyuqOEa1JNK22P7Phcibj+IFxjHxsJMrClwOLfgegyp3Gr88GiOaASkHR/JodWZY
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
 Orson Zhai <orsonzhai@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
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
 Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 01/21] dmaengine: apple-admac: Annotate
 struct admac_data with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct admac_data.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/apple-admac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 3af795635c5c..ff46260b6ebc 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -128,7 +128,7 @@ struct admac_data {
>   	int irq;
>   	int irq_index;
>   	int nchannels;
> -	struct admac_chan channels[];
> +	struct admac_chan channels[] __counted_by(nchannels);
>   };
>   
>   struct admac_tx {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
