Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D249A694104
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:26:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96531C6A5F0;
	Mon, 13 Feb 2023 09:26:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D29CEC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:26:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m10so2491978wrn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WSLZ3ZKzsvIefT199tYWo7cJEGZZJgm6+X6WVzrQDEk=;
 b=SLdab1UEWactdNcB1w+n5yvxgRExwZc1qv84xdAEmwynljSRSQ3Ci8uC20Xp/xeoD2
 VcW8RjLygpG/Vic1xrzk4LDrIIMHbU5ZCL2mTNqqQxqHyySDCkzOMi6skSPVhjxbFAJ6
 3DPVNXzwHenU7oA4LlRJtv8bRQvl2NnK49jTekMoOgvOxDyXD4JjwZz3VEia5N2TbEHd
 alyvyJ9GKaXrYxDN1TK7s/oRyizZXJMwt7yhcCe6Cfn+JSZOtuP/y5FcqHjwfutiChlk
 oSzGGpQtdmV40tjToqhFWJKA9xVuUvfPEujfkAglf75PmL72M99ijvPCErk58Kr6zLUz
 Hm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSLZ3ZKzsvIefT199tYWo7cJEGZZJgm6+X6WVzrQDEk=;
 b=ZP/H/qTZ9BPPMy5BKUOC1zPq1QFt2RImYCumUyOZqxzz7uOiAU89jmtGNRE+IgToe3
 hf4woje9j0Qpu2JH8ugs2SV+Ex2A/p8URnX6QA7FT5meJA0PtM3CcDRMeMUpPYKqAOP0
 xYObDCHidfq/Aa3qZ1ekHRCVqz367PSrp1XPzrQmKhkztK7dMFz418TU8UMMVwdIHKFT
 r/Wx9gg3Nu/D1x6zKGn21pY8VDmzADSIs9+HwhfjMWElNaQ3j2CTmggCaENlraA6sIGC
 LbTMO2kNGI3tNdjSVR9ErtKKNjGyikBHVp0aH806yZ/Rynb4GuswQ+gH3afpthIHdDfr
 VEqA==
X-Gm-Message-State: AO0yUKU4ZO0SO5rjwBGUt/To2j++x21ToPPBl3SyWFiC2zevPCpQv2P1
 urTtCDORwFNv7cNKZS56qj1oOg==
X-Google-Smtp-Source: AK7set/7w+SNxBNKti9FoZehdW/4irYGNDTCvC0R2xc487VgVY69FMUVdWPnhCVD0GvgBt0CK5LIuA==
X-Received: by 2002:a5d:6707:0:b0:2c3:d4b0:6d8 with SMTP id
 o7-20020a5d6707000000b002c3d4b006d8mr21318493wru.23.1676280369540; 
 Mon, 13 Feb 2023 01:26:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adff702000000b002bddac15b3dsm9806893wrp.33.2023.02.13.01.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:26:09 -0800 (PST)
Message-ID: <dbf26e3f-6a4f-cd15-c7d3-b0c1c482b83b@linaro.org>
Date: Mon, 13 Feb 2023 10:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
	StarFive JH7100 SoC
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This adds a glue layer for the Synopsys DesignWare MAC IP core on the
> StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [drop references to JH7110, update JH7100 compatible string]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d48468b81b94..defedaff6041 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19820,6 +19820,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>  
>  STARFIVE JH7100 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index f77511fe4e87..2c81aa594291 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
>  	  for the stmmac device driver. This driver is used for
>  	  arria5 and cyclone5 FPGA SoCs.
>  
> +config DWMAC_STARFIVE
> +	tristate "StarFive DWMAC support"

Bring only one driver.

https://lore.kernel.org/all/20230118061701.30047-6-yanhong.wang@starfivetech.com/

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
