Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EC947FCB
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 19:00:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A1CDC71290;
	Mon,  5 Aug 2024 17:00:10 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 741D0C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 17:00:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DE4CCE0A15;
 Mon,  5 Aug 2024 17:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA9EC32782;
 Mon,  5 Aug 2024 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722877206;
 bh=rMg8tq8sXoox5/aZPFwub+kNjISHhCSdM1/upF/TURs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C/0pGzr/WpVGNgjl3o864EDH0YfyswghtP2JFPG/YAbOf2KUVfUyq7PGLM/NR6kOR
 87rpEvhMkovWxOOpoS26eZqCZkm32Hv/DNS/TGIDn0xQt+qVkV4Uv/pcKIRArODVGw
 XSZPJNefb/wzMP3nw6QOpaiSAt507npkIVj2jkaLp6W1HV++Ii2MPaQs2NtqPeILrA
 RJraREhJYnLWUApH7eLCjdjzggTVQb+kdONsXoXsbZ/VUHiC2QndgokX87ziDWrjoP
 pS0jGPK9IquwvcbIw+ZEt6KCx+dJnz61lAMX/kW0wfJPUZ1uAlRTBzsGUkcsX5xZZ+
 vIWJ3+BCyzOug==
Date: Mon, 5 Aug 2024 18:00:02 +0100
From: Simon Horman <horms@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <20240805170002.GM2636630@kernel.org>
References: <AM9PR04MB85064D7EDF618DB5C34FB83BE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB85064D7EDF618DB5C34FB83BE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/6] net: stmmac: dwmac-s32cc: add basic
 NXP S32G/S32R glue
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

On Sun, Aug 04, 2024 at 08:50:10PM +0000, Jan Petrous (OSS) wrote:
> NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> 
> The basic driver supports only RGMII interface.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c

...

> +static int s32cc_gmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct s32cc_priv_data *gmac = priv;
> +	int ret;
> +
> +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> +	if (!ret)
> +		ret = clk_prepare_enable(gmac->tx_clk);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't set tx clock\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(gmac->rx_clk);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> +	else
> +		gmac->rx_clk_enabled = true;
> +
> +	ret = s32cc_gmac_write_phy_intf_select(gmac);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't set PHY interface mode\n");

Should operations on tx_clk and rx_clk be unwound here?

Flagged by Smatch.

> +		return ret;
> +	}
> +
> +	return 0;
> +}

...

> +static int s32cc_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct plat_stmmacenet_data *plat;
> +	struct s32cc_priv_data *gmac;
> +	struct stmmac_resources res;
> +	int ret;

Please consider arranging local variables in Networking code
in reverse xmas tree order - longest line to shortest.

Flagged by: https://github.com/ecree-solarflare/xmastree

> +
> +	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
> +	if (!gmac)
> +		return PTR_ERR(gmac);

This will return 0, perhaps return -ENOMEM ?

Flagged by Smatch.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
