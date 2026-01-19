Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25BD3AAF4
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 15:00:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8875C36B3C;
	Mon, 19 Jan 2026 14:00:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D40C1C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68D0C43AFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AE7C2BCB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768831202;
 bh=MIrQUfbJ2zL+AhG7FyLFIXu3ha5qK8PBOAlkOqBeaxM=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
 b=DmBFoPiW4Pc3VtOaIkWpHPVKAE20gAXm01sq6FinoEn7pKU+8VYXvxBxEK8DbM1e7
 DWxsXSHh/+bgMpWIDXLV0+Mziv/8qp7VrRcl7dBAIBaNhdTzZ/+YlGH+KNL5b8s4rr
 FKRsM1V2mx4aJ740fMIzSAg/D8MmpWBZD1uQqNd2uKSJlCqUdZuW2vRe/xy6mt9Gmj
 NAK/0767OcfJRt+MvIk+64ZOwQ0bLXzWyGxgBWiA3YdNg3ZbPuJZ0uWxiUQADgdcyU
 /AxnbgR0DAtPhEeh4t6l1AnvCmJ0XPEZT616W1ec3HaA2v2QBOngVwNL7s7JPEOM0e
 XWaekRitK7GHQ==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59b73193dc8so4071516e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 06:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWM6nM2mQJh9Fmj20mQo4W4F5nHlaYt3QCbaF1ERTFuX6ShwPBWIMfkXMUIBO5N+dGC3lm0MBQBDq0+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkoIue1rF8F/OVHgwEYedwczUt09JrCg7lt5ISrA7EKiKs8gmP
 zhzEveJzvIP8dHaY2NkaJRB8465t7EAP2esQ6VPM03iTN+M/8im5JLCgMOXbgpxjOVv0aWTiqvV
 2c7XaNSwR8jeodfk/FwZpI8SIuIGb7UEFWcfKwM1S2A==
X-Received: by 2002:a05:6512:3d9f:b0:594:347e:e679 with SMTP id
 2adb3069b0e04-59baeee6123mr4166539e87.43.1768831200472; Mon, 19 Jan 2026
 06:00:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 13:59:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
X-Gm-Features: AZwV_QgrQLlVOMTh-pKGr5woCaDOT6WzYHt89q8m_3zdKt2vs_AoPCBMlqv3zPI
Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/14] net: stmmac: qcom-ethqos:
	remove mac_base
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

On Mon, 19 Jan 2026 13:33:41 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> --
> 2.47.3
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
