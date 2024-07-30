Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8294215F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2024 22:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 402B6C6C841;
	Tue, 30 Jul 2024 20:14:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DAC9C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=v4CFd2TasPmU5GDteTVVRLuZB39ec134+LR0uaf3ydU=; b=C2H3gKIIUm+tU5C1HxkyyXLETb
 PlZtDj4JkLFTu4kywGSODjI4ivgbmrIhmZvC1pSmlDF3UAWR0fxQ21aOZ/zSTXvmirEW9gg3bcvOm
 IWoixsdzzX5pVPIZWZxFnXl8cXx+o+WAJWXWa4kfOHVB2oR9hNjQrTn+3VmGOGgw8bzU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sYtEk-003brc-7n; Tue, 30 Jul 2024 22:14:22 +0200
Date: Tue, 30 Jul 2024 22:14:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <18b83c34-c0e4-466c-aaa1-fff38c507e9a@lunn.ch>
References: <20240730091648.72322-1-swathi.ks@samsung.com>
 <CGME20240730092902epcas5p1520f9cac624dad29f74a92ed4c559b25@epcas5p1.samsung.com>
 <20240730091648.72322-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240730091648.72322-3-swathi.ks@samsung.com>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com,
 pankaj.dubey@samsung.com, krzk@kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ravi.patel@samsung.com, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 rcsekar@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 2/4] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

> +static int dwc_eqos_rxmux_setup(void *priv, bool external)
> +{
> +	int i = 0;
> +	struct fsd_eqos_plat_data *plat = priv;
> +	struct clk *rx1 = NULL;
> +	struct clk *rx2 = NULL;
> +	struct clk *rx3 = NULL;

Reverse Christmas tree please.

> @@ -264,6 +264,7 @@ struct plat_stmmacenet_data {
>  	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
>  	int (*init)(struct platform_device *pdev, void *priv);
>  	void (*exit)(struct platform_device *pdev, void *priv);
> +	int (*rxmux_setup)(void *priv, bool external);
>  	struct mac_device_info *(*setup)(void *priv);
>  	int (*clks_config)(void *priv, bool enabled);
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,

It would be good if one of the stmmas Maintainers looked at
this. There are already a lot of function pointers here, we should not
be added another one if one of the exiting ones could be used.

    Andrew

---
pw-bot: cr

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
