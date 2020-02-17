Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E521160BC9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 08:41:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8B78C36B0B;
	Mon, 17 Feb 2020 07:41:55 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79DEFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581925313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqMNovNPLBTkcDZOPcJd85GoyTDK28xkZ5YRxHDZcBM=;
 b=ehZecdFbhkDmpuogn/fGY4Hn7cl2Mq+ft82DOojzr8RiU2EyV3LVGsa31VVQ2w/OnqcI7f
 ei9tOexGAoMJnjy5S8EXAokTScG1mr7MtqWPPmPYwdnatQCbHb+J3673J7H+kZE6FhXu8K
 LCLgl7kyKdVTrcKKjBRCOv7QIhBgjp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-tvWotQ_rP52F4XbMwzS7ew-1; Mon, 17 Feb 2020 02:41:50 -0500
X-MC-Unique: tvWotQ_rP52F4XbMwzS7ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94405800D53;
 Mon, 17 Feb 2020 07:41:47 +0000 (UTC)
Received: from carbon (ovpn-200-41.brq.redhat.com [10.40.200.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 299292CC39;
 Mon, 17 Feb 2020 07:41:35 +0000 (UTC)
Date: Mon, 17 Feb 2020 08:41:33 +0100
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20200217084133.1a67ae63@carbon>
In-Reply-To: <20200217062850.133121-1-ilias.apalodimas@linaro.org>
References: <20200217062850.133121-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 toke@redhat.com, John Fastabend <john.fastabend@gmail.com>, brouer@redhat.com,
 Alexei Starovoitov <ast@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: page_pool: API cleanup
	and comments
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

On Mon, 17 Feb 2020 08:28:49 +0200
Ilias Apalodimas <ilias.apalodimas@linaro.org> wrote:

> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index cfbed00ba7ee..7c1f23930035 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -162,39 +162,33 @@ static inline void page_pool_use_xdp_mem(struct page_pool *pool,
>  }
>  #endif
>  
> -/* Never call this directly, use helpers below */
> -void __page_pool_put_page(struct page_pool *pool, struct page *page,
> -			  unsigned int dma_sync_size, bool allow_direct);
> +void page_pool_release_page(struct page_pool *pool, struct page *page);
>  
> -static inline void page_pool_put_page(struct page_pool *pool,
> -				      struct page *page, bool allow_direct)
> +/* If the page refcnt == 1, this will try to recycle the page.
> + * if PP_FLAG_DMA_SYNC_DEV is set, it will try to sync the DMA area for
> + * the configured size min(dma_sync_size, pool->max_len).
> + * If the page refcnt != page will be returned

Is this last comment line fully formed?


> + */
> +void page_pool_put_page(struct page_pool *pool, struct page *page,
> +			unsigned int dma_sync_size, bool allow_direct);
> +
> +/* Same as above but will try to sync the entire area pool->max_len */
> +static inline void page_pool_put_full_page(struct page_pool *pool,
> +					   struct page *page, bool allow_direct)



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
