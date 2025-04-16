Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C8A8B785
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 13:19:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39CF2C78F81;
	Wed, 16 Apr 2025 11:19:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55405CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 11:19:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 764F01FCEA;
 Wed, 16 Apr 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744802365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgL4bb6DJsY0X2uch3UIRkw8nqLjqKutjCA1hYMMONc=;
 b=dZbTltA57yBAmrO6sMjbBeHFlyFYNPYxN4/TRtuIGmVHZK+u1R2U9qyfuF6xlEkztr6PqD
 zOe6cLPsQnmbbLR5g83MKJX1jVpoL4t3OVdqmCOsesD2OAShDo7XMmwqR2NY/AC871hOma
 v6I5OLrtiY7/csxLx/DOHJKXoVQYPSllkDW2Zb55ZUSrmqc868mga0sLQw9taA2XlwMF7J
 HdAqAYYfEH5ASaJmxMNOfa0Vw7eN3k2NveqGMVV7474U3q+31z4duXqvp9gzsDWR72a6sL
 qrM9XI2KMvTJNV1WQqtkLoz7TQjGhq5W7sKDIIdXa2498K+a1T2f02NDHNYLdw==
Date: Wed, 16 Apr 2025 13:19:23 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250416131923.40cf0a06@fedora.home>
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] net: stmmac: socfpga: fix
 init ordering and cleanups
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

Hello Russell,

On Wed, 16 Apr 2025 10:31:44 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi,
> 
> This series fixes the init ordering of the socfpga probe function.
> The standard rule is to do all setup before publishing any device,
> and socfpga violates that. I can see no reason for this, but these
> patches have not been tested on hardware.
> 
> Address this by moving the initialisation of dwmac->stmmac_rst
> along with all the other dwmac initialisers - there's no reason
> for this to be late as plat_dat->stmmac_rst has already been
> populated.
> 
> Next, replace the call to ops->set_phy_mode() with an init function
> socfpga_dwmac_init() which will then be linked in to plat_dat->init.
> 
> Then, add this to plat_dat->init, and switch to stmmac_pltfr_pm_ops
> from the private ops. The runtime suspend/resume socfpga implementations
> are identical to the platform ones, but misses the noirq versions
> which this will add.
> 
> Before we swap the order of socfpga_dwmac_init() and
> stmmac_dvr_probe(), we need to change the way the interface is
> obtained, as that uses driver data and the struct net_device which
> haven't been initialised. Save a pointer to plat_dat in the socfpga
> private data, and use that to get the interface mode. We can then swap
> the order of the init and probe functions.
> 
> Finally, convert to devm_stmmac_pltfr_probe() by moving the call
> to ops->set_phy_mode() into an init function appropriately populating
> plat_dat->init.
> 
> v2: fix oops when calling set_phy_mode() early.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
>  1 file changed, 16 insertions(+), 63 deletions(-)

Feel free to CC: me for dwmac-socfpga stuff, I have some HW to test this
on :)

Thanks for this work, it's working fine :)

For the series,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
