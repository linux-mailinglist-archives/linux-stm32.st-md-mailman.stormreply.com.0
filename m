Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C506DAC44C6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 23:22:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F16FC36B11;
	Mon, 26 May 2025 21:22:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66161C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Kk/X2iMwkZ9QRWnt0o+BzHTjRbwP4NWs5dzU8KffOaA=; b=T879ss70/t9wA4mWiMI6mNI8BN
 UsnlixureesQqmV8uikvpnWFL2TZSc/FkVkD80DuZqSV07g5JosbMXOrJsiurr98FpjN+fcIdl4+2
 +RrySl2KnWyJagD2A3mOAbo80nAx0wASVHs7OeWfsVASTy0ha7jq2Nl7E9IdsODflT7I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uJfH0-00E1mE-Dn; Mon, 26 May 2025 23:22:18 +0200
Date: Mon, 26 May 2025 23:22:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
 <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
 <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

> > The normal way to do this is phy_find_first().
> 
> Sure, but there are problems with that approach here.
> 
> The initialization sequences are rather different and the devices
> won't be visible on the mdio bus until after they are initialized.
> 
> The resets will be specific to either the AC200 or AC300 so we
> need to choose the correct PHY based on the efuse value rather
> than a mdio bus scan to avoid a circular dependency essentially.
> 
> AC200: i2c based reset/init sequence
> AC300: mdio based reset/init sequence

O.K. so you need to post more, so we get to see the complete
problem/solution. It seems to me, AC200 and AC300 are not compatible,
so should have different compatible strings. That might be part of the
solution. But it is too early to say.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
