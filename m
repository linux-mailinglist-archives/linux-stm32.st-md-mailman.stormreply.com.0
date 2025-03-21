Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888EA6B8EB
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 11:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C31DEC78037;
	Fri, 21 Mar 2025 10:40:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 953B5C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0LKCPTWLqOz0v0nFE+m771YyCcWhP2oMeKQU76uMec=; b=GGV8D1vtw9RNsDDh0sGL/X/tYv
 usnovAyelwqv0yDopXgbrW6cYz0L5Bs2S/E+Jvo0w1H4nbClisHkcSex6ceeD2aFDLNUM89EsFqwQ
 SshPS4xhujhu9WQoDE4SPoLqgs439O+PNOqOi52YnQPZdANuRf0qw/qYJMCBFJl7PqhOVA8r8h6Fo
 U2dF4m6s2JfRh4TID8XKCVac42mgFPDV5+Lhfn9BHz81vR+Cavkl29IrFUlVaC8MV5muLolcvTdiU
 j7bMAEnNwvpO/teQRE1uVsJcENho2xqr1OFywzPafJ2+6938uJNVoqeSkquEb4KH/rXI7cy/9FFvz
 J4VVLEeQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53034)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tvZnm-0000S9-0C;
 Fri, 21 Mar 2025 10:40:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tvZni-0007aA-1A;
 Fri, 21 Mar 2025 10:40:30 +0000
Date: Fri, 21 Mar 2025 10:40:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z91CHjqVc0-BmTPX@shell.armlinux.org.uk>
References: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Call
 xpcs_config_eee_mult_fact() only when xpcs is present
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

On Fri, Mar 21, 2025 at 11:35:01AM +0100, Maxime Chevallier wrote:
> Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.
> 
> Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
> crash at init :
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write
> 
>  [...]
> 
>  Call trace:
>   xpcs_config_eee_mult_fact from stmmac_pcs_setup+0x40/0x10c
>   stmmac_pcs_setup from stmmac_dvr_probe+0xc0c/0x1244
>   stmmac_dvr_probe from socfpga_dwmac_probe+0x130/0x1bc
>   socfpga_dwmac_probe from platform_probe+0x5c/0xb0
> 
> Fixes: 060fb27060e8 ("net: stmmac: call xpcs_config_eee_mult_fact()")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Yes, I had noticed that but haven't had time to patch it, so thanks for
submitting the patch. However, I think the code structure could be
better in this function. Let's get the bug fixed, so:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
