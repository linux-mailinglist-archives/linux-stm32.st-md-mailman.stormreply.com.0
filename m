Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77FAC442B
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 21:56:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20006C36B10;
	Mon, 26 May 2025 19:56:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF970C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4+r/nHRyZltKy41tZTedOu70Px/F9mZ4F2bNtsI59OU=; b=4tEXRGQfPFBKpQqSc4z3gLgkOI
 2o4h5Mvi6Sh0ZTFi1D2+yNvmyXjWCGYdmEHfGYz0Cg28GnJ2XGysRQrywM1DpEhKGquRqpftFPcNI
 8DjUFHygH594V/sfYAptUWciuDPafHD5BXrYWXj9wRwcblq7YpMgBF+7bvyXY3SQXb9Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uJdvL-00E1V8-N2; Mon, 26 May 2025 21:55:51 +0200
Date: Mon, 26 May 2025 21:55:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526182939.2593553-2-james.hilliard1@gmail.com>
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

On Mon, May 26, 2025 at 12:29:35PM -0600, James Hilliard wrote:
> The Allwinner H616 ships with two different on-die phy variants, in
> order to determine the phy being used we need to read an efuse and
> then select the appropriate PHY based on the AC300 bit.
> 
> By defining an emac node without a phy-handle we can override the
> default PHY selection logic in stmmac by passing a specific phy_node
> selected based on the ac200 and ac300 names in a phys list.

The normal way to do this is phy_find_first().

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
