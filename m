Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A587DD96
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 15:53:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 966F8C6B46B;
	Sun, 17 Mar 2024 14:53:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FBFBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 14:53:23 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso338538766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710687202; x=1711292002;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7ImUJS52VyjYeLxcluUDeQFte9FFBlkrSYtgWQ8yXw=;
 b=qOo8cV1tzmq3I0q9ABwm/u88RKI8zfUxGkyUNdq9Xk/yAZfhWrMGEj+YAEKRvorFKz
 8uOvgorxZFD7IHzzjDWv0rb8gi8HPvcg7g4aY33v3ZenvoRRFsl9SDK6hGrpWrypfLhj
 KwCTu3GeNGM01B2w4wFXXtrv3J3GuxJKfhLwH+2BK8jLAx13SFW9w1+NSYRkjmHO7os4
 Rnw08z1Xiv0BdsNKRAdxGx3bWOvoTKnTXRGXaAan9GK3JlVS6ml6gHjxf+QystGWX4H0
 GkZ5MZ7H4FrVCUO93yvC2NtAcT028fNrTKj++3i8exrfKoI0KJskPLvAOlmdcJEpMSjk
 TpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710687202; x=1711292002;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7ImUJS52VyjYeLxcluUDeQFte9FFBlkrSYtgWQ8yXw=;
 b=jRQhYkiZqQVrD2t45bY1tDPSzcfFL8KSzKIqOM1nvAuxU51fruZHpNNGYZjEM02zqc
 G3mkkXejxvoBDWsmiJrjdXeevPLwsmXnzeRCRQfGk9s668ZZsUOzqVGkI/mk7V6v+Fc1
 E9CPKErdRNFQwDojQP5wMTbFMMW5RWf2Aj7HHu+Ej1HW685mNRFJbkF4TiHfaJLhRLjh
 yJ51tMVxPqAnO7kxq7jD0yQtu6u8/qOQqDF2DD0pGVU1h1dvwAY84dOncBfiW31NksQW
 PHV4IiE1xa9wxccUyzziuJA9dshOqvjVKBhfsm1umrr2fwzniRfdImiWxPvusnTHo4Za
 TBiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULxz/CO2rUOv+1BTmkkHqCJ+FZZjMXEHuXL5mmUeR4f2/MIQZm/cVj2Sp8jY025EbF8ecNhbZSPgKwYIjzt14O0DGiGxtkxJl3KEKPJiCclMzRSG9YEAJg
X-Gm-Message-State: AOJu0YykdqoWarMplCr+fO6W5J8+ahy/BuUYih15AIIYOUylNOTOpXBY
 u+QBNqAQbVRAvvCniyp2EdwFngljH4GVNn4M0ibTzDUH7JMAfVUA/T8xdYk8wig=
X-Google-Smtp-Source: AGHT+IGLHuYAXQTzUPfWxEk8zH5AVbEU7r4LozhX+lOU5bfxaSZ8BYJc0KlNTmOXTDzCaC2yHlx4VQ==
X-Received: by 2002:a17:906:831a:b0:a46:a10b:8806 with SMTP id
 j26-20020a170906831a00b00a46a10b8806mr3048939ejx.13.1710687202489; 
 Sun, 17 Mar 2024 07:53:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 jx25-20020a170907761900b00a4661f0f1e7sm3822898ejc.205.2024.03.17.07.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 07:53:22 -0700 (PDT)
Message-ID: <2316e61d-ad7d-46fb-9f55-67964552855a@linaro.org>
Date: Sun, 17 Mar 2024 15:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wadim Mueller <wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-3-wafgo01@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240315222754.22366-3-wafgo01@gmail.com>
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: Add NXP S32 SoC family
	support
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

On 15/03/2024 23:27, Wadim Mueller wrote:
> Add support for NXP S32 SoC family's GMAC to the stmmac network driver. This driver implementation is based on the patchset originally contributed by Chester Lin [1], which itself draws heavily from NXP's downstream implementation [2]. The patchset was never merged.
> 
> The S32G2/3 SoCs feature multiple Ethernet interfaces (PFE0, PFE1, PFE2, and GMAC) which can be routed through a SerDes Subsystem, supporting various interfaces such as SGMII and RGMII. However, the current Glue Code lacks support for SerDes routing and pinctrl handling, relying solely on correct settings in U-Boot. Clock settings for this SoC are managed by the ATF Firmware.


Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Read how commit msg should be wrapped.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Changes made compared to [1]:
> 
>     Rebased onto Linux 6.8-rc7
>     Consolidated into a single commit
>     Minor adjustments in naming and usage of dev_err()/dev_info()
> 
> Test Environment:
> The driver has been successfully tested on the official S32G-VNP-RDB3 Reference Design Board from NXP, utilizing an S32G3 SoC. The firmware and U-Boot used were from the BSP39 Release. The official BSP39 Ubuntu 22.04 Release was successfully booted. A network stress test using iperf [3] was also executed without issues.
> 
> [1] https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228
> [2] https://github.com/nxp-auto-linux/linux/blob/release/bsp39.0-5.15.129-rt/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
> [3] https://linux.die.net/man/1/iperf
> [4] https://github.com/nxp-auto-linux/u-boot
> [5] https://github.com/nxp-auto-linux/arm-trusted-firmware
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +

That's totally unrelated to DTS. Do not mix independent work in one
patchset. This targets net-next, not SoC, so please send it as separate
patchset when net-next reopens, so after merge window.

>  drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 313 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   9 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |   3 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   5 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   7 +
>  include/linux/stmmac.h                        |   9 +
>  9 files changed, 362 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 85dcda51df05..1cdf2da0251c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -142,6 +142,18 @@ config DWMAC_ROCKCHIP
>  	  This selects the Rockchip RK3288 SoC glue layer support for
>  	  the stmmac device drive


...

> +
> +	plat_dat->safety_feat_cfg->tsoee = 1;
> +	plat_dat->safety_feat_cfg->mrxpee = 1;
> +	plat_dat->safety_feat_cfg->mestee = 1;
> +	plat_dat->safety_feat_cfg->mrxee = 1;
> +	plat_dat->safety_feat_cfg->mtxee = 1;
> +	plat_dat->safety_feat_cfg->epsi = 1;
> +	plat_dat->safety_feat_cfg->edpp = 1;
> +	plat_dat->safety_feat_cfg->prtyen = 1;
> +	plat_dat->safety_feat_cfg->tmouten = 1;
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret)
> +		goto err_gmac_exit;
> +
> +	return 0;
> +
> +err_gmac_exit:
> +	s32_gmac_exit(pdev, plat_dat->bsp_priv);
> +	return ret;
> +}
> +
> +static const struct of_device_id s32_dwmac_match[] = {
> +	{ .compatible = "nxp,s32-dwmac" },


Missing bindings.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +	{}
> +};



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
