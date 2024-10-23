Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A09AC225
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F22E5C71287;
	Wed, 23 Oct 2024 08:49:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A80FC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:49:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D475B5C5EDE;
 Wed, 23 Oct 2024 08:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F54C4CEC6;
 Wed, 23 Oct 2024 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673389;
 bh=lgGbkc6uaJYpUzsc1Gh3kVF2XFhM1rzwAZjnJSwPphI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rN6WKyaA6gR0etHHoxMHugUoM5I4bhZAvWw0Ih5lCiYC9+06idpzCaGNDt9NvmdZi
 Q19ul2J0lVL4ndKksr0hM2KOnjWV8LhUyDO5LRUIlfmS2iDUhzrf7cjOqubyJ1eHA2
 8EsC5ZBfdj8hChTqynVuEK8Ee57NxEc5PgM/ZacW9RvRXX83tIOLW1SoOGCK1Ip7qU
 25QoQhymEmjdUcY8Nvwr5t7g5mWV2QpwMvpcO16SqPmBwDZ/3X8Oa/rH3DR23eTbQb
 n+RINzAmQv5SOWrdMC8yUxe2O1zKphVfJDfQaH2jDrLaEmmj2HUrjJSjJvnHkhjw5a
 Ho9lsRDUwqTvA==
Date: Wed, 23 Oct 2024 10:49:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <e6sz7p4lgkmuvgosafob5dvwtvp4ruzuzmwz4oyepcajfui2xm@fom7mj5fbik6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/14] dt-bindings: pinctrl: stm32:
 support IO synchronization parameters
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

On Tue, Oct 22, 2024 at 05:56:51PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming

Why? What is missing for existing hardware support?

> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 5d17d6487ae9c..9a7ecfea6eb5b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -207,6 +207,54 @@ patternProperties:
>                3: High speed
>              $ref: /schemas/types.yaml#/definitions/uint32
>              enum: [0, 1, 2, 3]
> +          st,io-delay-path:
> +            description: |
> +              IO synchronization delay path location
> +              0: Delay switched into the output path
> +              1: Delay switched into the input path
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Why enum? Why not bool? What is the "synchronization delay"? Why this is
needed per board?

> +          st,io-clk-edge:
> +            description: |
> +              IO synchronization clock edge
> +              0: Data single-edge (changing on rising or falling clock edge)
> +              1: Data double-edge (changing on both clock edges)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

All the same questions.

> +          st,io-clk-type:
> +            description: |
> +              IO synchronization clock inversion
> +              0: IO clocks not inverted. Data retimed to rising clock edge
> +              1: IO clocks inverted. Data retimed to falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

OK, so if not bool why this cannot be a readable string?

> +          st,io-retime:
> +            description: |
> +              IO synchronization data retime
> +              0: Data not synchronized or retimed on clock edges
> +              1: Data retimed to either rising or falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Missing blank lines everywhere between properties.

> +          st,io-delay:

Use proper unit suffix. Or is there no such?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
