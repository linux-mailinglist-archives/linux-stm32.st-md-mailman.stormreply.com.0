Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F5160BDB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 08:46:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B497C36B0B;
	Mon, 17 Feb 2020 07:46:15 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42867C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 07:46:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so18371721wru.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 23:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5qkKrOlcFFXZzVNv9icrocjiIlH9It8BWZdzD0LWt0Q=;
 b=nVwzAvmsNR+X50r3nGA+fAKqm4lVqop6F9Orm0R72w9u0QJH/wgbx6ALhdUWwKdPfZ
 rjuB4z7AJVDPUWjpfqGwquqJcbU7zoyj4AzStg0E64CPVyz4YIt8MRHIZgFMGArJmNBk
 aC9N3DvtmoG6jepAu1+EVe98hhZeaZzKRyw6ZR8lzwLGqfrWlFPuCWhti3+3X3a77h9B
 eenMFaN1CGdlEX4vF4AOpDLedZ19hyXcCzg/t51WAp78AEzQ9hVjScoV8FQyHDq2n6RQ
 hiS6+bajefP3Bh83xlyQwTdl+wVKaRWxVTOeWPxtfSlpPvQlDDYreJWe+cRVIeIZpmoD
 e0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5qkKrOlcFFXZzVNv9icrocjiIlH9It8BWZdzD0LWt0Q=;
 b=M/nzTbDZtGmPEjd2OeVW0ZoqygrRtjI5em0HYjS5lqXRD7s4EFKaZEJPuUEZu9SkuS
 6W7ERh1AqebL7O8BLuF5E79dCH+KZay2WJ1GiivrrGvpSIBnD00j13AAJX1iEI1O1Vm7
 1i4rYMdbKFVjV8D0qqBychXihS+XbSBPl+woj7TZDwcU8xg1OeG7hfCfOOrbptI1M7uy
 1Wn3955N2rMvRM2+hYjjNThTD+X7Zn5kEPl7zpMWEZacEREj0sS41/Tw7ZfR1WJuPmon
 cRTdl5dOG4LbuDw4h3hgfZkQUEswbLG3Ulcs2amwzgHpgzXPHLfrtc+GRYI2nLg+Kf13
 1nqw==
X-Gm-Message-State: APjAAAVX/3wvxoptNVIowhQma9quZGQjAKnNXm6P8fOHdxD3NET96gwb
 Urdo2z96jjq3P4o2mZokgnsjlg==
X-Google-Smtp-Source: APXvYqxJK1DF6QQA+j344kfPjdKZ9FNScf9ZQaa/MQTmBHsoNElLwtb1YxsehCFRWbNrdn9YAQ7Brw==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr20797979wrv.144.1581925571717; 
 Sun, 16 Feb 2020 23:46:11 -0800 (PST)
Received: from apalos.home (ppp-2-87-54-32.home.otenet.gr. [2.87.54.32])
 by smtp.gmail.com with ESMTPSA id f11sm18786744wml.3.2020.02.16.23.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 23:46:11 -0800 (PST)
Date: Mon, 17 Feb 2020 09:46:08 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <20200217074608.GA139819@apalos.home>
References: <20200217062850.133121-1-ilias.apalodimas@linaro.org>
 <20200217084133.1a67ae63@carbon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217084133.1a67ae63@carbon>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 toke@redhat.com, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jonathan.lemon@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 lorenzo@kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
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

On Mon, Feb 17, 2020 at 08:41:33AM +0100, Jesper Dangaard Brouer wrote:
> On Mon, 17 Feb 2020 08:28:49 +0200
> Ilias Apalodimas <ilias.apalodimas@linaro.org> wrote:
> 
> > diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> > index cfbed00ba7ee..7c1f23930035 100644
> > --- a/include/net/page_pool.h
> > +++ b/include/net/page_pool.h
> > @@ -162,39 +162,33 @@ static inline void page_pool_use_xdp_mem(struct page_pool *pool,
> >  }
> >  #endif
> >  
> > -/* Never call this directly, use helpers below */
> > -void __page_pool_put_page(struct page_pool *pool, struct page *page,
> > -			  unsigned int dma_sync_size, bool allow_direct);
> > +void page_pool_release_page(struct page_pool *pool, struct page *page);
> >  
> > -static inline void page_pool_put_page(struct page_pool *pool,
> > -				      struct page *page, bool allow_direct)
> > +/* If the page refcnt == 1, this will try to recycle the page.
> > + * if PP_FLAG_DMA_SYNC_DEV is set, it will try to sync the DMA area for
> > + * the configured size min(dma_sync_size, pool->max_len).
> > + * If the page refcnt != page will be returned
> 
> Is this last comment line fully formed?

Yes, but that dosen't mena it makes sense!
Maybe i should switch the last sentence to sometning like:
"If the page refcnt != 1, page will be returned to memory subsystem" ?

Thanks
/Ilias
> 
> 
> > + */
> > +void page_pool_put_page(struct page_pool *pool, struct page *page,
> > +			unsigned int dma_sync_size, bool allow_direct);
> > +
> > +/* Same as above but will try to sync the entire area pool->max_len */
> > +static inline void page_pool_put_full_page(struct page_pool *pool,
> > +					   struct page *page, bool allow_direct)
> 
> 
> 
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
