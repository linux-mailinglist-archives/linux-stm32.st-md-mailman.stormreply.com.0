Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A55F755
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 13:46:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64EA4C16371
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 11:46:20 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D06A8CBB4C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 10:31:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f9so6029947wre.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vfNfNOecUkgsCK5iRU+RHp5HzJkwACPrVEZHclgWgQw=;
 b=FVKkQerj/tMYlojr2Q5WpayQ+ByGFY3Q0bQtVLvJKEM1f46amoOo4TzfdoVLbfpGFq
 auEpc18Ed67ELqkaR3F4F29TioKOp/61uAHgb0KbVLNJAxbS4ihHPUdgj72YJsYh7VYN
 2YsD/Dr+6AT5Bc9ROI6C7GZeZcrtaOcW8tGXoeLQsvpXeo3w+YXmXKQMuvtcn6UNyvAW
 OtKUgoPW4socc1x5F5+1yvX4S+ZxiEX6RSZ+WoIYjsc/tR9U2HM6g6cpB0b2tBB3yiiy
 vGJ/S/IVFtqZEVsIwglpjE1jcjwuZS9V6cxvvV6qGnTcPUmWaDcRLQjnKyvS0O+avSWa
 Lrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vfNfNOecUkgsCK5iRU+RHp5HzJkwACPrVEZHclgWgQw=;
 b=dHo7fgq9GtXhcdP6wtl07Lo8YXn6NoQGL6e0/D4h11DX0YDtqD9ddosSWGPbk9Nh/r
 wSXN890jd3Xgo6PMaQ0EdT9Lad0PLtFl4kg3gJzltHJle5bmAOGX5KADsFbLvvQjsE8b
 sFZ1ektiiK2c42LlTRLxa7w3NQuWn93y0atH8wv5mU5XRU/LNG4O1qtk/CH6aUIhmCwp
 ZMYGI32haGzqM1+uyPdGW3lvEvH0VvTmyucHAPnueCe+gY3WUoOjP1iFKs1lrK0TIK8+
 LLyYwZWTiOqoinvvcND7x81tanKtl9QGCV7zRt6sgSiWXI0VHSuD0JEJWfUnAME7ryNd
 Ol5w==
X-Gm-Message-State: APjAAAUvnjUlkRFmbu93W4uOIhO7AToDTVCBfvqA3a1e/Un3zfVHR+bm
 GgifZ13ZFIaZ6AN7u+inEP150A==
X-Google-Smtp-Source: APXvYqxUVdc9ozRNmQRBYQi1aV7FgAVJIVtccp1fqnmyAt+NPySxjvsza2v74xpNJCzXO1zhqfzSSA==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr35965127wrv.30.1562236261279; 
 Thu, 04 Jul 2019 03:31:01 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id k63sm6177278wmb.2.2019.07.04.03.30.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 03:31:00 -0700 (PDT)
Date: Thu, 4 Jul 2019 13:30:57 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <20190704103057.GA29734@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704120018.4523a119@carbon>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 04 Jul 2019 11:46:18 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
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

HI Jesper, Ivan,

> On Wed,  3 Jul 2019 12:37:50 +0200
> Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> 
> > @@ -3547,6 +3456,9 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  			napi_gro_receive(&ch->rx_napi, skb);
> >  
> > +			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> 
> This doesn't look correct.
> 
> The page_pool DMA mapping cannot be "kept" when page traveling into the
> network stack attached to an SKB.  (Ilias and I have a long term plan[1]
> to allow this, but you cannot do it ATM).
> 
> You will have to call:
>   page_pool_release_page(rx_q->page_pool, buf->page);
> 
> This will do a DMA-unmap, and you will likely loose your performance
> gain :-(
> 
> 
> > +			buf->page = NULL;
> > +
> >  			priv->dev->stats.rx_packets++;
> >  			priv->dev->stats.rx_bytes += frame_len;
> >  		}
> 
> Also remember that the page_pool requires you driver to do the DMA-sync
> operation.  I see a dma_sync_single_for_cpu(), but I didn't see a
> dma_sync_single_for_device() (well, I noticed one getting removed).
> (For some HW Ilias tells me that the dma_sync_single_for_device can be
> elided, so maybe this can still be correct for you).
On our case (and in the page_pool API in general) you have to track buffers when
both .ndo_xdp_xmit() and XDP_TX are used.
So the lifetime of a packet might be 

1. page pool allocs packet. The API doesn't sync but i *think* you don't have to
explicitly since the CPU won't touch that buffer until the NAPI handler kicks
in. On the napi handler you need to dma_sync_single_for_cpu() and process the
packet.
2a) no XDP is required so the packet is unmapped and free'd
2b) .ndo_xdp_xmit is called so tyhe buffer need to be mapped/unmapped
2c) XDP_TX is called. In that case we re-use an Rx buffer so we need to
dma_sync_single_for_device()
2a and 2b won't cause any issues
In 2c the buffer will be recycled and fed back to the device with a *correct*
sync (for_device) and all those buffers are allocated as DMA_BIDIRECTIONAL.

So bvottom line i *think* we can skip the dma_sync_single_for_device() on the
initial allocation *only*. If am terribly wrong please let me know :)

Thanks
/Ilias
> 
> 
> [1] https://github.com/xdp-project/xdp-project/blob/master/areas/mem/page_pool02_SKB_return_callback.org
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
