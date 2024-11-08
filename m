Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD99C1D0C
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 13:32:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18FAFC6DD94;
	Fri,  8 Nov 2024 12:32:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1A27C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 12:32:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27E36A4291A;
 Fri,  8 Nov 2024 12:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185C2C4CECD;
 Fri,  8 Nov 2024 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731069128;
 bh=OTSjLYZ9CZLdTvXs6M+Ao3qZ+7v2e9k19DVGtbucSic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thlXps8ZJocdFA3UPRDrvXaiiCEru2GJimSp8zo+cSiFyBtaPPVWIyjv57IESI9AF
 O+xIRj7hmQNOrdrK2C4kxu+ngrYBxXEI2vtqxr1FKjF2RTeDqxUh9hTOhEm6zxWy9+
 NmbH/K0z8F/UVdswFtDc7uGiKtR7enBggiINeMQdk6Lp1F4UuEW/B/K/y3xGkEc5xQ
 QX8HnYdMQu/mpsx7Y1DEDpQjDI+XfRi5EfDAUult+xkXxwYgYqeG43PuRkTXq61bIe
 kne8JaI1PlfgdR+0LoHJhCNE7vAuzNdvHmvs0//W4jVFSEQ4tS9iR+KnLt18rulb8p
 yAX6LV9uPrztg==
Date: Fri, 8 Nov 2024 13:32:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <3nkoutm4uixuhetf5cputloooqzpvwhcnq6wklhu3euazmrybe@mjtjqnehfnvg>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
 <20241107155143.1340523-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107155143.1340523-2-olivier.moysan@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ASoC: dt-bindings: add stm32mp25
	support for sai
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

On Thu, Nov 07, 2024 at 04:51:41PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 SAI peripheral,
> through "st,stm32mp25-sai" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-sai.yaml          | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 68f97b462598..4a7129d0b157 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - st,stm32f4-sai
>        - st,stm32h7-sai
> +      - st,stm32mp25-sai
>  
>    reg:
>      items:
> @@ -43,9 +44,11 @@ properties:
>      const: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 3
>  
>    clock-names:
> +    minItems: 1

This actually fixes the binding because it lacked minItems before :/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
