Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15269E7F7B
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 11:13:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BFF9C7802D;
	Sat,  7 Dec 2024 10:13:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 810DEC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9m4W93mYJLzHPiDSNn2VKBwMS0KHXEKg2K2lKwcgsic=; b=hkOlp2GT+CFyuoN3LOa5axR6b/
 gUBV11fEHXr4WfIdXtN7VbNn+IVNk/YuLNGLLJtOSH06P+rGRFlNFa5ggxm0jwQhVxLa1D1O8uSuv
 nrU+Gvk5NwIDU+9H6XFBjCWxPSiFREzlNzKdPrwwQNsAPBP/VYskW7iZWIY9WcjGNyuCkls8GhliI
 f3eNXluxUoHGtGFZfrelPz99UeEZv3RTLN3lagIHt+eW78ZzhQ9yB8tmMGCwbPgS+b316AQWA7y7d
 DwMmgy1mzRt2Z0R2Bvc2EmecR2bTnBOuMLQ0sw6wsUhyI6zupSUTfV0F7hsmJv+KDt1hf3ceQV57g
 c0xrjZ7A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45680)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tJroO-0007FL-2B;
 Sat, 07 Dec 2024 10:13:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tJroI-0008RP-2w;
 Sat, 07 Dec 2024 10:13:14 +0000
Date: Sat, 7 Dec 2024 10:13:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
References: <20241207070248.4049877-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241207070248.4049877-1-0x1207@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Move extern
 declarations from common.h to hwif.h
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

On Sat, Dec 07, 2024 at 03:02:48PM +0800, Furong Xu wrote:
> These extern declarations are referenced in hwif.c only.
> Move them to hwif.h just like the other extern declarations.

We normally have declarations in a header file that corresponds to their
definition, rather than where they are used.

> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h | 14 --------------
>  drivers/net/ethernet/stmicro/stmmac/hwif.h   | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1367fa5c9b8e..fbcf07d201cf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -543,18 +543,8 @@ struct dma_features {
>  #define STMMAC_VLAN_INSERT	0x2
>  #define STMMAC_VLAN_REPLACE	0x3
>  
> -extern const struct stmmac_desc_ops enh_desc_ops;

Defined in enh_desc.c, but no header for it, so either common.h or
hwif.h seems sensible.

> -extern const struct stmmac_desc_ops ndesc_ops;

Defined in norm_desc.c, same situation as previous one.

> -
>  struct mac_device_info;
>  
> -extern const struct stmmac_hwtimestamp stmmac_ptp;

Defined in stmmac_hwtstamp.c, same as above.

> -extern const struct stmmac_hwtimestamp dwmac1000_ptp;

Ditto.

> -extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;

Defined in dwmac4_descs.c, maybe dwmac4_descs.h or dwmac4.h would make
more sense than hwif.c ?

> -
> -extern const struct ptp_clock_info stmmac_ptp_clock_ops;

Defined in stmmac_ptp.c, and there is stmmac_ptp.h which contains a
number of function declarations, so maybe moving that there would
make more sense?

> -extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;

Same as stmmac_ptp_clock_ops.

> -
>  struct mac_link {
>  	u32 caps;
>  	u32 speed_mask;
> @@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
>  
>  void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
>  
> -extern const struct stmmac_mode_ops ring_mode_ops;

Defined in ring_mode.c, same as enh_desc_ops.

> -extern const struct stmmac_mode_ops chain_mode_ops;

Defined in chain_mode.c, same as enh_desc_ops.

> -extern const struct stmmac_desc_ops dwmac4_desc_ops;

Defined in dwmac4_descs.c, similar situation to dwmac4_ring_mode_ops
above.


So I think rather than bulk moving these to hwif.h, where some of them
remain out of place, maybe placing some in a more appropriate header
would be better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
