Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D89FB926
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 05:19:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C75AFC78F67;
	Tue, 24 Dec 2024 04:19:10 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05C6EC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 04:19:02 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so5061165e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 20:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735013942; x=1735618742;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
 b=NOxI1QfOOvis238nQFWgrGl/dBfnQbIaPk5J5VRq0xYvwmeAVWB0jlQK4NbLiP6gU6
 Evh986f8yfJi5p2R7qezoVHzVz9tILbtYTPw7/8BYKJVRbJoOD7c4YMYmkUE5gPfqwrE
 3Y99YuK3+gyTYEvpVa/qKhjRyZvwulDE8CMDWltjBUoXhY9Ld7NSccPpXHPhqi+L44+B
 Q5fUuXd1KdZAE0MOBxYel8QsEGF7DqhGlTyU2QkwbWCNipQG+pdgWcrul8CSXf+aKaHs
 /XccWP5dgN9yakyMRxPR6YJyGu9a3Ffz907qMiJ54MRviyfSmLiJwB0EmbFqvKIFMby+
 JEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735013942; x=1735618742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
 b=ojESekAmM7I1s5i9caqKQ+uTkrVX1Q1Fsj4CtVhN/7Hc1DYUDYwWenZ5L5GrZxrPcm
 FdjdHX7wjfQs4oRbBms04JTpPFbQdsvhWYV3RivqVLnN5WHwU8w/g3xJ6Qp2KrvoUdYL
 BT2M33FbUA8qjB8LrFvB1vilnj2VbHDoTFeB3V4bTn5hNdqXy3shKmG4tYIvucDey70d
 n7U69rMtVjG3Xtj+/ZVaF9DkryMRgwFvWcIleD3V2Rvm6hdBeFmv7a9LngJSDDUii1PR
 lJ8b0WDFe38LDWWPiUtFSHkvnXiTExyiGdjCX3iNb2P2wc62I7dlELUsDkrLrEG7fbun
 xp6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUy/yjGyOIupN+TL7X2ZexhUf6FmWjFHw/FAbTkG63ccOCmReqc+NEDF4+2Pm4AtjxehtGLD/aHfdhpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztRx626kMoN1+Krdhz4abgmF/WdhEgMfBLkn4sY9ZBgteA6ECy
 GWulTrj18tIUUDE7Gu06wsrLOrgaXvS0O02hMwRcmp1Tf/N4JhpXVJbHXmox6IM=
X-Gm-Gg: ASbGnctef2vLoryrKL0JA0q6s13Z6slBLjIIvTMHzEeCnjW0wyo7BdnicDbh9zHHaMw
 vCl5mJjPdLWqff82K7yPyuNlOB0gl8Y27HeABNt1lEhJwBFEXsAXRBsVF5Ru93L27f0RwiWcMy2
 IKU3zVFv0eaH/R/pZKjcq6bHJOuaG3HRocKPsZUY6yG9jrn4juve7uMeO0zHSurbW7H/+L3IsiU
 RRLmxWuiHwG+VSV1aMJZ/umkKLhinWD74j0d5mMTi3vkJq0R/alzDtVZDbdFOa81pj5XugdIGB0
 7nYeEzVxLVaihfeKvu8VXFGhNfIeD5pIjJJk
X-Google-Smtp-Source: AGHT+IENMWxXPIOYhp6GLi6KEvU2mAH3sEt8lO8Lah7Hkc79/YZpEbN2wsmvfsGNSMcgutuOQc9tKg==
X-Received: by 2002:a05:6512:1041:b0:540:1dac:c03d with SMTP id
 2adb3069b0e04-54229586ef3mr4768804e87.57.1735013942241; 
 Mon, 23 Dec 2024 20:19:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5fa8sm1496276e87.46.2024.12.23.20.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:19:00 -0800 (PST)
Date: Tue, 24 Dec 2024 06:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-3-000ea9044c49@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos:
 add support for EMAC on qcs615 platforms
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

On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> compatible.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
>  	.has_emac_ge_3 = false,
>  };
>  
> +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },

lowercase the hex, please.

> +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> +};
> +
> +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> +	.por = emac_v2_3_1_por,
> +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> +	.rgmii_config_loopback_en = true,
> +	.has_emac_ge_3 = false,
> +};

Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
corrected to use qcom,qcs404-ethqos as as fallback entry, making this
patch unused. Please correct the bindings instead.

> +
>  static const struct ethqos_emac_por emac_v3_0_0_por[] = {
>  	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
>  	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
>  	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
>  	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
>  	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
