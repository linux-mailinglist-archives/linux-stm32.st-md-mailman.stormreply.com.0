Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F656D846F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 19:02:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4809C6A606;
	Wed,  5 Apr 2023 17:02:21 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5459EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 17:02:20 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-17fcc07d6c4so25159644fac.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Apr 2023 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680714139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=wJdooDkKozVkmq/jE5ZIJWHR45XBypuBSfKalkLMI0w=;
 b=lhndkTBq464U/Xt0gXIA3bzt6cy6hrEA9CqJAkmYdK2UONW6KBlkuDpUphZApxzZ9o
 yH+WHRlywqpAaRY1ZtroZg+JfQkLAfyKahIkrCYlwB8BXLszNLKTUN0LxaTxuFJpxv/J
 S2qbhbPM09ZG6KYFJPTlz29MDb3EjQCWPS/ogkmwnK4Ok3hQVrUk8DaF1hLSvfHFz2MM
 IN/5d8GU44EBeqpNMLWKF4dmwjDfDmJYym1vvYwa+NWi0bSwStQADBYpJ2H27HZ2SAUm
 +VswydxOZfluEWZLiH8oDcX3aCdtzHI8rUg8jISF3gXISZ067fWckPPrRZxI4ec1rMwD
 FOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680714139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJdooDkKozVkmq/jE5ZIJWHR45XBypuBSfKalkLMI0w=;
 b=U2bGng6TScf3T/G5hqh7OZor9q2S8r8L1CQsKULc4M0VCmbR/dWE8xpEzKeLxFKtkZ
 9fmaZYGTyxKR2vYjzkcqOiF6xKIK7iVKHWqxNHNl5uvyBZNrUevPvz9fuqFxj9NPTlLC
 wIMgQrSbRFpTud1QS/Emckn2ueZrtcyb+KcxB52KXNvZ2NHHAyR6LyO4/3vvW3HqvmQP
 c3JKLfdCK+bXXp47LUsuzO7TwpavLoyTP4f7O1U96OQQb/plg1Fg+3Iz82o2y8uiZv79
 PNXC7NK50lm5hcfEJXuJEkt8zipOJkeExTy22WoeG+svxf+RFNSCjjA53H7ta5PJweYq
 qK/g==
X-Gm-Message-State: AAQBX9cPNAn8N473VRh+3LZqWmg5vccVyK1UjTMJNBJTfbBqe2JKsGAe
 td23jfxbFKm5g7K2wCG0YtB+Zgof9Us=
X-Google-Smtp-Source: AKy350Y+q+FZUc+o6NJRWKav1W5Jicca/zmUWi5GHYLjZcSC8DIl2a9Q6sS0FbYDYCYe31KADbNeuQ==
X-Received: by 2002:a05:6870:6025:b0:17a:cb34:758a with SMTP id
 t37-20020a056870602500b0017acb34758amr4109941oaa.34.1680714139060; 
 Wed, 05 Apr 2023 10:02:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a0568301e0f00b006a1508d348dsm7177806otr.22.2023.04.05.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:02:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:02:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <5bb39f85-7ef0-4cbb-a06b-0d6431ab09b7@roeck-us.net>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
 <20230324081656.2969663-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324081656.2969663-3-michael.wei.hong.sit@intel.com>
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: check if MAC
 needs to attach to a PHY
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

On Fri, Mar 24, 2023 at 04:16:55PM +0800, Michael Sit Wei Hong wrote:
> After the introduction of the fixed-link support, the MAC driver
> no longer attempt to scan for a PHY to attach to. This causes the
> non fixed-link setups to stop working.
> 
> Using the phylink_expects_phy() to check and determine if the MAC
> should expect and attach a PHY.
> 
> Fixes: ab21cf920928 ("net: stmmac: make mdio register skips PHY scanning for fixed-link")
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Signed-off-by: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>

With this patch in linux-next, the orangepi-pc qemu emulation fails to
bring up the Ethernet interface. The following error is seen.

[   12.482401] dwmac-sun8i 1c30000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   12.487789] dwmac-sun8i 1c30000.ethernet eth0: PHY [mdio_mux-0.1:01] driver [Generic PHY] (irq=POLL)
[   12.488177] dwmac-sun8i 1c30000.ethernet eth0: no phy found
[   12.488295] dwmac-sun8i 1c30000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)

Reverting this patch fixes the problem.

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8f543c3ab5c5..41f0f3b74933 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1135,6 +1135,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	struct fwnode_handle *fwnode;
> +	bool phy_needed;
>  	int ret;
>  
>  	fwnode = of_fwnode_handle(priv->plat->phylink_node);
> @@ -1144,10 +1145,11 @@ static int stmmac_init_phy(struct net_device *dev)
>  	if (fwnode)
>  		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
>  
> +	phy_needed = phylink_expects_phy(priv->phylink);
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!fwnode || ret) {
> +	if (!fwnode || phy_needed || ret) {

I don't really understand this condition. It starts taking this path even if ret == 0
and fwnode != NULL if phy_needed is set. That means this path is now taken even if
phylink_fwnode_phy_connect() returned no error. That seems odd.

Guenter

>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;
>  
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
