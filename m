Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4C7FEFC0
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 14:09:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFA1C6B479;
	Thu, 30 Nov 2023 13:09:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C7E0C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 13:09:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50bc21821a1so1347797e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701349782; x=1701954582;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=da5ufd57tWXpSlzE4MME0kb6SHbAqME3sLaJIDhv8Ic=;
 b=eEp35WXqzl9FeuQUx2tQcQ3ja7FvpJzXd0DX1WWXSZ6Jlzfi+Jd3jJWHiWhYzOIB3w
 ewuCSlsyWTqJ7NqEfFu/DFVC47ZIfpGzt5/yW1nMGsQ9LX3g+C2ZVhRPeQB2MKOIMAuJ
 mWWhLQE5eFsPjcMRqs3AYqPikaGlu6rZVJy9jQmgWN/5oCsX/0IB0sn0vddVWCqMXhoB
 eh0egplQrvXsj5VCwW+J1YZrQFDnzYM3BkJQSuNDNGvjZpZh30MzPFD/OZCIX0+26Fm5
 RG4BK0QKqhfa227a/vusMTarF9XbzbiCrPTpYr+UT75PfVpr7lzDsE/uXKq7c0K3toxi
 g6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701349782; x=1701954582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=da5ufd57tWXpSlzE4MME0kb6SHbAqME3sLaJIDhv8Ic=;
 b=v1sH0HEr2d7p0DIXMAeNRh4mcL2Yd75JeGouQF75GD4fX4w3tKFBxqfGVv6V9gBj17
 e1sXMPlSSD2I4RAcyk9o6f7gep/f4Ev9aeOGsEKUbgGsSGdmD8GWjbO5t6i04QklnPIX
 UgxpHxDCz7puy0GthI0oARIhIg5JSvKQqixegjAbQoSwwWJDpKdXZQo4D/CIYw9Uxo8Q
 oeqlW1Fmtlv2xas0sZtZkW8KN29xY6e9LpJHTHHRAPPjSgO6bx7rKBH1M4QEdnayDD9T
 EBvy1PVh4z7RivFE6VgWBkvOBmQTfg2TqY0y6d1KCW8VJq+4WKuCXgqU8XlUJbX+p/b9
 uBlA==
X-Gm-Message-State: AOJu0YwkQywd8BjVOd+xbD742fA9KlMCc6vM+kFbPf3m8n/HUxiZVwvo
 5DtbuArbi4qtDJhFM03lLEU=
X-Google-Smtp-Source: AGHT+IHZZq+mpon//KVX/ODG35QK/HioZ5belNK2yEIWQkeaf4mxbX52keAl41xu2O210pOw2AjMwQ==
X-Received: by 2002:a05:6512:284:b0:50b:bf57:7d6 with SMTP id
 j4-20020a056512028400b0050bbf5707d6mr4813341lfp.6.1701349782003; 
 Thu, 30 Nov 2023 05:09:42 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a19e04f000000b0050bbd1feb5bsm165331lfj.199.2023.11.30.05.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 05:09:41 -0800 (PST)
Date: Thu, 30 Nov 2023 16:09:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <5djt72m664jtskz4i7vu63cqpb67o4qeu2roqb6322slsypwos@vmf4n2emdazd>
References: <CY5PR12MB6372BF02C49FC9E628D0EC02BFBCA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <1716792a3881338b1a416b1f4dd85a9437746ec2.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1716792a3881338b1a416b1f4dd85a9437746ec2.camel@redhat.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 James Li <James.Li1@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Russell King \(Oracle" <rmk+kernel@armlinux.org.uk>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix FPE events losing
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

Hi Paolo

On Thu, Nov 30, 2023 at 10:55:34AM +0100, Paolo Abeni wrote:
> On Tue, 2023-11-28 at 05:56 +0000, Jianheng Zhang wrote:
> > The status bits of register MAC_FPE_CTRL_STS are clear on read. Using
> > 32-bit read for MAC_FPE_CTRL_STS in dwmac5_fpe_configure() and
> > dwmac5_fpe_send_mpacket() clear the status bits. Then the stmmac interrupt
> > handler missing FPE event status and leads to FPE handshaking failure and
> > retries.
> > To avoid clear status bits of MAC_FPE_CTRL_STS in dwmac5_fpe_configure()
> > and dwmac5_fpe_send_mpacket(), add fpe_csr to stmmac_fpe_cfg structure to
> > cache the control bits of MAC_FPE_CTRL_STS and to avoid reading
> > MAC_FPE_CTRL_STS in those methods.
> > 
> > Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > Signed-off-by: Jianheng Zhang <jianheng@synopsys.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c       | 45 +++++++++-------------
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  4 +-
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  3 +-
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  1 +
> >  include/linux/stmmac.h                             |  1 +
> >  7 files changed, 36 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > index e95d35f..8fd1675 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > @@ -710,28 +710,22 @@ void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
> >  	}
> >  }
> >  
> > -void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> > +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> > +			  u32 num_txq, u32 num_rxq,
> >  			  bool enable)
> >  {
> >  	u32 value;
> >  
> > -	if (!enable) {
> > -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > -
> > -		value &= ~EFPE;
> > -
> > -		writel(value, ioaddr + MAC_FPE_CTRL_STS);
> > -		return;
> > +	if (enable) {
> > +		cfg->fpe_csr = EFPE;
> > +		value = readl(ioaddr + GMAC_RXQ_CTRL1);
> > +		value &= ~GMAC_RXQCTRL_FPRQ;
> > +		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> > +		writel(value, ioaddr + GMAC_RXQ_CTRL1);
> > +	} else {
> > +		cfg->fpe_csr = 0;
> >  	}
> > -
> > -	value = readl(ioaddr + GMAC_RXQ_CTRL1);
> > -	value &= ~GMAC_RXQCTRL_FPRQ;
> > -	value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> > -	writel(value, ioaddr + GMAC_RXQ_CTRL1);
> > -
> > -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > -	value |= EFPE;
> > -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> > +	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
> >  }
> >  
> >  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> > @@ -741,6 +735,9 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> >  
> >  	status = FPE_EVENT_UNKNOWN;
> >  
> > +	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
> > +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> > +	 */
> >  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> >  
> >  	if (value & TRSP) {
> > @@ -766,19 +763,15 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> >  	return status;
> >  }
> >  
> > -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type)
> > +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> > +			     enum stmmac_mpacket_type type)
> >  {
> > -	u32 value;
> > +	u32 value = cfg->fpe_csr;
> >  
> > -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > -
> > -	if (type == MPACKET_VERIFY) {
> > -		value &= ~SRSP;
> > +	if (type == MPACKET_VERIFY)
> >  		value |= SVER;
> > -	} else {
> > -		value &= ~SVER;
> > +	else if (type == MPACKET_RESPONSE)
> >  		value |= SRSP;
> > -	}
> >  
> >  	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> >  }
> 

> It's unclear to me why it's not necessary to preserve the SVER/SRSP
> bits across MAC_FPE_CTRL_STS writes. I guess they are not part of the
> status bits? perhaps an explicit comment somewhere will help?

The SRSP and SVER are self-cleared flags with no effect on zero
writing. Their responsibility is to emit the Respond and Verify
mPackets respectively. As soon as the packets are sent, the flags will
be reset by hardware automatically. So no, they aren't a part of the
status bits.

Note since 'value' now isn't read from the MAC_FPE_CTRL_STS register,
there is no point in clearing up these flags in the local variable
because 'value' has now them cleared by default.

Not sure whether a comment about that is required, since the described
behavior is well documented in the Synopsys HW-manual.

-Serge(y)

> 
> Thanks
> 
> Paolo
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
