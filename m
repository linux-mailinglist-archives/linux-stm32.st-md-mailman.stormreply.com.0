Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6568EFB7
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 14:29:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98ABBC6A5E8;
	Wed,  8 Feb 2023 13:29:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 199B4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=gVnNzRUs4OA2UfcdlTrQFkCI/U2RrCm033aNur/MvyI=; b=UBXikFe+4zXo9C7W98y05ILTAD
 RzecF0fMAcc7v0EI6RlHZcr2B/HoFCP3ooti11GCYt1AzUfTRiSXp4tUiwyvkZRV9UvPx5Xr5AlBa
 txiPhyRrfCr1gpiyljmcraxHYfOlqQzeDfMP0moi6x4SNluRGO6y08+3hCyWxtdbIxsE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pPkVx-004PAa-7r; Wed, 08 Feb 2023 14:29:33 +0100
Date: Wed, 8 Feb 2023 14:29:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <Y+OjvfOvqz0s8qDr@lunn.ch>
References: <20230208124025.5828-1-guanwentao@uniontech.com>
 <Y+OfmMeP3Eto3K7t@corigine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+OfmMeP3Eto3K7t@corigine.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Guan Wentao <guanwentao@uniontech.com>, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: get phydev->interface from
 mac for mdio phy init
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

On Wed, Feb 08, 2023 at 02:11:52PM +0100, Simon Horman wrote:
> On Wed, Feb 08, 2023 at 08:40:25PM +0800, Guan Wentao wrote:
> > The phy->interface from mdiobus_get_phy is default from phy_device_create.
> > In some phy devices like at803x, use phy->interface to init rgmii delay.
> > Use plat->phy_interface to init if know from stmmac_probe_config_dt.
> > 
> > Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> > Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
> > ---
> 
> This is v2 of this patch, so let me make some comments about that.
> 
> * Firstly, unless asked to repost by a reviewer/maintainer,
>   it's generally bad practice to post a patch(set) more than once within 24h.

Hi Guan

I just showed you why there is this 24 hour rule by replying to your
first version...

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
