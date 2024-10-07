Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49169992E54
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 16:08:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6ED8C71287;
	Mon,  7 Oct 2024 14:08:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A506EC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 14:08:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AFE6888B78;
 Mon,  7 Oct 2024 16:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728310114;
 bh=+VpmP0fcyJ4CvVzbF2fPZNTRpsuYq852AIzc/SBidtU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xzIjojC59GxXRKRyu56hXd98pKsVTbyL5R3E22FUEE3Cm+gMGHRZ9MBK6DHgEnBC+
 j/fN/jMlSBxGtNtZNvWQZmzaiM5906Itwyy1RidcsUqo5qjZKhgOaQg2irZ0aRxsOc
 GX9GGxZexQtw3+CDRIy007j6VG7zD73biVSG+5SIqwzutx/PXVOBssYDZgcCiowyQv
 0EB0XtLElyCYQ+NvTeKEAYdlLub7LVH5qqchcU79KAUzQQLPKyxM/fhC+X3AIH+DQZ
 igRNWj2W4n3wOWX7ZtZKMqbBgQrSsJSxVK5O7x4PQkoqHP4mWIdqzYOI4s1Qt73yqz
 1MKzuBt3CypfA==
Message-ID: <a7b2d849-ce6c-46b3-bf4f-c619106e2edd@denx.de>
Date: Mon, 7 Oct 2024 15:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-2-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241007132721.168428-2-gatien.chevallier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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

On 10/7/24 3:27 PM, Gatien Chevallier wrote:
> Add RNG STM32MP25x platforms compatible. Update the clock
> properties management to support all versions.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   .../devicetree/bindings/rng/st,stm32-rng.yaml | 41 +++++++++++++++++--
>   1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> index 340d01d481d1..c92ce92b6ac9 100644
> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> @@ -18,12 +18,19 @@ properties:
>       enum:
>         - st,stm32-rng
>         - st,stm32mp13-rng
> +      - st,stm32mp25-rng
>   
>     reg:
>       maxItems: 1
>   
>     clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: rng_clk
> +      - const: rng_hclk
>   
>     resets:
>       maxItems: 1
> @@ -57,15 +64,43 @@ allOf:
>         properties:
>           st,rng-lock-conf: false
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-rng
Maybe this match should be inverted, it is likely the next generation of 
stm32 will also use 2 input clock into the RNG block and it will be only 
the legacy MP1 that uses one clock.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
