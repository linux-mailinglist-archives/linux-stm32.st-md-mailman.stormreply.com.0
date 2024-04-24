Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC408B0C84
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 16:29:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2221BC7128C;
	Wed, 24 Apr 2024 14:29:58 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA53C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 14:29:56 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-369e3c29aedso29735545ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713968995; x=1714573795;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CKrtiFG0UE+ikFKGmO4FtGR8vkeqkLcj1oUGJzlR1fw=;
 b=SjFMqAoF/9uZTP/mqntmkzQxSYPAucg5ZJZxQMLGs/e21xkE2vLsZYfiNoEK3+msyp
 kob5CerKr2cNimUTbs7AM51XJ+fshypbqrE6Zu8jqSltVarZCGiHhHiQePAeVbKDeVeo
 InczzPdOJM2ucQ2afH+SrgYTgcJrNljW/fWr3YYCpagjQHZh8ln+KzSQBvHxnfKQ3jEu
 zGTS2RcWU/dRv5lTK4KYPzjnQP72FReAR8GsPIf7t5ttRT1CtuqdE08JJmS4s88D0QhP
 zYIG/nd/PCOB88Saem0TwU6gtbXmdJN6naD0msXA0geDr9ODoyN9+WozCSoBMVv3zs30
 syFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713968995; x=1714573795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKrtiFG0UE+ikFKGmO4FtGR8vkeqkLcj1oUGJzlR1fw=;
 b=cqNcKM8HGk6zE3wT0HuuTV8z05vqHDfOf0AjbhRl5YZhci8eV0GI2Smpbb/oyNlkot
 xr7tHDYGg8zstLTZzzYMZ1xj1jCmW+/CPl25rpZUniJ/mEQYo7xVvrs0nO1TPaXwqAQU
 nJvRf7/YYExryHzud4CUUvb3z48FeIY912lLBsCXQ4r5lt/V5v27W588quzCaxui/muf
 qNsoLqa0Dqhul7rf8HrIExvn3XmE/lq+2yq5GoR+QgoH5lJ1Yo7cjeXf+id4fsQ30Zyb
 rF3+/kpPFMWS4ztDNRm0AvFitHc0DZGe9Z3xTdfbN8IA6INaHC35B4BPF1LgaN1cvqnV
 1bWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbpBieUuzoPA3lB32ocNgJTDa0fo/VkMiiFjFvEXcV6k1Eq9hjN8wdE7J9Zl5wcD+WMxHPmQuAOAuRCrmM3llG0rf3uixiQuFGpmzIM6uVEee0/khEIAPG
X-Gm-Message-State: AOJu0Yw6ExxiutfvgS0Ln5Z1nmP0mOmAF8grreJge1LquHkcWKYs0S+A
 xFY26WLnlu8IGQD2aLtrbhWU9AYYggwcDdGFSrb8hcwZC4I6iWfI
X-Google-Smtp-Source: AGHT+IH5nG+woSZE5slYDOLAGQomRFgwgnnIIYEPGWVZEfq0Lp6lq6bTwAH998gKRg6GsNujcv7Hgw==
X-Received: by 2002:a05:6e02:1568:b0:36c:b88:e492 with SMTP id
 k8-20020a056e02156800b0036c0b88e492mr2924351ilu.19.1713968994873; 
 Wed, 24 Apr 2024 07:29:54 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056638300d00b00482b12a0776sm4232950jak.27.2024.04.24.07.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:29:54 -0700 (PDT)
Date: Wed, 24 Apr 2024 17:29:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <qf637dtkakxbumefbei3qrhbpyxgerjwn72ixp5xh6mc6yjbda@6z6tm6hk7fki>
References: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
 <20240424-rzn1-gmac1-v4-2-852a5f2ce0c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-rzn1-gmac1-v4-2-852a5f2ce0c0@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/5] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

Hi Romain

On Wed, Apr 24, 2024 at 11:06:20AM +0200, Romain Gantois wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Introduce a mechanism whereby platforms can create their PCS instances
> prior to the network device being published to userspace, but after
> some of the core stmmac initialisation has been completed. This means
> that the data structures that platforms need will be available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [rgantois: removed second parameters of new callbacks]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++++
>  include/linux/stmmac.h                            |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 59bf83904b62d..bee9c9ab31a88 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7200,6 +7200,12 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	if (ret)
>  		return ret;
>  
> +	if (priv->plat->pcs_init) {
> +		ret = priv->plat->pcs_init(priv);
> +		if (ret)
> +			return ret;
> +	}
> +

Once again. There is a ready-to-use stmmac_xpcs_setup() method. Which
is currently intended for the XPCS setups. Let's collect all the
PCS-related stuff in a single place there. That will make code cleaner
and easier to read. This was discussed on v3:

https://lore.kernel.org/netdev/42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf/

You agreed to do that, but just ignored in result. I'll repeat what I
said in v3:

On Tue, 16 Apr 2024 16:41:33 +0300, Serge Semin wrote:
> I am currently working on my Memory-mapped DW XPCS patchset cooking:
> https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com/
> The changes in this series seems to intersect to what is/will be
> introduced in my patchset. In particular as before I am going to
> use the "pcs-handle" property for getting the XPCS node. If so what
> about collecting PCS-related things in a single place. Like this:
>
> int stmmac_xpcs_setup(struct net_device *ndev)
> {
> 	...
> 
> 	if (priv->plat->pcs_init) {
> 		return priv->plat->pcs_init(priv); /* Romain' part */
> 	} else if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
> 		/* My DW XPCS part */
> 	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> 		/* Currently implemented procedure */
> 	}
> 
> 	...
> }
>
> void stmmac_xpcs_clean(struct net_device *ndev)
> {
> 	...
> 
> 	if (priv->plat->pcs_exit) {
> 		priv->plat->pcs_exit(priv);
> 		return;
> 
> 	}
> 
> 	xpcs_destroy(priv->hw->xpcs);
> 	priv->hw->xpcs = NULL;
> }
> 
> Please see the last two patches in my series:
> https://lore.kernel.org/netdev/20231205103559.9605-16-fancer.lancer@gmail.com/
> https://lore.kernel.org/netdev/20231205103559.9605-17-fancer.lancer@gmail.com/
> as a reference of how the changes could be provided.

You replied it was a good idea, but the function names should be
renamed. That's not a problem. Just create a pre-requisite patch which
does that. So the patch in the subject could be replaced with four
subsequent patches:

1. Move the conditional XPCS-setup execution into the
stmmac_xpcs_setup() method. This change is partly implemented here
https://lore.kernel.org/netdev/20231205103559.9605-17-fancer.lancer@gmail.com/

2. Rename stmmac_xpcs_setup() method to just stmmac_pcs_setup() as a
preparation before adding the platform-specific PCS init()/exit()
callbacks.

3. Introduce the PCS-cleanup method. You can pick it up from here, but
use the stmmac_pcs_clean() name:
https://lore.kernel.org/netdev/20231205103559.9605-16-fancer.lancer@gmail.com/

4. Add pcc_init()/pcs_exit() callbacks as it's done in this patch but
call them in the stmmac_pcs_setup()/stmmac_pcs_clean() methods
instead of open-coding in the more generic
stmmac_hw_init()/stmmac_hw_exit() functions.

It doesn't look as that much hard thing to do, but will cause having a
better readable code by providing a single coherent function for all
PCS'es.

-Serge(y)

>  	/* Get the HW capability (new GMAC newer than 3.50a) */
>  	priv->hw_cap_support = stmmac_get_hw_features(priv);
>  	if (priv->hw_cap_support) {
> @@ -7282,6 +7288,12 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	return 0;
>  }
>  
> +static void stmmac_hw_exit(struct stmmac_priv *priv)
> +{
> +	if (priv->plat->pcs_exit)
> +		priv->plat->pcs_exit(priv);
> +}
> +
>
> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
