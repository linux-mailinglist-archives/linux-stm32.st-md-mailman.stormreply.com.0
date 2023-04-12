Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BC6DEC18
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 08:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49B86C65E4F;
	Wed, 12 Apr 2023 06:50:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39A31C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 06:40:44 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ABF62FF806;
 Wed, 12 Apr 2023 06:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681281643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0inNdIAr829fr5K7PpU7etdJAAGCFNAmGQoieYPHcMs=;
 b=Kf6wrkZVYcGH40qojFViQ1U6OtDYwiD3KoDZyfc7LKCwqKFh0RSWyZFJWaN3XKFpAzd+od
 zMR4e2JrTgwnWyapS3bA6zmXOrZ++EB1+ZJAC8kbQ6a+UCXr0znrcB5ike8QnOTySXMAwi
 Eygdi0gAppNGzFzR+QxdUCrjcHjeGqqWgv3hkfkskEW/KSRN+5ex8E7tdPryUW7G2Zv0lA
 O+tDBtJJjeuzbOcaLPY0/nxanMaRYdF0qthFaLeyl9QQNuu41JoWIPGs6LdAkO10+kty6L
 RsVE1ZseC8SBwX++ZknMgAscxKqszVhUtclZo+5GFgXBSKNB9MELY13MGrpK4w==
Date: Wed, 12 Apr 2023 10:38:12 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20230412103812.45e52ab5@pc-288.home>
In-Reply-To: <20230330091404.3293431-2-michael.wei.hong.sit@intel.com>
References: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
 <20230330091404.3293431-2-michael.wei.hong.sit@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Apr 2023 06:50:30 +0000
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, linux@armlinux.org.uk,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "alexis.lothore@bootlin.com" <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net v5 1/3] net: phylink: add
 phylink_expects_phy() method
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

Hello everyone,

On Thu, 30 Mar 2023 17:14:02 +0800
Michael Sit Wei Hong <michael.wei.hong.sit@intel.com> wrote:

> Provide phylink_expects_phy() to allow MAC drivers to check if it
> is expecting a PHY to attach to. Since fixed-linked setups do not
> need to attach to a PHY.
> 
> Provides a boolean value as to if the MAC should expect a PHY.
> Returns true if a PHY is expected.

I'm currently working on the TSE rework for dwmac_socfpga, and I
noticed one regression since this patch, when using an SFP, see details
below :

> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> ---
>  drivers/net/phy/phylink.c | 19 +++++++++++++++++++
>  include/linux/phylink.h   |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 1a2f074685fa..30c166b33468 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1586,6 +1586,25 @@ void phylink_destroy(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_destroy);
>  
> +/**
> + * phylink_expects_phy() - Determine if phylink expects a phy to be
> attached
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * When using fixed-link mode, or in-band mode with 1000base-X or
> 2500base-X,
> + * no PHY is needed.
> + *
> + * Returns true if phylink will be expecting a PHY.
> + */
> +bool phylink_expects_phy(struct phylink *pl)
> +{
> +	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
> +	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> +	     phy_interface_mode_is_8023z(pl->link_config.interface)))

From the discussion, at one point Russell mentionned [1] :
"If there's a sfp bus, then we don't expect a PHY from the MAC driver
(as there can only be one PHY attached), and as phylink_expects_phy()
is for the MAC driver to use, we should be returning false if
pl->sfp_bus != NULL."

This makes sense and indeed adding the relevant check solves the issue.

Am I correct in assuming this was an unintentional omission from this
patch, or was the pl->sfp_bus check dropped on purpose ?

> +		return false;
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(phylink_expects_phy);

Thanks,

Maxime

[1] :
https://lore.kernel.org/netdev/ZCQJWcdfmualIjvX@shell.armlinux.org.uk/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
