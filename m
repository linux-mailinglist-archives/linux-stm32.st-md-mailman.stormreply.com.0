Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB646C87733
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 00:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8D5C01FB5;
	Tue, 25 Nov 2025 23:19:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2F27C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 23:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ukMBHd2xprh1k/N8cNGlN+MYj/FJerUlkN0OU+0nrSM=; b=Tmkl9DgGtXT1tFoDpAdbmsXLu2
 wPfi67ITjX3MMczRG20rf2PbUhq4ZGCG/KDNkBGrpGO+cN+ZFzUAi1UFWV1q9dAU55D65VFvfK/+v
 CijIMS61dPmELwsL21oN9hO8F057RmwJbKrEu0o9u66hmRyhu7TYQJL4I1Xcyzr9ienz1xQ78akqf
 RquMtihWgU9RyHFTEoJ+Hw2IsjlFXCPXyzGrOLfg2QnvLGfG0eFuUlqnxqH1oCpROSyT/AjVs7xCl
 VuniJyZ9A2qMyXOxayYK+EASCMWoEKAOE3jDp0UaeuKiqTAxpRI140EdlLrjJIwKMqVxAEAdPTBM4
 4wrPwEKQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56056)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vO2JU-000000003IU-2m6E;
 Tue, 25 Nov 2025 23:19:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vO2JQ-000000001AF-0Uv7; Tue, 25 Nov 2025 23:19:08 +0000
Date: Tue, 25 Nov 2025 23:19:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Message-ID: <aSY5ayT0X_zFeYFs@shell.armlinux.org.uk>
References: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix E2E delay
	mechanism
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

On Tue, Nov 25, 2025 at 10:50:02PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> messages shows up for dwmac v3.70+ and dwxgmac IPs.
> 
> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> Agilex5 (dwxgmac). According to the databook, to enable timestamping
> for all events, the SNAPTYPSEL bit in the MAC_Timestamp_Control

bits

> register must be set to 2'b00, and the TSEVNTENA bit must be cleared
> to 0'b0.

Are you sure 3.70 is the appropriate point. According to the 3.74
databook, SNAPTYPSEL changed between 3.5 and 3.6.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
