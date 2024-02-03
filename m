Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2405D8483E7
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 06:12:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA948C6DD98;
	Sat,  3 Feb 2024 05:12:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67313C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 05:12:04 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5ceb3fe708eso2199955a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706937123; x=1707541923;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTV9gbg5MKn5RvztaG5+AnGINY2wWIUBOjQj4JgbKAs=;
 b=U0AH6ABrjTFpUpAqk1HChWZ86Jp8j0ZQeC3aZbLW0+iMKhalS8LjcqaYw4J2aCvrmr
 wYGUjvboX6nb3VUPc4YZYvDcxTHl6sSZsfa1LiHiL3MudleIRQPUgz1JQc1mJ5cyuMnq
 32D9XIMxsBkEz8HD4Lwf9U0S+XfTMC5aUfZdpEIZfQuk5KVLNfmgr6M8r1s/3T3nqZau
 kHeK5RsfIAKa08KPo+Ph4o8tpnRxY7h69qkdiJVvcWLijooFTXd57yMTqSk1e0ftxWbP
 vvDTxmjvSeArz+btAqYGRUejt80BkMm5nG9Ts4BCyQMPClbYZr8Gg7MJIvR4e6a/a+3F
 P+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706937123; x=1707541923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTV9gbg5MKn5RvztaG5+AnGINY2wWIUBOjQj4JgbKAs=;
 b=iJxX/T2lzXwFszdfThiK/2zwCcvjqmDEwPc/S0+USPW8b7p7th4Nva6fJQoAo5X6bp
 ISEihwLMe3f5SA5P9p7x/j9nPrvyhJnH1Kap+m91JdAcKrGSxwyoiycOl4XkN2StlVWj
 oBJvo8tk1SSzFwMVn8lZWuIztKlJw/7nyRutruV59otP7TWrh0FaqEpiH65wJ31hvgy0
 +2brolvRODK50dsvLTiiUZu8stDt2KQXxf8hftlL59s0bGpi6mdKAqkL0xUVHmsQ/zZc
 RpdWpQ6mF1kFeSk4CLeUJr1MSzcRVdgVXn4Mw7RjvxQ7qrYttX751MP27PulxJK4ub97
 8ELw==
X-Gm-Message-State: AOJu0Yzta7SDm/wpTsTXEC90fyoNFNw+znGgO8xWQzTvqUvNLsCy91Xq
 8elr7bK63xto280qhl7Zfx7WPMfQWwd0A2nT2FIrJlBvTg0v2P5f
X-Google-Smtp-Source: AGHT+IH5+XC1/bcCppA4nFR7X2sj4P5Iy8Z0U/6nYySgkYLySzaYVQAPqHXoiQs4dnlg7lwlTMkbNg==
X-Received: by 2002:a17:902:e807:b0:1d7:6d49:c78a with SMTP id
 u7-20020a170902e80700b001d76d49c78amr12547440plg.58.1706937122766; 
 Fri, 02 Feb 2024 21:12:02 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWTyx3Tb8ALnQnDfkcnBxx8lNHZQcdL5+5L97dSuORYHMNih1eREndOh7Pbm6/YwPLM88BBKE9zNrrHPVzc8uE8xdsFTmlNcIYSzf0TMQOBqR58x7INtYGp40T/2w6rLMdgID9zXSs+HgyFXrAwY5mIAM3zkGUjMc4SP628zNW4lYfPyBfdtUzca2SucvOVDt7+vBl8byGjlCYRl/38z5A18EunmLR9P02VqiX5LAllCDpHBSRzakp7wjFtoElTTTGFaNM/3aGHQ2d1Kj2u+mrwljYHMv+/5OogqJL7RI5Zhhdu3WhsUgQheyANoMP8QmJ0NONTRoN8YGf38Ru37AuW7T9v+tpdz34Iy2XMjQBk03e+daiCljZIE518h7t2Pjbn1FgrD8B2mG8g0egOMTTf0MqLaqFAV6vzpqTE5VknZxRc7uPWKlgI3F0i0Rw3w2e2TIl4lCu7hXzjir33FaEWl9Zj1odnltrn/UBmgE6nb5l+SiHGWn8VzqrS7uouGlLsx2TuLA==
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170903411400b001d6ee9d8957sm2437664pld.281.2024.02.02.21.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 21:12:02 -0800 (PST)
Date: Sat, 3 Feb 2024 13:11:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240203131154.00005898@gmail.com>
In-Reply-To: <ksfs7uag4yukqbeygch7pxvr5axyrqz4gunq2xes3ppmtrgm5b@hwh5yx5qz3wl>
References: <20240131020828.2007741-1-0x1207@gmail.com>
 <ksfs7uag4yukqbeygch7pxvr5axyrqz4gunq2xes3ppmtrgm5b@hwh5yx5qz3wl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: fix handling
 of DPP safety error for DMA channels
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

On Sat, 3 Feb 2024 00:58:39 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Wed, Jan 31, 2024 at 10:08:28AM +0800, Furong Xu wrote:
> > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > XGMAC core") checks and reports safety errors, but leaves the
> > Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> > a storm of interrupt.
> > Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> > 
> > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> > Changes in v3:
> >  - code style fix, thanks Paolo Abeni
> > 
> > Changes in v2:
> >   - explicit enable Data Path Parity Protection
> >   - add new counters to stmmac_safety_stats
> >   - add detailed log
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 57 ++++++++++++++++++-
> >  3 files changed, 60 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> > index 721c1f8e892f..b4f60ab078d6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> > @@ -216,6 +216,7 @@ struct stmmac_safety_stats {
> >  	unsigned long mac_errors[32];
> >  	unsigned long mtl_errors[32];
> >  	unsigned long dma_errors[32];
> > +	unsigned long dma_dpp_errors[32];
> >  };
> >  
> >  /* Number of fields in Safety Stats */
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > index 207ff1799f2c..5c67a3f89f08 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -303,6 +303,8 @@
> >  #define XGMAC_RXCEIE			BIT(4)
> >  #define XGMAC_TXCEIE			BIT(0)
> >  #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
> > +#define XGMAC_MTL_DPP_CONTROL		0x000010e0  
> 
> > +#define XGMAC_DDPP_DISABLE		BIT(0)  
> 
> Is the double "D" a typo? Shouldn't this be XGMAC_DPP_DISABLE or just
> XGMAC_DDPP (if the "DDPP" means "Disable DPP")?
> 
> If so, David/Jakub, is it possible to rebase the branch with the macro
> fixed in the commit or a new cleanup patch is the only option?
> 
> Other than the nit above no more notes from my side:
> 
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> -Serge(y)
> 

Hi Serge:

Sorry for my mistake.

DDPP is copied from Synopsys Data book: Disable Data path Parity Protection.
When it is 0x0, Data path Parity Protection is enabled.
When it is 0x1, Data path Parity Protection is disabled.

I will send a new patch.

> >  #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
> >  #define XGMAC_TQS			GENMASK(25, 16)
> >  #define XGMAC_TQS_SHIFT			16
> > @@ -385,6 +387,7 @@
> >  #define XGMAC_DCEIE			BIT(1)
> >  #define XGMAC_TCEIE			BIT(0)
> >  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> > +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
> >  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
> >  #define XGMAC_SPH			BIT(24)
> >  #define XGMAC_PBLx8			BIT(16)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index eb48211d9b0e..04d7c4dc2e35 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -830,6 +830,43 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
> >  };
> >  
> > +static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
> > +static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
> > +static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
> > +	{ true, "TDPES0", dpp_tx_err },
> > +	{ true, "TDPES1", dpp_tx_err },
> > +	{ true, "TDPES2", dpp_tx_err },
> > +	{ true, "TDPES3", dpp_tx_err },
> > +	{ true, "TDPES4", dpp_tx_err },
> > +	{ true, "TDPES5", dpp_tx_err },
> > +	{ true, "TDPES6", dpp_tx_err },
> > +	{ true, "TDPES7", dpp_tx_err },
> > +	{ true, "TDPES8", dpp_tx_err },
> > +	{ true, "TDPES9", dpp_tx_err },
> > +	{ true, "TDPES10", dpp_tx_err },
> > +	{ true, "TDPES11", dpp_tx_err },
> > +	{ true, "TDPES12", dpp_tx_err },
> > +	{ true, "TDPES13", dpp_tx_err },
> > +	{ true, "TDPES14", dpp_tx_err },
> > +	{ true, "TDPES15", dpp_tx_err },
> > +	{ true, "RDPES0", dpp_rx_err },
> > +	{ true, "RDPES1", dpp_rx_err },
> > +	{ true, "RDPES2", dpp_rx_err },
> > +	{ true, "RDPES3", dpp_rx_err },
> > +	{ true, "RDPES4", dpp_rx_err },
> > +	{ true, "RDPES5", dpp_rx_err },
> > +	{ true, "RDPES6", dpp_rx_err },
> > +	{ true, "RDPES7", dpp_rx_err },
> > +	{ true, "RDPES8", dpp_rx_err },
> > +	{ true, "RDPES9", dpp_rx_err },
> > +	{ true, "RDPES10", dpp_rx_err },
> > +	{ true, "RDPES11", dpp_rx_err },
> > +	{ true, "RDPES12", dpp_rx_err },
> > +	{ true, "RDPES13", dpp_rx_err },
> > +	{ true, "RDPES14", dpp_rx_err },
> > +	{ true, "RDPES15", dpp_rx_err },
> > +};
> > +
> >  static void dwxgmac3_handle_dma_err(struct net_device *ndev,
> >  				    void __iomem *ioaddr, bool correctable,
> >  				    struct stmmac_safety_stats *stats)
> > @@ -841,6 +878,13 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
> >  
> >  	dwxgmac3_log_error(ndev, value, correctable, "DMA",
> >  			   dwxgmac3_dma_errors, STAT_OFF(dma_errors), stats);
> > +
> > +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > +
> > +	dwxgmac3_log_error(ndev, value, false, "DMA_DPP",
> > +			   dwxgmac3_dma_dpp_errors,
> > +			   STAT_OFF(dma_dpp_errors), stats);
> >  }
> >  
> >  static int
> > @@ -881,6 +925,12 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> >  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
> >  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
> >  
> > +	/* 5. Enable Data Path Parity Protection */
> > +	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
> > +	/* already enabled by default, explicit enable it again */
> > +	value &= ~XGMAC_DDPP_DISABLE;
> > +	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -914,7 +964,11 @@ static int dwxgmac3_safety_feat_irq_status(struct net_device *ndev,
> >  		ret |= !corr;
> >  	}
> >  
> > -	err = dma & (XGMAC_DEUIS | XGMAC_DECIS);
> > +	/* DMA_DPP_Interrupt_Status is indicated by MCSIS bit in
> > +	 * DMA_Safety_Interrupt_Status, so we handle DMA Data Path
> > +	 * Parity Errors here
> > +	 */
> > +	err = dma & (XGMAC_DEUIS | XGMAC_DECIS | XGMAC_MCSIS);
> >  	corr = dma & XGMAC_DECIS;
> >  	if (err) {
> >  		dwxgmac3_handle_dma_err(ndev, ioaddr, corr, stats);
> > @@ -930,6 +984,7 @@ static const struct dwxgmac3_error {
> >  	{ dwxgmac3_mac_errors },
> >  	{ dwxgmac3_mtl_errors },
> >  	{ dwxgmac3_dma_errors },
> > +	{ dwxgmac3_dma_dpp_errors },
> >  };
> >  
> >  static int dwxgmac3_safety_feat_dump(struct stmmac_safety_stats *stats,
> > -- 
> > 2.34.1
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
