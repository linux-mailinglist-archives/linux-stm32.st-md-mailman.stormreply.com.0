Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C958390041D
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A7ACC78005;
	Fri,  7 Jun 2024 12:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D4AC712A3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 12:54:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 42FDB8843F;
 Fri,  7 Jun 2024 14:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717764897;
 bh=VEyICVXVOAE0B8ItgEDxm4sokZMsD0t+tJNKgZw1T7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tmPNDRqv1m8He/GCNsJTfLL8b/vWW3CAJYfWCcNkXFXyx39Cq6rZSpK9BWlGz8ftC
 LDkSewO6Go/u2jwTgAfZPbjoRyx/rCZF16Ij9ZEXpFQ94+klINMEAbAY1I6oStWIXN
 YXryOyHPARwPQVuuEXkaulnVi2ZRcsBk3ymk2TuKvUhSYl6XIs4ZNuMsYvtzr1TZwz
 lQjR36+FK/MBh9fBuZ8+/5F6RHjIm4eiZPXjXQBngeG9+Y9PHn/mf5pe4meLTHmO/3
 RisnqkYCJuCuwxQmMP2Cev9iK6KYqCrZcPqz4iXnc1fDPBgkG61YzYhXgWPkBOF0gB
 VbD6N/1d2GM9w==
Message-ID: <379a013a-5385-4b74-ad68-12e73253a8b5@denx.de>
Date: Fri, 7 Jun 2024 14:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-8-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240607095754.265105-8-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 07/12] net: stmmac: dwmac-stm32: Mask
 support for PMCR configuration
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

On 6/7/24 11:57 AM, Christophe Roullier wrote:

[...]

> @@ -348,8 +352,15 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   		return PTR_ERR(dwmac->regmap);
>   
>   	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
> -	if (err)
> +	if (err) {
>   		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
> +		return err;
> +	}
> +
> +	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
> +	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
> +	if (err)
> +		pr_debug("Warning sysconfig register mask not set\n");

Isn't this ^ an error ? If so, use dev_err(), else use dev_dbg()

>   	return err;
>   }

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
