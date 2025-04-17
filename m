Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24DA92167
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 17:25:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD50EC78F74;
	Thu, 17 Apr 2025 15:25:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 716ABC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JySm67fHnESL8Q88SmdhwLZQvpKI176J17Nt4E7e3iU=; b=KC1H5SWXs4IhtqrhqF+IT+bXNh
 1p1IGLwEPJ099yvDwibR2YPvXWdKd5lg3xmXcvuaPUMc3T3NzKoGwEVmVxbz3WBSUALRVD9Ei2rxm
 sNUVJsBg2HxVKqO9f8IFgFYxXo0BtIeqtyK+a+zoGo9KbUS5p7yNwLz6Ocbck5v9WF9xCCpcEOBfT
 ZPJMFuiozWGc+UCZBE0pgxgkvgjF7cW5TUFje/A/9oqOZLqF9+y4sP0Q8sgg3PdDcMLy0esYoo584
 mH/ML+Xq91/hsfGObldta2xSMWejPgLhtS3c46I4+GE+ywZpHb73c9mq/GHs9mEV1GTGApXiiVbrP
 RDAANTWQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45184)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u5R6m-0007Vs-0O;
 Thu, 17 Apr 2025 16:24:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u5R6f-0002Y8-2W;
 Thu, 17 Apr 2025 16:24:49 +0100
Date: Thu, 17 Apr 2025 16:24:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
 <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
 linux-doc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v3 00/11] Add PCS core support
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

On Thu, Apr 17, 2025 at 10:22:09AM -0400, Sean Anderson wrote:
> Hi Russell,
> 
> On 4/17/25 08:25, Russell King (Oracle) wrote:
> > On Tue, Apr 15, 2025 at 03:33:12PM -0400, Sean Anderson wrote:
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> > 
> > As per previous, unless I respond (this response not included) then I
> > haven't had time to look at it - and today is total ratshit so, not
> > today.
> 
> Sorry if I resent this too soon. I had another look at the request for
> #pcs-cells [1], and determined that a simpler approach would be
> possible. So I wanted to resend with that change since it would let me
> drop the fwnode_property_get_reference_optional_args patches.

Please can you send them as RFC so I don't feel the pressure to say
something before they get merged (remember, non-RFC patches to netdev
get queued up in patchwork for merging.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
