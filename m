Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 760999E6E6B
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 13:41:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E52C6DD9D;
	Fri,  6 Dec 2024 12:41:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1E49C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60+QdJdxKs6rZA+mdAzlD6sjzLBFb35Y3PSnzo24tzk=; b=WK2FExw1uNyzInbCva0clg0JsG
 kZEr9EIkBLryuhClWgKxoTYYDN0lYpa9z8LIJeyGAS6eKvR9OmD3Ij4ifFmT0FKtLWlQbZWgOcGL5
 VUkyvzI/WUWxwBJ/deE4lUIzj8aU9xYELZnqEwkA4LGPCy8QAtE0piWWjs3RBRHOkDauu3hrhmPhr
 e+igfTThsB4ondJhfP7TEB+pyob6h27CKOvgcRz9L9Mmcpz7O5i8JR1UTHgEAaYDI7PVTz2E5Zc9G
 nqI8LvD+CRzGY+WxpZPzOHGHxK42VxIiHebEJCtq91lNvWTw7E15ZU0P/TCGZf+zrX9aC0TmAzzyq
 Zuj3CV+A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54884)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tJXdf-0006Fj-2g;
 Fri, 06 Dec 2024 12:40:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tJXdc-0007YT-1B;
 Fri, 06 Dec 2024 12:40:52 +0000
Date: Fri, 6 Dec 2024 12:40:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Z1Lw1LzgeAyHv2Bl@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
 <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
 <20241205085539.0258e5fb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241205085539.0258e5fb@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unaligned
 DMA unmap for non-paged SKB data
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

On Thu, Dec 05, 2024 at 08:55:39AM -0800, Jakub Kicinski wrote:
> On Thu, 5 Dec 2024 16:43:22 +0000 Russell King (Oracle) wrote:
> > I'm slightly disappointed to have my patch turned into a commit under
> > someone else's authorship before I've had a chance to do that myself.
> > Next time I won't send a patch out until I've done that.
> 
> Yes, this is definitely not okay. LMK if you dropped this from your
> TODO already, otherwise I'm tossing this patch and expecting the fix
> from the real author.

See https://lore.kernel.org/r/E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
