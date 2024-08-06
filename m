Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1A948CAF
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 12:18:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C52D6C71289;
	Tue,  6 Aug 2024 10:18:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F28ABC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 10:17:56 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so878591e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722939476; x=1723544276;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GWXCoJ7rYq4RnfaGfXCHjKin4v2Wy0/q7H4yQqP9Ac4=;
 b=LZ2VdTxxTQ7L8ZVU10zvwYsnhATxDW0LIRCyr3rFMHV9WUKXXgN6Ro+rHfE2v1A1/E
 MqCn3y42Tm96nLAM8EeGyL0/jnqf57S84/jcovAQMM/GZtiEnLHZig+xkccZRavr6q0W
 tU9XRZweWknNc/v7NayOLE/osIe1zBWcxdd00dExMlJ4ITYgy6fEIbNJwNb3dTNamgGd
 GMmz0yL7f8Y2aWOlrfN+YmUufUQ8d28crAcBgu5tDT1oqTe8pAE7FXH3DtgndjU+0wQs
 SV1WQnO98D+ZKbJf+dJuFur/BAG+EX2o0qkqkrkhOAhXd7TE4kZMroUs+LBskc0p08Vt
 ZZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722939476; x=1723544276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWXCoJ7rYq4RnfaGfXCHjKin4v2Wy0/q7H4yQqP9Ac4=;
 b=uYMv5iuSXdf0+luudCDX7peRSp281S6j8/6O2fc/+s0WDJDz/lljF7lIYoGtP2lnVS
 KCkb5XhclZ9oh6C8gMCOZ1Si/Oh51+JFoO9wMayxvCRjvwZo9Nlduu1JIfnIIdM96ZPv
 l/ec5oQBj4K/6tg/AoHvRfKh75+YVNeEGWTfg6giCHEDMiBZ2/FNJB+BfTnhowgkd+l9
 47P1lv5L19pD+9WiYUHYNFDDPef6nXcVKihYQS3Ame8jMkGJnVJyH9epp8iGl/Zmm7EK
 CZkND6A8m2A+OH4v94WM63/+0HSKnTQW4EkUV1L44eqVHIWEP5iYkl+d3qAm1lrfvyZY
 in5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9SvwcpbOuYp8TrDVkFX0BW91b79y0AgsAPm6b9E97myHWJvjDkhz4q1rR7Kwu90GtbyHq0kFeLimVbffHxIRFfm+QH3ZPSDpBw/tj0wo0KXqq6UYAULXx
X-Gm-Message-State: AOJu0Yxd3z1sXPZvYNPrD86RWcgJWWoAunEVIctWpiNkrXFIGSfNHdtw
 bhWCgDrhmwcrr2zqacdC9A2GUps/8iN1gl2THRkk1X1gDB5BvSze
X-Google-Smtp-Source: AGHT+IHzsWMpgZJ3RQ+PF9fvZCYjeTmSj6mhWqMiOTlM0IENo7LW4n77skqeBowAwJ40wPFgndSJ+g==
X-Received: by 2002:a05:6512:b08:b0:52e:9694:3f98 with SMTP id
 2adb3069b0e04-530bb3a05c4mr9527838e87.27.1722939475747; 
 Tue, 06 Aug 2024 03:17:55 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba0fee7sm1421223e87.66.2024.08.06.03.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 03:17:55 -0700 (PDT)
Date: Tue, 6 Aug 2024 13:17:52 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <ciueb72cjvfkmo3snnb5zcrfqtbum5x54kgurkkouwe6zrdrjj@vi54y7cczow3>
References: <AM9PR04MB85062693F5ACB16F411FD0CFE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB85062693F5ACB16F411FD0CFE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/6] net: stmmac: Expand clock rate
	variables
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

On Sun, Aug 04, 2024 at 08:49:49PM +0000, Jan Petrous (OSS) wrote:
> The clock API clk_get_rate() returns unsigned long value.
> Expand affected members of stmmac platform data.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Since you are fixing this anyway, please convert the
stmmac_clk_csr_set() and dwmac4_core_init() methods to defining the
unsigned long clk_rate local variables.

After taking the above into account feel free to add:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 2 +-
>  include/linux/stmmac.h                                  | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa..2a5b38723635 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -777,7 +777,7 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
>  	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
>  
> -	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
> +	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
>  
>  static int qcom_ethqos_probe(struct platform_device *pdev)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..b1e4df1a86a0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -639,7 +639,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		dev_info(&pdev->dev, "PTP uses main clock\n");
>  	} else {
>  		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
> -		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
> +		dev_dbg(&pdev->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
>  	}
>  
>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 7caaa5ae6674..47a763699916 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -279,8 +279,8 @@ struct plat_stmmacenet_data {
>  	struct clk *stmmac_clk;
>  	struct clk *pclk;
>  	struct clk *clk_ptp_ref;
> -	unsigned int clk_ptp_rate;
> -	unsigned int clk_ref_rate;
> +	unsigned long clk_ptp_rate;
> +	unsigned long clk_ref_rate;
>  	unsigned int mult_fact_100ns;
>  	s32 ptp_max_adj;
>  	u32 cdc_error_adj;
> @@ -292,7 +292,7 @@ struct plat_stmmacenet_data {
>  	int mac_port_sel_speed;
>  	int has_xgmac;
>  	u8 vlan_fail_q;

> -	unsigned int eee_usecs_rate;
> +	unsigned long eee_usecs_rate;

Sigh... One another Intel clumsy stuff: this field is initialized by
the Intel glue-drivers and utilized in there only. Why on earth has it
been added to the generic plat_stmmacenet_data structure?.. The
only explanation is that the Intel developers were lazy to refactor
the glue-driver a bit so the to be able to reach the platform data at
the respective context.

-Serge(y)

>  	struct pci_dev *pdev;
>  	int int_snapshot_num;
>  	int msi_mac_vec;
> -- 
> 2.45.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
