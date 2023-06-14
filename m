Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4800F72F8F4
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 11:24:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E54CCC6A61A;
	Wed, 14 Jun 2023 09:24:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2375AC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 09:24:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-30e3caa6aa7so6434366f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686734662; x=1689326662;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7vhykEG+gmq52oSNnSPExwEhKf++8eJ31Faf/uybBvo=;
 b=MZ/7VuHlf5M9nJ6GXXGSP1shZRtsCCaJ2g1j1OJitRZdfzuJO4bcP/WrJK9xlZx0Oo
 hpw/s/lLqJdUEWkv2tTQCMhlLKqD+wY5oNP7anb9MBqGoYJs964f2fdBDojrxtRFaTGp
 pJwciX0i1lH9vnHrK/eRFArcpXq/aW9x5BJicwhqtCTndYKjjgwsXAgVAh+b3Wz46Y3i
 rO3TqSCN9HsfV0/sHavO/kdnTDIFagXodFR5Qg+JWuF7odcqYGYdOgnqbfwXGe3nCVGj
 jCndsch5YUCIWn23HGTU8YtfqebJ1Y0dCpAqcbRK9NW5x6D/XmN4K6h8XDnSPloszexE
 fgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734662; x=1689326662;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vhykEG+gmq52oSNnSPExwEhKf++8eJ31Faf/uybBvo=;
 b=Oo+cc+zw4a0NNKQlK9wNBGRUArtrpnq0Sx/JSi6+tOqgpYsFog4d78Lr9Sle/JSCZ6
 BZK9+1uTYJ8p20zZhhBKvcganOh3uPfyL+rQzV1ysvnmxq/exS8c6JZ5QRi3iWg0l+Vb
 dfbvCPmIyTabqcAfLV1Gd/hxE1bSW7evuFvQ5Udc/NFiACKmoJNdGO7uxVboYuQTS2Sp
 dKLJPmClE4y36quN+oIP0OMxGwsBf1R0O3VExbiXl2h6RDRmCVvl9nNR6DUuI13j5e9O
 oR83sf8mCKHpzER2zZchg/MXxo9gBkdwTrmvkG40YpAstcCX6VBQaGf+VYIubKcr519e
 gsyQ==
X-Gm-Message-State: AC+VfDyUwKVWzlT4WzysWq61hA3V6u0sCHxBPNI5ht1/i4nMGIVCySlv
 zmRSt4mXn25pyGsdJImroLQ=
X-Google-Smtp-Source: ACHHUZ5EYjmX3Te3NRl5NRfUn4gvi77Sf9p4U7ex2tQl76NC2IloI4S7UAWui12wcDHsMggxAlCHCA==
X-Received: by 2002:adf:fcc1:0:b0:30a:e369:5acb with SMTP id
 f1-20020adffcc1000000b0030ae3695acbmr10329954wrs.68.1686734662140; 
 Wed, 14 Jun 2023 02:24:22 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a5d6dd1000000b003095bd71159sm17777371wrz.7.2023.06.14.02.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 02:24:21 -0700 (PDT)
Message-ID: <64898745.5d0a0220.546a.a6f1@mx.google.com>
X-Google-Original-Message-ID: <ZIki6HMOBlgvBURh@Ansuel-xps.>
Date: Wed, 14 Jun 2023 04:16:08 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
References: <20220723142933.16030-1-ansuelsmth@gmail.com>
 <20220723142933.16030-5-ansuelsmth@gmail.com>
 <DM4PR12MB508882D5BE351BD756A7A9A4D35AA@DM4PR12MB5088.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR12MB508882D5BE351BD756A7A9A4D35AA@DM4PR12MB5088.namprd12.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [net-next PATCH v5 4/5] net: ethernet: stmicro:
 stmmac: generate stmmac dma conf before open
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

On Wed, Jun 14, 2023 at 07:15:03AM +0000, Jose Abreu wrote:
> Hi Christian,
> 
> From: Christian Marangi <ansuelsmth@gmail.com>
> Date: Sat, Jul 23, 2022 at 15:29:32
> 
> > +static int __stmmac_open(struct net_device *dev,
> > +			 struct stmmac_dma_conf *dma_conf)
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> >  	int mode = priv->plat->phy_interface;
> > -	int bfsize = 0;
> >  	u32 chan;
> >  	int ret;
> >  
> > @@ -3657,45 +3794,10 @@ static int stmmac_open(struct net_device *dev)
> >  	memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
> >  	priv->xstats.threshold = tc;
> >  
> > -	bfsize = stmmac_set_16kib_bfsize(priv, dev->mtu);
> > -	if (bfsize < 0)
> > -		bfsize = 0;
> > -
> > -	if (bfsize < BUF_SIZE_16KiB)
> > -		bfsize = stmmac_set_bfsize(dev->mtu, priv->dma_conf.dma_buf_sz);
> > -
> > -	priv->dma_conf.dma_buf_sz = bfsize;
> > -	buf_sz = bfsize;
> > -
> >  	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
> >  
> > -	if (!priv->dma_conf.dma_tx_size)
> > -		priv->dma_conf.dma_tx_size = DMA_DEFAULT_TX_SIZE;
> > -	if (!priv->dma_conf.dma_rx_size)
> > -		priv->dma_conf.dma_rx_size = DMA_DEFAULT_RX_SIZE;
> > -
> > -	/* Earlier check for TBS */
> > -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
> > -		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
> > -		int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
> > -
> > -		/* Setup per-TXQ tbs flag before TX descriptor alloc */
> > -		tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
> > -	}
> > -
> > -	ret = alloc_dma_desc_resources(priv);
> > -	if (ret < 0) {
> > -		netdev_err(priv->dev, "%s: DMA descriptors allocation failed\n",
> > -			   __func__);
> > -		goto dma_desc_error;
> > -	}
> > -
> > -	ret = init_dma_desc_rings(dev, GFP_KERNEL);
> > -	if (ret < 0) {
> > -		netdev_err(priv->dev, "%s: DMA descriptors initialization failed\n",
> > -			   __func__);
> > -		goto init_error;
> > -	}
> > +	buf_sz = dma_conf->dma_buf_sz;
> > +	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
> 
> This memcpy() needs to be the first thing to be done on __stmmac_open(), otherwise
> you'll leak the dma_conf when stmmac_init_phy() fails.
>

I'm not following the meaning of leak here. If it's intended as a memory
leak then dma_conf is correctly freed in the 2 user of __stmmac_open.

stmmac_init_phy also doesn't seems to use dma_conf. Am I missing
something here?

> Can you please send follow-up patch?

Happy to push a follow-up patch with these concern cleared!

> 
> Thanks,
> Jose

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
