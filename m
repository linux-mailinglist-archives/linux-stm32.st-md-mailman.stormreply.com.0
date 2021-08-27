Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DE3F9231
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 04:03:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CC11C597B3;
	Fri, 27 Aug 2021 02:03:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5800C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GuRZkuKuMuIZkC+HPEQmbSTwj2lMnWB+PUw0G55rLes=; b=vhd7m8gEUoEIMs6OaIWlMmSvXe
 GKT1vYNssoGR6c4ym6+a/W5UTYIIvJkM02ILKd4++Bq5JIxnXIRfvgdnqHy+/HK46ZXjK9WKRLeeQ
 SSqAnndp4xK2HmO3h/ZHK6C29Yr4op4JYR9UZ+lhHVRk2Uk5OmJ7Gks4YAHasKlCuFug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mJRDP-0042ba-AC; Fri, 27 Aug 2021 04:03:31 +0200
Date: Fri, 27 Aug 2021 04:03:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YShH84C9gFtL1LcJ@lunn.ch>
References: <20210826235134.4051310-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826235134.4051310-1-vee.khee.wong@linux.intel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] net: pcs: xpcs: enable
 skip xPCS soft reset
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

On Fri, Aug 27, 2021 at 07:51:32AM +0800, Wong Vee Khee wrote:
> Unlike any other platforms, Intel AlderLake-S uses Synopsys SerDes where
> all the SerDes PLL configurations are controlled by the xPCS at the BIOS
> level. If the driver perform a xPCS soft reset on initialization, these
> settings will be switched back to the power on reset values.

So you have given up on the idea of calling into the BIOS to do this?
ACPI is too difficult to use? Can you at least copy the code from the
BIOS into the driver? It might then also be possible to fix your
inability to swap link speeds?

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
