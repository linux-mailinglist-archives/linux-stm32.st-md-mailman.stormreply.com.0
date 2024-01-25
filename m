Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B183CBE6
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 20:07:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89731C6B477;
	Thu, 25 Jan 2024 19:07:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE33FC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 19:07:19 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2cf354613easo13908041fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 11:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706209639; x=1706814439;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TXr+6RTm2y0jFaSgxtjxgqNsWNZTUA5ivbr5rQKXoKM=;
 b=KYU3g1ELZa3zXgkIOdLUcX8eeBIJ/37Xom90xAAiAQxhwZUuEO+eN8Ndm1Yb1Ok69j
 iB86OKUoa5cNI8fTPwQOe9zdlaZgOY33mpkT+Ykc/fpC9g8HUpu0Dp1xgu61ago9YZ5d
 w+h0QxnnKiy3qxcpkZsjQA/D3bCA+8eHudgXLTnxrG9APme6m6QZQNv4z2zgDjolSlsy
 dUkGHt8YZ0CxAgrdjgn17+hF0kEIRuZeqckQcepmDD4bITerM/e253dCxM5I+/gdfqdF
 Buvuypy/3idXZCZTMPup0qIdEGLdc+NH/+DLvtHIcb5qDNs2jUVkEH7oN8jVsBQ6aQ/k
 o4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706209639; x=1706814439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXr+6RTm2y0jFaSgxtjxgqNsWNZTUA5ivbr5rQKXoKM=;
 b=Cy68/frVgsM6mxpr4rMft8O9ZtsNk/sY7yqM3dYLY1SsaDZGLXJe2ewir7u4shmumR
 Kv9zyvc47wbZEUTd4dMVPEH+uh1CHyN+sQ8Bu+SaBmmKVlcdphdJuo9PQIl8ROMdJmUS
 nVZtiKvabsZGarXL2Jrq6vGLJ52PBSmuB95REmQxD1r6tPubUukbSrkd+k+Ov+LPv/Se
 YGWGsv4YwwCpmfHuuYHYT8TAoQWDz8ssjiBKW6FE+2csEWC4XZSasdAuQt4s3d1DDm4g
 R8MxMpVj4aNyFzr2qZMk+gai8gmf384InA/1d8YkGMdcAv6QpwXPJ+iAfUCKp/xah2/c
 IGiQ==
X-Gm-Message-State: AOJu0YzSUzRdpj/cBrOPOfz71ar7EQJOP3dY3VnAXehg+qi+UjJK+//t
 hJMZ58ncZaeuSAhkCYEpxwsr9IEQnohYUo/rTbOFrzTDWsGKqo1z
X-Google-Smtp-Source: AGHT+IGRO7XLqxNPmXpytHm/jv8xSj2MEwW928f4bFwxrqq6A1bFNX0EYOUDQ4O2bEA5tfrTPBuSyg==
X-Received: by 2002:a2e:be1f:0:b0:2cd:a311:6aec with SMTP id
 z31-20020a2ebe1f000000b002cda3116aecmr115609ljq.21.1706209638688; 
 Thu, 25 Jan 2024 11:07:18 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a2ea30f000000b002cf1033e8bdsm363582lje.30.2024.01.25.11.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 11:07:18 -0800 (PST)
Date: Thu, 25 Jan 2024 22:07:15 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <czebrzszux2gdik3ey54tr3iewsxs4hjom432eb527jcpftnnr@ftiiwofakorj>
References: <20240123095006.979437-1-0x1207@gmail.com>
 <vsert76o6lxxc676tjiiikir577qobfonyo6sgo5eek6alzxlo@tb6hq5s2qcsp>
 <20240125105620.000040b7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125105620.000040b7@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix handling of
 DPP safety error for DMA channels
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

On Thu, Jan 25, 2024 at 10:56:20AM +0800, Furong Xu wrote:
> On Wed, 24 Jan 2024 17:36:10 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > On Tue, Jan 23, 2024 at 05:50:06PM +0800, Furong Xu wrote:
> > > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > > XGMAC core") checks and reports safety errors, but leaves the
> > > Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> > > a storm of interrupt.
> > > Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> > > 
> > > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 1 +
> > >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++++
> > >  2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > index 207ff1799f2c..188e11683136 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > @@ -385,6 +385,7 @@
> > >  #define XGMAC_DCEIE			BIT(1)
> > >  #define XGMAC_TCEIE			BIT(0)
> > >  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> > > +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
> > >  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
> > >  #define XGMAC_SPH			BIT(24)
> > >  #define XGMAC_PBLx8			BIT(16)
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > index eb48211d9b0e..874e85b499e2 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > @@ -745,6 +745,12 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> > >  
> > >  	dwxgmac3_log_error(ndev, value, correctable, "MAC",
> > >  			   dwxgmac3_mac_errors, STAT_OFF(mac_errors), stats);
> > > +
> > > +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > > +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > > +
> > > +	if (value)
> > > +		netdev_err(ndev, "Found DMA_DPP error, status: 0x%x\n", value);  
> > 
> > 1. Why not to implement this in the same way as the rest of the safety
> > errors handle code? (with the flags described by the
> > dwxgmac3_error_desc-based table and the respective counters being
> > incremented should the errors were detected)
> > 

> XGMAC_DMA_DPP_INT_STATUS is just a bitmap of DMA RX and TX channels,
> bottom 16 bits for 16 DMA TX channels and top 16 bits for 16 DMA RX channels.
> No other descriptions.
> 
> And the counters should be updated, I will send a new patch.

Ok. I'll wait for this patch v2 then with the counters fixed. Please
also note that you are adding the _DMA_ DPP events handling support.
Thus the more suitable place for this change would be
dwmac5_handle_dma_err().

> 
> > 2. I don't see this IRQ being enabled in the dwxgmac3_safety_feat_config()
> > method. How come the respective event has turned to be triggered
> > anyway?
> This error report is enabled by default, and cannot be disabled or marked(as Synopsys Databook says).
> What we can do is clearing it when it asserts.

This sounds so strange that I can barely believe in it. The DW QoS Eth
MTL DPP feature can be enabled/disabled, but the DW XGMAC DMA DPP
can't? This doesn't look logical. What's the point in having a never
maskable IRQ for not that much crucial but optional feature? Moreover
DPP adds some data flow overhead. If we are sure that no problem with
the device data paths, then it seems redundant to have it always
enabled. So I guess it must be switchable. Are you completely sure it
isn't?

-Serge(y)

> > 
> > -Serge(y) 
> > 
> > >  }
> > >  
> > >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> > > -- 
> > > 2.34.1
> > > 
> > >   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
