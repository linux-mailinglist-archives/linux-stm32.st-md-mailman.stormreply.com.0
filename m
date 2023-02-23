Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3756A05A1
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 11:09:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6850C6A5F8;
	Thu, 23 Feb 2023 10:09:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C59FEC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 10:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677146950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkvJTf97FKy/fS5owtL2kbI4ZWoazZ97WEJk/xaK81w=;
 b=Gj0sTnvLeUlPWYOiGUcXMpWrYN+YtB0lMe/IaegX1ZESJRzt0nZsvnlj1aW1LH2yXmM8nT
 SXS7clUBtICUovz/9kN1zFCM1nNAh155AW0ncdClRX+VNtLXe5fwj6FbNUX1qUIE9/rC7j
 AwgIhqyWdY7ounACsUMXrto+CrNMu+I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-LH6oTOZtMTqrxtnWKdO2qQ-1; Thu, 23 Feb 2023 05:09:09 -0500
X-MC-Unique: LH6oTOZtMTqrxtnWKdO2qQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk15-20020a05620a1a0f00b00741d6880f38so4308590qkb.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 02:09:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677146949;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MwNi2R/qfei2F24G6SnycO92yZ0kjnuQBMoTKw0Q4E8=;
 b=w3HMq/FjkP2voqiRnnzAbMDZ5vDXoAB7qJ2o2sCKBFOUfyPRZoRISmmk7zOmMLdE1R
 FQop/lDhW8KKhKHWID0bctvqiPdj7z8uLnrjYmCKT3bg26OJWGRgf2n2cjPTzF/FgDRm
 IYmx3tGFwJx8us/7DLgshYp4zYOFMyUzQR8jk5nLF9fX5lavq3rG3t2Z7L/Z6JmfX7wX
 5X281MM1BFd3jhWFcqxPuLM9I6UavMXCKyt0tqqBZrb57T8FQ/cu5vGwwiYavYYm8Xbo
 zJOQNlxPlh6LJm2cd51VajK8MaIuV+1vPr76JfGrg/JvsKFc9B23wbPiXjrNfeKVQBBf
 viVg==
X-Gm-Message-State: AO0yUKU5OIwcVZoYPINthjjqlnLZBO8reVAylzSqVD4mwJx/HeifkuWx
 Anih0+oIYQ3iufBisPRZSN8xUedCssBuDArFCj49CHKeWtjGVEw/8A0QRAhwxcVC431s1YF2q2G
 viu/TeV882c54tU8RR4q/LwC4Y/SagxAtAuTLvrDH
X-Received: by 2002:ac8:5cd4:0:b0:3bb:75c7:9326 with SMTP id
 s20-20020ac85cd4000000b003bb75c79326mr22869247qta.0.1677146949159; 
 Thu, 23 Feb 2023 02:09:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/koRPNANUmknQG+7kAuYwa4ay569snO2eNYzEq0HDqUGBTIoDvfkqm5FimiOMJ/yChM2nVyQ==
X-Received: by 2002:ac8:5cd4:0:b0:3bb:75c7:9326 with SMTP id
 s20-20020ac85cd4000000b003bb75c79326mr22869227qta.0.1677146948834; 
 Thu, 23 Feb 2023 02:09:08 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
 by smtp.gmail.com with ESMTPSA id
 x191-20020a3763c8000000b007402fdda195sm6650615qkb.123.2023.02.23.02.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:09:08 -0800 (PST)
Message-ID: <83a8fb89ac7a69d08c9ea1422dade301dcc87297.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Clark Wang <xiaoning.wang@nxp.com>, peppe.cavallaro@st.com, 
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, mcoquelin.stm32@gmail.com, 
 linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com
Date: Thu, 23 Feb 2023 11:09:04 +0100
In-Reply-To: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
References: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-imx@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH V3 1/2] net: phylink: add a function to
 resume phy alone to fix resume issue with WoL enabled
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

On Thu, 2023-02-02 at 16:15 +0800, Clark Wang wrote:
> Issue we met:
> On some platforms, mac cannot work after resumed from the suspend with WoL
> enabled.
> 
> The cause of the issue:
> 1. phylink_resolve() is in a workqueue which will not be executed immediately.
>    This is the call sequence:
>        phylink_resolve()->phylink_link_up()->pl->mac_ops->mac_link_up()
>    For stmmac driver, mac_link_up() will set the correct speed/duplex...
>    values which are from link_state.
> 2. In stmmac_resume(), it will call stmmac_hw_setup() after called the
>    phylink_resume(), because mac need phy rx_clk to do the reset.
>    stmmac_core_init() is called in function stmmac_hw_setup(), which will
>    reset the mac and set the speed/duplex... to default value.
> Conclusion: Because phylink_resolve() cannot determine when it is called, it
>             cannot be guaranteed to be called after stmmac_core_init().
> 	    Once stmmac_core_init() is called after phylink_resolve(),
> 	    the mac will be misconfigured and cannot be used.
> 
> In order to avoid this problem, add a function called phylink_phy_resume()
> to resume phy separately. This eliminates the need to call phylink_resume()
> before stmmac_hw_setup().
> 
> Add another judgement before called phy_start() in phylink_start(). This way
> phy_start() will not be called multiple times when resumes. At the same time,
> it may not affect other drivers that do not use phylink_phy_resume().
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> V2 change:
>  - add mac_resume_phy_separately flag to struct phylink to mark if the mac
>    driver uses the phylink_phy_resume() first.
> V3 change:
>  - add brace to avoid ambiguous 'else'
>    Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/net/phy/phylink.c | 32 ++++++++++++++++++++++++++++++--
>  include/linux/phylink.h   |  1 +
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 319790221d7f..c2fe66f0b78f 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -80,6 +80,8 @@ struct phylink {
>  	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
>  	u8 sfp_port;
> +
> +	bool mac_resume_phy_separately;
>  };
>  
>  #define phylink_printk(level, pl, fmt, ...) \
> @@ -1509,6 +1511,7 @@ struct phylink *phylink_create(struct phylink_config *config,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	pl->mac_resume_phy_separately = false;
>  	pl->using_mac_select_pcs = using_mac_select_pcs;
>  	pl->phy_state.interface = iface;
>  	pl->link_interface = iface;
> @@ -1943,8 +1946,12 @@ void phylink_start(struct phylink *pl)
>  	}
>  	if (poll)
>  		mod_timer(&pl->link_poll, jiffies + HZ);
> -	if (pl->phydev)
> -		phy_start(pl->phydev);
> +	if (pl->phydev) {
> +		if (!pl->mac_resume_phy_separately)
> +			phy_start(pl->phydev);
> +		else
> +			pl->mac_resume_phy_separately = false;
> +	}
>  	if (pl->sfp_bus)
>  		sfp_upstream_start(pl->sfp_bus);
>  }
> @@ -2024,6 +2031,27 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
>  }
>  EXPORT_SYMBOL_GPL(phylink_suspend);
>  
> +/**
> + * phylink_phy_resume() - resume phy alone
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * In the MAC driver using phylink, if the MAC needs the clock of the phy
> + * when it resumes, can call this function to resume the phy separately.
> + * Then proceed to MAC resume operations.
> + */
> +void phylink_phy_resume(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (!test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)
> +	    && pl->phydev) {
> +		phy_start(pl->phydev);
> +		pl->mac_resume_phy_separately = true;
> +	}
> +

Minor nit: the empty line here is not needed.

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
