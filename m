Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402F809525
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 23:16:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDAB1C65E4F;
	Thu,  7 Dec 2023 22:16:17 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAE0DC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 22:16:15 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ca03103155so16860111fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 14:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701987375; x=1702592175;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dXX2SimUn48mcVbhB+e4BDcFMonTTNXXs/7BudeSvw0=;
 b=CplTTFoTZ7wk9s21g9GV0Bgl0hFAb925jF99eyMAybBZedlG0po5MRkvDPaAMEib70
 G2cApOKzIHr8vYn/Md4NaXwCoqqUInW3fmcjwexeq4W8skdJkBIYT3DiZnPVBbrv7uxp
 divdKKE8iqH78nsxUtVXM0Vsurr18mMM/FaNHMKXhrzR+F7HpDKYnmw8EoCBSgQ1AVlx
 GJlwvwcl/TShGurjVfnA7rLdHo/tMABTLnBpN+wjFBVa4a/JH8dii6AMFRyjdL57aJ3+
 CTWB5CsWVIAL3NzgV5Qnp9dzMNY46bzPK7dPSlMHBwc8OzZbthWwH9sw7wHb0dstPYgP
 /9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701987375; x=1702592175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXX2SimUn48mcVbhB+e4BDcFMonTTNXXs/7BudeSvw0=;
 b=PvUqQWDYlDu5XoBLJ3yEhsEp1JxmxhJY+zi463ByqxtkHuaGiZOGIoWQtqG1yJto2g
 kVbwomAGp8+UXuf2Rh/NqANRFisvtTp+WTdSbuOAAKAMnlG0INwmftV1NZN/JrzhRRzc
 d944Wdl1Xukf53Dgp5G6tSdd5f0u4eGzqKxZZhf70yrlwz42uBgBgE6071zGP61obm/J
 X0zqriPkdFHL+8Q0spAYQwGyWrhLIoZE3Vuuhj8FRJUxtDBSDvYIPSaJJC6iV3K7m2Df
 Rc0Dzt3COUmjDrXJt/57NAvSRHDg4oM/jy7Hs6CH+ol4WYZRHd2t6QEjhhI3A4zfcd76
 9nfQ==
X-Gm-Message-State: AOJu0YwwLzrMzqm32NHQWtoTYyLORkFP3EMA5fwCZrzoXM6TBPeSvde9
 65NeTQ3Qa8dUOQoUtevz1xw=
X-Google-Smtp-Source: AGHT+IE6LZ2v1Jvbi5K7ltNfx74fGPNBHOrCUdjDzp2zk+F1/+j+7FEfiAtOUrMFt2pO6nq5/OdvCw==
X-Received: by 2002:a2e:910c:0:b0:2ca:749:3f43 with SMTP id
 m12-20020a2e910c000000b002ca07493f43mr1236540ljg.32.1701987374730; 
 Thu, 07 Dec 2023 14:16:14 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b002ca0290a0fesm51799lja.126.2023.12.07.14.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 14:16:14 -0800 (PST)
Date: Fri, 8 Dec 2023 01:16:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: don't create a
 MDIO bus if unnecessary
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

On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> The stmmac_dt_phy() function, which parses the devicetree node of the
> MAC and ultimately causes MDIO bus allocation, misinterprets what
> fixed-link means in relation to the MAC's MDIO bus. This results in
> a MDIO bus being created in situations it need not be.
> 
> Currently a MDIO bus is created if the description is either:
> 
>     1. Not fixed-link
>     2. fixed-link but contains a MDIO bus as well
> 
> The "1" case above isn't always accurate. If there's a phy-handle,
> it could be referencing a phy on another MDIO controller's bus[1]. In
> this case currently the MAC will make a MDIO bus and scan it all
> anyways unnecessarily.
> 
> There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> be created and scanned for a phy. This case can also be inferred from
> the platform description by not having a phy-handle && not being
> fixed-link. This hits case "1" in the current driver's logic.
> 
> Let's improve the logic to create a MDIO bus if either:
> 

>     - Devicetree contains a MDIO bus
>     - !fixed-link && !phy-handle (legacy handling)

If what you suggest here is a free from regressions semantics change
(really hope it is) I will be with both my hands for it. This will
solve the problem we have with one of our device which doesn't have
SMA interface (hardware designers decided to save ~4K gates of the
chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
SMA interface available on a DW *MAC device but creating the MDIO-bus
on top of the non-existent SMA CSRs anyway causes having _32_ dummy
PHYs created with zero IDs.

> 
> Below upstream devicetree snippets can be found that explain some of
> the cases above more concretely.
> 
> Here's[0] a devicetree example where the MAC is both fixed-link and
> driving a switch on MDIO (case "2" above). This needs a MDIO bus to
> be created:
> 
>     &fec1 {
>             phy-mode = "rmii";
> 
>             fixed-link {
>                     speed = <100>;
>                     full-duplex;
>             };
> 
>             mdio1: mdio {
>                     switch0: switch0@0 {
>                             compatible = "marvell,mv88e6190";
>                             pinctrl-0 = <&pinctrl_gpio_switch0>;
>                     };
>             };
>     };
> 
> Here's[1] an example where there is no MDIO bus or fixed-link for
> the ethernet1 MAC, so no MDIO bus should be created since ethernet0
> is the MDIO master for ethernet1's phy:
> 
>     &ethernet0 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy0>;
> 
>             mdio {
>                     compatible = "snps,dwmac-mdio";
>                     sgmii_phy0: phy@8 {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0x8>;
>                             device_type = "ethernet-phy";
>                     };
> 
>                     sgmii_phy1: phy@a {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0xa>;
>                             device_type = "ethernet-phy";
>                     };
>             };
>     };
> 
>     &ethernet1 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy1>;
>     };
> 
> Finally there's descriptions like this[2] which don't describe the
> MDIO bus but expect it to be created and the whole address space
> scanned for a phy since there's no phy-handle or fixed-link described:
> 
>     &gmac {
>             phy-supply = <&vcc_lan>;
>             phy-mode = "rmii";
>             snps,reset-gpio = <&gpio3 RK_PB4 GPIO_ACTIVE_HIGH>;
>             snps,reset-active-low;
>             snps,reset-delays-us = <0 10000 1000000>;
>     };
> 
> [0] https://elixir.bootlin.com/linux/v6.5-rc5/source/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
> [1] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> [2] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/rockchip/rk3368-r88.dts#L164
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> Changes in v3:

>     - Keep logic out of stmmac_probe_config_dt() since it's already massive (Serge)

Thanks for taking my note into account. The change turned out even
better than I thought it would look like. The MDIO-bus setup procedure
is much more readable now. A small nitpick below.

> 
> Changes in v2:
>     - Handle the fixed-link + mdio case (Andrew Lunn)
>     - Reworded commit message
>     - Still handle the "legacy" case mentioned in the commit
>     - Bit further refactoring of the function for readability
> 
> - Link to v2: https://lore.kernel.org/r/20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com
> - Link to v1: https://lore.kernel.org/netdev/20230808120254.11653-1-brgl@bgdev.pl/
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 91 +++++++++++++---------
>  1 file changed, 54 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..d6079c1432c7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -296,62 +296,80 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  }
>  
>  /**
> - * stmmac_dt_phy - parse device-tree driver parameters to allocate PHY resources
> - * @plat: driver data platform structure
> - * @np: device tree node
> - * @dev: device pointer
> - * Description:
> - * The mdio bus will be allocated in case of a phy transceiver is on board;
> - * it will be NULL if the fixed-link is configured.
> - * If there is the "snps,dwmac-mdio" sub-node the mdio will be allocated
> - * in any case (for DSA, mdio must be registered even if fixed-link).
> - * The table below sums the supported configurations:
> - *	-------------------------------
> - *	snps,phy-addr	|     Y
> - *	-------------------------------
> - *	phy-handle	|     Y
> - *	-------------------------------
> - *	fixed-link	|     N
> - *	-------------------------------
> - *	snps,dwmac-mdio	|
> - *	  even if	|     Y
> - *	fixed-link	|
> - *	-------------------------------
> + * stmmac_of_get_mdio() - Gets the MDIO bus from the devicetree.
> + * @np: devicetree node
>   *
> - * It returns 0 in case of success otherwise -ENODEV.
> + * The MDIO bus will be searched for in the following ways:
> + * 1. The compatible is "snps,dwc-qos-ethernet-4.10" && a "mdio" named
> + *    child node exists
> + * 2. A child node with the "snps,dwmac-mdio" compatible is present
> + *
> + * Return: The MDIO node if present otherwise NULL
>   */
> -static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
> -			 struct device_node *np, struct device *dev)
> +static struct device_node *stmmac_of_get_mdio(struct device_node *np)
>  {
> -	bool mdio = !of_phy_is_fixed_link(np);
>  	static const struct of_device_id need_mdio_ids[] = {
>  		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
>  		{},
>  	};
> +	struct device_node *mdio_node = NULL;
>  
>  	if (of_match_node(need_mdio_ids, np)) {
> -		plat->mdio_node = of_get_child_by_name(np, "mdio");
> +		mdio_node = of_get_child_by_name(np, "mdio");
>  	} else {
>  		/**
>  		 * If snps,dwmac-mdio is passed from DT, always register
>  		 * the MDIO
>  		 */
> -		for_each_child_of_node(np, plat->mdio_node) {
> -			if (of_device_is_compatible(plat->mdio_node,
> +		for_each_child_of_node(np, mdio_node) {
> +			if (of_device_is_compatible(mdio_node,
>  						    "snps,dwmac-mdio"))
>  				break;
>  		}
>  	}
>  
> -	if (plat->mdio_node) {
> +	return mdio_node;
> +}
> +
> +/**
> + * stmmac_mdio_setup() - Populate platform related MDIO structures.
> + * @plat: driver data platform structure
> + * @np: devicetree node
> + * @dev: device pointer
> + *
> + * This searches for MDIO information from the devicetree.
> + * If an MDIO node is found, it's assigned to plat->mdio_node and
> + * plat->mdio_bus_data is allocated.
> + * If no connection can be determined, just plat->mdio_bus_data is allocated
> + * to indicate a bus should be created and scanned for a phy.
> + * If it's determined there's no MDIO bus needed, both are left NULL.
> + *
> + * This expects that plat->phy_node has already been searched for.
> + *
> + * Return: 0 on success, errno otherwise.
> + */
> +static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
> +			     struct device_node *np, struct device *dev)
> +{
> +	bool legacy_mdio;
> +
> +	plat->mdio_node = stmmac_of_get_mdio(np);
> +	if (plat->mdio_node)
>  		dev_dbg(dev, "Found MDIO subnode\n");
> -		mdio = true;
> -	}
>  
> -	if (mdio) {
> -		plat->mdio_bus_data =
> -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> -				     GFP_KERNEL);

> +	/* Legacy devicetrees allowed for no MDIO bus description and expect
> +	 * the bus to be scanned for devices. If there's no phy or fixed-link
> +	 * described assume this is the case since there must be something
> +	 * connected to the MAC.
> +	 */
> +	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
> +	if (legacy_mdio)
> +		dev_info(dev, "Deprecated MDIO bus assumption used\n");
> +
> +	if (plat->mdio_node || legacy_mdio) {
> +		plat->mdio_bus_data = devm_kzalloc(dev,

Special thanks for adding the comment above this code. It will really
save time of figuring out why MDIO-bus needs to be created anyway.

> +						   sizeof(struct stmmac_mdio_bus_data),

Should v4 is required I would suggest to change this to
sizeof(*plat->mdio_bus_data).

Anyway feel free to add:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> +						   GFP_KERNEL);
>  		if (!plat->mdio_bus_data)
>  			return -ENOMEM;
>  
> @@ -471,8 +489,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	if (of_property_read_u32(np, "snps,phy-addr", &plat->phy_addr) == 0)
>  		dev_warn(&pdev->dev, "snps,phy-addr property is deprecated\n");
>  
> -	/* To Configure PHY by using all device-tree supported properties */
> -	rc = stmmac_dt_phy(plat, np, &pdev->dev);
> +	rc = stmmac_mdio_setup(plat, np, &pdev->dev);
>  	if (rc)
>  		return ERR_PTR(rc);
>  
> 
> ---
> base-commit: fd8a79b63710acb84321be3ce74be23c876873fb
> change-id: 20231127-stmmac-no-mdio-node-1db9da8a25d9
> 
> Best regards,
> -- 
> Andrew Halaney <ahalaney@redhat.com>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
