Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC6817777
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 17:28:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C44DCC6DD70;
	Mon, 18 Dec 2023 16:28:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21AFCC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702916884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTEkicxeHNXHb/6pSYfpZYOfjZVCf7gx8W87QpG78TA=;
 b=GgV5sn8CFNrDMDEphMrR8bBeLftl0QgHW7R3HOPja2OhcbHveT3Us5wRZczJ3GNswb8UcP
 +tLYXJ7gQPEPPj/xknEav8QARIggDNlgGOMZog9wHoEBUT7TuYUZV3jvfSuNcxfFzRJlvO
 7qtK2KYmRnr7/zi5Q5QQ1q8gLwXRnzA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-ig_0D5ZlMviK5M5Cy4MjKw-1; Mon, 18 Dec 2023 11:28:02 -0500
X-MC-Unique: ig_0D5ZlMviK5M5Cy4MjKw-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7b7a9f90f04so548072339f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 08:28:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702916881; x=1703521681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTEkicxeHNXHb/6pSYfpZYOfjZVCf7gx8W87QpG78TA=;
 b=dUlAyBlqcKwwYmzXRp6LgTbEKeH7i4AwNJAgdNwbgiD6iU2RVgWMkpfbTuL/1odje3
 mp/Z5EivXPUr5cIc9yI8klrqVtDGKX/cFouMZJhdDjJPfaT76mqotCT1M0tlHFrwCRK5
 4VEMnkEgJbnBXfZo39y4tZmiE7piezK8u9b14JrLlcffKKsjqeC1njCIwMKLiD+aUxId
 VfmqaMlRLLt98c2fu4rgpfJbBmgt1jhykvL5c2GNUggigqXMeIxvocBrnwKhXrWf2K05
 calI/bVkIqGBrlislwqj09Rnrc145N5B5gD5ZWxG8QOxzO/ZNdapgDByBULMvNzj1xEj
 umzw==
X-Gm-Message-State: AOJu0YyMlHve7GtQthoP3FRKH+ncRtZXsH7SNsVLynsKr+TVflqsaFLl
 tcxkUnPXpwcjqSj2QV3ok5ZXpy29r+IwFzP3h/up70PaAC6GAdUQmSyyQ8pHDmK8ypoRci9EyeB
 EmaXBfOpzn0c0c7aOC6QP9rI+FMaDap+PmzaMf1dA
X-Received: by 2002:a05:620a:4591:b0:77e:fba3:58e2 with SMTP id
 bp17-20020a05620a459100b0077efba358e2mr21670384qkb.115.1702916407346; 
 Mon, 18 Dec 2023 08:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtIhW+W09l1XgbMu3JLXQQrCRVUmt/NuCFTSbNGaPFdKMggkCWZLhtm+YyuiZCLChvHbZurQ==
X-Received: by 2002:a05:620a:4591:b0:77e:fba3:58e2 with SMTP id
 bp17-20020a05620a459100b0077efba358e2mr21670361qkb.115.1702916407066; 
 Mon, 18 Dec 2023 08:20:07 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 vq18-20020a05620a559200b0077fafc08e46sm2772136qkn.84.2023.12.18.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 08:20:06 -0800 (PST)
Date: Mon, 18 Dec 2023 10:20:03 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231218071118.21879-1-quic_snehshah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

On Mon, Dec 18, 2023 at 12:41:18PM +0530, Sneh Shah wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..b3a28dc19161 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -21,6 +21,7 @@
>  #define RGMII_IO_MACRO_CONFIG2		0x1C
>  #define RGMII_IO_MACRO_DEBUG1		0x20
>  #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
> +#define ETHQOS_MAC_AN_CTRL		0xE0
>  
>  /* RGMII_IO_MACRO_CONFIG fields */
>  #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
> @@ -78,6 +79,10 @@
>  #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
>  #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
>  
> +/*ETHQOS_MAC_AN_CTRL bits */
> +#define ETHQOS_MAC_AN_CTRL_RAN			BIT(9)
> +#define ETHQOS_MAC_AN_CTRL_ANE			BIT(12)
> +

nit: space please add a space before ETHQOS_MAC_AN_CTRL

>  struct ethqos_emac_por {
>  	unsigned int offset;
>  	unsigned int value;
> @@ -109,6 +114,7 @@ struct qcom_ethqos {
>  	unsigned int num_por;
>  	bool rgmii_config_loopback_en;
>  	bool has_emac_ge_3;
> +	unsigned int serdes_speed;
>  };
>  
>  static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -600,27 +606,47 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  
>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
> -	int val;
> -
> +	int val, mac_an_value;
>  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
> +	mac_an_value = readl(ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
>  
>  	switch (ethqos->speed) {
> +	case SPEED_2500:
> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_2500)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value &= ~ETHQOS_MAC_AN_CTRL_ANE;
> +		break;
>  	case SPEED_1000:
>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	case SPEED_100:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	}
>  
>  	writel(val, ethqos->mac_base + MAC_CTRL_REG);
> +	writel(mac_an_value, ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
> +	ethqos->serdes_speed = ethqos->speed;

I see these bits are generic and there's some functions in stmmac_pcs.h
that muck with these...

Could you help me understand if this really should be Qualcomm specific,
or if this is something that should be considered for the more core bits
of the driver? I feel in either case we should take advantage of the
common definitions in that file if possible.

>  
>  	return val;
>  }
> @@ -789,6 +815,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  				     "Failed to get serdes phy\n");
>  
>  	ethqos->speed = SPEED_1000;
> +	ethqos->serdes_speed = SPEED_1000;
>  	ethqos_update_link_clk(ethqos, SPEED_1000);
>  	ethqos_set_func_clk_en(ethqos);
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
