Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E436F80C56B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 11:00:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95114C6B479;
	Mon, 11 Dec 2023 10:00:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC97C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 10:00:23 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so4941559e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702288822; x=1702893622;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kGMaAvNkf13KTNtEI35Ww6Ch0iXZrDDVN4YHlrZP/Rs=;
 b=AC01mOFNKnM4adjK5nheobMpvZlcF/A//R92mcF/wBHvVSC1EwULBYwt2JTzB1qVRY
 9p3CvdXXYGn9QTWLMaG/iy1UCToA+ybkJExV1PQgk4ZtuoNLxra1Et+HeGNanp067EoT
 +LCRZgkIAQFjaESUb6W0MERCSXOhfITMWVeQ6vt7y4seSW4F/wq3deqWo0VeKX+Irlo8
 3ASzg38l1LTkVdGDSshRrbtSdfnA+SdKexsncg6JB62ohwFzt3WD4fVizpuGeLX9n4l8
 6bdy4PTd/edD6rGL1t/qPNmK5QbnyZXd/furlmuIzycCA6HKH6hNqMVboNLai6FYMJrO
 K2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702288822; x=1702893622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGMaAvNkf13KTNtEI35Ww6Ch0iXZrDDVN4YHlrZP/Rs=;
 b=WZwtN6gy8rBiy5/7sC9hIw621MqiAOq8rxDSuWnqq5Ls/SHA/kZ0tTpwBkPpKVmupF
 9J3l0hRHbGc+Y15HxsHzR9tiK8PqDcmOibdWSeiqgr90/0MQPVQwhWuAbTNcf9shwTI6
 dMnrig34BOi8uV8JMindVqlkmFf18VycKSZP7JlskerNEzx2WUcQ0VFMwb3ZYh+wL1ve
 xNIUVr+nuvfVz+aENuTo06dWJObDuaMtYl6tsuFkI0NxLwun75kmXkhWOuv6zrWOtczm
 9IywwuhWOafDe6vILpglVA2dyUrS4JR2Oerk8wjmIaztVhEY3MDmsin5URWQmcI+LGuN
 fDOg==
X-Gm-Message-State: AOJu0Yyy/butgWJt5liqRk/0X2JC/udeODhUoC9YBRLFmJqCTtYhiUkh
 z3SWv4vREiFMnVxY6ud1yjM=
X-Google-Smtp-Source: AGHT+IErNr5wT1OqJdBAWPwdSo/P2wNmv6BuRcCssiJsnTb1QT67Tto3UHYRZ37cvI4cE2N9nqUJaQ==
X-Received: by 2002:ac2:47ee:0:b0:50c:a39:ee20 with SMTP id
 b14-20020ac247ee000000b0050c0a39ee20mr1781746lfp.103.1702288822181; 
 Mon, 11 Dec 2023 02:00:22 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 dx5-20020a0565122c0500b0050bfb2d3ab8sm1049986lfb.305.2023.12.11.02.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 02:00:21 -0800 (PST)
Date: Mon, 11 Dec 2023 13:00:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <3bwuo4lpo5h75wbscsgi2jtn5ex45vx5fvezocwjbetnbwriyr@ltdd5axuri6e>
References: <20231208062502.13124-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208062502.13124-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: update Rx clk divider
	for 10M SGMII
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

On Fri, Dec 08, 2023 at 11:55:02AM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.

One more time:

> [PATCH v3] net: stmmac: update Rx clk divider for 10M SGMII

It would be better to add "dwmac-qcom-ethqos" prefix to the subject
since the patch concerns the Qualcomm Eth MAC only. This time don't
forget to do that on v4.

-Serge(y)

> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
> v3 changelog:
> - Added comment to explain why MAC needs to be reconfigured for SGMII
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..ab2245995bc6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -34,6 +34,7 @@
>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
>  
>  /* SDCC_HC_REG_DLL_CONFIG fields */
>  #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
> @@ -598,6 +599,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> +/* On interface toggle MAC registetrs gets reset.
> + * Configure MAC block for SGMII on ethernet phy link up
> + */
>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
>  	int val;
> @@ -617,6 +621,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> +			      RGMII_IO_MACRO_CONFIG);
>  		break;
>  	}
>  
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
