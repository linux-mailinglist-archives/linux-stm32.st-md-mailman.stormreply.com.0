Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A24A8B3EA
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 10:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9B96C78F83;
	Wed, 16 Apr 2025 08:32:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E29C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 08:32:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05D39433EC;
 Wed, 16 Apr 2025 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744792378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQGQgS3fn9DpLHF39v5wKc9omOFCoaDRzybsm2gWEIE=;
 b=UWDn9fuGUR59UV7s0DWAYDL0GZA6lja8F9iLNR0CJm41eX4TBQgHujtyQR0dQ9lamNwbKK
 ynw+rFpw8QvOgLP1M3LsmaAyOW+wqFCNfkKm+jiiwo8yaIvcsXSQH1gEzk5+T5cMLBPCqB
 /egJWGENgZXhvhu721EkXQG3NWlIw3g5Z4nzBLcj35NcuJF/RQcuko7k6+AjY14H0w7Juj
 M9r59IYpzvkiQsahyB2sxO0hsXuO4821Y4D3oXYm4KUWzjbFxRw0LKsU0MCo7EgWbM+bbr
 uE5v0PHcjcYVzMvUPaN3fPUf2HBJbOJJ1Onc+KB/DPZiNxgYzwGymLzNd5zKkA==
Date: Wed, 16 Apr 2025 10:32:53 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250416103253.629db3de@fedora.home>
In-Reply-To: <Z_9oVrAOnInrhb6z@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
 <20250416095343.1820272f@fedora.home>
 <Z_9oVrAOnInrhb6z@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: socfpga: fix
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

On Wed, 16 Apr 2025 09:20:38 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Apr 16, 2025 at 09:53:43AM +0200, Maxime Chevallier wrote:
> > I've given this a try and unfortunately :  
> 
> Great, someone with hardware, and who responds to patches! :)
> 
> > This is only to get the phymode, maybe we should do like dwmac_imx
> > and store a pointer to plat_dat into struct dwmac_socfpga, so that we
> > can get it back in dwmac_init ? I've tried with the patch below and it
> > does solve the issue, but maybe you have a better approach.  
> 
> Yes, but I don't think we need such a big patch:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 8e6d780669b9..59f90b123c5b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -50,6 +50,7 @@ struct socfpga_dwmac {
>  	u32	reg_offset;
>  	u32	reg_shift;
>  	struct	device *dev;
> +	struct plat_stmmacenet_data *plat_dat;
>  	struct regmap *sys_mgr_base_addr;
>  	struct reset_control *stmmac_rst;
>  	struct reset_control *stmmac_ocp_rst;
> @@ -233,10 +234,7 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
>  
>  static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>  {
> -	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -
> -	return priv->plat->mac_interface;
> +	return dwmac->plat_dat->mac_interface;
>  }
>  
>  static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
> @@ -490,6 +488,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	 */
>  	dwmac->stmmac_rst = plat_dat->stmmac_rst;
>  	dwmac->ops = ops;
> +	dwmac->plat_dat = plat_dat;
>  
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> 

Even better indeed ! I've tested it and it works.

I'll be happy to test any followup :)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
