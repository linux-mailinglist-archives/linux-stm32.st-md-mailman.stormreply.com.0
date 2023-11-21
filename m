Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C97F2D1E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 13:27:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AB99C6B46B;
	Tue, 21 Nov 2023 12:27:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E1DFC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 12:27:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-507975d34e8so7720075e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 04:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700569668; x=1701174468;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GOcAOBX2xiKh29AKg54qGZlhZDJq8h/h+dA5La5VZhs=;
 b=R2TJ7VLkNe/k9Wt9ZIlTpUc4XXbFtgGOR5GUPqy5ZOEirUP5b5sP/gnZGUh4Blg5M1
 kjK+oPbufKktmRZeWGHKMuvxHcNEF7ljh6jh/44An8Ro6V8J2w6iG89QSC/n2k5rNosW
 Avopa/u/y8oKFZL4NL2ghHLddjLE+B47RTq/yCJfl81Zkyz6EMTRl21l9qMWkTx70vOA
 DXg4xqLBeAT3/dKA/G/kRnwMB5tZYedLpzMyrk0rINmbPjsGx4tJ+HwqXgAAblLrMo63
 lUiuzTOdEHzIIZjhQJSLd1Trc+26nplUjV7mOnO0xFMo5W3rPEoMFfAtIOZOe6K8bRsQ
 LgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700569668; x=1701174468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOcAOBX2xiKh29AKg54qGZlhZDJq8h/h+dA5La5VZhs=;
 b=mRY4NMy3752oAKaHNQqPACOE5gpPdvrbLCEBKutqh+Ekn5aXDYM+N0b0uJnrNodVSB
 nL+NDmRHeeVkf/1LjMxIqSZjDT2Q5F1CRfkocye7132PQAFq+Xeh0nzRFv1prd0O1L8e
 +2wYlLWGenXJub0e8ThZ7fQvK/EnZ9upysI2l3SnuXuZ1Y53L/qO3crrwquDli74wWjN
 rNKPt0rdDTC6X+yWUcoU03grd/yDRdyFkhn5cE5Bw92u6ygntD/aUMqyXrTCatPt/a7/
 XTRl/ik+H2R+CjptvW45NxI/0ftSlBdhrMn8byKK1nZoH67oy+vMGyWaOv1R+oCYn7Ec
 PcQw==
X-Gm-Message-State: AOJu0YwyeRxh3WqRcNUbsyDMrgwPvA5Vu3tOzDYFB8zL3wJzoQmrDiA+
 5FNq8lf91MOtGpq4QshRVrg=
X-Google-Smtp-Source: AGHT+IGghZAk29coi15eVyquX/1EvGd6TGCrazur79yUOTEDV8cYJkDsvdQsN9n2vQuk8yRsGn9KEw==
X-Received: by 2002:a05:6512:31c9:b0:50a:a97d:f13d with SMTP id
 j9-20020a05651231c900b0050aa97df13dmr8326258lfe.65.1700569667873; 
 Tue, 21 Nov 2023 04:27:47 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac24146000000b005042ae2baf8sm1489692lfi.258.2023.11.21.04.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:27:47 -0800 (PST)
Date: Tue, 21 Nov 2023 15:27:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <er4vp42libh5kqo45puunsiejmkuy2cr42l2oggdgv2u6fluj5@wiedy3cr6ssg>
References: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
 <xo4cbvc35zewabg4ite73trijy6fvbsaxsy6hag5qsr3dyharm@predjydxblsf>
 <ZVTU4TTFYSMLswTs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVTU4TTFYSMLswTs@shell.armlinux.org.uk>
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

On Wed, Nov 15, 2023 at 02:25:37PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 14, 2023 at 02:59:57PM +0300, Serge Semin wrote:
> > On Tue, Nov 14, 2023 at 11:07:34AM +0000, Jianheng Zhang wrote:
> > > The 32-bit access of register MAC_FPE_CTRL_STS may clear the FPE status
> > > bits unexpectedly. Use 8-bit access for MAC_FPE_CTRL_STS control bits to
> > > avoid unexpected access of MAC_FPE_CTRL_STS status bits that can reduce
> > > the FPE handshake retries.
> > > 
> > > The bit[19:17] of register MAC_FPE_CTRL_STS are status register bits.
> > > Those bits are clear on read (or write of 1 when RCWE bit in
> > > MAC_CSR_SW_Ctrl register is set). Using 32-bit access for
> > > MAC_FPE_CTRL_STS control bits makes side effects that clear the status
> > > bits. Then the stmmac interrupt handler missing FPE event status and
> > > leads to FPE handshake failure and retries.
> > > 
> > > The bit[7:0] of register MAC_FPE_CTRL_STS are control bits or reserved
> > > that have no access side effects, so can use 8-bit access for
> > > MAC_FPE_CTRL_STS control bits.
> > > 
> > > Fixes: 5a5586112b92 ("net: stmmac: support FPE link partner hand-shaking procedure")
> > > Signed-off-by: jianheng <jianheng@synopsys.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > index e95d35f..7333995 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > > @@ -716,11 +716,11 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
> > >  	u32 value;
> > >  
> > >  	if (!enable) {
> > 
> > > -		value = readl(ioaddr + MAC_FPE_CTRL_STS);
> > > +		value = readb(ioaddr + MAC_FPE_CTRL_STS);
> > 
> > Note this may break the platforms which don't support non-32 MMIOs for
> > some devices. None of the currently supported glue-drivers explicitly
> > state they have such peculiarity, but at the same time the STMMAC-core
> > driver at the present state uses the dword IO ops only. For instance
> > the PCIe subsystem has the special accessors for such cases:
> > pci_generic_config_read32()
> > pci_generic_config_write32()
> > which at the very least are utilized on the Tegra and Loongson
> > platforms to access the host CSR spaces. These platforms are also
> > equipped with the DW MACs. The problem might be irrelevant for all the
> > currently supported DW MAC controllers implementations though, but
> > still it worth to draw an attention to the problem possibility and in
> > order to prevent it before ahead it would be better to just avoid
> > using the byte-/word- IOs if it's possible.
> 

> Yes, this exists for configuration accesses, and is damn annoying
> because the read-modify-write of these can end up clearing PCI
> status register bits that are W1C.
> 

Right, but at least on Tegra these accessors are utilized to reach the
Root Port config space only, which is basically the normal memory
mapped CSRs. No PCIe bus transfers is performed for it, just normal
AHB/AXI/etc bus IOs passed directly to the DW PCIe CDM (Configuration
Dependent Module, that is generic PCIe config-space and
Synopsys-specific CSRs).

> I've never heard of that problem with MMIO though.

I was working with such platform and it was indeed tricky to have linux
working there well for all such peculiar SoC devices. Some drivers had the
"reg-io-width"/"reg-shift" DT-properties supported, which helped very
much in that matter since it tweaked the respective drivers to using
the allowed on my platform instructions only.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
