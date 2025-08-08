Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C8B1EA4A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 16:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B28E4C3F952;
	Fri,  8 Aug 2025 14:22:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64814C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 14:22:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1409B5C6852;
 Fri,  8 Aug 2025 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3172C4CEF4;
 Fri,  8 Aug 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754662976;
 bh=C2mDBiwbp98LucRDstG30Q8R9qWzgIONvigmiGMmCDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIR9WG8YIiMvBoT/2IOlRZTCD66n0CHJqXz2aC/VtFq/nBAf6oXz7ZccbJWE0Jvm4
 QEk3o2tYw4YXMLOVJcqN3nr6Afnq8gsOGI1X5jsSpzKaWi57bKeWcWyTJyaF9PeOxM
 NTlC2B+uplfuNYIfBkEUI4YNbDdWe0XwIfH2MmoGCLHUOxjwJtPLBLfDO5xfLPmfOo
 GhCjPH2m94x6a7yVqwLnM+9Bgg0N9sVeAOwmiehh/ZiSobGQvGohQu0aMKVIR+Ey9F
 0x/FryhM+qcRnllO9Yz0xNVcVNsCM/8X2ssENYmOeHk1K1sOvIM+wP1xxtTNWimN4h
 z2hIhv+FSsBMw==
Date: Fri, 8 Aug 2025 15:22:51 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250808142251.GF1705@horms.kernel.org>
References: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwc-qos: fix clk
 prepare/enable leak on probe failure
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

On Fri, Aug 08, 2025 at 01:16:39PM +0100, Russell King (Oracle) wrote:
> dwc_eth_dwmac_probe() gets bulk clocks, and then prepares and enables
> them. Unfortunately, if dwc_eth_dwmac_config_dt() or stmmac_dvr_probe()
> fail, we leave the clocks prepared and enabled. Fix this by using
> devm_clk_bulk_get_all_enabled() to combine the steps and provide devm
> based release of the prepare and enable state.
> 
> This also fixes a similar leakin dwc_eth_dwmac_remove() which wasn't
> correctly retrieving the struct plat_stmmacenet_data. This becomes
> unnecessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russell,

Probably this wants:

Fixes: a045e40645df ("net: stmmac: refactor clock management in EQoS driver")

Otherwise looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
