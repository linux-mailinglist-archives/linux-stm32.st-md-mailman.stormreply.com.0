Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD6160C5F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 09:08:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2755AC36B0B;
	Mon, 17 Feb 2020 08:08:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E60C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581926931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtqkCjqdRXLuRh9VlLNSDW1ljo1S6L5c70FnhGzTNhM=;
 b=OnZsI0bblNvbolzL7YFuQHX1bVDzFfhZLCjoJMhn2h04wBrc8aizDZRisYJbAnhTU2uBut
 jss2u6/QrCseAPirZzvKyJfsmZ1ltLSmuhZI8Mmt0CGg5DZKSrFvDhfbKYdSefJGDEagFe
 ujAyTeo7WPSO65GJq5qgyKF/ucBkg4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-9Nx8pL2hOKaLfoXLO9UU9Q-1; Mon, 17 Feb 2020 03:08:48 -0500
X-MC-Unique: 9Nx8pL2hOKaLfoXLO9UU9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 562D0107ACC4;
 Mon, 17 Feb 2020 08:08:45 +0000 (UTC)
Received: from carbon (ovpn-200-41.brq.redhat.com [10.40.200.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6396C1001B09;
 Mon, 17 Feb 2020 08:08:33 +0000 (UTC)
Date: Mon, 17 Feb 2020 09:08:31 +0100
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20200217090831.56de425e@carbon>
In-Reply-To: <20200217074608.GA139819@apalos.home>
References: <20200217062850.133121-1-ilias.apalodimas@linaro.org>
 <20200217084133.1a67ae63@carbon>
 <20200217074608.GA139819@apalos.home>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 toke@redhat.com, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 brouer@redhat.com, Jassi Brar <jaswinder.singh@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jesper Dangaard Brouer <hawk@kernel.org>
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

On Mon, 17 Feb 2020 09:46:08 +0200
Ilias Apalodimas <ilias.apalodimas@linaro.org> wrote:

> On Mon, Feb 17, 2020 at 08:41:33AM +0100, Jesper Dangaard Brouer wrote:
> > On Mon, 17 Feb 2020 08:28:49 +0200
> > Ilias Apalodimas <ilias.apalodimas@linaro.org> wrote:
> >   
> > > diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> > > index cfbed00ba7ee..7c1f23930035 100644
> > > --- a/include/net/page_pool.h
> > > +++ b/include/net/page_pool.h
> > > @@ -162,39 +162,33 @@ static inline void page_pool_use_xdp_mem(struct page_pool *pool,
> > >  }
> > >  #endif
> > >  
> > > -/* Never call this directly, use helpers below */
> > > -void __page_pool_put_page(struct page_pool *pool, struct page *page,
> > > -			  unsigned int dma_sync_size, bool allow_direct);
> > > +void page_pool_release_page(struct page_pool *pool, struct page *page);
> > >  
> > > -static inline void page_pool_put_page(struct page_pool *pool,
> > > -				      struct page *page, bool allow_direct)
> > > +/* If the page refcnt == 1, this will try to recycle the page.
> > > + * if PP_FLAG_DMA_SYNC_DEV is set, it will try to sync the DMA area for
> > > + * the configured size min(dma_sync_size, pool->max_len).
> > > + * If the page refcnt != page will be returned  
> > 
> > Is this last comment line fully formed?  
> 
> Yes, but that dosen't mena it makes sense!
> Maybe i should switch the last sentence to sometning like:
> "If the page refcnt != 1, page will be returned to memory subsystem" ?

Yes, that sounds better.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
