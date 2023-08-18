Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10D781030
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 18:21:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC928C6B461;
	Fri, 18 Aug 2023 16:21:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1798C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 16:21:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso16873611fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692375665; x=1692980465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ISevr3prZA/3S0QxHj5ydXN0Zv61FsI9PfVEfof23CI=;
 b=jZahUfj/MmduD+IPM03Pint/RLvUMSFv0iyRRMZSaK908OZyaz1O8uAqEOBN88VHc1
 qNUNn4OVR+Z5EdbK7gnS4UphDN5VeVwufEUMpn8lpNV2nvE0UB4iMLP8b+cjHbHV47u/
 2bqeW+UcsPb1eQTiJ5flLoGXw+0pKJFWwXm03O2yDfz5x39ZvdyJ+EOW2S5LatN4wemT
 pFYYtLSTflnCmN31qdlqNS/9ABA85Bw7JTX4xETOWP1ymW5V+RDZfzrwYw/5LX6Ds9k3
 bZeWn68Ym2ldz7i9zXQjKozmlM+fRC5okYuigbqgTnkiYKmUAldLuYmhHznPiV3rREO2
 YiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692375665; x=1692980465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISevr3prZA/3S0QxHj5ydXN0Zv61FsI9PfVEfof23CI=;
 b=DiFv1bucdGGxMStAnsYVJKNbR9SHVeKeex2S6Brs4l6oUuMAIQ9QAAu4e3xoY2lKNE
 zXlLZGRAgJ2LGJJ/shMYkq9bD6Nui3sym4xYXpvfkt+ojpsPX+0bHIKehX7HBV3Rrp/a
 r3sA99rS49oHPBTmB+o9ipjeiZaElBvsdFJdjQcydnqbd5Cwk8JBo4MncTq2bo+S8GNk
 gUI8s4723OYCGO2TJBiJeXSUEhAQwyeX48sP/vrM1t3rQi7+SjI1t1w+yToPm6YrUdRe
 FHupxfZKDGl/zUWt2gSUp9Ufso2Cn3wD3sq9fFKC4JczhZOEPkVQHlBCcX7yzGuAHHr1
 pdsQ==
X-Gm-Message-State: AOJu0YzQkwBZUMP+ffIqc2KtHG5tOnwmwhZcuAxtq7jdlO5V3qld1xWy
 eGpvlIxew91uZ8fg1WkJpBA=
X-Google-Smtp-Source: AGHT+IE3/49Cxy+7LqkfRNSOMxG3XFb7K+P7OqdpNJXTtf3WMhq9yD7RJ9phPsVggVXGgrG0MkRTsw==
X-Received: by 2002:a19:4f42:0:b0:4fb:9129:705b with SMTP id
 a2-20020a194f42000000b004fb9129705bmr1957691lfk.6.1692375664574; 
 Fri, 18 Aug 2023 09:21:04 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 l17-20020ac25551000000b004fe432108aesm406648lfk.261.2023.08.18.09.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 09:21:04 -0700 (PDT)
Date: Fri, 18 Aug 2023 19:21:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <2kx4oyzkt3d72lf746rhblx4cecy32yosyyshqzehd5vadth7w@4jppnqxpm6ww>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817165749.672-2-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/9] net: stmmac: correct RX
 COE parsing for xgmac
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

On Fri, Aug 18, 2023 at 12:57:41AM +0800, Jisheng Zhang wrote:
> xgmac can support RX COE, but there's no two kinds of COE, I.E type 1
> and type 2 COE.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 733b5e900817..3d90ca983389 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7035,7 +7035,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	if (priv->plat->rx_coe) {
>  		priv->hw->rx_csum = priv->plat->rx_coe;
>  		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
> -		if (priv->synopsys_id < DWMAC_CORE_4_00)
> +		if (priv->synopsys_id < DWMAC_CORE_4_00 && !priv->plat->has_xgmac)
>  			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
>  	}
>  	if (priv->plat->tx_coe)
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
