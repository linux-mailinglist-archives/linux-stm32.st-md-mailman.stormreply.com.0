Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C6A129D5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 18:28:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86999C78F74;
	Wed, 15 Jan 2025 17:28:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72094C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 17:27:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-21675fd60feso154509065ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fastly.com; s=google; t=1736962077; x=1737566877;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/tOyA1p7QjHDsifRN5k+/Gb8kyRYOVF0Azt3OIzzyw=;
 b=PsD/SzhcFAEgYXWzHuNP8gztfkeVuHLMrzxmCA/RfQd3PsO6GvzIZEY5L5IHNpNS9q
 BXR1CcW7od3BpUVg/RaXsBRV/bCv3Cf+yypHxqq1LAlUn7W+AA+zUQoIT1ABj1AP4MHt
 lpTbaGSMPuTfW+zr8uaJ7rYvNQC4VwHd/FI8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736962077; x=1737566877;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/tOyA1p7QjHDsifRN5k+/Gb8kyRYOVF0Azt3OIzzyw=;
 b=GFM613YueLUhMoRnbM1Oi2PhSPhvHshA5aJXXTw3WHDQidNQ0xuTGa/RViBXFmvJoa
 HQPrU7mOPaPeC4taY+GZthbOTQD8j0drsbivd9KxkLJJNsDvllRcGEDSFZRNpoD4PlSj
 sfkT6midUqet4uW7eDhO+ZipTK+Yi1xCnHh6mVrjfbAdhazb5nPdHZQ7BEyYYy57uMsl
 RXUjkTMqN14lZgcitM/Xm7RL+8xyjVlLJzwYUr5Hc5KPonw2dAvxb17QU5qd3rttX+FX
 zRTa8giLXnvlw0ZksOHG2BvpGbazLFJaQHHD8Er+cbg48WnCOpstC/ochozhqV2o+gAm
 9oQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBQyYXz+pxxcIEeGGQREhTGLBsbfdgWa3ZKMy9z8vbkHyaykcAm2URajVYGGB1I2CvgmiXXW+nlfQlag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxg+mTXBMpnnffwh0cK6w8he4aCERgjcF2GRY0TZQJFQcsPcHFW
 IO5mC9fCx3IlI11SjD/+mhML846owK84XS45mMUtBzXkreNiVOpQBMnckYaoT7s=
X-Gm-Gg: ASbGncsJjHmPeQQvEbpwzBkqLqDOdVdOceXvMycD5A6Reb4aM4zeLfOWhgtRoioCUUm
 3H5mpo8LkHAd81n5cJgsOnkl01LzkNfqVAqT4Vz71vmh9lHM2xc/JhTTkLLLZZDmSiShrwcDAhv
 lnADOba1bxtvjNGHszMb6QO80n7GoXV071DnLNjkQi2/dlwG8zw6wePURW9XAdg6tPbRGXMAEAj
 S0KlGj3RQaJoDlm60nmvruP1wSEIgHleCVTLbRZahvJeWtuauSxzSGWDvFBVnCxww0Eu125HQZI
 qx+1XXESRk/CqGvRF9lMPzg=
X-Google-Smtp-Source: AGHT+IGksVKSylJkV0LbwF+RW3gakMaxvSakIRb83Rj9Zk5r6cV3J0tIrcgSWtS1CavXnppBEpmgAQ==
X-Received: by 2002:a05:6a00:1906:b0:72a:bc6a:3a85 with SMTP id
 d2e1a72fcca58-72d22007a0emr30575531b3a.22.1736962076898; 
 Wed, 15 Jan 2025 09:27:56 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d405485b7sm9320991b3a.2.2025.01.15.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 09:27:56 -0800 (PST)
Date: Wed, 15 Jan 2025 09:27:53 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z4fwGc50mAfrMmYJ@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
 Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
 <Z4bzuToquRAMfvvu@LQ3V64L9R2> <20250115103358.00005b57@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115103358.00005b57@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Optimize
 cache prefetch in RX path
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

On Wed, Jan 15, 2025 at 10:33:58AM +0800, Furong Xu wrote:
> On Tue, 14 Jan 2025 15:31:05 -0800, Joe Damato <jdamato@fastly.com> wrote:
> 
> > On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> > > Current code prefetches cache lines for the received frame first, and
> > > then dma_sync_single_for_cpu() against this frame, this is wrong.
> > > Cache prefetch should be triggered after dma_sync_single_for_cpu().
> > > 
> > > This patch brings ~2.8% driver performance improvement in a TCP RX
> > > throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> > > core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> > > 
> > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index ca340fd8c937..b60f2f27140c 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> > >  
> > >  		/* Buffer is good. Go on. */
> > >  
> > > -		prefetch(page_address(buf->page) + buf->page_offset);
> > > -		if (buf->sec_page)
> > > -			prefetch(page_address(buf->sec_page));
> > > -
> > >  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
> > >  		len += buf1_len;
> > >  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> > > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> > >  
> > >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> > >  						buf1_len, dma_dir);
> > > +			prefetch(page_address(buf->page) + buf->page_offset);  
> > 
> > Minor nit: I've seen in other drivers authors using net_prefetch.
> > Probably not worth a re-roll just for something this minor.
> 
> After switch to net_prefetch(), I get another 4.5% throughput improvement :)
> Thanks! This definitely worth a v3 of this series.q

No worries. For what it's worth, it looks like there are a few other
instances in this driver where net_prefetch or net_prefetchw can be
used instead. That might be better as a followup / cleanup and
separate from this series though.

Just thought I'd mention it as you have a way to test the
improvements and I, unfortunately, do not have one of these devices.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
