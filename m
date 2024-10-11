Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B899A8B8
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 18:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BDBC71290;
	Fri, 11 Oct 2024 16:18:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EEBAC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 16:18:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 054928936A;
 Fri, 11 Oct 2024 18:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728663523;
 bh=qfzW9M1gcsBgbQS/ObjS1UtD5eOPTO5aHJtP2tyAvJY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ROXEdRO+gkZTauh53iw2lkRJiA3LJcYCuftJStaEvqb5Ds2MpmwpMsgyTHYy4JoxS
 XDCbFwvDWzl/v+1MR3xe0jtzAgElljxvaxpeWyp39spJmlQBNYnTdZuz5zXPHRB+EV
 GEbSI5ONgbBLKOIloCspOih9PfP1gqeIMMT0LMjqRsxqHIiuR3C4xqt6BAmDsZNn8E
 YtkOO4mxyA59dCyFPtBvDP7BHIrhPRbSEWKU2KXna5myMnMm5pW1kgLa1q5YLOw3gI
 arbnegbnK4bfTkbQV7aZqtlv/2m7+T8dWpt0n7JY4eyPvO3uLspp38e+U/Kic/u9St
 juHTDpszu3wNg==
Message-ID: <318dbd5e-f547-4d78-b42e-4dcacc08d328@denx.de>
Date: Fri, 11 Oct 2024 18:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-2-76fd6170280c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241011-rng-mp25-v2-v2-2-76fd6170280c@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/4] hwrng: stm32 - implement support
 for STM32MP25x platforms
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/11/24 5:41 PM, Gatien Chevallier wrote:

[...]

> @@ -551,6 +565,41 @@ static int stm32_rng_probe(struct platform_device *ofdev)
>   	priv->rng.read = stm32_rng_read;
>   	priv->rng.quality = 900;
>   
> +	if (!priv->data->nb_clock || priv->data->nb_clock > 2)
> +		return -EINVAL;
> +
> +	priv->clk_bulk = devm_kzalloc(dev, priv->data->nb_clock * sizeof(*priv->clk_bulk),
> +				      GFP_KERNEL);
> +	if (!priv->clk_bulk)
> +		return -ENOMEM;

Try this:

ret = devm_clk_bulk_get(dev, priv->data->nb_clock, priv->clk_bulk);
...
// Swap the clock if they are not in the right order:
if (priv->data->nb_clock == 2 &&
     strcmp(__clk_get_name(priv->clk_bulk[0].clk), "core"))
{
  const char *id = priv->clk_bulk[1].id;
  struct clk *clk = priv->clk_bulk[1].clk;
  priv->clk_bulk[1].id = priv->clk_bulk[0].id;
  priv->clk_bulk[1].clk = priv->clk_bulk[0].clk;
  priv->clk_bulk[0].id = id;
  priv->clk_bulk[0].clk = clk;
}

> +	if (priv->data->nb_clock == 2) {
> +		struct clk *clk;
> +		struct clk *bus_clk;
> +
> +		clk = devm_clk_get(&ofdev->dev, "core");
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		bus_clk = devm_clk_get(&ofdev->dev, "bus");
> +		if (IS_ERR(clk))
> +			return PTR_ERR(bus_clk);
> +
> +		priv->clk_bulk[0].clk = clk;
> +		priv->clk_bulk[0].id = "core";
> +		priv->clk_bulk[1].clk = bus_clk;
> +		priv->clk_bulk[1].id = "bus";
> +	} else {
> +		struct clk *clk;
> +
> +		clk = devm_clk_get(&ofdev->dev, NULL);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		priv->clk_bulk[0].clk = clk;
> +		priv->clk_bulk[0].id = "core";
> +	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
