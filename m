Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616DC4D79F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 12:48:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7456C628AA;
	Tue, 11 Nov 2025 11:48:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C2DBC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 11:48:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5F0242B45;
 Tue, 11 Nov 2025 11:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E74BC116D0;
 Tue, 11 Nov 2025 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762861689;
 bh=jxi1Gv6OcPtGGFXGFF2QxkwKjLaMbfnLeBrhrAyU/Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U8wDzG2jhPfzS4KLy6BBXjLkq8tbdJdbZ2HLPt/oCduCWbREVPz6XahhQXZNBZvqk
 rL61nJbROp9KbKpanxP6Xm+RhhBC2JjGt3mq5g1Vt8UeeKM8gOKgcYiPO0I2jAA8oR
 2vP9zcZsjezzMSY7lXp0qcTehuQ5Bvcn5PLIyv21tVd9pJmlDNPzRzYLCVga+fJVZC
 exeLAcTwq2GZWVxiqi/O5Hs9YfEKaR3AZUbkmkVOA0uPAeCkVjy4pmp9+BXSwywuet
 qQS5xfNfqALbItTHOqCEixH82CxNQPweybJmarDGuJMjWDhzcw/4Ag1g8TdQPeJwJh
 M8yYB1Fdu26pw==
Date: Tue, 11 Nov 2025 11:47:53 +0000
From: Simon Horman <horms@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <aRMiafCQNPVDOljU@horms.kernel.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v5 8/8] net: stmmac: qcom-ethqos: add
	support for sa8255p
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

On Fri, Nov 07, 2025 at 11:29:58AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> +static int qcom_ethqos_pd_init(struct platform_device *pdev, void *priv)
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
> +
> +static void qcom_ethqos_pd_exit(struct platform_device *pdev, void *data)
> +{
> +	struct qcom_ethqos *ethqos = data;
> +
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
> +}
> +
>  static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  {
>  	struct plat_stmmacenet_data *plat_dat = priv->plat;

...

> @@ -852,28 +993,63 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
>  	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
>  	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
> -
> -	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
> -	if (IS_ERR(ethqos->pm.link_clk))
> -		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
> -				     "Failed to get link_clk\n");
> -
> -	ret = ethqos_clks_config(ethqos, true);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
> -	if (ret)
> -		return ret;
> -
> -	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
> -	if (IS_ERR(ethqos->pm.serdes_phy))
> -		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
> -				     "Failed to get serdes phy\n");
> -
> -	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
>  	ethqos->serdes_speed = SPEED_1000;
> -	ethqos_update_link_clk(ethqos, SPEED_1000);
> +
> +	if (pm_data && pm_data->use_domains) {
> +		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
> +
> +		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
> +						 &ethqos->pd.pd_list);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
> +
> +		plat_dat->clks_config = ethqos_pd_clks_config;
> +		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
> +		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
> +		plat_dat->exit = qcom_ethqos_pd_exit;

Hi Bartosz,

It seems that the intention of this is to ensure
that domains turned on by qcom_ethqos_pd_init()
are turned off again on exit or clean-up in error paths.

> +		plat_dat->init = qcom_ethqos_pd_init;
> +		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
> +
> +		ret = qcom_ethqos_pd_init(pdev, ethqos);
> +		if (ret)
> +			return ret;

And here those domains are turned on.

> +
> +		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +		if (ret)

But it seems that if we reach this error path then the cleanup is not
performed. This is because plat_dat and thus it's exit callback are
registered until the call to devm_stmmac_pltfr_probe() towards the end of
this function.

Sorry if I'm on the wrong track here. I did dig into it.
But this was flagged by Claude Code running
https://github.com/masoncl/review-prompts/

> +			return dev_err_probe(dev, ret,
> +					     "Failed to enable the serdes power domain\n");

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
