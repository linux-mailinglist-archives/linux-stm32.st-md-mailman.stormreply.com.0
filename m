Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E0F911872
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 04:26:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F902C7128D;
	Fri, 21 Jun 2024 02:26:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A4FDC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 02:26:41 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-706354409e1so1411264b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718936800; x=1719541600;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EOjQvHBNQ4HSObNyapAYwFrypjXAGViXwaERjXA6IA=;
 b=GF8YCYufkf4OR0y+2SyzCjT4yZth3UPFBtukNvDOdhrGJ5s75XyRo/EK7zJgCTHkzC
 gNLskwK6d2opUfbyYOAo5vmLHd0voRCUHLaqTeZ9OICCuUzLjOOcMyvQz43r9bWha+bQ
 OhyS6nZW0QlQqwziCMN2aJA1R1JqflHYfHPV/XZdlEDvMAUaCeB8a96pJYT6d++YDwVX
 Z9DEsea2PRzoIVYAnVZz1SYmXEnWBEhnJitn+zps4ivwLP1iJFwieb36w6QVlVLPR47d
 okIS5bXiB26F3M+wZQdiWGSzEqAl/B9jFOTaukSI7vI+bogiVXV69il5u31RIp7SHahS
 A6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718936800; x=1719541600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EOjQvHBNQ4HSObNyapAYwFrypjXAGViXwaERjXA6IA=;
 b=Xqcz0uHyfuZwdoGrpUpzv+iPF1HGCYHvnHdk3H+6GTN/AJAPRkg5O37nufidt2739L
 PgG7TQfLLkpj8oRGgIerp9x+hn13FE8shCrUiNSSr/4w2tkRQU/KTlAF7zk5mG7c/qpl
 o4uj78h3HTTMOLyur6Fd6nx3F7lbuCqHPXJFC+szYYlGcspC2xz7NBJ9ewO32Ldsfbkl
 R9yQ07APTlTmDtLWkE/WYPi4T9lXkEGIfMYfFuWm954MOk1fLllyShohMpyd2Pf1EonY
 EFojD1Teog/sAs1NklITTxNjdW031Sxk1CwjzFJmNaQFD25yamy9HdGfa3qGPkTcI4+V
 YVzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXteopCtmY0UvPlRX5OS1Ngg38yQcRL114p9F8i+jXT+X5Fb4laYKiOweu4A4LVhBLujDccsZsEKH66Jlw8IfyvLemLO1baXiuRYWwx0ZlUbDGRDljzsOLE
X-Gm-Message-State: AOJu0YyGcPweH+aJnymdovGgllWrYg34na1MUYGPBBwmD0JFW9prAx11
 nAKbrrEzM/uNP0bvPSgG0kXUUjw8AB/jtGPE7s8yDtDkWcIEYp1c
X-Google-Smtp-Source: AGHT+IEaTUQSQHEf8JO1QEEzvL12qgq6Mth9Alo5Y74gEn+JuuGA4loLO41+inOPhXbfBBplIF26gQ==
X-Received: by 2002:aa7:9d0b:0:b0:704:3251:1b67 with SMTP id
 d2e1a72fcca58-70629c1d46amr7588666b3a.2.1718936799570; 
 Thu, 20 Jun 2024 19:26:39 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7065130c204sm321525b3a.211.2024.06.20.19.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 19:26:39 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:26:27 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240621102627.000060d6@gmail.com>
In-Reply-To: <e3yzigcfbbkowias54nijvejc36hbcvfgjgbodycka3kfoqqek@46gktho2hwwt>
References: <20240620085200.583709-1-0x1207@gmail.com>
 <e3yzigcfbbkowias54nijvejc36hbcvfgjgbodycka3kfoqqek@46gktho2hwwt>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: xgmac: increase
 length limit of descriptor ring
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

On Thu, 20 Jun 2024 15:06:57 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> Hi Furong
> 
> On Thu, Jun 20, 2024 at 04:52:00PM +0800, Furong Xu wrote:
> > DWXGMAC CORE supports a ring length of 65536 descriptors, bump max length
> > from 1024 to 65536  
> 
> What XGMAC IP-core version are you talking about? The DW XGMAC
> IP-core databooks I have define the upper limit much lesser than that.
> 
Hi Serge

Thanks for this information.
I double checked 3.10a and 3.20a, 3.10a do have a limit to 16K,
and 3.20a bump the limit to 64K.
So we need to lower the limit to fit all XGMAC versions. And what about
your advice to set this limit?

> Do you understand that specifying 65K descriptors will cause a huge
> amount of memory consumed, right? Each descriptor is equipped with at
> least 1-page buffer. If QoS/XGMAC SPH is enabled then each descriptor
> is equipped with a second buffer. So 65K-descriptor will cause
> allocation of at least 65536 * (4 * 4) bytes + 65536 * PAGE_SIZE
> bytes. So it's ~256MB for the smallest possible 4K-pages. Not to
> mention that there can be more than one queue, two buffers assigned to
> each descriptor and more than a single page allocated for each buffer
> in case of jumbos. All of that will multiply the basic ~256MB memory
> consumption.
> 
Fully agree with you. This patch is trying to make it possible for ethtool
to set a longer descriptor length against XGMAC. All MAC cores still have
512 descriptors allocated by default for both TX and RX, which is defined
by DMA_DEFAULT_TX_SIZE and DMA_DEFAULT_RX_SIZE in
drivers/net/ethernet/stmicro/stmmac/common.h

This patch does not change the default descriptor length for XGMAC core,
but give ethtool a chance to set a bigger value than DMA_MAX_TX_SIZE and
DMA_MAX_RX_SIZE defined in drivers/net/ethernet/stmicro/stmmac/common.h

> Taking all of the above into account, what is the practical reason of
> having so many descriptors allocated? Are you afraid your CPU won't
> keep up with some heavy incoming traffic?
> 
Heavy incoming traffic on some heavy load system, the max 1024 limit defined
by DMA_MAX_RX_SIZE in drivers/net/ethernet/stmicro/stmmac/common.h is too
few to achieve high throughput for XGMAC.
With this patch, ethtool can set a new length than 1024

> Just a note about GMACs. The only GMAC having the ring-length limited
> is DW QoS Eth (v4.x/v5.x). It may have up to 1K descriptors in the
> ring. DW GMAC v3.73a doesn't have the descriptors array length constraint.
> The last descriptor is marked by a special flag TDESC0.21 and
> RDESC1.15, after meeting which the DMA-engine gets back to the first
> descriptor in the ring.
> 
> -Serge(y)
> 
> > 
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
> >  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 24 +++++++++++++++----
> >  2 files changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > index 6a2c7d22df1e..264f4f876c74 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -11,6 +11,8 @@
> >  
> >  /* Misc */
> >  #define XGMAC_JUMBO_LEN			16368
> > +#define XGMAC_DMA_MAX_TX_SIZE		65536
> > +#define XGMAC_DMA_MAX_RX_SIZE		65536
> >  
> >  /* MAC Registers */
> >  #define XGMAC_TX_CONFIG			0x00000000
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > index 18468c0228f0..3ae465c5a712 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -491,9 +491,16 @@ static void stmmac_get_ringparam(struct net_device *netdev,
> >  				 struct netlink_ext_ack *extack)
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(netdev);  
> 
> > +	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
> > +	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
> >  
> > -	ring->rx_max_pending = DMA_MAX_RX_SIZE;
> > -	ring->tx_max_pending = DMA_MAX_TX_SIZE;
> > +	if (priv->plat->has_xgmac) {
> > +		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
> > +		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
> > +	}
> > +
> > +	ring->rx_max_pending = dma_max_rx_size;
> > +	ring->tx_max_pending = dma_max_tx_size;  
> 
> Do you understand the consequence of this change, right?
> De
> 
> >  	ring->rx_pending = priv->dma_conf.dma_rx_size;
> >  	ring->tx_pending = priv->dma_conf.dma_tx_size;
> >  }
> > @@ -503,12 +510,21 @@ static int stmmac_set_ringparam(struct net_device *netdev,
> >  				struct kernel_ethtool_ringparam *kernel_ring,
> >  				struct netlink_ext_ack *extack)
> >  {
> > +	struct stmmac_priv *priv = netdev_priv(netdev);
> > +	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
> > +	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
> > +
> > +	if (priv->plat->has_xgmac) {
> > +		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
> > +		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
> > +	}
> > +
> >  	if (ring->rx_mini_pending || ring->rx_jumbo_pending ||
> >  	    ring->rx_pending < DMA_MIN_RX_SIZE ||
> > -	    ring->rx_pending > DMA_MAX_RX_SIZE ||
> > +	    ring->rx_pending > dma_max_rx_size ||
> >  	    !is_power_of_2(ring->rx_pending) ||
> >  	    ring->tx_pending < DMA_MIN_TX_SIZE ||
> > -	    ring->tx_pending > DMA_MAX_TX_SIZE ||
> > +	    ring->tx_pending > dma_max_tx_size ||
> >  	    !is_power_of_2(ring->tx_pending))
> >  		return -EINVAL;
> >  
> > -- 
> > 2.34.1
> > 
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
