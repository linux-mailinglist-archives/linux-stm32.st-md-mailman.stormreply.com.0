Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9B7DCF46
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 15:34:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51930C6B44B;
	Tue, 31 Oct 2023 14:34:15 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 465D1C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:34:14 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 710DC3F04D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698762853;
 bh=COgus/3ZSuwT+db+ge/hLLqZedK9bhS7aDmQpcwmeRs=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=d6neoEAGMetpbnC7t/fDCR8UiAYUwXJOS4dy5QO1Ppel/YnNcFXXYwfHw2jyJ9I2Q
 jC8cPNlsB1jkg03qvHm7M2eq3ElLlaqs8KefGnOTRGbxZdzkHEu2AQcDebnZ+LqdrD
 7hw5HZsMW6Gh4Hcy/J/D4Kaa0nj166Q6FPoKoBi82LmpWJI9t07VXg2WtqvTbHQ5TU
 kT+BhqRMn9wmo7Vpx1hYBQa84d2LjAkWYReTd/LDLqjbUfCSfUhk9kSi8mNioVZJit
 7gg7xxN6A4GqQD/P5xFJunQUt5ktccJQ8bsDs++Pbge/rFsnpG+1q/TCaTDd1jlIFz
 GHANj2bPSgzIg==
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-27ff9e2ffdfso5322366a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 07:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698762852; x=1699367652;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=COgus/3ZSuwT+db+ge/hLLqZedK9bhS7aDmQpcwmeRs=;
 b=SHYobuvhU8/hhjHy2cev7sOYL/Cj8+23rvQUMDRk6drdJiKSajWnDlksBFLh5juZzJ
 Y+NNBqpRj6B6T9D0k8ZrHGEZ5qvOtzCpHjlIGy072RtkdxDjlIQqwKnYsdqKTJkOGttR
 5fW3ZLPIn86XDr2997eSdE/698liH+SHQkixGEQq/GkVqHG9vyXV7cPjz7Y/AmQbuQI6
 d/MKC3Pc4Egjn5PawNzcr7+lRaCWoqUj7W4HT2TO2dynMIgfORR6bHShvwwOUhVSB6zj
 UXrwppFwdsJHjGRQb9rfguVlrTU7q0p7LsSiQK4xdFlqHjGtIotk6k8FvgsEENUZysqc
 izEg==
X-Gm-Message-State: AOJu0YzjOeJVPCvPST3AP9X5f60TGJ5BDDhubshLODExaj7Wp3Udf4wL
 ipO1KyD9PUAQJ8cGgd5muhBIT7KkTL48pL3Z8+VWBtVs40HY1GugSVe6/VrXfR9gMcHAQKbARk6
 CX8QyBBro/duAaN/LYZEmKxlblZO2zlGXvqICahMlyfK4neT6ZvuTCR9MyQ9WmhUf1+9ZuCUtCw
 ==
X-Received: by 2002:a05:6214:29c7:b0:671:9c02:cba9 with SMTP id
 gh7-20020a05621429c700b006719c02cba9mr8520641qvb.51.1698762831413; 
 Tue, 31 Oct 2023 07:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF74SsUAurkkruUb75fgXBV0BIjaQzXoMkI8lq6APUuq85/spyU3nh/61hrUO+aeB6Sqk13/8jIe+UO0RD6jOs=
X-Received: by 2002:a05:6214:29c7:b0:671:9c02:cba9 with SMTP id
 gh7-20020a05621429c700b006719c02cba9mr8520611qvb.51.1698762831069; Tue, 31
 Oct 2023 07:33:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:33:50 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-6-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-6-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:33:50 -0700
Message-ID: <CAJM55Z8K5QztgU9NYiJ1kv+-BSsgP=LCABN7BYDtQ30_G1Nc7w@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/12] net: stmmac: dwmac-starfive: Add
 support for JH7100 SoC
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

Cristian Ciocaltea wrote:
> Add a missing quirk to enable support for the StarFive JH7100 SoC.
>
> Additionally, for greater flexibility in operation, allow using the
> rgmii-rxid and rgmii-txid phy modes.
>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Hi Cristian,

Thanks for working on this! This driver has code to update the phy clock for
different line speeds. I don't think that will work without the
CLK_SET_RATE_PARENT flag added to the clock in [1] which in turn depends on
[2].

[1]: https://github.com/esmil/linux/commit/b200c3054b58a49ba25af67aff82d9045e3c3666
[2]: https://github.com/esmil/linux/commit/dce189542c16bf0eb8533d96c0305cb59d149dae

Two more comments below..

> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 ++--
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 ++++++++++++++++---
>  2 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index a2b9e289aa36..c3c2c8360047 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,9 +165,9 @@ config DWMAC_STARFIVE
>  	help
>  	  Support for ethernet controllers on StarFive RISC-V SoCs
>
> -	  This selects the StarFive platform specific glue layer support for
> -	  the stmmac device driver. This driver is used for StarFive JH7110
> -	  ethernet controller.
> +	  This selects the StarFive platform specific glue layer support
> +	  for the stmmac device driver. This driver is used for the
> +	  StarFive JH7100 and JH7110 ethernet controllers.
>
>  config DWMAC_STI
>  	tristate "STi GMAC support"
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 5d630affb4d1..88c431edcea0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -15,13 +15,20 @@
>
>  #include "stmmac_platform.h"
>
> -#define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
> -#define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
> -#define STARFIVE_DWMAC_PHY_INFT_FIELD	0x7U
> +#define STARFIVE_DWMAC_PHY_INFT_RGMII		0x1
> +#define STARFIVE_DWMAC_PHY_INFT_RMII		0x4
> +#define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
> +
> +#define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
> +
> +struct starfive_dwmac_data {
> +	unsigned int gtxclk_dlychain;
> +};
>
>  struct starfive_dwmac {
>  	struct device *dev;
>  	struct clk *clk_tx;
> +	const struct starfive_dwmac_data *data;
>  };
>
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> @@ -67,6 +74,8 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>  		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
>  		break;
>
> @@ -89,6 +98,14 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	if (err)
>  		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
>
> +	if (dwmac->data) {

I think you want something like this so future quirks don't need to touch this
code:

	if (dwmac->data && dwmac->data->gtxclk_dlychain)

> +		err = regmap_write(regmap, JH7100_SYSMAIN_REGISTER49_DLYCHAIN,
> +				   dwmac->data->gtxclk_dlychain);
> +		if (err)
> +			return dev_err_probe(dwmac->dev, err,
> +					     "error selecting gtxclk delay chain\n");
> +	}
> +
>  	return 0;
>  }
>
> @@ -114,6 +131,8 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	if (!dwmac)
>  		return -ENOMEM;
>
> +	dwmac->data = device_get_match_data(&pdev->dev);
> +
>  	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
>  	if (IS_ERR(dwmac->clk_tx))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> @@ -144,8 +163,13 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  }
>
> +static const struct starfive_dwmac_data jh7100_data = {
> +	.gtxclk_dlychain = 4

Please add a , at the end of this line. I know it's unlikely that we need to
add more properties, but it's still good practice to do. This way such patches
won't need to touch this line.

> +};
> +
>  static const struct of_device_id starfive_dwmac_match[] = {
> -	{ .compatible = "starfive,jh7110-dwmac"	},
> +	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
> +	{ .compatible = "starfive,jh7110-dwmac" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
