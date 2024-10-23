Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 732009AC231
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 10:52:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2683AC71287;
	Wed, 23 Oct 2024 08:52:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1E12C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:51:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E20CE5C5EE1;
 Wed, 23 Oct 2024 08:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D1C4CEC6;
 Wed, 23 Oct 2024 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673512;
 bh=HgvIm+497Hmdq2R0Wn5snLjGoTlA1hQo19CTjG70174=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+vIG12jWtj69d2TdKEb+dkCv8jMcz0EKHpltNBDS1/400GbeSIBlOjBfIXifOSao
 7lVwe2DOdbLkI4ynU6aWPCyBeZxpxNEIcWTRjMCNfAShdZU9wo+G3x1C5rxg8eOTz+
 7knWRBkXcPbr0cU4fWLfeEvpL210+BtxZhI2DF8+3Ehm7MJE3Wbh/31v+P34652Hzh
 OSOGLh9C2YSVW6Brd2I8ce7rdwt/QowMBuh7OFAvrn85lWHrXF9gCl+iZtIX1LWEPS
 ku7mqABnrIxLKHV9pPti3C1e8uXKFOnIUiL7oszjv+3WU3QTUrcRf/cBW1SExRfbzm
 TM3BCIrikeLFw==
Date: Wed, 23 Oct 2024 10:51:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-12-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/14] dt-bindings: pinctrl: stm32:
 support for stm32mp215 and additional packages
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

On Tue, Oct 22, 2024 at 05:56:55PM +0200, Antonio Borneo wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.

So all previous patches are for this? Then they are supposed to be here.

> Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 +++-
>  include/dt-bindings/pinctrl/stm32-pinfunc.h                   | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 9a7ecfea6eb5b..0a2d644dbece3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -27,6 +27,8 @@ properties:
>        - st,stm32mp135-pinctrl
>        - st,stm32mp157-pinctrl
>        - st,stm32mp157-z-pinctrl
> +      - st,stm32mp215-pinctrl
> +      - st,stm32mp215-z-pinctrl
>        - st,stm32mp257-pinctrl
>        - st,stm32mp257-z-pinctrl
>  
> @@ -59,7 +61,7 @@ properties:
>        Indicates the SOC package used.
>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1000, 0x2000, 0x4000]
>  
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> index af3fd388329a0..01bc8be78ef72 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -41,6 +41,9 @@
>  #define STM32MP_PKG_AI	0x100
>  #define STM32MP_PKG_AK	0x400
>  #define STM32MP_PKG_AL	0x800
> +#define STM32MP_PKG_AM	0x1000
> +#define STM32MP_PKG_AN	0x2000
> +#define STM32MP_PKG_AO	0x4000

Why these are some random hex values but not for example 0x801, 0x802
and 0x803? That's an enum, so bitmask does not make sense here.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
