Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D1A065FD
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 21:25:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291E2C78F66;
	Wed,  8 Jan 2025 20:25:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07EFAC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUDw2uMXlvZKFnYf/nGhrEOQlOnEKNrdrSrZUwzH9YU=; b=bgULs6bQzGZW9Uddr1Ln/594zs
 Vt9+DfsqfV4bSp5A8CpFEk5PVqbyagYxOG7eiUkt6KlN4zYgexHHHRGZ67E1YtT19gt9Qcu16kQPM
 +vbDAsasIt/5/6e4pO8EbTtvDNh0nfECU6D/UZqrKAdZqaDqlrwjAJMMzYPHE0FWqHVfGbFHqctMy
 I6jniHa56A1hvkHEb0KzrCJPhzOqbxZTqn4LmoUuajDAL4SwFSjf3sJkYuu823oHxUr/t9cnYpmZ3
 zb/pTPwV/3iL4UnidBODEqp9wCcq7lH6Ul3+G1adhBnAplyCbvsedd7k5ITwUu45l93vhG+TS6+M1
 oSzGG/8Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50228)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tVcc3-0001BL-1g;
 Wed, 08 Jan 2025 20:25:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tVcbz-0006a3-24;
 Wed, 08 Jan 2025 20:25:07 +0000
Date: Wed, 8 Jan 2025 20:25:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z37fI8dMLOS7-ky7@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
 <E1tVZDw-0002KL-Gg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tVZDw-0002KL-Gg@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 07/18] net: stmmac: clean up
 stmmac_disable_eee_mode()
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

On Wed, Jan 08, 2025 at 04:48:04PM +0000, Russell King (Oracle) wrote:
> stmmac_disable_eee_mode() is now only called from stmmac_xmit() when
> both priv->tx_path_in_lpi_mode and priv->eee_sw_timer_en are true.
> Therefore:
> 
> 	if (!priv->eee_sw_timer_en)
> 
> in stmmac_disable_eee_mode() will never be true, so this is dead code.
> Remove it, and rename the function to indicate that it now only deals
> with software based EEE mode.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index de06aa1ff3f6..9a043d19ebac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -427,18 +427,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
>  }
>  
>  /**
> - * stmmac_disable_eee_mode - disable and exit from LPI mode
> + * stmmac_disable_sw_eee_mode - disable and exit from LPI mode
>   * @priv: driver private structure
>   * Description: this function is to exit and disable EEE in case of
>   * LPI state is true. This is called by the xmit.
>   */
> -static void stmmac_disable_eee_mode(struct stmmac_priv *priv)
> +static void stmmac_disable_sw_eee_mode(struct stmmac_priv *priv)

Looking at this again, I'm still not happy with the function name, but
not enough to send another version. I'll change it to
stmmac_stop_sw_lpi() in the next batch of stmmac EEE cleanups (there
is more to come!)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
