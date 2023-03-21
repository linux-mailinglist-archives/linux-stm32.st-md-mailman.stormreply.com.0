Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A7A6C2898
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 04:29:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90911C6A603;
	Tue, 21 Mar 2023 03:29:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7086BC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 03:29:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6275661943;
 Tue, 21 Mar 2023 03:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160ACC433D2;
 Tue, 21 Mar 2023 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679369390;
 bh=GZWXqBx1VZ5HLFmDQaUsHeHsXagTJgeevyhmDS9nBQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fgt8ewdhEaKB7HcggS2oUKQwMcNjAqV2eGMyVXGnJauZ79cLN0Uq1f/sdAzSEe1L+
 DAusnUTbcsPD7vBET9ovu5kWDQsz4LsyQ4CacIDa31R7ZZGY9SGtZUWJxHJ1jOjBOf
 BI6cR447fnFLxdGR2kMzAfcl56Oo339nQmQ7gua4g/t4rvuu4OcwbO3KwSPoFpypE/
 R/TQBEEnnYE4Y2SPTUUR7kj1ajpDIz0ivcl568Qs80uG7BEZQGzaCqdqDfDIUxp33y
 P9ko7lq6mwUiJLD/E1Vbdgw8RHqnmP+RpYbcmiGVKQWaz048cEXLJtEk8JSWNXrZ8G
 GjGG53hhlKLCA==
Date: Mon, 20 Mar 2023 20:29:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230320202948.7ba109a4@kernel.org>
In-Reply-To: <20230320221617.236323-11-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-11-ahalaney@redhat.com>
MIME-Version: 1.0
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/12] net: stmmac:
 dwmac-qcom-ethqos: Respect phy-mode and TX delay
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

On Mon, 20 Mar 2023 17:16:15 -0500 Andrew Halaney wrote:
>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
> +	int phy_mode;
> +	int phase_shift;

nit: invert the order, we like variable declaration lines longest 
to shortest

> +	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> +	phy_mode = device_get_phy_mode(&ethqos->pdev->dev);
> +	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID || phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)

Let's try to stick to 80 chars where reasonable, this would be easier
to read as 2 lines.

> +		phase_shift = 0;
> +	else
> +		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> +
>  	/* Disable loopback mode */
>  	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
>  		      0, RGMII_IO_MACRO_CONFIG2);
> @@ -300,9 +310,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  			      RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
>  			      0, RGMII_IO_MACRO_CONFIG2);
> +
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
> -			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
> -			      RGMII_IO_MACRO_CONFIG2);
> +				  phase_shift, RGMII_IO_MACRO_CONFIG2);

here and in couple more places looks like indentation got broken?
continuation line should start under the opening bracket + 1.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
