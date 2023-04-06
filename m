Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 340ED6D921C
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 10:57:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0CACC6A61C;
	Thu,  6 Apr 2023 08:57:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BFB6C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680771437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZNl+uqbccaR6P7ROzn8PC1aJ1TDsT5g+QeX5B6yqoA=;
 b=RJMxz7Rkujhv16jsYfzWYvAe9jRoWlb0GSO0246C62H9yMv040tzdpHiOGG0+l0l57KKBF
 YRCRWO4LQNaqpDHw0lQ7m/xxzZfFUf40eL+SaCSkhnQfRzgOaUFls7G4WyBnJGbcYiMQGd
 ThqvGPpt07w9W53K03QTNk3fjpNoaqQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-hzPir-MzOJ-Ugnl6y0y5Qw-1; Thu, 06 Apr 2023 04:57:16 -0400
X-MC-Unique: hzPir-MzOJ-Ugnl6y0y5Qw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3e1522cf031so13678141cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 01:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771435;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=srqW/Zc6uyMlDdpAQsQE29ZbVva96BUjEhTIphyrjK4=;
 b=TpN7mD7ejbJeyfYXBTg5YeA+6vqmmZOlqAE/O05oR/yLdeTOFpsiXleIKtZCULxxDj
 uc6znSWfJA9aofiz7/+Zd85cS39jiXfevJ4WNK9l5Va8xIM9z/ss7RKtGfTOsp2EYdRG
 on0BcR1GIBkuGIow+DBgZ9EafTn46/09vCqI98xKSEbWW/IBYWxcetw9Ae5eNyvRHQae
 Y1Q0qTM2x3C8WBtB9+0Goom0yoiCbZ8ZBZog4/Pg+eHYjt5oqwIuvx+IA1DYMoO9HFkb
 nLR4T+Ca+Gq46x+VixFMt1KefiCfdbGPUJ7PI5C74S/2Ac42GV83pJVFOcXteR+aydjY
 Jrlg==
X-Gm-Message-State: AAQBX9fdy8THQb78L/kCVvmY/AboNckXdPaTvmK4/OdCkJifD4Yl5QyH
 /sKlM5bWsmgPFDRAwtEjr7fu4cec48GzBXdj4AXgZwq2j96je8p71ErdbLXMAWhwgSgE6B5qbb7
 yzlAzO8mnkWy3y8wn420A0dJQ7RPbgMuJ5Jv1r95G
X-Received: by 2002:a05:622a:1815:b0:3e4:eb39:eb8b with SMTP id
 t21-20020a05622a181500b003e4eb39eb8bmr11113084qtc.5.1680771435680; 
 Thu, 06 Apr 2023 01:57:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzXKpcq5d/id+6ZQprS3naXkWcpRtP62YORjWExdv5Im2GPPasqjiU0Vii9Sx8y+GhdWYImw==
X-Received: by 2002:a05:622a:1815:b0:3e4:eb39:eb8b with SMTP id
 t21-20020a05622a181500b003e4eb39eb8bmr11113044qtc.5.1680771435377; 
 Thu, 06 Apr 2023 01:57:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it.
 [146.241.227.151]) by smtp.gmail.com with ESMTPSA id
 15-20020a05620a040f00b0073b8512d2dbsm318849qkp.72.2023.04.06.01.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:57:15 -0700 (PDT)
Message-ID: <d9f969cfc020a29a4ad74d3726c1fc322f8eb9a8.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 06 Apr 2023 10:57:08 +0200
In-Reply-To: <20230403165229.4jhpo2xs7tuclekw@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230403165229.4jhpo2xs7tuclekw@halaney-x13s>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 echanude@redhat.com, konrad.dybcio@linaro.org, vkoul@kernel.org,
 hisunil@quicinc.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 12/12] net: stmmac:
 dwmac-qcom-ethqos: Add EMAC3 support
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

Hi,

On Mon, 2023-04-03 at 11:52 -0500, Andrew Halaney wrote:
> @@ -327,9 +370,17 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  			      RGMII_CONFIG2_RX_PROG_SWAP,
>  			      RGMII_IO_MACRO_CONFIG2);
>  
> -		/* Set PRG_RCLK_DLY to 57 for 1.8 ns delay */
> -		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
> -			      57, SDCC_HC_REG_DDR_CONFIG);
> +		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
> +		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
> +		 */
> +		if (ethqos->has_emac3)
> +			/* 0.9 ns */
> +			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
> +				      115, SDCC_HC_REG_DDR_CONFIG);
> +		else
> +			/* 1.8 ns */
> +			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
> +				      57, SDCC_HC_REG_DDR_CONFIG);

The only (very minor) comment I have is that AFAIK the preferred style
for the above block is: 

		if (ethqos->has_emac3) {
			/* 0.9 ns */
			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
				      115, SDCC_HC_REG_DDR_CONFIG);
		} else {
			...

due to the comment presence this should be threaded as a multi-line statement.
(even if checkpatch does not complain).

Cheers,

Paolo

>  			      SDCC_HC_REG_DDR_CONFIG);
> @@ -355,8 +406,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  			      BIT(6), RGMII_IO_MACRO_CONFIG);
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
>  			      0, RGMII_IO_MACRO_CONFIG2);
> -		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> -			      0, RGMII_IO_MACRO_CONFIG2);
> +
> +		if (ethqos->has_emac3)
> +			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> +				      RGMII_CONFIG2_RX_PROG_SWAP,
> +				      RGMII_IO_MACRO_CONFIG2);
> +		else
> +			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> +				      0, RGMII_IO_MACRO_CONFIG2);
> +
>  		/* Write 0x5 to PRG_RCLK_DLY_CODE */
>  		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
>  			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
> @@ -389,8 +447,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  			      RGMII_IO_MACRO_CONFIG);
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
>  			      0, RGMII_IO_MACRO_CONFIG2);
> -		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> -			      0, RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->has_emac3)
> +			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> +				      RGMII_CONFIG2_RX_PROG_SWAP,
> +				      RGMII_IO_MACRO_CONFIG2);
> +		else
> +			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
> +				      0, RGMII_IO_MACRO_CONFIG2);
>  		/* Write 0x5 to PRG_RCLK_DLY_CODE */
>  		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
>  			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
> @@ -433,6 +496,17 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
>  	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN,
>  		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
>  
> +	if (ethqos->has_emac3) {
> +		if (ethqos->speed == SPEED_1000) {
> +			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
> +			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
> +			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
> +		} else {
> +			rgmii_writel(ethqos, 0x40010800, SDCC_USR_CTL);
> +			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
> +		}
> +	}
> +
>  	/* Clear DLL_RST */
>  	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_RST, 0,
>  		      SDCC_HC_REG_DLL_CONFIG);
> @@ -452,7 +526,9 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
>  			      SDCC_HC_REG_DLL_CONFIG);
>  
>  		/* Set USR_CTL bit 26 with mask of 3 bits */
> -		rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26), SDCC_USR_CTL);
> +		if (!ethqos->has_emac3)
> +			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
> +				      SDCC_USR_CTL);
>  
>  		/* wait for DLL LOCK */
>  		do {
> @@ -547,6 +623,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
>  	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
> +	ethqos->has_emac3 = data->has_emac3;
>  
>  	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_clk)) {
> @@ -566,6 +643,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
>  	plat_dat->dump_debug_regs = rgmii_dump;
>  	plat_dat->has_gmac4 = 1;
> +	plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
>  	plat_dat->pmt = 1;
>  	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
>  	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
> @@ -603,6 +681,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> +	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
>  	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
>  	{ }
>  };

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
