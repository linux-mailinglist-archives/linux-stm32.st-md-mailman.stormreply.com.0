Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B8A949B27
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2024 00:15:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B032C7129D;
	Tue,  6 Aug 2024 22:15:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8337EC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 22:14:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52f025bc147so1566886e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722982499; x=1723587299;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yXjtb86nnXZiK+81bTmuvRngQoj2Z9OAz1cGyJKoh3A=;
 b=gAiqZCE950lzBWFN527p+jIbXbYWgu8clM/Vr/nUEo5bws4v/7I92Oauz75PtNfmjm
 nKHiTjhcASIYNlZY/X8ajs/6SonnpbeYBq0T6iMl80EaED/t8ac9B7IR6nM3rOEMWp5u
 Gkd5RimXCVbzErohGE7kjocNR64oF3rGQ2q6ENw4nFL94urhf9hiNwmzfSYvaw73hvUC
 oP0gVJlYckfL/J1M3q6SS6TS7NMFEkRtSt37sfNMkuPGdndLve1MusKN8+DTjZY3yOVF
 UCjv4Q/7ogExntSv76HhWWepGjkrnYF/CzDUfHR9D5DO2wdMdVkVipyp8Trv9VOHrQ/F
 xR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722982499; x=1723587299;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXjtb86nnXZiK+81bTmuvRngQoj2Z9OAz1cGyJKoh3A=;
 b=n7IqoUTrfMstpRxstr7ENrAuolUxbF2xpG3SLIZZZa35PVUDu6FopE6VrHTEFrExwQ
 c5P+ZuinftL2IBIFIyNxDe4XlIEQbJiz7B8RxJyAeRwokXMQO26orC7yMVS3k/vHTVC4
 nRe5crBiZA4G2NMrhmy3Ho/PhH/YN/u14La0qlgQwdN2QjUNlqvxuHl/T1kYRH8AMYFY
 emSM7D08UUExal8scaCHJB2dEyTd6LFIxiX8PFDt7ODMb+FLVHgjAIrnC3m3ECOgtgdq
 knIgqTr+JMErLMOJEESLwRmz03Zcxl6FnTxNrJ+wW0WBqMxiDN0NPzRFKQIaqp/cvSd/
 3t9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVddMAytR0JyR/+2FZZzgEJZe7/A+cEgQpYl3ro0UsCjjp+/Xfd5akVQqB8oBbOL+yITtkn01cfXXSsLu3GSoxumoLfLz9pA1JbAuZn3HioYhwMlupxBaGC
X-Gm-Message-State: AOJu0YwcFWDAsRzNKvu70tQks3Avw3d3eVxZuhuRYv+fJr9rsBoeESNK
 41mB1qNcyQhQlY4nH0q18ONbzlN2xZFnPjY9xsyz8BFXvv2KscOQ
X-Google-Smtp-Source: AGHT+IEKpr1UFCKDIwWRxjnU/uCMgSVrE+o0Upo4NwXVrAnyDnyihhz4pz3m7yaMLFIsDF1d0jQ75A==
X-Received: by 2002:a05:6512:3c98:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-530bb39bf01mr11779826e87.55.1722982498234; 
 Tue, 06 Aug 2024 15:14:58 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de457b3csm3663e87.161.2024.08.06.15.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 15:14:57 -0700 (PDT)
Date: Wed, 7 Aug 2024 01:14:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <o4dgczjefqjek3iqw2y3ca7pwolj5e6otjyuinpuvkwcli5xei@dzehe7xde44x>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

On Thu, Aug 01, 2024 at 08:18:21PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Integrate dwxgmac4 support into stmmac hardware interface handling.
> A dwxgmac4 is an xgmac device and hence it inherits properties from
> existing stmmac_hw table entry.
> The quirks handling facility is used to update dma_ops field to
> point to dwxgmac400_dma_ops when the user version field matches.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h |  4 +++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 26 +++++++++++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h   |  1 +
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index cd36ff4da68c..9bf278e11704 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -37,11 +37,15 @@
>  #define DWXGMAC_CORE_2_10	0x21
>  #define DWXGMAC_CORE_2_20	0x22
>  #define DWXLGMAC_CORE_2_00	0x20

> +#define DWXGMAC_CORE_4_00	0x40

DW25GMAC_CORE_4_00?

>  
>  /* Device ID */
>  #define DWXGMAC_ID		0x76

What is the device ID in your case? Does it match to DWXGMAC_ID?

>  #define DWXLGMAC_ID		0x27
>  
> +/* User Version */
> +#define DWXGMAC_USER_VER_X22	0x22
> +
>  #define STMMAC_CHAN0	0	/* Always supported and default for all chips */
>  
>  /* TX and RX Descriptor Length, these need to be power of two.
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 29367105df54..713cb5aa2c3e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -36,6 +36,18 @@ static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
>  	return (reg & GENMASK(15, 8)) >> 8;
>  }
>  

> +static u32 stmmac_get_user_version(struct stmmac_priv *priv, u32 id_reg)
> +{
> +	u32 reg = readl(priv->ioaddr + id_reg);
> +
> +	if (!reg) {
> +		dev_info(priv->device, "User Version not available\n");
> +		return 0x0;
> +	}
> +
> +	return (reg & GENMASK(23, 16)) >> 16;
> +}
> +

The User Version is purely a vendor-specific stuff defined on the
IP-core synthesis stage. Moreover I don't see you'll need it anyway.

>  static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
>  {
>  	struct mac_device_info *mac = priv->hw;
> @@ -82,6 +94,18 @@ static int stmmac_dwmac4_quirks(struct stmmac_priv *priv)
>  	return 0;
>  }
>  

> +static int stmmac_dwxgmac_quirks(struct stmmac_priv *priv)
> +{
> +	struct mac_device_info *mac = priv->hw;
> +	u32 user_ver;
> +
> +	user_ver = stmmac_get_user_version(priv, GMAC4_VERSION);
> +	if (priv->synopsys_id == DWXGMAC_CORE_4_00 &&
> +	    user_ver == DWXGMAC_USER_VER_X22)
> +		mac->dma = &dwxgmac400_dma_ops;
> +	return 0;
> +}
> +
>  static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
>  {
>  	priv->hw->xlgmac = true;
> @@ -256,7 +280,7 @@ static const struct stmmac_hwif_entry {
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxgmac2_setup,
> -		.quirks = NULL,
> +		.quirks = stmmac_dwxgmac_quirks,

Why? You can just introduce a new stmmac_hw[] entry with the DW
25GMAC-specific stmmac_dma_ops instance specified.

-Serge(y)

>  	}, {
>  		.gmac = false,
>  		.gmac4 = false,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index e53c32362774..6213c496385c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -683,6 +683,7 @@ extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
>  extern const struct stmmac_mmc_ops dwmac_mmc_ops;
>  extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
>  extern const struct stmmac_est_ops dwmac510_est_ops;
> +extern const struct stmmac_dma_ops dwxgmac400_dma_ops;
>  
>  #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
>  #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
