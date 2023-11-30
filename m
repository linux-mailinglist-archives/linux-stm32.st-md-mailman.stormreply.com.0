Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078C7FF171
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 15:13:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2823FC6B479;
	Thu, 30 Nov 2023 14:13:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 369E4C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701353631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8WyLubWXYu38o5DREE8pV8GD1yZeJA1DhLLIyhZZDs=;
 b=WKiswxHpyA+s9uHeA8YbtnWhOx93CzYsaRPkvQKQ8HyjMx5faC+S53H5xdfVVgo/YWF8tG
 I4f5/cUCUL19t/v3Hc9i3BPWiF8bKDaw1an3F6TQvVR/ju2zRNc3FQufqJc76qPrWlc2gT
 PZUWkgJdCG4wyW+WJCqa7YgtuDO1Ph0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-yNaMM-AeMzS4USTBX8Z-Hw-1; Thu, 30 Nov 2023 09:13:49 -0500
X-MC-Unique: yNaMM-AeMzS4USTBX8Z-Hw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a13e43f47b0so13195466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 06:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353628; x=1701958428;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+PQtdjjvyLcduv0PEtDZLVtj4NN0MkNsPP5YsdIq81g=;
 b=n5yib5829UU0C/vOxSwS7o4b9zGS8los7MMVzAtBokVlQzV42uBFDJ7GqQPd80fVys
 HyTwxfWD36EiTC5o+nucnZtG4u+N3/Gds6YkZAgox+1tgUcMfZGrghvgNkxk0weMw3sL
 6gOQa+aMuNfHGs2GJXkCOPhuiQJQQNENSe+hWzAmixn3wHjgrkkvAZ26hs47hqRqa6gB
 oESXsrzNy2O3cK4zmFZNR3SPgynbJP+XbOolhBtW+ep48O0R9vutiPDPqWWbposEN1AG
 Qf6QVAwA3iaHGZplCwilhySpKTbZlZv+Vum7joV4rrZ/sjc/BpYJheGJLzYQkgsJ5lh8
 B5ag==
X-Gm-Message-State: AOJu0YyQEMNTg3PXgAk8zG3WDEPXwARbjAIq0agFjAKEhJ+smZagemsl
 lSN8ubUpUBvRBKZYiEhAXrhn3dQF7v444UT+bcT8U0NZi2XJtoV0lt2OGLKMyz4ujijBMPAEJxd
 fsjHbblgm61BzhyPpsHBgOajxcjkcRf8ET43dREuO
X-Received: by 2002:a17:906:3a50:b0:9e6:c282:5bd5 with SMTP id
 a16-20020a1709063a5000b009e6c2825bd5mr13695281ejf.3.1701353628666; 
 Thu, 30 Nov 2023 06:13:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+1W+Wun7VROUBW2eagR+Spq3ZRe+h6X4L4Px5xpmgPHCCC3D1b0DrYSWcS/G0SNY7Brk0Sw==
X-Received: by 2002:a17:906:3a50:b0:9e6:c282:5bd5 with SMTP id
 a16-20020a1709063a5000b009e6c2825bd5mr13695252ejf.3.1701353628188; 
 Thu, 30 Nov 2023 06:13:48 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-254-32.dyn.eolo.it.
 [146.241.254.32]) by smtp.gmail.com with ESMTPSA id
 ox11-20020a170907100b00b009920a690cd9sm718454ejb.59.2023.11.30.06.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:13:47 -0800 (PST)
Message-ID: <1a47789d8b56370989f469aa5508738eabb1f798.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Date: Thu, 30 Nov 2023 15:13:45 +0100
In-Reply-To: <081b3aab0c9350a42fdb69149b563c7aef4af0d5.camel@redhat.com>
References: <CY5PR12MB6372BF02C49FC9E628D0EC02BFBCA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <1716792a3881338b1a416b1f4dd85a9437746ec2.camel@redhat.com>
 <5djt72m664jtskz4i7vu63cqpb67o4qeu2roqb6322slsypwos@vmf4n2emdazd>
 <081b3aab0c9350a42fdb69149b563c7aef4af0d5.camel@redhat.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 James Li <James.Li1@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
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

On Thu, 2023-11-30 at 15:09 +0100, Paolo Abeni wrote:
> On Thu, 2023-11-30 at 16:09 +0300, Serge Semin wrote:
> > Hi Paolo
> > 
> > On Thu, Nov 30, 2023 at 10:55:34AM +0100, Paolo Abeni wrote:
> > > On Tue, 2023-11-28 at 05:56 +0000, Jianheng Zhang wrote:
> > > > The status bits of register MAC_FPE_CTRL_STS are clear on read. Using
> > > > 32-bit read for MAC_FPE_CTRL_STS in dwmac5_fpe_configure() and
> > > > dwmac5_fpe_send_mpacket() clear the status bits. Then the stmmac interrupt
> > > > handler missing FPE event status and leads to FPE handshaking failure and
> > > > retries.
> > > > To avoid clear status bits of MAC_FPE_CTRL_STS in dwmac5_fpe_configure()
> > > > and dwmac5_fpe_send_mpacket(), add fpe_csr to stmmac_fpe_cfg structure to
> > > > cache the control bits of MAC_FPE_CTRL_STS and to avoid reading
> > > > MAC_FPE_CTRL_STS in those methods.
> > > > 
> > > > Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> > > > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > > > Signed-off-by: Jianheng Zhang <jianheng@synopsys.com>
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c       | 45 +++++++++-------------
> > > >  drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  4 +-
> > > >  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  3 +-
> > > >  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++-
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  1 +
> > > >  include/linux/stmmac.h                             |  1 +
> > > >  7 files changed, 36 insertions(+), 30 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > index e95d35f..8fd1675 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > @@ -710,28 +710,22 @@ void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
> > > >  	}
> > > >  }
> > > >  
> > > > -void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> > > > +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> > > > +			  u32 num_txq, u32 num_rxq,
> > > >  			  bool enable)
> > > >  {
> > > >  	u32 value;
> > > >  
> > > > -	if (!enable) {
> > > > -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > > -
> > > > -		value &= ~EFPE;
> > > > -
> > > > -		writel(value, ioaddr + MAC_FPE_CTRL_STS);
> > > > -		return;
> > > > +	if (enable) {
> > > > +		cfg->fpe_csr = EFPE;
> > > > +		value = readl(ioaddr + GMAC_RXQ_CTRL1);
> > > > +		value &= ~GMAC_RXQCTRL_FPRQ;
> > > > +		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> > > > +		writel(value, ioaddr + GMAC_RXQ_CTRL1);
> > > > +	} else {
> > > > +		cfg->fpe_csr = 0;
> > > >  	}
> > > > -
> > > > -	value = readl(ioaddr + GMAC_RXQ_CTRL1);
> > > > -	value &= ~GMAC_RXQCTRL_FPRQ;
> > > > -	value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> > > > -	writel(value, ioaddr + GMAC_RXQ_CTRL1);
> > > > -
> > > > -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > > -	value |= EFPE;
> > > > -	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> > > > +	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
> > > >  }
> > > >  
> > > >  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> > > > @@ -741,6 +735,9 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> > > >  
> > > >  	status = FPE_EVENT_UNKNOWN;
> > > >  
> > > > +	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
> > > > +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> > > > +	 */
> > > >  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > >  
> > > >  	if (value & TRSP) {
> > > > @@ -766,19 +763,15 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> > > >  	return status;
> > > >  }
> > > >  
> > > > -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type)
> > > > +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> > > > +			     enum stmmac_mpacket_type type)
> > > >  {
> > > > -	u32 value;
> > > > +	u32 value = cfg->fpe_csr;
> > > >  
> > > > -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > > -
> > > > -	if (type == MPACKET_VERIFY) {
> > > > -		value &= ~SRSP;
> > > > +	if (type == MPACKET_VERIFY)
> > > >  		value |= SVER;
> > > > -	} else {
> > > > -		value &= ~SVER;
> > > > +	else if (type == MPACKET_RESPONSE)
> > > >  		value |= SRSP;
> > > > -	}
> > > >  
> > > >  	writel(value, ioaddr + MAC_FPE_CTRL_STS);
> > > >  }
> > > 
> > 
> > > It's unclear to me why it's not necessary to preserve the SVER/SRSP
> > > bits across MAC_FPE_CTRL_STS writes. I guess they are not part of the
> > > status bits? perhaps an explicit comment somewhere will help?
> > 
> > The SRSP and SVER are self-cleared flags with no effect on zero
> > writing. Their responsibility is to emit the Respond and Verify
> > mPackets respectively. As soon as the packets are sent, the flags will
> > be reset by hardware automatically. So no, they aren't a part of the
> > status bits.
> > 
> > Note since 'value' now isn't read from the MAC_FPE_CTRL_STS register,
> > there is no point in clearing up these flags in the local variable
> > because 'value' has now them cleared by default.
> > 
> > Not sure whether a comment about that is required, since the described
> > behavior is well documented in the Synopsys HW-manual.
> 
> Thanks for the explanation, it clarifies the things to me. I agree
> there is no need for a patch change.

I'm sorry, I have to take back the last sentence: the submitter and SoB
email address still don't match. @Jianheng: please fix it for good at
the next iteration.

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
