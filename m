Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455D9FB964
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 06:06:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E2B7C78F67;
	Tue, 24 Dec 2024 05:06:02 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B50B8C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 05:05:54 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso5349564e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 21:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735016754; x=1735621554;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
 b=wlkSKcnTq2w61jp+R9/cxqyPHKQZAJAl/b3fY2FmAw/wUqVHKjXjtzRvmrS+BXHdV9
 2bY119fg5rLK0Bpslhm08hDEMjxRv0LCP2n4CP06vjY/gtsAV6YIe6biYH1le6xFQF/0
 mKiEX4n84VUWFi42TyEl41VbiTh185RMjoS6QfFepzlorg43hzkIF56xlZ57NpjLoVGx
 iYYoguO+mvVv6KVh7zesgNrOZcoENmh12RlqVL/nXJ922vyJainO/dUb9+Mle9eO/zgs
 XTPoExbgY05+joFD720+HfmXXXmBRJbadoI/i2PSC0KNYvBI6XbM3mB0AfBBMyH6R0PH
 HGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735016754; x=1735621554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
 b=DAQFYoKaa4jmiI6UpxyFdhwKCs1kK6AT4salzP5zyCIs6mhnNuX25fkLaCX5EvbGbT
 BbjuTLaNnaoDXJElfWPoW0gCGAbNZhi3/8P6xcq4mldvRSAnYmbp6sufvLOXRUxpStZk
 pc6CNUR8Am/m61whYJk4fMitUGkjovAu4jKcizbXd6KAPvy0v0ZwQWU1WTW+VGMs8AK6
 EaU8V36gL1V7NVTkMHie5ZjVhheziahbTBo2uR9DyP5r7gwrhhN0wsCTT/RVCVj/Ixbf
 n5YoPZuvb2KaS424EEulU5X9UZrUQi7tyr5NUN/M09q6wT+RP1Pn400GSH99xqDcoeSH
 fxRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDc3y+CcbMt0xCUeY49Pr1VaB8bJuct8dwmLoxtZv6d6l8kF6WagkdWNURwoFwn7tfSiJS6m13OHNuHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNVIwocCgCCWE/69po1pAwxByT5JO2+6bmgmKZr827UQY3ABQy
 pQ/rMN2tLDApj0RRCH8Dl/mhunz5rtKuS3PI4vUlalNjulUePHrPcZNsF7w1jes=
X-Gm-Gg: ASbGnctx8bktTHDV9mAOTmpfIrt+aklQsi5G8vm8inGQ/45zkZnqd2/ZaMb6qfnLgVU
 T60CrIMr1V/b9sTQvDjHBD+Q0L1hHtJ5RlTi25bw2rJOudMcO6j2BbAUlDtKYwMpRtIhj3++nGg
 3CZWXbB/DQ3ppto7fTLwhI68+KFaUU0P/EffKdd5J6Uz49cx1kBsV6cXXNnm/lTkpQ+2ZQsD4L8
 Sl9j/7bFsqRX0QVBIiJoPeBsOt+e8L0lQsJvJcHftiEyhhIq8bs7DKNjRku0yqLWAvdf0MjnhA0
 9IHkbnfxHErHK3Rlqa4frSVDaA12Ia3Jb10L
X-Google-Smtp-Source: AGHT+IFEQbqTtUHwKKMk91ZNCPcChoIwDJTCy518t9r4AD4nY9+X1Uvz8CG9rXE+5M9RXLCgiSKkQA==
X-Received: by 2002:a05:6512:3b08:b0:542:23b3:d82c with SMTP id
 2adb3069b0e04-542295244aamr5324092e87.3.1735016752385; 
 Mon, 23 Dec 2024 21:05:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238216cbsm1486707e87.216.2024.12.23.21.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 21:05:51 -0800 (PST)
Date: Tue, 24 Dec 2024 07:05:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <htnq5jjxwbsn3fjc3m6tzvyqrwzckipd3z63j2dotkliiwnqgk@lifzh4q35dqg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
 <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
 <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
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

On Tue, Dec 24, 2024 at 12:36:29PM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-24 12:18, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> > > qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> > > compatible.
> > > 
> > > Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> > > ---
> > >   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
> > >   	.has_emac_ge_3 = false,
> > >   };
> > > +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
> > 
> > lowercase the hex, please.
> 
> I will take care of it.
> 
> > 
> > > +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> > > +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> > > +};
> > > +
> > > +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> > > +	.por = emac_v2_3_1_por,
> > > +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> > > +	.rgmii_config_loopback_en = true,
> > > +	.has_emac_ge_3 = false,
> > > +};
> > 
> > Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
> > emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
> > corrected to use qcom,qcs404-ethqos as as fallback entry, making this
> > patch unused. Please correct the bindings instead.
> 
> Although they currently share the same data, they are actually two different
> versions. Their differences are not apparent now but will become evident
> once new features are uploaded. If I revert to qcom,qcs404-ethqos now, it
> will be challenging to distinguish between them in the future.

Which features? Moreover, note, the use of the fallback doesn't preclude
you from addign a new compat entry later on. By having a fallback you
simply declare that the device A is also compatible with the device B.

> 
> > 
> > > +
> > >   static const struct ethqos_emac_por emac_v3_0_0_por[] = {
> > >   	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
> > >   	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> > > @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   static const struct of_device_id qcom_ethqos_match[] = {
> > >   	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> > > +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
> > >   	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
> > >   	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
> > >   	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
