Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF7722721
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 15:15:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2A0FC6A5FA;
	Mon,  5 Jun 2023 13:15:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC2EC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 13:15:18 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685970918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezVCXA59R6OoUuoJw4TkUJ8Lfny/r5hrMVf+Oit43HM=;
 b=pFe/JDymlb8lWaJnLc+kVSQv2RGWrE5mG4o7pyvP3LBJ5Ypix7HyK1wfxtPo1LU+Mq62s+
 xRdi5Pg+15iCku3Rx/BTziSPmQlJQOpOjlP0eh9SiWM3PnoIL/O1T61yprHFzySc6ilP2H
 jmfxuqRP8U/FdZApLzD8W9mgqOC9eWuaIfYDmrUHPqC7wcj0GXdIDZbRyIo0Dk09L5v1Kr
 UEiaAT+IPPC2FyGfv2iRQDK5zNGrRWJ4nKmvvaGJ/lYx0zecNYeQfhdE4LtUplA5aiziTp
 Kln0ykC1Zef0iG561jiN1eHtpeiAH7WFw5WP9gmx/9f87HciFBXjcAY0dSFcEw==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 661EE60010;
 Mon,  5 Jun 2023 13:15:15 +0000 (UTC)
Date: Mon, 5 Jun 2023 15:15:14 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Mark Brown <broonie@kernel.org>, davem@davemloft.net
Message-ID: <20230605151514.20112956@pc-7.home>
In-Reply-To: <20230601141454.67858-3-maxime.chevallier@bootlin.com>
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
 <20230601141454.67858-3-maxime.chevallier@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/4] net: ethernet:
 altera-tse: Convert to mdio-regmap and use PCS Lynx
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

Hi,

On Thu,  1 Jun 2023 16:14:52 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> The newly introduced regmap-based MDIO driver allows for an easy mapping
> of an mdiodevice onto the memory-mapped TSE PCS, which is actually a
> Lynx PCS.
> 
> Convert Altera TSE to use this PCS instead of the pcs-altera-tse, which
> is nothing more than a memory-mapped Lynx PCS.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[ ... ]

> -	ret = request_and_map(pdev, "pcs", &pcs_res,
> -			      &priv->pcs_base);
> +	ret = request_and_map(pdev, "pcs", &pcs_res, &priv->pcs_base);

It turns out I'm missing the zeroing of pcs_regmap_cfg, which can trigger
errors at probe time. I know this series has been applied, and that I can
send a followup fix, but due to the missing regmap patch in the net-next
tree, this series will break altera_tse and dwmac_socfpga anyway,as
mentionned here (and in the cover):

https://lore.kernel.org/netdev/20230605142039.3f8d1530@pc-7.home/

Is reverting the way to go then ?

Best regards,

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
