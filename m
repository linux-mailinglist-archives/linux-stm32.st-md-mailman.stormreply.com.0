Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A1A96F23
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 16:42:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FDEFC78F61;
	Tue, 22 Apr 2025 14:42:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3646C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 14:42:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE75A41CFD;
 Tue, 22 Apr 2025 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745332953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jt9Mkr75c4uKAU1hZ+a3wXo6IhuSBSJ1I5FWD7KkaKo=;
 b=mQbOxbPVkr5b4cEsk2QiCO7WlOWZoOOT2oQwWVn4K5DxpU27RzMBPjwNtHVpQXZ6MRWV37
 7r/QCuZm1iooze+gyHGRrPPHg3qH9N9eM/QHV8BT3oorCPuUv7hAXz7mSa/cIfzJbcQV3Q
 5nvO6MfJBWe8Nm7WbilLrZfs/JspuxXqYB9SgtcbKkuMZhmnvntW9cULdVIRydNZF8/y7N
 AqO+Cxa6Ik5c1YyfNby9a13BHYfA5rO0cGviemIoPAVKy2wQeSiLfS3bpicrVK2Z8J61Ej
 ZX15rnnmRt1SH65uFg6azI3W9YYkAD+AW9QIWjgtPa1xREx7kpYWJ6Mt3xc/lQ==
Date: Tue, 22 Apr 2025 16:42:30 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250422164230.5ffb90d3@fedora.home>
In-Reply-To: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
References: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: calibrate
 tegra with mdio bus idle
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

On Tue, 22 Apr 2025 15:24:55 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Thierry states that there are prerequists for Tegra's calibration
> that should be met before starting calibration - both the RGMII and
> MDIO interfaces should be idle.
> 
> This commit adds the necessary MII bus locking to ensure that the MDIO
> interface is idle during calibration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

[...]
	
> -static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
> +static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
>  {
> -	struct tegra_eqos *eqos = priv;
> +	struct tegra_eqos *eqos = bsp_priv;
>  	bool needs_calibration = false;
> +	struct stmmac_priv *priv;
>  	u32 value;
>  	int err;
>  
> @@ -158,6 +159,11 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
>  	}
>  
>  	if (needs_calibration) {
> +		priv = netdev_priv(dev_get_drvdata(eqos->dev));
> +
> +		/* Calibration should be done with the MDIO bus idle */
> +		mutex_lock(&priv->mii->mdio_lock);

Can't priv->mii be NULL, if the PHY for that MAC is connected to
another MDIO bus for instance ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
