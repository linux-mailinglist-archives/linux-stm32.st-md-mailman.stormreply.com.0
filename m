Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD8B532C5
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 14:51:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCDD3C349C1;
	Thu, 11 Sep 2025 12:51:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 100F3C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+5rP8nGZfUE7JovJkiq3wIxYuLAUJaHuDcq9FK6N2o=; b=j5jyOipc7CF+6IrtAD8U6rzM+N
 VTg3B4CS4xefU8x9b56O+oumZqqhJmMFMn8HWy5FCrix6LQr53E1wrfwJTwUpIUmqymE2YohLIxPS
 gGyhFS4UJq4MZKJbb2zL550hMOTzkwsUupEOFC7cu3uYP2+W9pN13nrPYDUv70mJAZafsfIj5gWlW
 pjyGeqxb7eNyjrmiPdXnc6kEGwQt3GfP/8mc6kEMg4yzBNOvjWYti9tdhcpM7AES2/U1fPDlicDVP
 fhm2341mm88VopLKqpBw1gPHdv8RnHXiI+NnARfvJ9GGomDSp4TPJid8PxYrvLOdzDa9TTiDXWUrn
 Ihz5WVRg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44464)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uwglt-0000000032i-2qAs;
 Thu, 11 Sep 2025 13:51:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uwglp-000000002Mx-3vtO; Thu, 11 Sep 2025 13:51:25 +0100
Date: Thu, 11 Sep 2025 13:51:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Message-ID: <aMLFzSLBHxsk9YI8@shell.armlinux.org.uk>
References: <20250911-hlbs_2-v1-1-cb655e8995b7@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250911-hlbs_2-v1-1-cb655e8995b7@altera.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: est: Drop frames
	causing HLBS error
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

On Thu, Sep 11, 2025 at 04:38:16PM +0800, Rohan G Thomas via B4 Relay wrote:
> @@ -109,6 +109,11 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
>  
>  		x->mtl_est_hlbs++;
>  
> +		for (i = 0; i < txqcnt; i++) {
> +			if (value & BIT(i))
> +				x->mtl_est_txq_hlbs[i]++;
> +		}

There's no need for the parens around the for loop.

I'm afraid I can't provide much more of a review as I don't have the
documentation for GMAC4 or XGMAC.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
