Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 216018A6580
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:55:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C73EFC6B45B;
	Tue, 16 Apr 2024 07:55:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DB50C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:55:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B3FEFF802;
 Tue, 16 Apr 2024 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713254157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MNHJECVaeH5Bqcxn+tWmMLACctSfkhVXpwFzee2HMAk=;
 b=LtugVChyoDxebpXTrApSPFU1i07DT8qK9YJEwMwn/0JmI6ndkLuG22gdGgU0V+VI9K923L
 CK6F7wKZ7kaniEyTR5uvoEug6BjcnL1a/xdRTo1RsS1ZyHpnWZ8z14QKM7oMhRF+mWiy92
 vWxP33Z9hLCY2jjTfrGbZRZ5gTmEdY8bEl7vj1HjfNZ8dF685mQdeRCVSdB/IHcemRbh/s
 3xvMTWwNHqrUJxfAw7f5LSxNhnI4n+aw+YjU/IwJxsHyFLkYUsvcULOiA2MmqKyVkTCXZj
 QblLIhQt69FkaNO52lwcj+uADa+0o9vJMWZ7Sx51X+/M7rkz+wjyn/uqUU4ozQ==
Date: Tue, 16 Apr 2024 09:56:32 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <20240412180340.7965-5-fancer.lancer@gmail.com>
Message-ID: <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

Hi Serge,

On Fri, 12 Apr 2024, Serge Semin wrote:

> +static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> +					 phy_interface_t interface)
> +{
> +	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> +
> +	/* Get the MAC-specific capabilities */
> +	stmmac_mac_phylink_get_caps(priv);

This is a bit of a nitpick, but the terminology is quite confusing between 
stmmac_mac_phylink_get_caps() and stmmac_mac_get_caps(). Ideally, we could just 
get rid of the whole stmmac_do_void_callback() complexity and just call 
phylink_get_caps() directly. In the meantime, maybe renaming this to 
stmmac_mac_core_get_caps() would be acceptable?

Please let me know what you think.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
