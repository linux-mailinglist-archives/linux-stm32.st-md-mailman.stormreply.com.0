Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBB7AEAC5
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Sep 2023 12:52:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 554DEC6A5EA;
	Tue, 26 Sep 2023 10:52:06 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 268F7C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 10:52:05 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso141331641fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695725524; x=1696330324;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qddpFrAbHgrI9I4qDNwU5xvTVB3IzX2OJ7vgquZmuOo=;
 b=EzuPeXI1yTVuCnzCTOY1ARA1NoDOjL3GmKHpGzlXhfN0Uq9vPhH689nnJzErfHTH5q
 8rdyLS7+Bz36BEyZKOId0K8L2qldX2cQ6z6bVs9OyfnUXtKq74cy0xDhKyX6eAhHhm+k
 +rsrT+wkwRwbSBstavolrNfkAo7p8tayuSpVqUmLEkrYzDEpSUI50uxMfXUsK9pwp/kr
 f6ox+oqAoRsqdPqMnz+XadpmJOAWOYOMQjhoncyjeQqVQdpXLPAD+AOLPDEs3g9EZu58
 HQprqQzuIZnxnfOowK5adXhw2MdO8+Bze2iA1NCQyD6IrPqFGSaDmcZmPzwmCUY6cZdq
 zH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695725524; x=1696330324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qddpFrAbHgrI9I4qDNwU5xvTVB3IzX2OJ7vgquZmuOo=;
 b=qzpSd6hm6wg6FlszOMgLSDvj+8pxGsttgaB0uXS8G6uVvLMKz5EaZp1yoQbD+uzPnA
 qwu9sIjm4CZI6GCnyD8QJ58XO71GOTIwwiaR8Z9GNBoQe9Q2nRoLh0YBdJm8rspfT5fE
 Q8LC9aoFf4YH7wWnkL+4y1VycWdn00qYQe40hjUZxE2cSUSrBoPnPc4XzWWh7UBLjQm2
 wzv9MJxudbkaKy0Sbcnam2rCqwC3kGPCB0MAt6jIVB7E+n3W/3R4e1ibhIHxOLAz3WI2
 LCtGaUNWa2xbObUloaMk/jKA/wy+vHO1euZAJ4Siswv1+vzJ+S2yvzX0jUAsvFsGOK75
 flBA==
X-Gm-Message-State: AOJu0YzDS6aadzvGCsMg0p3QkUmOyU7nnCTHJ0SCLC8oz8bUEeZO2wm8
 BkAlo6gT+8WVrWEid9fXN2I=
X-Google-Smtp-Source: AGHT+IHSoFKqX0fg4X/60v5LLHrytvVwsD0oPAsS9XDYQtQ0atkHkPuaXxm6c3eyVBDTG5qsh0EXbA==
X-Received: by 2002:a2e:be89:0:b0:2c1:522a:8e1b with SMTP id
 a9-20020a2ebe89000000b002c1522a8e1bmr7697238ljr.51.1695725523667; 
 Tue, 26 Sep 2023 03:52:03 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a2e6a04000000b002b95eb96ab7sm2575327ljc.18.2023.09.26.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 03:52:03 -0700 (PDT)
Date: Tue, 26 Sep 2023 13:51:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
Message-ID: <ogrj3h65cpzmrtbv3antnxht5ebrxzzex4snj6oeqxzdtsvqeh@a5tq5ozokjr5>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921121946.3025771-3-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/5] net: pcs: xpcs: combine
 C37 SGMII AN and 2500BASEX for Intel mGbE controller
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

Hi Choong

On Thu, Sep 21, 2023 at 08:19:43PM +0800, Choong Yong Liang wrote:
> From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
> 
> This commit introduces xpcs_sgmii_2500basex_features[] that combine
> xpcs_sgmii_features[] and xpcs_2500basex_features[] for Intel mGbE
> controller that desire to interchange the speed mode of
> 10/100/1000/2500Mbps at runtime.
> 
> Also, we introduce xpcs_config_aneg_c37_sgmii_2500basex() function
> which is called by the xpcs_do_config() with the new AN mode:
> DW_SGMII_2500BASEX, and this new function will proceed next-level
> calling to perform C37 SGMII AN/2500BASEX configuration based on
> the PHY interface updated by PHY driver.

Why do you even need all of those changes? Please thoroughly justify
because ... (see below)

> 
> Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/pcs/pcs-xpcs.c   | 72 ++++++++++++++++++++++++++++++------
>  include/linux/pcs/pcs-xpcs.h |  1 +
>  2 files changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 4dbc21f604f2..60d90191677d 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -104,6 +104,21 @@ static const int xpcs_2500basex_features[] = {
>  	__ETHTOOL_LINK_MODE_MASK_NBITS,
>  };
>  

> +static const int xpcs_sgmii_2500basex_features[] = {
> +	ETHTOOL_LINK_MODE_Pause_BIT,
> +	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
> +	ETHTOOL_LINK_MODE_Autoneg_BIT,
> +	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
> +	ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
> +	ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
> +	ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> +	ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
> +	ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +	__ETHTOOL_LINK_MODE_MASK_NBITS,
> +};
> +
>  static const phy_interface_t xpcs_usxgmii_interfaces[] = {
>  	PHY_INTERFACE_MODE_USXGMII,
>  };
> @@ -133,6 +148,12 @@ static const phy_interface_t xpcs_2500basex_interfaces[] = {
>  	PHY_INTERFACE_MODE_MAX,
>  };
>  
> +static const phy_interface_t xpcs_sgmii_2500basex_interfaces[] = {
> +	PHY_INTERFACE_MODE_SGMII,
> +	PHY_INTERFACE_MODE_2500BASEX,
> +	PHY_INTERFACE_MODE_MAX,
> +};
> +

... these are just a combination of the
xpcs_sgmii_features[]/xpcs_sgmii_interfaces[] and
xpcs_2500basex_features[]/xpcs_2500basex_interfaces[] data which are
already supported by the generic DW XPCS code. All of these features
and interfaces are checked in the xpcs_create() method and then get to
be combined in the framework of the xpcs_validate() and
xpcs_get_interfaces() functions. And ...

>  enum {
>  	DW_XPCS_USXGMII,
>  	DW_XPCS_10GKR,
> @@ -141,6 +162,7 @@ enum {
>  	DW_XPCS_SGMII,
>  	DW_XPCS_1000BASEX,
>  	DW_XPCS_2500BASEX,
> +	DW_XPCS_SGMII_2500BASEX,
>  	DW_XPCS_INTERFACE_MAX,
>  };
>  
> @@ -290,6 +312,7 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
>  	case DW_AN_C37_SGMII:
>  	case DW_2500BASEX:
>  	case DW_AN_C37_1000BASEX:
> +	case DW_SGMII_2500BASEX:
>  		dev = MDIO_MMD_VEND2;
>  		break;
>  	default:
> @@ -748,6 +771,8 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
>  	if (xpcs->dev_flag == DW_DEV_TXGBE)
>  		ret |= DW_VR_MII_DIG_CTRL1_PHY_MODE_CTRL;
>  

> +	/* Disable 2.5G GMII for SGMII C37 mode */
> +	ret &= ~DW_VR_MII_DIG_CTRL1_2G5_EN;

* This is the only specific change in this patch. But it can be
* applied independently from the rest of the changes. Although I agree
* with Russel, it must be double checked since may cause regressions
* on the other platforms.

>  	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
>  	if (ret < 0)
>  		return ret;
> @@ -848,6 +873,26 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
>  	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
>  }
>  

> +static int xpcs_config_aneg_c37_sgmii_2500basex(struct dw_xpcs *xpcs,
> +						unsigned int neg_mode,
> +						phy_interface_t interface)
> +{
> +	int ret = -EOPNOTSUPP;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		ret = xpcs_config_aneg_c37_sgmii(xpcs, neg_mode);
> +		break;
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		ret = xpcs_config_2500basex(xpcs);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +

... this is just a copy of the code which is already available in xpcs_do_config():

<        compat = xpcs_find_compat(xpcs->id, interface);
<        if (!compat)
<                return -ENODEV;
<
<        switch (compat->an_mode) {
< ...
<        case DW_AN_C37_SGMII:
<                ret = xpcs_config_aneg_c37_sgmii(xpcs, neg_mode);
<                if (ret)
<                        return ret;
<                break;
< ...
<        case DW_2500BASEX:
<                ret = xpcs_config_2500basex(xpcs);
<                if (ret)
<                        return ret;
<                break;

So based on the passed interface xpcs_find_compat() will find a proper
compat descriptor, which an_mode field will be then utilized to call
the respective config method. Thus, unless I miss something, basically
you won't need any of the changes below and the most of the changes
above reducing the patch to just a few lines.

-Serge(y)

>  int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
>  		   const unsigned long *advertising, unsigned int neg_mode)
>  {
> @@ -890,6 +935,12 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
>  		if (ret)
>  			return ret;
>  		break;
> +	case DW_SGMII_2500BASEX:
> +		ret = xpcs_config_aneg_c37_sgmii_2500basex(xpcs, neg_mode,
> +							   interface);
> +		if (ret)
> +			return ret;
> +		break;
>  	default:
>  		return -1;
>  	}
> @@ -1114,6 +1165,11 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
>  		}
>  		break;
>  	case DW_AN_C37_SGMII:
> +	case DW_SGMII_2500BASEX:
> +		/* 2500BASEX is not supported for in-band AN mode. */
> +		if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
> +			break;
> +
>  		ret = xpcs_get_state_c37_sgmii(xpcs, state);
>  		if (ret) {
>  			pr_err("xpcs_get_state_c37_sgmii returned %pe\n",
> @@ -1266,23 +1322,17 @@ static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
>  		.num_interfaces = ARRAY_SIZE(xpcs_10gbaser_interfaces),
>  		.an_mode = DW_10GBASER,
>  	},
> -	[DW_XPCS_SGMII] = {
> -		.supported = xpcs_sgmii_features,
> -		.interface = xpcs_sgmii_interfaces,
> -		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_interfaces),
> -		.an_mode = DW_AN_C37_SGMII,
> -	},
>  	[DW_XPCS_1000BASEX] = {
>  		.supported = xpcs_1000basex_features,
>  		.interface = xpcs_1000basex_interfaces,
>  		.num_interfaces = ARRAY_SIZE(xpcs_1000basex_interfaces),
>  		.an_mode = DW_AN_C37_1000BASEX,
>  	},
> -	[DW_XPCS_2500BASEX] = {
> -		.supported = xpcs_2500basex_features,
> -		.interface = xpcs_2500basex_interfaces,
> -		.num_interfaces = ARRAY_SIZE(xpcs_2500basex_interfaces),
> -		.an_mode = DW_2500BASEX,
> +	[DW_XPCS_SGMII_2500BASEX] = {
> +		.supported = xpcs_sgmii_2500basex_features,
> +		.interface = xpcs_sgmii_2500basex_interfaces,
> +		.num_interfaces = ARRAY_SIZE(xpcs_sgmii_2500basex_features),
> +		.an_mode = DW_SGMII_2500BASEX,
>  	},
>  };
>  
> diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
> index da3a6c30f6d2..f075d2fca54a 100644
> --- a/include/linux/pcs/pcs-xpcs.h
> +++ b/include/linux/pcs/pcs-xpcs.h
> @@ -19,6 +19,7 @@
>  #define DW_2500BASEX			3
>  #define DW_AN_C37_1000BASEX		4
>  #define DW_10GBASER			5
> +#define DW_SGMII_2500BASEX		6
>  
>  /* device vendor OUI */
>  #define DW_OUI_WX			0x0018fc80
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
