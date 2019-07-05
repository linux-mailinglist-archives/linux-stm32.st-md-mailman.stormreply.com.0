Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886460692
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 15:29:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B6FEC35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 13:29:11 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0FF1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 13:29:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so9986230wrs.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2019 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ES3Fxqq/qVk0kvCdNYd6vQVB8dMaCL8eLDDrQ6qbPig=;
 b=jKImGNCLlO5An5dLyx2aVNvpjjInFeFKhGs2nmLuOp1EvadE1LSjGLgdbhRmtWQSfx
 n3MOTFnCoJzCmRtYd/3UAJewbi640IocbvSpPJt28zuRLrYKdpCPXQhFGTjVn9VW4C6Q
 ry3YKmLr46tCXpgWSMGkVOgJLCVZQWqszsNAslKm8KwOm6wxaXxui4og6rrSPEMBTUsv
 MD8jq4UhEWSs7/giqq378k9I8OY3qdXHsisW2/V/PxXRF8+FbcG3x/a9jeCDlSCcJ50l
 ogsrd3sOIYdRSvXPEg1u7n8rpdH45iY/fs3YdrbCuD8FAfLYp9Ey2AqdRR5tpntE1e0D
 ONJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ES3Fxqq/qVk0kvCdNYd6vQVB8dMaCL8eLDDrQ6qbPig=;
 b=Z09Zp3ZEt8ME2DkFjWhAShFQlrJjwx42tT/l708go/UlOYpt/qGI15Hvg8Uni1NCZN
 JaqcyRskbnF57R/NpseZfSq0JZpUZ4ri68HgdXyA0o121R8azt1ZB9/So1xtUSAad7uw
 r8r/lY8a7ClzUqgQQ4GI8G5aRkK1f89uW1I8dyzOgrbZ2/sUx33/TKyZ1hgYCkgi6IXz
 DHpfqTExYSGCePauCfD9AZj0+SEwROkLsjni9R8pzGe8YOwMbu9M7RxLxsV5bbWwEG+N
 ICPX2drLJQzkRLgT6v359TteJbnluxeQiNgUt15J+TsBr51X+cnIjE2252auhTcGcjOz
 0SzQ==
X-Gm-Message-State: APjAAAXMkdBnvCHcWge13M/CYDQGgCyMFV/T59tEGRvZoUGytQDZnKC/
 B7fFfImm5/HAZG6s2K468QgqFA==
X-Google-Smtp-Source: APXvYqzjMQhemoYavZtb41OiKS8heBAFjJkN3Jzjp+CP4WqiX2GqTTD7wj40s7CG20LugioQJosqgg==
X-Received: by 2002:adf:de08:: with SMTP id b8mr3606488wrm.282.1562333349431; 
 Fri, 05 Jul 2019 06:29:09 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id h8sm8749710wmf.12.2019.07.05.06.29.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 06:29:08 -0700 (PDT)
Date: Fri, 5 Jul 2019 16:29:05 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190705132905.GA15433@apalos>
References: <cover.1562311299.git.joabreu@synopsys.com>
 <384dab52828c4b65596ef4202562a574eed93b91.1562311299.git.joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <384dab52828c4b65596ef4202562a574eed93b91.1562311299.git.joabreu@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Introducing
 support for Page Pool
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

Hi Jose,

I think this look ok for now. One request though, on page_pool_free 

On Fri, Jul 05, 2019 at 09:23:00AM +0200, Jose Abreu wrote:
> Mapping and unmapping DMA region is an high bottleneck in stmmac driver,
> specially in the RX path.
> 
> This commit introduces support for Page Pool API and uses it in all RX
> queues. With this change, we get more stable troughput and some increase
> of banwidth with iperf:
> 	- MAC1000 - 950 Mbps
> 	- XGMAC: 9.22 Gbps
> 
> Changes from v2:
> 	- Uncoditionally call page_pool_free() (Jesper)
> Changes from v1:
> 	- Use page_pool_get_dma_addr() (Jesper)
> 	- Add a comment (Jesper)
> 	- Add page_pool_free() call (Jesper)
> 	- Reintroduce sync_single_for_device (Arnd / Ilias)
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Jesper Dangaard Brouer <brouer@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  10 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 203 +++++++---------------
>  3 files changed, 70 insertions(+), 144 deletions(-)
> 

[...]
> @@ -1498,8 +1480,11 @@ static void free_dma_rx_desc_resources(struct stmmac_priv *priv)
>  					  sizeof(struct dma_extended_desc),
>  					  rx_q->dma_erx, rx_q->dma_rx_phy);
>  
> -		kfree(rx_q->rx_skbuff_dma);
> -		kfree(rx_q->rx_skbuff);
> +		kfree(rx_q->buf_pool);
> +		if (rx_q->page_pool) {
> +			page_pool_request_shutdown(rx_q->page_pool);
> +			page_pool_free(rx_q->page_pool);

A patch currently under review will slightly change that [1] and [2]
Can you defer this a bit till that one gets merged?
The only thing you'll have to do is respin this and replace page_pool_free()
with page_pool_destroy()

[1] https://lore.kernel.org/netdev/20190705094346.13b06da6@carbon/
[2] https://lore.kernel.org/netdev/156225871578.1603.6630229522953924907.stgit@firesoul/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
