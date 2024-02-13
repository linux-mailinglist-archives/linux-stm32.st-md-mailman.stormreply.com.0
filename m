Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785D852679
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 02:30:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CAF5C6C83D;
	Tue, 13 Feb 2024 01:30:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 066ECC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 01:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CBEC9CE18C3;
 Tue, 13 Feb 2024 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808CDC433C7;
 Tue, 13 Feb 2024 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707787817;
 bh=JdTHedcxVO15s3B4sRid8zTpEzYkN8lo7pBe02dMOIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f7FzUXFTQaQH8sST/82MCPpBjozyaFswVdXgob1DuM96d49GvcQ8wdCMwWZLzkxgb
 UJgmMIkE6HmuBTiwWJJ6jbHzUIBgH/uaV2/oVNOH4xgI1gpyjHC1FKtodkkM88NPb5
 LyLBx4QyM/e4GbXQ9l/97+7UnUSKW79+3X60suDirIZ49zHBqCVf9kc5JZJbMEEuBU
 lj1FTyIPXxlSxynmRWq9W8yZkHNr8N0DDAMX7DKO/qDNJnO27yCwoSnhWfXInum8fD
 dpSzPJHVFS8eWxVFGFi/KxHI9rP3OGCCxyjAQig1Jl5af3KmOGPZSpKo/QKejms+s5
 N9fniz4acy2nQ==
Date: Mon, 12 Feb 2024 17:30:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <20240212173015.0341f0ee@kernel.org>
In-Reply-To: <20240208111714.11456-1-quic_snehshah@quicinc.com>
References: <20240208111714.11456-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:
 dwmac-qcom-ethqos: Add support for 2.5G SGMII
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

On Thu,  8 Feb 2024 16:47:14 +0530 Sneh Shah wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> Changing serdes phy speed involves multiple register writes for
> serdes block. To avoid redundant write operations only update serdes
> phy when new speed is different.

Sounds like 2 separate changes in one patch, please split the
optimization of not writing the registers multiple times and
the 2.5G support.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..6bbdbb7bef44 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -106,6 +106,7 @@ struct qcom_ethqos {
>  	struct clk *link_clk;
>  	struct phy *serdes_phy;
>  	unsigned int speed;
> +	int serdes_speed;

Why signed if speed itself is unsigned?

>  	/* Enable and restart the Auto-Negotiation */
>  	if (ane)
>  		value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
> +	else
> +		value &= ~GMAC_AN_CTRL_ANE;

That looks unrelated. Either a separate patch or please explain in the
commit msg why.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
