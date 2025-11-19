Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FFC6DE6E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 11:11:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A46C3C62D37;
	Wed, 19 Nov 2025 10:11:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3B82C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D34CtWTDd1vUfTflZaY/LmIETvT4QwvilMK5Cvqwxb8=; b=UlqN0QcHrqqCa0kWZnWMI0c1zg
 vxsuRMadYN1IICVUnzqxK5bT4Bm/DvusdFBCFL09cMszWSzQJm5n8cMPBEi0bw3Pap5wZEEB7PXDf
 ZSorIvKaiR76mgRBW+gr9bokyeYiQ3pe5gu6I8p7jZYzy1wg8nJedcteRrkTR4pB1MJyo4R0k4VOQ
 NwWswRybeiQrOKtzYrE2k6+SEx9oBlJ4eMjZq5cNOfxwoO1vMAiVkxtkeL1YtlCmVzeeNEp8NiBhl
 8edUmFmFjH0gYitWiyhJPOq+tMvdl0+5+cCpQb76qH1l1fuzrNNepmBH+LMFKWYFoSz8px66NTZbG
 ceRnB+oQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50806)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vLf9Q-000000004Sv-2lDM;
 Wed, 19 Nov 2025 10:11:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vLf9O-000000003Ki-1D9n; Wed, 19 Nov 2025 10:10:58 +0000
Date: Wed, 19 Nov 2025 10:10:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aR2Xsk_aNar-2YMV@shell.armlinux.org.uk>
References: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos-eth:
 simplify switch() in dwc_eth_dwmac_config_dt()
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

On Tue, Nov 18, 2025 at 11:18:01AM +0000, Russell King (Oracle) wrote:
> Simplify the the switch() statement in dwc_eth_dwmac_config_dt().

I notice that "the the" stammer has appeared in this patch commit
description, which is flagged as a warning in patchwork, so I'll
re-send with that fixed.

As I have a number of other patches that depend on this, all centred
around the axi_blen stuff, I'll send this patch as part of that series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
