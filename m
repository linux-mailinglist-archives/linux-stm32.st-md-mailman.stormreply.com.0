Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC2BDF6CD
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 17:39:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C93C2C57163;
	Wed, 15 Oct 2025 15:39:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F875C5663D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8WH71db750jps9WxI3z1NEUJwkE3VXRhtPG7iUgTWY=; b=04hQz4eK43+AW/wKb5wdQbpX7W
 9qjxEPcOHoILOsxV1PI8IytNEk84VUOiE3we1jZwRHbOWnulNKUJp706hKrMypx3oAeFgwVnxQJp1
 7NcBfL3w49o/pLRiGOLUQIQ/mWRC0KCTP8+VfDs1dsu+lXWJju+rDn+BWTwR/+t0mRP2hDyld2Iy+
 Y+3njCB/O24OWRDwUd5m5IiCMsrA2qo8dBfgqnXLAfyzO2XLKOXq0hFkLwNxW1dEVY+Dz3X9mnDRT
 2VTa9nPxpngzLSATgjGK+7eSuRfEQT3c4w5Fc5pxwzaBcGyASUd1jlsNEB+d8MwZ634P3VQG8TnLz
 W4C0Q8HQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37834)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v935W-000000004wH-29yk;
 Wed, 15 Oct 2025 16:06:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v935S-000000002Le-3AO4; Wed, 15 Oct 2025 16:06:46 +0100
Date: Wed, 15 Oct 2025 16:06:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
X-Mailman-Approved-At: Wed, 15 Oct 2025 15:39:09 +0000
Cc: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Move subsecond
 increment configuration in dedicated helper
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

On Wed, Oct 15, 2025 at 12:27:21PM +0200, Maxime Chevallier wrote:
> +static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
> +{
> +	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;

Just to say that I have patches that get rid of these has_xxx flags for
the cores, and these changes (and the additional platform glue patches
that have been posted) will conflict with them.

Given the rate of change in stmmac, at some point we're going to have
to work out some way of stopping stmmac development to get such an
invasive cleanup change merged - but with my variability and pressures
on the time I can spend even submitting patches, I've no idea how that
will work... I was going to send them right at the start of this
cycle, but various appointments on Monday and Tuesday this week plus
work pressures prevented that happening.

So, I decided instead to send out the first stmmac PCS series... which
means I now need to wait for that to be merged before I can think about
sending out anything else stmmac-related. (and there's more PCS patches
to come beyond the 14 I sent today.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
