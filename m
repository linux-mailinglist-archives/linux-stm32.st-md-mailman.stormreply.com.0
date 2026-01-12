Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABED14A17
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 19:00:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319EEC5A4CA;
	Mon, 12 Jan 2026 18:00:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09A9FC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 18:00:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BE3C60055;
 Mon, 12 Jan 2026 18:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB923C16AAE;
 Mon, 12 Jan 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768240811;
 bh=mGbofIjwnm9caXWlIFuD+vvkQiRMHg0CWCn2+iWjokQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=feB0lBBcPjMm6TcLwyV7ebbxAv/YTwcCPMIuU2dVmvhL5mGCrIawtev3cma1EX2dA
 gimcge4/rXibL+oI/bA4/8WLwnYBQjmUWgdqxGK+z6QcoubI5S8MGhmHsN6RGU3I0m
 bOaihftKwYyTpOxlZre+emHgYCTF4qUVx3nrUpVhTKwciuti+mwHDDCK+Uudv2JTSh
 R6RBys8rz+B/35nVnKrzi3MKeFCyoNWx7MF7/pgVShpqzu4mBxe+J9/cv0NwkEif1g
 VG+WPfM/JevSndphvgNzv7J2+6JAdWpT5GxWT+B4lRohyxUT14oeDlYMchDvMoo1+A
 VALVB9TuQpPSg==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Date: Mon, 12 Jan 2026 10:00:05 -0800
Message-ID: <20260112180005.4144056-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
MIME-Version: 1.0
Cc: richardcochran@gmail.com, imx@lists.linux.dev, s32@nxp.com, kernel@esmil.dk,
 geert+renesas@glider.be, fustini@kernel.org, Frank.Li@nxp.com,
 liangshuang@eswincomputing.com, linux-mips@vger.kernel.org,
 swathi.ks@samsung.com, lizhi2@eswincomputing.com, netdev@vger.kernel.org,
 guoren@kernel.org, nobuhiro.iwamatsu.x90@mail.toshiba,
 linux-amlogic@lists.infradead.org, shawnguo@kernel.org,
 linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 robh@kernel.org, samuel@sholland.org, wens@kernel.org,
 weishangjuan@eswincomputing.com, romain.gantois@bootlin.com,
 khilman@baylibre.com, unicorn_wang@outlook.com, magnus.damm@gmail.com,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, samin.guo@starfivetech.com, linux-imx@nxp.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, konradybcio@kernel.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, brgl@kernel.org, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, jan.petrous@oss.nxp.com,
 minda.chen@starfivetech.com, mripard@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, vineetha.g.jaya.kumaran@intel.com,
 sophgo@lists.linux.dev, peppe.cavallaro@st.com, dfustini@tenstorrent.com,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@oss.qualcomm.com,
 neil.armstrong@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@oss.qualcomm.com, edumazet@google.com,
 keguang.zhang@gmail.com, andersson@kernel.org, xiaoning.wang@nxp.com,
 inochiama@gmail.com, christophe.roullier@foss.st.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 andrew+netdev@lunn.ch, vkoul@kernel.org, kernel@pengutronix.de,
 david.wu@rock-chips.com, krzk+dt@kernel.org, matthew.gerlach@altera.com,
 davem@davemloft.net, wefu@redhat.com
Subject: Re: [Linux-stm32] [RESEND, net-next, v6,
	7/7] net: stmmac: qcom-ethqos: add support for sa8255p
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least pausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: qcom-ethqos: add support for sa8255p

This commit adds support for the SA8255P SoC which uses power domains
managed via SCMI firmware, rather than the traditional clock/phy-based
power management used by other variants.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8ba57bba3f2e..54f8ef3cfd7d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> +static void ethqos_disable_serdes(void *data)
> +{
> +	struct qcom_ethqos *ethqos = data;
> +
> +	qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
                          ^^

Should this be qcom_ethqos_domain_off() instead of qcom_ethqos_domain_on()?

This function is registered as a cleanup action via devm_add_action_or_reset()
to undo the qcom_ethqos_domain_on(ETHQOS_PD_SERDES) call during probe. Using
domain_on here would increment the PM runtime usage counter again rather than
decrementing it. The serdes power domain would never be properly turned off
on driver removal.

Compare with qcom_ethqos_pd_serdes_powerdown() which correctly uses
qcom_ethqos_domain_off().

> +}

[ ... ]

> +static int qcom_ethqos_pd_init(struct device *dev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	int ret;
> +
> +	/*
> +	 * Enable functional clock to prevent DMA reset after timeout due
> +	 * to no PHY clock being enabled after the hardware block has been
> +	 * power cycled. The actual configuration will be adjusted once
> +	 * ethqos_fix_mac_speed() is called.
> +	 */
> +	ethqos_set_func_clk_en(ethqos);
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
> +	if (ret) {
> +		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

>  	if (pm_data && pm_data->use_domains) {
>  		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
>
> +		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
> +						 &ethqos->pd.pd_list);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
> +
> +		plat_dat->clks_config = ethqos_pd_clks_config;
> +		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
> +		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
> +		plat_dat->exit = qcom_ethqos_pd_exit;
> +		plat_dat->init = qcom_ethqos_pd_init;
                             ^^^^^^^^^^^^^^^^^^^^^^^

> +		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
> +
> +		ret = qcom_ethqos_pd_init(dev, ethqos);
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is qcom_ethqos_pd_init() being called twice?

It is assigned to plat_dat->init above, and then called directly here. Later,
devm_stmmac_pltfr_probe() -> stmmac_pltfr_probe() -> stmmac_dvr_probe() will
call plat_dat->init() again (see stmmac_main.c stmmac_dvr_probe function).

Each call to qcom_ethqos_pd_init() increments the PM runtime usage counter
for ETHQOS_PD_CORE and ETHQOS_PD_MDIO via pm_runtime_resume_and_get(). With
two calls, the refcount would be 2 for each domain, but qcom_ethqos_pd_exit()
only decrements once per domain. This would leave the power domains with a
dangling reference.

Perhaps the direct call to qcom_ethqos_pd_init() here should be removed, and
let stmmac_dvr_probe() invoke it through the plat_dat->init callback?

> +		if (ret)
> +			return ret;

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
