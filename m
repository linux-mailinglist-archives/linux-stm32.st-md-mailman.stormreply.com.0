Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A177C05CE8
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 13:10:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1372C5F1C7;
	Fri, 24 Oct 2025 11:10:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49510C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDpctzUzikXL5mr7jsd57bMJaOx9W5e5E6CpNx8Gahs=; b=Th81nqULbGbjjKR79CdwmOIGcr
 y8WpnOEojfstJp+/4umsKlu5NcCELKDaYKbYzNk4ur+8ttLlqOQqXlwwP1E93EyieKwk20UgdI5/B
 UjJXbqUrVKZBjQCM+cyrUrNOk1APRGuUUHPo+fQENFGS7VGEcHeBefQuQpks7paGWWrsXGqCUpnPC
 ffUFQroNmlxwD97xCyLh9LvXNxn1ZoqAb0AeWRDyLm4WJoLOEStLdzlyE+Hx3Sqk+GcytzkR1e9x+
 1kax5UAp049Jhkl9cfjWrC5fAbzMBNvQ1kyqBdsWPQoq/03JCVMua3CSCPMihnLxg1RsyJZIMqKL7
 HDE89+1g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39360)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCFgp-000000007Sj-1qqU;
 Fri, 24 Oct 2025 12:10:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCFgn-000000002eS-0hGl; Fri, 24 Oct 2025 12:10:33 +0100
Date: Fri, 24 Oct 2025 12:10:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPteqZ57fWULRfNy@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
 <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/8] net: stmmac: simplify
	stmmac_get_version()
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

On Thu, Oct 23, 2025 at 08:46:00PM +0200, Andrew Lunn wrote:
> On Thu, Oct 23, 2025 at 10:37:29AM +0100, Russell King (Oracle) wrote:
> > We can simplify stmmac_get_version() by pre-initialising the version
> > members to zero, detecting the MAC100 core and returning, otherwise
> > determining the version register offset separately from calling
> > stmmac_get_id() and stmmac_get_dev_id(). Do this.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>


Hi Andrew,

It seems I had a typo "verison" which should've been "version" in this
patch, which carried through patches 3 and 4. Are you happy for me to
retain your r-b with this typo fixed please?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
