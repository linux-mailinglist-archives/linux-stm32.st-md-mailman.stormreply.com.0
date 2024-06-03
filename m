Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF848D7DE7
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 10:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E143C6B47E;
	Mon,  3 Jun 2024 08:54:34 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 012F5C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 08:54:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52b9af7a01bso816442e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jun 2024 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717404866; x=1718009666;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NY422RM8D/dbgd/9UPZ5mROW0tVlpPtXiW4z+0KlNnE=;
 b=UVbH6oJZeh9Tn7/TT06AvvoLYKtbb0XTgBmSqCsnimjVbZF900hsjveKXpBxMa0+GN
 YTIE4VGqt+v3sECxibwmbQ54wGL/S4ZUSOUFI9KkraN4OZXLmYQKWETdiQsfQ6zo1pWF
 Wd/dDFSdyiOtsqY1Tvl1nAyjSGdx4e1kX8s6Fh+IstxP5ZtmbnGLGVf7SFsK9PuJye50
 aZgr6Y9v0EPrk/xbMmyFVCiL3zA06G5BuPOit96ZkYVYsacyciyHILdJlv+1IzN7d+93
 jk4BQV4vq+quhDQqpDPMNzrY4uv++QP6+4erdvYzx9+K9A/H2j6CjnHBUbhsxbxuVEuO
 cAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717404866; x=1718009666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NY422RM8D/dbgd/9UPZ5mROW0tVlpPtXiW4z+0KlNnE=;
 b=U0nZBSuqPE5kXxcDYI74Tcq+02tVvfv+9BrkgVPzTxi5+019u1dRHFd+6DF//oUkaC
 +wEkq8TbbzPyH+nJ4g0KOQ7vaPRA1Z8oMh6XEp2MPARV7SShDkqtKeFxX8CFw9AM3WT4
 uY4huQ+0AtzLt6rD94xMD0Qr7FrsFKevM9CYqAWk1TUNRpFQIdZx/fKVqFIuxKVn4hPM
 tEi9GM1cn/5ZKpl56sn2/FLEdLFdqpdvIUiQIlYZinvTzZOAp6/SQrY7Ws9zTe4MgBsY
 E7zRrvHohX30UNE2MoTkSJdA7WQwDR2sSIdBIKePWIFikL75S959HoVFPf9iq/RJ1RUa
 MQuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAh6DAAIGOK8J13qJj9hGaQnymS0nd7AXi+RniRkYgA6RP0DwmmAO4Idd2f0dMT7UegRsq9b/hZjHdgockPo40kkNz0l8E24qV08gA3u9Kw+wki3bGSQmf
X-Gm-Message-State: AOJu0YxoT8Zt5h6Ydk4EVOLgfSKQl1Gzb6+d7eixN+xpp/HUxwsWUaTa
 jXJHhQI6uP5X67WrEJ6MO139/MIaUzIL/H1GKcu6He4/Hjlw/dkc
X-Google-Smtp-Source: AGHT+IGmEy0pYkF0twnrOuWMhktsYiK7HkcxKp/i55MnzurvZ0bHVnO1byEssKtiE9Jq5GqpgYVslA==
X-Received: by 2002:a05:6512:1152:b0:52b:9c8a:735a with SMTP id
 2adb3069b0e04-52b9c8a74fcmr1011745e87.40.1717404866030; 
 Mon, 03 Jun 2024 01:54:26 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b97571ba8sm437665e87.205.2024.06.03.01.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 01:54:25 -0700 (PDT)
Date: Mon, 3 Jun 2024 11:54:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240602143636.5839-11-fancer.lancer@gmail.com>
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/10] net: stmmac: Add DW
 XPCS specified via "pcs-handle" support
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

On Sun, Jun 02, 2024 at 05:36:24PM +0300, Serge Semin wrote:
> Recently the DW XPCS DT-bindings have been introduced and the DW XPCS
> driver has been altered to support the DW XPCS registered as a platform
> device. In order to have the DW XPCS DT-device accessed from the STMMAC
> driver let's alter the STMMAC PCS-setup procedure to support the
> "pcs-handle" property containing the phandle reference to the DW XPCS
> device DT-node. The respective fwnode will be then passed to the
> xpcs_create_fwnode() function which in its turn will create the DW XPCS
> descriptor utilized in the main driver for the PCS-related setups.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 807789d7309a..dc040051aa53 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -497,15 +497,22 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  
>  int stmmac_pcs_setup(struct net_device *ndev)
>  {
> +	struct fwnode_handle *devnode, *pcsnode;
>  	struct dw_xpcs *xpcs = NULL;
>  	struct stmmac_priv *priv;
>  	int addr, mode, ret;
>  
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
> +	devnode = priv->plat->port_node;
>  
>  	if (priv->plat->pcs_init) {
>  		ret = priv->plat->pcs_init(priv);

> +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> +		fwnode_handle_put(pcsnode);
> +		ret = PTR_ERR_OR_ZERO(xpcs);

Just figured, we might wish to be a bit more portable in the
"pcs-handle" property semantics implementation seeing there can be at
least three different PCS attached:
DW XPCS
Lynx PCS
Renesas RZ/N1 MII

Any suggestion of how to distinguish the passed handle? Perhaps
named-property, phandle argument, by the compatible string or the
node-name?

-Serge(y)

>  	} else if (priv->plat->mdio_bus_data &&
>  		   priv->plat->mdio_bus_data->has_xpcs) {
>  		addr = priv->plat->mdio_bus_data->xpcs_addr;
> @@ -515,10 +522,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  		return 0;
>  	}
>  
> -	if (ret) {
> -		dev_warn(priv->device, "No xPCS found\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->device, ret, "No xPCS found\n");
>  
>  	priv->hw->xpcs = xpcs;
>  
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
