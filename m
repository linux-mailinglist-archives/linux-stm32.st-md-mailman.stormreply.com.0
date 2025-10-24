Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C3C0C4F8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8D0C60484;
	Mon, 27 Oct 2025 08:30:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 738ACC5F1DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sSCWIiX+MqLPwcbYBwmpimdl3z9FmDkAbweXSQKqMIE=; b=tgGTe94KoPkOGF3Tt42ZqRR99L
 UuqCXl9LZWM7vDJkFh11BngEwHQi0OsImNfGBPOipf9aeAj/Skdt0x4EYnBMNMKwxcCAuAhvSkDHk
 czxc02Jd4jaAYtFTLdqSVA0xdYx+McwFRizYvipP5G2CFfFTHhahyekC7smCcqvrPF2YVYKWJodGH
 xUmsqiNn2HnSJP51JJJREj8Hj6WFIA7gURVyTprHmORJ5PATTmyi3NIiw5H4B/Tf/grk/m8cATtpd
 ORWh+0ha/z9vAI8jDv2AQY1oBxBr5pzH3Wbe7ga+E74xBarO8g8ZQRy4dL32/gz819EYSZ7plNTeu
 Q5hUzVjw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51278)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCH8N-000000007YG-27cE;
 Fri, 24 Oct 2025 13:43:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCH8J-000000002i4-1Ltu; Fri, 24 Oct 2025 13:43:03 +0100
Date: Fri, 24 Oct 2025 13:43:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aPt0V43zYg5idFU6@shell.armlinux.org.uk>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024070720.71174-2-maxime.chevallier@bootlin.com>
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:01 +0000
Cc: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: Move
 subsecond increment configuration in dedicated helper
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

On Fri, Oct 24, 2025 at 09:07:17AM +0200, Maxime Chevallier wrote:
> In preparation for fine/coarse support, let's move the subsecond increment
> and addend configuration in a dedicated helper.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
