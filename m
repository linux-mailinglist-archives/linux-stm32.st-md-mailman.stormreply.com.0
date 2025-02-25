Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CFA43E8E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 13:02:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36C6FC78039;
	Tue, 25 Feb 2025 12:02:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0BD2C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:02:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C94A05C66DD;
 Tue, 25 Feb 2025 12:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7AEC4CEDD;
 Tue, 25 Feb 2025 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740484928;
 bh=yORW2iO3qKiXB1CP0vLEWVQzUX4QPYnSqxUO9k6Ec6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cXUECgvxZ6dw2v3p6USt0hLALQJ/AnxoJFTYEWdQ26slxWBaxwNePPXCtZpAiY2qh
 P0t5gPSdiCs8UNzxjyApcIsaAAblvRZBCf3cJOJMUwbk+Eis69qwl4qesj2Rd4IOA2
 IDc8FIu4Fd4att6obvi5HD/pmKcFQotVywGSswv9uf1fOTXCdDieWjYjXhJDV4lcdH
 UgMSQyuLx8LtrM42QAAx8hoZeTKd2wCzXkR8Ns/+Q/GfCmLyE0wcnMCxDLrFN+bX2z
 8RQ4CBU7yru+Y1gXp7fKzLsvmGF5a40eDcHxbjU6gvhz5JfTnKql1lDqNkHFq+VR3h
 Tp9oIM1f6veuw==
Date: Tue, 25 Feb 2025 13:02:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250225-outgoing-scorpion-of-music-be0bea@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: mfd: stm32-lptimer: add
 support for stm32mp25
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

On Mon, Feb 24, 2025 at 07:01:43PM +0100, Fabrice Gasnier wrote:
>    pwm:
>      type: object
>      additionalProperties: false
>  
>      properties:
>        compatible:
> -        const: st,stm32-pwm-lp
> +        enum:
> +          - st,stm32-pwm-lp
> +          - st,stm32mp25-pwm-lp
>  
>        "#pwm-cells":
>          const: 3
> @@ -69,7 +76,9 @@ properties:
>  
>      properties:
>        compatible:
> -        const: st,stm32-lptimer-counter
> +        enum:
> +          - st,stm32-lptimer-counter
> +          - st,stm32mp25-lptimer-counter

Driver changes suggest many of these are compatible. Why isn't this expressed?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
