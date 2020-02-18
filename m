Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110A1624F4
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2020 11:52:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18917C36B0B;
	Tue, 18 Feb 2020 10:52:35 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43F2EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 10:52:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so23294448wrx.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CE/pgHyanhmc6jLqsxDCeHUfCHIDMRAwR39NvYTnVpY=;
 b=mvjX4ekSrTZt9lmQ1FFKz/G7xx1R7scrAlF++QCCbLL7aGzuZGVW9USJKeOCULlG21
 yh1Xk+PI+vbhOSmfs7F8l1H4Wt0XLaef+bOm+wf+kbilZNHMLiYTeceEibyBEA1JmY4r
 nnk2mrBG2050jJ6rntkRxZLsORxIpP7G9Le4Egk7p0qYBO5a3GGiLxda8PwKZFigaYeH
 79uVRpkoZZsrbfIZi1aPJPPB8ne9VyMnYKj3CQQo0GJluFCOjDT3BB93nc8Bw0vT+eK4
 YqQN0+WV0tTZFVcdDhfbrLalUAlVtNI7YTgK/1z7J71K21QAQpYikiwa+pKUfwhc1jKt
 XuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CE/pgHyanhmc6jLqsxDCeHUfCHIDMRAwR39NvYTnVpY=;
 b=Zw3TmuoiZ125/nd2UDD3k+ZWZSBaE8wLYHoYgatTwwElBJtQx6twoGnoz/3q4868dd
 0xoGCJ8vQWjx1Q7oaml02/V6RFJlXBK4mVdD4EtQ7MbaRwxa/VMRFFKer4T7MOvQQyYE
 O346z6p4LWKG0kc6Ln5we5aO9Qi+zFp3LTvHA4m0DNawJhU9yd1k/d10AeFo9Uwzu8yi
 I9QZLXBB9KniCcFpuoVDiFV2V2lHAt5oU0axXiVZlTafdBhFP5Cusq1FA472/0pMVryo
 5XeVC4JaRPbka3NlkuEBNylSSYoeJgkk986P+B3XZ4OddLnZFvmF3oRtwlvSnJ+J6U5Q
 FOKA==
X-Gm-Message-State: APjAAAVX2o8xGyHJDY2f7zaYPVX1SgKadXomz9Lt8Wy0+bjSXCjqlZcE
 Ky5Dc7XUCl3zxPAKEQ3S5K5mLg==
X-Google-Smtp-Source: APXvYqxkMbjmf+SDu7haNAsrP5Y4CZzpu7hmBj1k/4YWieRi1ZPkzVsYalktNyvx6jkcQlRACUK8Vw==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr28673181wrn.239.1582023151386; 
 Tue, 18 Feb 2020 02:52:31 -0800 (PST)
Received: from apalos.home (ppp-2-87-54-32.home.otenet.gr. [2.87.54.32])
 by smtp.gmail.com with ESMTPSA id f11sm3013705wml.3.2020.02.18.02.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 02:52:30 -0800 (PST)
Date: Tue, 18 Feb 2020 12:52:27 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: netdev@vger.kernel.org
Message-ID: <20200218105227.GA170097@apalos.home>
References: <20200218075658.165499-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218075658.165499-1-ilias.apalodimas@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-stm32@st-md-mailman.stormreply.com, toke@redhat.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: page_pool: API cleanup
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This breaks xdp.c building since page_pool_release_page is not available if=
 the
kernel is compiled without PAGE_POOL support. =


I'll fix it and sent a v4

Regards
/Ilias
On Tue, Feb 18, 2020 at 09:56:57AM +0200, Ilias Apalodimas wrote:
> Functions starting with __ usually indicate those which are exported,
> but should not be called directly. Update some of those declared in the
> API and make it more readable.
> page_pool_unmap_page() and page_pool_release_page() were doing
> exactly the same thing. Keep the page_pool_release_page() variant
> and export it in order to show up on perf logs.
> Finally rename __page_pool_put_page() to page_pool_put_page() since we
> can now directly call it from drivers and rename the existing
> page_pool_put_page() to page_pool_put_full_page() since they do the same
> thing but the latter is trying to sync the full DMA area.
> =

> This patch also updates netsec, mvneta and stmmac drivers which use
> those functions.
> =

> Acked-by: Toke H=F8iland-J=F8rgensen <toke@redhat.com>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
> v1:
> - Fixed netsec driver compilation error
> v2:
> - Improved comment description of page_pool_put_page()
> =

>  drivers/net/ethernet/marvell/mvneta.c         | 19 +++---
>  drivers/net/ethernet/socionext/netsec.c       | 23 ++++---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
>  include/net/page_pool.h                       | 39 +++++------
>  net/core/page_pool.c                          | 64 ++++++++++---------
>  net/core/xdp.c                                |  2 +-
>  6 files changed, 75 insertions(+), 76 deletions(-)
> =

> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet=
/marvell/mvneta.c
> index 98017e7d5dd0..22b568c60f65 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -1933,7 +1933,7 @@ static void mvneta_rxq_drop_pkts(struct mvneta_port=
 *pp,
>  		if (!data || !(rx_desc->buf_phys_addr))
>  			continue;
>  =

> -		page_pool_put_page(rxq->page_pool, data, false);
> +		page_pool_put_full_page(rxq->page_pool, data, false);
>  	}
>  	if (xdp_rxq_info_is_reg(&rxq->xdp_rxq))
>  		xdp_rxq_info_unreg(&rxq->xdp_rxq);
> @@ -2108,9 +2108,9 @@ mvneta_run_xdp(struct mvneta_port *pp, struct mvnet=
a_rx_queue *rxq,
>  		err =3D xdp_do_redirect(pp->dev, xdp, prog);
>  		if (err) {
>  			ret =3D MVNETA_XDP_DROPPED;
> -			__page_pool_put_page(rxq->page_pool,
> -					     virt_to_head_page(xdp->data),
> -					     len, true);
> +			page_pool_put_page(rxq->page_pool,
> +					   virt_to_head_page(xdp->data), len,
> +					   true);
>  		} else {
>  			ret =3D MVNETA_XDP_REDIR;
>  		}
> @@ -2119,9 +2119,9 @@ mvneta_run_xdp(struct mvneta_port *pp, struct mvnet=
a_rx_queue *rxq,
>  	case XDP_TX:
>  		ret =3D mvneta_xdp_xmit_back(pp, xdp);
>  		if (ret !=3D MVNETA_XDP_TX)
> -			__page_pool_put_page(rxq->page_pool,
> -					     virt_to_head_page(xdp->data),
> -					     len, true);
> +			page_pool_put_page(rxq->page_pool,
> +					   virt_to_head_page(xdp->data), len,
> +					   true);
>  		break;
>  	default:
>  		bpf_warn_invalid_xdp_action(act);
> @@ -2130,9 +2130,8 @@ mvneta_run_xdp(struct mvneta_port *pp, struct mvnet=
a_rx_queue *rxq,
>  		trace_xdp_exception(pp->dev, prog, act);
>  		/* fall through */
>  	case XDP_DROP:
> -		__page_pool_put_page(rxq->page_pool,
> -				     virt_to_head_page(xdp->data),
> -				     len, true);
> +		page_pool_put_page(rxq->page_pool,
> +				   virt_to_head_page(xdp->data), len, true);
>  		ret =3D MVNETA_XDP_DROPPED;
>  		break;
>  	}
> diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethern=
et/socionext/netsec.c
> index e8224b543dfc..46424533d478 100644
> --- a/drivers/net/ethernet/socionext/netsec.c
> +++ b/drivers/net/ethernet/socionext/netsec.c
> @@ -896,9 +896,9 @@ static u32 netsec_run_xdp(struct netsec_priv *priv, s=
truct bpf_prog *prog,
>  	case XDP_TX:
>  		ret =3D netsec_xdp_xmit_back(priv, xdp);
>  		if (ret !=3D NETSEC_XDP_TX)
> -			__page_pool_put_page(dring->page_pool,
> -					     virt_to_head_page(xdp->data),
> -					     len, true);
> +			page_pool_put_page(dring->page_pool,
> +					   virt_to_head_page(xdp->data), len,
> +					   true);
>  		break;
>  	case XDP_REDIRECT:
>  		err =3D xdp_do_redirect(priv->ndev, xdp, prog);
> @@ -906,9 +906,9 @@ static u32 netsec_run_xdp(struct netsec_priv *priv, s=
truct bpf_prog *prog,
>  			ret =3D NETSEC_XDP_REDIR;
>  		} else {
>  			ret =3D NETSEC_XDP_CONSUMED;
> -			__page_pool_put_page(dring->page_pool,
> -					     virt_to_head_page(xdp->data),
> -					     len, true);
> +			page_pool_put_page(dring->page_pool,
> +					   virt_to_head_page(xdp->data), len,
> +					   true);
>  		}
>  		break;
>  	default:
> @@ -919,9 +919,8 @@ static u32 netsec_run_xdp(struct netsec_priv *priv, s=
truct bpf_prog *prog,
>  		/* fall through -- handle aborts by dropping packet */
>  	case XDP_DROP:
>  		ret =3D NETSEC_XDP_CONSUMED;
> -		__page_pool_put_page(dring->page_pool,
> -				     virt_to_head_page(xdp->data),
> -				     len, true);
> +		page_pool_put_page(dring->page_pool,
> +				   virt_to_head_page(xdp->data), len, true);
>  		break;
>  	}
>  =

> @@ -1020,8 +1019,8 @@ static int netsec_process_rx(struct netsec_priv *pr=
iv, int budget)
>  			 * cache state. Since we paid the allocation cost if
>  			 * building an skb fails try to put the page into cache
>  			 */
> -			__page_pool_put_page(dring->page_pool, page,
> -					     pkt_len, true);
> +			page_pool_put_page(dring->page_pool, page, pkt_len,
> +					   true);
>  			netif_err(priv, drv, priv->ndev,
>  				  "rx failed to build skb\n");
>  			break;
> @@ -1199,7 +1198,7 @@ static void netsec_uninit_pkt_dring(struct netsec_p=
riv *priv, int id)
>  		if (id =3D=3D NETSEC_RING_RX) {
>  			struct page *page =3D virt_to_page(desc->addr);
>  =

> -			page_pool_put_page(dring->page_pool, page, false);
> +			page_pool_put_full_page(dring->page_pool, page, false);
>  		} else if (id =3D=3D NETSEC_RING_TX) {
>  			dma_unmap_single(priv->dev, desc->dma_addr, desc->len,
>  					 DMA_TO_DEVICE);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 5836b21edd7e..37920b4da091 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1251,11 +1251,11 @@ static void stmmac_free_rx_buffer(struct stmmac_p=
riv *priv, u32 queue, int i)
>  	struct stmmac_rx_buffer *buf =3D &rx_q->buf_pool[i];
>  =

>  	if (buf->page)
> -		page_pool_put_page(rx_q->page_pool, buf->page, false);
> +		page_pool_put_full_page(rx_q->page_pool, buf->page, false);
>  	buf->page =3D NULL;
>  =

>  	if (buf->sec_page)
> -		page_pool_put_page(rx_q->page_pool, buf->sec_page, false);
> +		page_pool_put_full_page(rx_q->page_pool, buf->sec_page, false);
>  	buf->sec_page =3D NULL;
>  }
>  =

> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index cfbed00ba7ee..5cf75141c82c 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -162,39 +162,34 @@ static inline void page_pool_use_xdp_mem(struct pag=
e_pool *pool,
>  }
>  #endif
>  =

> -/* Never call this directly, use helpers below */
> -void __page_pool_put_page(struct page_pool *pool, struct page *page,
> -			  unsigned int dma_sync_size, bool allow_direct);
> +void page_pool_release_page(struct page_pool *pool, struct page *page);
>  =

> -static inline void page_pool_put_page(struct page_pool *pool,
> -				      struct page *page, bool allow_direct)
> +/* If the page refcnt =3D=3D 1, this will try to recycle the page.
> + * if PP_FLAG_DMA_SYNC_DEV is set, we'll try to sync the DMA area for
> + * the configured size min(dma_sync_size, pool->max_len).
> + * If the page refcnt !=3D 1, then the page will be returned to memory
> + * subsystem.
> + */
> +void page_pool_put_page(struct page_pool *pool, struct page *page,
> +			unsigned int dma_sync_size, bool allow_direct);
> +
> +/* Same as above but will try to sync the entire area pool->max_len */
> +static inline void page_pool_put_full_page(struct page_pool *pool,
> +					   struct page *page, bool allow_direct)
>  {
>  	/* When page_pool isn't compiled-in, net/core/xdp.c doesn't
>  	 * allow registering MEM_TYPE_PAGE_POOL, but shield linker.
>  	 */
>  #ifdef CONFIG_PAGE_POOL
> -	__page_pool_put_page(pool, page, -1, allow_direct);
> +	page_pool_put_page(pool, page, -1, allow_direct);
>  #endif
>  }
> -/* Very limited use-cases allow recycle direct */
> +
> +/* Same as above but the caller must guarantee safe context. e.g NAPI */
>  static inline void page_pool_recycle_direct(struct page_pool *pool,
>  					    struct page *page)
>  {
> -	__page_pool_put_page(pool, page, -1, true);
> -}
> -
> -/* Disconnects a page (from a page_pool).  API users can have a need
> - * to disconnect a page (from a page_pool), to allow it to be used as
> - * a regular page (that will eventually be returned to the normal
> - * page-allocator via put_page).
> - */
> -void page_pool_unmap_page(struct page_pool *pool, struct page *page);
> -static inline void page_pool_release_page(struct page_pool *pool,
> -					  struct page *page)
> -{
> -#ifdef CONFIG_PAGE_POOL
> -	page_pool_unmap_page(pool, page);
> -#endif
> +	page_pool_put_full_page(pool, page, true);
>  }
>  =

>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 9b7cbe35df37..464500c551e8 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -96,7 +96,7 @@ struct page_pool *page_pool_create(const struct page_po=
ol_params *params)
>  }
>  EXPORT_SYMBOL(page_pool_create);
>  =

> -static void __page_pool_return_page(struct page_pool *pool, struct page =
*page);
> +static void page_pool_return_page(struct page_pool *pool, struct page *p=
age);
>  =

>  noinline
>  static struct page *page_pool_refill_alloc_cache(struct page_pool *pool,
> @@ -137,7 +137,7 @@ static struct page *page_pool_refill_alloc_cache(stru=
ct page_pool *pool,
>  			 * (2) break out to fallthrough to alloc_pages_node.
>  			 * This limit stress on page buddy alloactor.
>  			 */
> -			__page_pool_return_page(pool, page);
> +			page_pool_return_page(pool, page);
>  			page =3D NULL;
>  			break;
>  		}
> @@ -281,17 +281,20 @@ static s32 page_pool_inflight(struct page_pool *poo=
l)
>  }
>  =

>  /* Cleanup page_pool state from page */
> -static void __page_pool_clean_page(struct page_pool *pool,
> -				   struct page *page)
> +static void page_pool_clean_page(struct page_pool *pool, struct page *pa=
ge)
>  {
>  	dma_addr_t dma;
>  	int count;
>  =

>  	if (!(pool->p.flags & PP_FLAG_DMA_MAP))
> +		/* Always account for inflight pages, even if we didn't
> +		 * map them
> +		 */
>  		goto skip_dma_unmap;
>  =

>  	dma =3D page->dma_addr;
> -	/* DMA unmap */
> +
> +	/* When page is unmapped, it cannot be returned our pool */
>  	dma_unmap_page_attrs(pool->p.dev, dma,
>  			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
>  			     DMA_ATTR_SKIP_CPU_SYNC);
> @@ -304,20 +307,23 @@ static void __page_pool_clean_page(struct page_pool=
 *pool,
>  	trace_page_pool_state_release(pool, page, count);
>  }
>  =

> -/* unmap the page and clean our state */
> -void page_pool_unmap_page(struct page_pool *pool, struct page *page)
> +/* Disconnects a page (from a page_pool).  API users can have a need
> + * to disconnect a page (from a page_pool), to allow it to be used as
> + * a regular page (that will eventually be returned to the normal
> + * page-allocator via put_page).
> + */
> +void page_pool_release_page(struct page_pool *pool, struct page *page)
>  {
> -	/* When page is unmapped, this implies page will not be
> -	 * returned to page_pool.
> -	 */
> -	__page_pool_clean_page(pool, page);
> +#ifdef CONFIG_PAGE_POOL
> +	page_pool_clean_page(pool, page);
> +#endif
>  }
> -EXPORT_SYMBOL(page_pool_unmap_page);
> +EXPORT_SYMBOL(page_pool_release_page);
>  =

>  /* Return a page to the page allocator, cleaning up our state */
> -static void __page_pool_return_page(struct page_pool *pool, struct page =
*page)
> +static void page_pool_return_page(struct page_pool *pool, struct page *p=
age)
>  {
> -	__page_pool_clean_page(pool, page);
> +	page_pool_release_page(pool, page);
>  =

>  	put_page(page);
>  	/* An optimization would be to call __free_pages(page, pool->p.order)
> @@ -326,8 +332,7 @@ static void __page_pool_return_page(struct page_pool =
*pool, struct page *page)
>  	 */
>  }
>  =

> -static bool __page_pool_recycle_into_ring(struct page_pool *pool,
> -				   struct page *page)
> +static bool page_pool_recycle_in_ring(struct page_pool *pool, struct pag=
e *page)
>  {
>  	int ret;
>  	/* BH protection not needed if current is serving softirq */
> @@ -344,7 +349,7 @@ static bool __page_pool_recycle_into_ring(struct page=
_pool *pool,
>   *
>   * Caller must provide appropriate safe context.
>   */
> -static bool __page_pool_recycle_direct(struct page *page,
> +static bool page_pool_recycle_in_cache(struct page *page,
>  				       struct page_pool *pool)
>  {
>  	if (unlikely(pool->alloc.count =3D=3D PP_ALLOC_CACHE_SIZE))
> @@ -363,8 +368,8 @@ static bool pool_page_reusable(struct page_pool *pool=
, struct page *page)
>  	return !page_is_pfmemalloc(page);
>  }
>  =

> -void __page_pool_put_page(struct page_pool *pool, struct page *page,
> -			  unsigned int dma_sync_size, bool allow_direct)
> +void page_pool_put_page(struct page_pool *pool, struct page *page,
> +			unsigned int dma_sync_size, bool allow_direct)
>  {
>  	/* This allocator is optimized for the XDP mode that uses
>  	 * one-frame-per-page, but have fallbacks that act like the
> @@ -381,12 +386,12 @@ void __page_pool_put_page(struct page_pool *pool, s=
truct page *page,
>  						      dma_sync_size);
>  =

>  		if (allow_direct && in_serving_softirq())
> -			if (__page_pool_recycle_direct(page, pool))
> +			if (page_pool_recycle_in_cache(page, pool))
>  				return;
>  =

> -		if (!__page_pool_recycle_into_ring(pool, page)) {
> +		if (!page_pool_recycle_in_ring(pool, page)) {
>  			/* Cache full, fallback to free pages */
> -			__page_pool_return_page(pool, page);
> +			page_pool_return_page(pool, page);
>  		}
>  		return;
>  	}
> @@ -403,12 +408,13 @@ void __page_pool_put_page(struct page_pool *pool, s=
truct page *page,
>  	 * doing refcnt based recycle tricks, meaning another process
>  	 * will be invoking put_page.
>  	 */
> -	__page_pool_clean_page(pool, page);
> +	/* Do not replace this with page_pool_return_page() */
> +	page_pool_release_page(pool, page);
>  	put_page(page);
>  }
> -EXPORT_SYMBOL(__page_pool_put_page);
> +EXPORT_SYMBOL(page_pool_put_page);
>  =

> -static void __page_pool_empty_ring(struct page_pool *pool)
> +static void page_pool_empty_ring(struct page_pool *pool)
>  {
>  	struct page *page;
>  =

> @@ -419,7 +425,7 @@ static void __page_pool_empty_ring(struct page_pool *=
pool)
>  			pr_crit("%s() page_pool refcnt %d violation\n",
>  				__func__, page_ref_count(page));
>  =

> -		__page_pool_return_page(pool, page);
> +		page_pool_return_page(pool, page);
>  	}
>  }
>  =

> @@ -449,7 +455,7 @@ static void page_pool_empty_alloc_cache_once(struct p=
age_pool *pool)
>  	 */
>  	while (pool->alloc.count) {
>  		page =3D pool->alloc.cache[--pool->alloc.count];
> -		__page_pool_return_page(pool, page);
> +		page_pool_return_page(pool, page);
>  	}
>  }
>  =

> @@ -461,7 +467,7 @@ static void page_pool_scrub(struct page_pool *pool)
>  	/* No more consumers should exist, but producers could still
>  	 * be in-flight.
>  	 */
> -	__page_pool_empty_ring(pool);
> +	page_pool_empty_ring(pool);
>  }
>  =

>  static int page_pool_release(struct page_pool *pool)
> @@ -535,7 +541,7 @@ void page_pool_update_nid(struct page_pool *pool, int=
 new_nid)
>  	/* Flush pool alloc cache, as refill will check NUMA node */
>  	while (pool->alloc.count) {
>  		page =3D pool->alloc.cache[--pool->alloc.count];
> -		__page_pool_return_page(pool, page);
> +		page_pool_return_page(pool, page);
>  	}
>  }
>  EXPORT_SYMBOL(page_pool_update_nid);
> diff --git a/net/core/xdp.c b/net/core/xdp.c
> index 8310714c47fd..4c7ea85486af 100644
> --- a/net/core/xdp.c
> +++ b/net/core/xdp.c
> @@ -372,7 +372,7 @@ static void __xdp_return(void *data, struct xdp_mem_i=
nfo *mem, bool napi_direct,
>  		xa =3D rhashtable_lookup(mem_id_ht, &mem->id, mem_id_rht_params);
>  		page =3D virt_to_head_page(data);
>  		napi_direct &=3D !xdp_return_frame_no_direct();
> -		page_pool_put_page(xa->page_pool, page, napi_direct);
> +		page_pool_put_full_page(xa->page_pool, page, napi_direct);
>  		rcu_read_unlock();
>  		break;
>  	case MEM_TYPE_PAGE_SHARED:
> -- =

> 2.25.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
