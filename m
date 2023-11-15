Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BC7EC519
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 15:25:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81327C6B47E;
	Wed, 15 Nov 2023 14:25:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 869A8C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9vAuO/jfgQB1UhChgmKpQEPKWuu2SwX00yO6kwgCd+o=; b=R4lvU8aoiGhmjKhmijiJcU0iOy
 cAFpoOGF6geENuGKG0YERvll8BorOKMgpETeDfOenRJ/baC0yUb/LPQ0bzEvibDeTEx8pg+UqzJZX
 DiXzYAyu6xh2RAcZXaVmLLSkf6ebbkDE7vk0n7xZsoLaCoCOF0NfWiYw7vHbCRCpaFkYy7OQpB8c5
 dWL+bu3jjtB+rceCR1XlxEtTlIdNgmzKQDYzsPgxInn4wZHAlnohohCygd0SX3BRLblu85XHopmUc
 a4Lx7XLISx0Zxo2gBolM+cmym5uUH1Xzw+aDc+vdTdYCQ3oWa1BaofAM5/ulIgY9uU2e1ToyOux04
 nclip+Sw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50016)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1r3Gpl-0000md-0s;
 Wed, 15 Nov 2023 14:25:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1r3Gpl-0006ec-5X; Wed, 15 Nov 2023 14:25:37 +0000
Date: Wed, 15 Nov 2023 14:25:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZVTU4TTFYSMLswTs@shell.armlinux.org.uk>
References: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
 <xo4cbvc35zewabg4ite73trijy6fvbsaxsy6hag5qsr3dyharm@predjydxblsf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xo4cbvc35zewabg4ite73trijy6fvbsaxsy6hag5qsr3dyharm@predjydxblsf>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Voon Weifeng <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
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

On Tue, Nov 14, 2023 at 02:59:57PM +0300, Serge Semin wrote:
> On Tue, Nov 14, 2023 at 11:07:34AM +0000, Jianheng Zhang wrote:
> > The 32-bit access of register MAC_FPE_CTRL_STS may clear the FPE status
> > bits unexpectedly. Use 8-bit access for MAC_FPE_CTRL_STS control bits to
> > avoid unexpected access of MAC_FPE_CTRL_STS status bits that can reduce
> > the FPE handshake retries.
> > 
> > The bit[19:17] of register MAC_FPE_CTRL_STS are status register bits.
> > Those bits are clear on read (or write of 1 when RCWE bit in
> > MAC_CSR_SW_Ctrl register is set). Using 32-bit access for
> > MAC_FPE_CTRL_STS control bits makes side effects that clear the status
> > bits. Then the stmmac interrupt handler missing FPE event status and
> > leads to FPE handshake failure and retries.
> > 
> > The bit[7:0] of register MAC_FPE_CTRL_STS are control bits or reserved
> > that have no access side effects, so can use 8-bit access for
> > MAC_FPE_CTRL_STS control bits.
> > 
> > Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> > Signed-off-by: jianheng <jianheng@synopsys.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > index e95d35f..7333995 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > @@ -716,11 +716,11 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> >  	u32 value;
> >  
> >  	if (!enable) {
> 
> > -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > +		value = readb(ioaddr + MAC_FPE_CTRL_STS);
> 
> Note this may break the platforms which don't support non-32 MMIOs for
> some devices. None of the currently supported glue-drivers explicitly
> state they have such peculiarity, but at the same time the STMMAC-core
> driver at the present state uses the dword IO ops only. For instance
> the PCIe subsystem has the special accessors for such cases:
> pci_generic_config_read32()
> pci_generic_config_write32()
> which at the very least are utilized on the Tegra and Loongson
> platforms to access the host CSR spaces. These platforms are also
> equipped with the DW MACs. The problem might be irrelevant for all the
> currently supported DW MAC controllers implementations though, but
> still it worth to draw an attention to the problem possibility and in
> order to prevent it before ahead it would be better to just avoid
> using the byte-/word- IOs if it's possible.

Yes, this exists for configuration accesses, and is damn annoying
because the read-modify-write of these can end up clearing PCI
status register bits that are W1C.

I've never heard of that problem with MMIO though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
