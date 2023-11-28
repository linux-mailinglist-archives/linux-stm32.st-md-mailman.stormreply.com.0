Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BF7FB5B2
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 10:26:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C2A8C6B442;
	Tue, 28 Nov 2023 09:26:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9546DC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 09:26:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14305E000C;
 Tue, 28 Nov 2023 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701163601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SWqqO2Y/xiO+TRt8YQW+yLQIPdt2LTdZoHMxmm1Ics=;
 b=Sjtn6l7zR30mQxJLlA3aYzk9WnLTcPBVw0DYsqorv2X4Go8xgOK4V3aCzIINxp+nkLGQK5
 Ayse/f/Mse7tHbDjEPE+MPdWmz3bMf42OLOslD8lN5W9elEuudOQOBJjNrD+tiwAbEWIAr
 SCTRi+QfaZVk0WJipImlHqNLPfi9dC88hjVDTFMScwVwr1vaJ5aeZQD3WVaCxQPTF2Ikz1
 dlK4suG6cJLtk01cHyNVpoT0H7VlPB0VGUwvyIScf/5+mKM+5Bfq0T+bA2rNwRtCJDAFRP
 Jp/kVUBaLItB12epGtBbbim4dhUuRLuNfhMK3eet1bJq29qppvLkNdVT6MzFIA==
Date: Tue, 28 Nov 2023 11:20:37 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20231128112037.21e2d5aa@device.home>
In-Reply-To: <20231128101841.627fc97e@windsurf>
References: <20231128094538.228039-1-maxime.chevallier@bootlin.com>
 <20231128101841.627fc97e@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-socfpga: Don't
 access SGMII adapter when not available
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

Hello Thomas,

On Tue, 28 Nov 2023 10:18:41 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 28 Nov 2023 10:45:37 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > The SGMII adapter isn't present on all dwmac-socfpga implementations.
> > Make sure we don't try to configure it if we don't have this adapter.
> > 
> > Fixes: 5d1f3fe7d2d5 ("net: stmmac: dwmac-sogfpga: use the lynx pcs driver")
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > index ba2ce776bd4d..ae120792e1b6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > @@ -243,7 +243,8 @@ static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
> >  {
> >  	u16 val = enable ? SGMII_ADAPTER_ENABLE : SGMII_ADAPTER_DISABLE;
> >  
> > -	writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
> > +	if (dwmac->sgmii_adapter_base)
> > +		writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
> >  }
> >  
> >  static int socfpga_set_phy_mode_common(int phymode, u32 *val)  
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> As a follow-up improvement, there's an open-coded version of
> socfpga_sgmii_config() in socfpga_dwmac_fix_mac_speed(), which could be
> rewritten as such:
> 
> 	socfpga_sgmii_config(dwmac, false);
>
> 	if (splitter_base) {
> 		val = readl(splitter_base + EMAC_SPLITTER_CTRL_REG);
> 		val &= ~EMAC_SPLITTER_CTRL_SPEED_MASK;
 [...]

I did saw this, but as this is merely a non-functional rework, I'd
like to target this to net-next, so I'll wait for the fix to land and
follow-up with this rework indeed.

Thanks for the review,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
