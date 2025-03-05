Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D133A50589
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 17:48:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 999F8C78037;
	Wed,  5 Mar 2025 16:48:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49ABACFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 16:48:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 253F75C65EF;
 Wed,  5 Mar 2025 16:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF23C4CED1;
 Wed,  5 Mar 2025 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741193280;
 bh=q9RwUsahZEDzg4kp8X6VT0iwUQxY7NE3PJQxq7dtK7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ekxy6gYheu0ogt41k4byYBhS5G+HBulFW9+/8nNtHsUEpaPQzVOLHbNwBNQpBsGw1
 Lzcd5JprYDUUkdqDdjHeKwTAR3egKNc6w1ijwkEqKdF6R3R/GylpaFbwx4WV4qOPDh
 PLpsU3jz+VwnZxMSJViOKAN+d524dJiTEClfQiOoGiuIMHzl7N6M95zHN3ys17K6Vq
 L+tBaPLWV6AbJDbOINBy/E2uovpIta2UATL4CFIzYreKNPdnLFLRQXLg2Vk976H0tZ
 yW7JtQksdVCo7do/dY7B5mwoaiyObB8LqHJiCjp4llrX+RhCOnnnrB2ApdUbjcLssY
 9wKadFzvDCdYg==
Date: Wed, 5 Mar 2025 10:47:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <174119327848.2121305.11563216194052431018.robh@kernel.org>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305094935.595667-2-fabrice.gasnier@foss.st.com>
Cc: linux-pwm@vger.kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, will@kernel.org,
 krzk+dt@kernel.org, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/8] dt-bindings: mfd: stm32-lptimer:
 add support for stm32mp25
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


On Wed, 05 Mar 2025 10:49:28 +0100, Fabrice Gasnier wrote:
> Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
> STM32MP25 SoC. Some features has been updated or added to the low-power
> timer:
> - new capture compare channels
> - up to two PWM channels
> - PWM input capture
> - peripheral interconnect in stm32mp25 has been updated (new triggers).
> - registers/bits has been added or revisited (IER access).
> So introduce a new compatible to handle this diversity.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V3:
> - Fix yaml indentation issue found by Rob's bot
> Changes in V2:
> - Use fallback compatibles, along with stm32mp25 specific compatible
> - trigger identifier can be up to 4 (e.g. from LPTIM1..5)
> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
