Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBA7F618F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 15:34:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9B0BC6B476;
	Thu, 23 Nov 2023 14:34:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57564C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 14:34:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1ABF5621FB;
 Thu, 23 Nov 2023 14:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A54C433CA;
 Thu, 23 Nov 2023 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700750074;
 bh=UQZtD3/J3EWnFay8ssfBnsqxH7p2amiDhWgYKfTALAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLKhMH45lRed+KJ6STR6/3MFTjtf2H5ttXPl++EXW5oXxN5ZADshoxAH3rjdI/XmN
 FQmAysB71pY/tMhWGAscAyE6GwlsOv3l8MrcZh2s7HDOoiKl3yd6WwgE6yzzEtzq2L
 QICQbbCCR4hklr2qYY7tlPIcrUN1WZ0RC/jTdpWho5iFEtxZGG6ZNmv/6vJmazsiPr
 93Ps2rZnFk+FlIfxhpPRiY6nMcDv+ZzhNZiZMiPtAQQcnudYPS2xnU6p8AJZl5IL4l
 Q1ifqstmNG1GZ7qmfmFghsSRc5yaxRHIzCabLf/E7Fy//Yq1bOQu7RWACDuHHCm8Fn
 xvtLgNDaWA4Kg==
Date: Thu, 23 Nov 2023 14:34:28 +0000
From: Simon Horman <horms@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <20231123143428.GH6339@kernel.org>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add driver
 support for DWMAC5 fault IRQ Support
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

On Thu, Nov 23, 2023 at 05:08:15PM +0530, Suraj Jaiswal wrote:
> Add IRQ support to listen HW fault like ECC,DPP,FSM
> fault and print the fault information in the kernel
> log.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..bae1704d5f4b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -690,9 +690,25 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  #endif /* CONFIG_OF */
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>  
> +int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)

Hi Suraj,

stmmac_get_fault_intr_config() appears to only be used in this function.
If so it should be static.

Also, please consider limiting Networking code to 80 columns wide.

static int stmmac_get_fault_intr_config(struct platform_device *pdev,
					struct stmmac_resources *res)

...

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
