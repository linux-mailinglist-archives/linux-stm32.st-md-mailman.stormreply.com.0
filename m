Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C87F2C8E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 13:09:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1035FC6B442;
	Tue, 21 Nov 2023 12:09:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5633AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 12:09:11 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-66fa16092c0so18751536d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 04:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700568550; x=1701173350;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9hjcE5I/qbemATCrzh7EwNso+ZYNUcOPTjjYXKq0rc=;
 b=YRhF9j9M2RnKaa74iMLwRtS3CUJlZ+GAqCTSceJguHgbO3OxuWx/+sXw82HnWyB3a3
 CxZxS10HRUnbbUk81VvKQ03L4G5iGWMuFsWMNp0vs2CCc18C/fl7MGA7PkIGSOsXe8r4
 F2ZPdbmpRzgpg3BOp/117G0CHjj3q8E+vKWV17RbNejOPPAfctx22vjzQCh2nOmqONhY
 P0vsGGN9syQKaG27mMqaszDdp5Mp+36DWDxNP4JFpMXWMJu7K3pVn7bxamUUxGUvDYUx
 4ozG5mG8X8Wf87kYjk60DU79wx4rSpDbo4PnxAYJn7pwRTDmmd3tnHWS/BPS52F1zmj5
 mKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700568550; x=1701173350;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9hjcE5I/qbemATCrzh7EwNso+ZYNUcOPTjjYXKq0rc=;
 b=JNVV/V4NBnKOPyeSc0yg1oxRyqn5Llyq7hcb1NaIMxoaBfxoTv1ZvAkA11UTM7fm1I
 91kyaPCCOJmi/19it7U5bikS9N2esSlCpSdFHYcNzvd8dpV8FBbMVPYebbFKLY1+0qf9
 Sbzop8nRHXndGSOYt2eGteZ1ohEWCdl7ABq5K3wN2+R2JLb39wH6hGjiYg4TSsHu/SoT
 Z+1Patb78E3orDjgoEjXXY84sr1pVh9IVIjk89HAFEE6GsxO70d9zcbyQp+IYBGheIeA
 sS3/2nnmMb4gzQazm5aR2jOXexwwkWCsNgU4K/MuZ8MUFZHObthdUFqYifiR++ufsMyI
 RUKw==
X-Gm-Message-State: AOJu0YwbTG8+VT4nnzSUNowApXPAF0YjT6m/BIiZw5AWxH/4toE6fjmx
 U+Qa/FbWjU10kT0fbKFw+0U=
X-Google-Smtp-Source: AGHT+IGhflwHUv/VHR3LuQfIQAcMuxfJnSM6x6SZ2A+DFrs7ZiGbyq7kLhFDpWew6cxzHr9Kl2CRmA==
X-Received: by 2002:a05:6214:1241:b0:66d:a50a:2c6 with SMTP id
 r1-20020a056214124100b0066da50a02c6mr11233487qvv.63.1700568549868; 
 Tue, 21 Nov 2023 04:09:09 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 kh13-20020a056214514d00b00679df2f6d11sm1553149qvb.59.2023.11.21.04.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:09:09 -0800 (PST)
Date: Tue, 21 Nov 2023 15:09:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <aicr2gv4aqsgam4nc4wahacyakwn744xx52uojfkn7fjtd26pt@6lxmiizwkrqk>
References: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
 <xo4cbvc35zewabg4ite73trijy6fvbsaxsy6hag5qsr3dyharm@predjydxblsf>
 <ZVTU4TTFYSMLswTs@shell.armlinux.org.uk>
 <CY5PR12MB63727BAD92930CB04DE4DB52BFB1A@CY5PR12MB6372.namprd12.prod.outlook.com>
 <CY5PR12MB637235F27E5114CFB4DE1AD3BFBBA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB637235F27E5114CFB4DE1AD3BFBBA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Voon Weifeng <weifeng.voon@intel.com>, James Li <James.Li1@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix FPE events losing
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

On Tue, Nov 21, 2023 at 09:31:31AM +0000, Jianheng Zhang wrote:
> > From: Jianheng Zhang
> > Sent: Thursday, November 16, 2023 12:01 AM
> > To: Russell King <linux@armlinux.org.uk>; Serge Semin <fancer.lancer@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; David S.
> > Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> > <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> > <mcoquelin.stm32@gmail.com>; Tan Tee Min <tee.min.tan@intel.com>; Ong Boon Leong
> > <boon.leong.ong@intel.com>; Voon Weifeng <weifeng.voon@intel.com>; Mohammad Athari Bin Ismail
> > <mohammad.athari.ismail@intel.com>; netdev@vger.kernel.org;
> > linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH] net: stmmac: fix FPE events losing
> > 
> > 
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: Wednesday, November 15, 2023 10:26 PM
> > > To: Serge Semin <fancer.lancer@gmail.com>
> > > Cc: Jianheng Zhang <jianheng@synopsys.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>;
> > Jose
> > > Abreu <joabreu@synopsys.com>; David S. Miller <davem@davemloft.net>; Eric Dumazet
> > > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>;
> > > Maxime Coquelin <mcoquelin.stm32@gmail.com>; Tan Tee Min <tee.min.tan@intel.com>; Ong Boon
> > > Leong <boon.leong.ong@intel.com>; Voon Weifeng <weifeng.voon@intel.com>; Mohammad Athari
> > Bin
> > > Ismail <mohammad.athari.ismail@intel.com>; netdev@vger.kernel.org;
> > > linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH] net: stmmac: fix FPE events losing
> > >
> > > On Tue, Nov 14, 2023 at 02:59:57PM +0300, Serge Semin wrote:
> > > > On Tue, Nov 14, 2023 at 11:07:34AM +0000, Jianheng Zhang wrote:
> > > > > The 32-bit access of register MAC_FPE_CTRL_STS may clear the FPE status
> > > > > bits unexpectedly. Use 8-bit access for MAC_FPE_CTRL_STS control bits to
> > > > > avoid unexpected access of MAC_FPE_CTRL_STS status bits that can reduce
> > > > > the FPE handshake retries.
> > > > >
> > > > > The bit[19:17] of register MAC_FPE_CTRL_STS are status register bits.
> > > > > Those bits are clear on read (or write of 1 when RCWE bit in
> > > > > MAC_CSR_SW_Ctrl register is set). Using 32-bit access for
> > > > > MAC_FPE_CTRL_STS control bits makes side effects that clear the status
> > > > > bits. Then the stmmac interrupt handler missing FPE event status and
> > > > > leads to FPE handshake failure and retries.
> > > > >
> > > > > The bit[7:0] of register MAC_FPE_CTRL_STS are control bits or reserved
> > > > > that have no access side effects, so can use 8-bit access for
> > > > > MAC_FPE_CTRL_STS control bits.
> > > > >
> > > > > Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> > > > > Signed-off-by: jianheng <jianheng@synopsys.com>
> > > > > ---
> > > > >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 12 ++++++------
> > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > > index e95d35f..7333995 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > > > @@ -716,11 +716,11 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32
> > > num_rxq,
> > > > >  	u32 value;
> > > > >
> > > > >  	if (!enable) {
> > > >
> > > > > -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > > > +		value = readb(ioaddr + MAC_FPE_CTRL_STS);
> > > >
> > > > Note this may break the platforms which don't support non-32 MMIOs for
> > > > some devices. None of the currently supported glue-drivers explicitly
> > > > state they have such peculiarity, but at the same time the STMMAC-core
> > > > driver at the present state uses the dword IO ops only. For instance
> > > > the PCIe subsystem has the special accessors for such cases:
> > > > pci_generic_config_read32()
> > > > pci_generic_config_write32()
> > > > which at the very least are utilized on the Tegra and Loongson
> > > > platforms to access the host CSR spaces. These platforms are also
> > > > equipped with the DW MACs. The problem might be irrelevant for all the
> > > > currently supported DW MAC controllers implementations though, but
> > > > still it worth to draw an attention to the problem possibility and in
> > > > order to prevent it before ahead it would be better to just avoid
> > > > using the byte-/word- IOs if it's possible.
> > >
> > > Yes, this exists for configuration accesses, and is damn annoying
> > > because the read-modify-write of these can end up clearing PCI
> > > status register bits that are W1C.
> > >
> > > I've never heard of that problem with MMIO though.
> > >
> > > --
> > > RMK's Patch system:
> > >
> > https://urldefense.com/v3/__https://www.armlinux.org.uk/developer/patches/__;!!A4F2R9G_pg!ZnsQc
> > >
> > 7LKbdCiIj_nLBkt44MRSL8W8YD4WvMmPNkHFlDMrjrVqEVOVA1-P-9BVE3Oa5bC1ymKXLNV5C9mJ_rfFtLW
> > > Fg$
> > > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> > Thanks for all your mention about the potential risks of using readb and suggestions, I'll consider a new
> > solution and update the patch.
> > 
> > Best Regards,
> > Jianheng
> 
> Thanks for Andrew's suggestion. I consider the solution of set 
> MAC_CSR_SW_Ctrl.RCWE carefully and found that the MAC_CSR_SW_Ctrl.RCWE 
> is efficient for many other interrupt status registers, and some are used
> in current stmmac driver (LPI PMT MMC etc). Those registers work fine in
> clear on read mode with current code. So, I think there is no need to 
> set MAC_CSR_SW_Ctrl.RCWE that will make a large impact to current 
> interrupt handler.  
> 
> I try adding a new member variable(staged_fpe_state) to stmmac_fpe_cfg 
> that is used to stage the MAC_FPE_CTRL_STS value read in 
> dwmac5_fpe_send_mpacket(). And in dwmac5_fpe_irq_status(), use this staged
> value and current value of MAC_FPE_CTRL_STS to check FPE status. The 
> draft patch is below.

Are the status flags in the MAC_FPE_CTRL_STS register cleared on
_writes_? (I am asking because for some reason my DW QoS Eth v5.10a HW
manual has the status MAC_FPE_CTRL_STS flags marked as R/W, which is
weird access mode for the status flags.) If they turn to be _not_
changeable on writes, then what about just converting the
dwmac5_fpe_configure() and dwmac5_fpe_send_mpacket() methods to always
writing to the MAC_FPE_CTRL_STS register, and if required preserve the
shadow control MAC_FPE_CTRL_STS flags in the stmmac_fpe_cfg structure?
AFAICS the only flag which needs to be preserved is EFPE - "enable
FPE" flag.

Such implementation (if it's possible) shall be free from the _status_
flags race condition and won't require additional serializations. On
the contrary your suggestion AFAICS causes unresolved race condition
in here

> +	value = readl(ioaddr + MAC_FPE_CTRL_STS) | fpe_cfg->staged_fpe_state;
> +	fpe_cfg->staged_fpe_state = 0x0;

and here

>  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +	cfg->staged_fpe_state = value;

Depending on the IRQ handling and the task scheduling timing you may
end up with loosing the status flags anyway.

* Note I am not concerning here the MAC_FPE_CTRL_STS control flags
* race condition which AFAICS already exist in the current frame
* preemption code. See the configs performed in the open/close/suspend
* methods, in the link state change callbacks, in the worker task and
* in the FPE status IRQ handler. Control flag accesses don't look
* coherent there.

-Serge(y)

> 
> Best Regards,
> Jianheng
> 
> [PATCH v2] net: stmmac: fix FPE events losing
> 
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c      | 9 +++++++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
>  include/linux/stmmac.h                            | 1 +
>  5 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index e95d35f..8917fd0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> @@ -736,12 +736,15 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
>  
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  {
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +	struct stmmac_fpe_cfg *fpe_cfg = priv->plat->fpe_cfg;
>  	u32 value;
>  	int status;
>  
>  	status = FPE_EVENT_UNKNOWN;
>  
> -	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +	value = readl(ioaddr + MAC_FPE_CTRL_STS) | fpe_cfg->staged_fpe_state;
> +	fpe_cfg->staged_fpe_state = 0x0;
>  
>  	if (value & TRSP) {
>  		status |= FPE_EVENT_TRSP;
> @@ -766,11 +769,13 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
>  	return status;
>  }
>  
> -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, enum stmmac_mpacket_type type)
> +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			     enum stmmac_mpacket_type type)
>  {
>  	u32 value;
>  
>  	value = readl(ioaddr + MAC_FPE_CTRL_STS);
> +	cfg->staged_fpe_state = value;
>  
>  	if (type == MPACKET_VERIFY) {
>  		value &= ~SRSP;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> index 53c138d..022c1a2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> @@ -156,6 +156,7 @@ void dwmac5_est_irq_status(void __iomem *ioaddr, struct net_device *dev,
>  void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
>  			  bool enable);
>  void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
> +				 struct stmmac_fpe_cfg *cfg, 
>  			     enum stmmac_mpacket_type type);
>  int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index b95d3e1..5496781 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -415,6 +415,7 @@ struct stmmac_ops {
>  	void (*fpe_configure)(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
>  			      bool enable);
>  	void (*fpe_send_mpacket)(void __iomem *ioaddr,
> +				 struct stmmac_fpe_cfg *cfg,
>  				 enum stmmac_mpacket_type type);
>  	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
>  };
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3e50fd5..6a29f55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -964,7 +964,8 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  	bool *hs_enable = &fpe_cfg->hs_enable;
>  
>  	if (is_up && *hs_enable) {
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, MPACKET_VERIFY);
> +		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> +					MPACKET_VERIFY);
>  	} else {
>  		*lo_state = FPE_STATE_OFF;
>  		*lp_state = FPE_STATE_OFF;
> @@ -5838,6 +5839,7 @@ static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  		/* If user has requested FPE enable, quickly response */
>  		if (*hs_enable)
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						fpe_cfg,
>  						MPACKET_RESPONSE);
>  	}
>  
> @@ -7280,6 +7282,7 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
>  			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
>  				    *lo_state, *lp_state);
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						fpe_cfg,
>  						MPACKET_VERIFY);
>  		}
>  		/* Sleep then retry */
> @@ -7294,6 +7297,7 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>  	if (priv->plat->fpe_cfg->hs_enable != enable) {
>  		if (enable) {
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> +						priv->plat->fpe_cfg,
>  						MPACKET_VERIFY);
>  		} else {
>  			priv->plat->fpe_cfg->lo_fpe_state = FPE_STATE_OFF;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 0b4658a..1322c78 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -175,6 +175,7 @@ struct stmmac_fpe_cfg {
>  	bool hs_enable;				/* FPE handshake enable */
>  	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
>  	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
> +	u32 staged_fpe_state; /* Staged FPE state when read MAC_FPE_CTRL_STS */
>  };
>  
>  struct stmmac_safety_feature_cfg {
> -- 
> 1.8.3.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
