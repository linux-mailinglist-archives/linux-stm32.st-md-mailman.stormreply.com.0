Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B872D079
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81273C6A617;
	Mon, 12 Jun 2023 20:33:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78229C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686601981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=43J77l2MjvOeufIj2deKwRG8u6kAZJyfknPdAW9w59s=;
 b=eBMuakVeMcC3eJgG5Srv803mdjUq+MiQNbICVR9CFATsN7bs5PiH8N9HBpWsW5Ptfjk0kU
 diXw7VK5JvY3PSuNcv2DYlAeYvLsr1QleXvhcPPE1UwUnJ2bD90YJaXiNx7nYE8HpbVUJH
 UG+ptB9jN0lWuhlsMfebI61vZusdmpc=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-qMpn-yoiP7S50GvZM1Pi0g-1; Mon, 12 Jun 2023 16:33:00 -0400
X-MC-Unique: qMpn-yoiP7S50GvZM1Pi0g-1
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-558b7c65e3bso2551628eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686601979; x=1689193979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43J77l2MjvOeufIj2deKwRG8u6kAZJyfknPdAW9w59s=;
 b=IHXrSkZtvKNChv6iANigysoe+H1E7wNQyGgwAJwqjEZEm8c0dLR2yDoye5ghoyX8kj
 1L7dvRzEWTiA/YRXoIiXqF6QnMFVhBhYyrTGGFtsYizDkhEIecu8QhGa7r8rsXwzjmmm
 hu7cSR2jBPZxBDPtZVTqqXl7QODkLUDId3t3U/MdNDcdGjCrsLuzjRNjpsUETt5sEspp
 I9JhwV81dJurWcEmUw4ZE030aXKifCDjLIdJNfJBeyH0PSk6EBIUV8vbu6hGo07mW49l
 /qq62xcIr6uibyCZq9OD3h5bAHSwJiD3GV2BM0GE7vMxMTKS9q+DjqcLer3Qqbu/DU2m
 X52Q==
X-Gm-Message-State: AC+VfDxXyluSdEq7afzyfbjsUizh0Dlb7xOgeE9wsnLZjOWSEylzTCak
 LWNxNnDxsdC/sjgee9N88FtQcwwQIz4IBXutJm5WSn8Tvso4thwOkKuT9GI4S15ZO2ssFDxP6vv
 P++dzTVkHHqjq9Nd3nHGQ+n+VyZhQetBRAXUWlOWi
X-Received: by 2002:a4a:eac3:0:b0:558:b3f1:1081 with SMTP id
 s3-20020a4aeac3000000b00558b3f11081mr5365961ooh.9.1686601979256; 
 Mon, 12 Jun 2023 13:32:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vKyZqmPyAlZrIvh+fzGMNtvVVMAbuUA5odR16L7SaZeByU3UDtpAZGSfSXxbwRc/TkU6rpw==
X-Received: by 2002:a4a:eac3:0:b0:558:b3f1:1081 with SMTP id
 s3-20020a4aeac3000000b00558b3f11081mr5365934ooh.9.1686601978975; 
 Mon, 12 Jun 2023 13:32:58 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a4aa804000000b0055affd1ca3csm3556530oom.1.2023.06.12.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:32:58 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:32:55 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612203255.72t52ucry7zzq3em@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-13-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-13-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 12/26] net: stmmac: dwmac-qcom-ethqos: add
 support for the optional serdes phy
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

On Mon, Jun 12, 2023 at 11:23:41AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p platforms, there's a SGMII SerDes PHY between the MAC and
> external PHY that we need to enable and configure.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8ed05f29fe8b..3438b6229351 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
> +#include <linux/phy/phy.h>
>  #include <linux/property.h>
>  
>  #include "stmmac.h"
> @@ -93,6 +94,7 @@ struct qcom_ethqos {
>  
>  	unsigned int rgmii_clk_rate;
>  	struct clk *rgmii_clk;
> +	struct phy *serdes_phy;
>  	unsigned int speed;
>  
>  	const struct ethqos_emac_por *por;
> @@ -566,6 +568,30 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed)
>  	ethqos_configure(ethqos);
>  }
>  
> +static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	int ret;
> +
> +	ret = phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_init(ethqos->serdes_phy);
> +	if (ret)
> +		return ret;
> +
> +	return phy_power_on(ethqos->serdes_phy);

The docs say (phy.rst):

    The general order of calls should be::

        [devm_][of_]phy_get()
        phy_init()
        phy_power_on()
        [phy_set_mode[_ext]()]
        ...
        phy_power_off()
        phy_exit()
        [[of_]phy_put()]

    Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
    but controllers should always call these functions to be compatible with other
    PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
    others may use a default mode (typically configured via devicetree or other
    firmware). For compatibility, you should always call this function if you know
    what mode you will be using. Generally, this function should be called after
    :c:func:`phy_power_on`, although some PHY drivers may allow it at any time.

Not really dictating you need to do that order, but if possible I think
calling phy_set_speed after init + power_on is more generic. Not sure if
that plays nice with the phy driver in this series or not.

Otherwise, I think this looks good.

> +}
> +
> +static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	phy_power_off(ethqos->serdes_phy);
> +	phy_exit(ethqos->serdes_phy);
> +}
> +
>  static int ethqos_clks_config(void *priv, bool enabled)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> @@ -651,6 +677,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_config_dt;
>  
> +	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
> +	if (IS_ERR(ethqos->serdes_phy)) {
> +		ret = PTR_ERR(ethqos->serdes_phy);
> +		goto out_config_dt;
> +	}
> +
>  	ethqos->speed = SPEED_1000;
>  	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
>  	ethqos_set_func_clk_en(ethqos);
> @@ -666,6 +698,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
>  		plat_dat->rx_clk_runs_in_lpi = 1;
>  
> +	if (ethqos->serdes_phy) {
> +		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
> +		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
> +	}
> +
>  	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
>  	if (ret)
>  		goto out_config_dt;
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
