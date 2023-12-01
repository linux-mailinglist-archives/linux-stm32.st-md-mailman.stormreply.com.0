Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89EA800AFA
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 13:35:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89F78C6B479;
	Fri,  1 Dec 2023 12:35:08 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83BC7C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 12:35:06 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2c9b5c12898so25573751fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 04:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701434106; x=1702038906;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YAJ12ZP/6sikIFKSSmQlShHQawFcbI6eeUcRDaDj6EQ=;
 b=Yjue30Z0uWPCIhCOAlOdljkBZriWtTK+LaVHEfjhXCWWDC3psQR0QDXWK6gtkw8Idy
 bZUDBb3fOM6Sysqif+n+58VHmtaRLMLMGdLvuc2Iw/B2tOG32wZ2kXgrbVgkEJnqUvWs
 YEv3DnhHrH7gXWJ0GRRuqTpTPfK01s+QYRrqBldvYphc0z/ekkgo3n35puAMdnNlWKaD
 kWwGTTzFSayS0V6kPujDzZGT2Kj8j9QO99AobS5nQNFjQ6QZ5HxVzqe6qVQ5pdUQbmvu
 3Sm9MHftEW8abGrrIrly/FqZXZ0m7Ibwd1fH6vbXJSmALmqK6L3tpj7RU6GERcEFB1FX
 P8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701434106; x=1702038906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAJ12ZP/6sikIFKSSmQlShHQawFcbI6eeUcRDaDj6EQ=;
 b=bb7GdSm5eiMviVcP5YhimDBDN2v1AmS7e4PEE0MJyEUwFXjISY/FiD4itq69vvw72G
 x5WDv7BdyOsvvTRAowNwFqOK7UcrPKMgRExKXrIR2N2TE9wkyR0R71hcU61/A/qDELKo
 0sovV+WFlTRD5WE+nBtQDoqZn9Vo+mXV722tpP74GpyMZq7rGOrYnnuLFneKylloo05r
 InnkK+315rLevP5TvaGFOt9ibwQ3fO/8Rs3kg3psFuNMQ5p71n77TTDGmfGImwZJgYIJ
 2sgVUhPnGDuFw4UM4IGq09fot92Vfx/nhU2vHIf6SGXHE32Y+VIH02dlQWKyPIkv7nSg
 6LFg==
X-Gm-Message-State: AOJu0Yymf4JSeZrVJz+Z++1ML+6ML7rNyXujjPmbQvNXi2k7bvQ3YgP6
 Ehuwu0QIdwvMPdFiXsoR+l4=
X-Google-Smtp-Source: AGHT+IFWvGMZWlpeLzOqlvxU4Iovm3Lrni2kgJ/FhveV1eY9wgfEIZEwE7tYYQ2Va/X639zttJ8beg==
X-Received: by 2002:a2e:8895:0:b0:2c9:d874:6efc with SMTP id
 k21-20020a2e8895000000b002c9d8746efcmr818380lji.89.1701434105454; 
 Fri, 01 Dec 2023 04:35:05 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a2e8655000000b002c9b873270asm408702ljj.123.2023.12.01.04.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 04:35:05 -0800 (PST)
Date: Fri, 1 Dec 2023 15:35:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <mfcvaq2n2lzsg47nzgk25n5fpmii2ftbx6gkrmz7pkxv6mq4w6@eia6ymhx3wff>
References: <20231201100548.12994-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231201100548.12994-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: update Rx clk divider for
	10M SGMII
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

On Fri, Dec 01, 2023 at 03:35:48PM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.

> [PATCH v2] net: stmmac: update Rx clk divider for 10M SGMII

It would be better to add "dwmac-qcom-ethqos" prefix to the subject
since the patch concerns the Qualcomm Eth MAC only. 

-Serge(y)

> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..df6ff8bcdb5c 100644
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
> @@ -617,6 +618,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
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
