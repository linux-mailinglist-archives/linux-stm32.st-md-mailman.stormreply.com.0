Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB39AC213
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 10:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A50C3C71287;
	Wed, 23 Oct 2024 08:46:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDC9CC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:46:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 456285C5D03;
 Wed, 23 Oct 2024 08:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4126C4CEC6;
 Wed, 23 Oct 2024 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673190;
 bh=EyZ4QiVXvPEbdDEY9GYHE0FBEpWxqBjav2KP4V+fZmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FrGTwzflVTlJdLIYjkTXefJWDQspCdNwO9KK8hrcJ8ViG8MqtrEAXscjMMkwEYP+A
 T+wzl7dpb9x4hhedL38JuarGMqJjqWsjoRxeEFLJl4DDo5fm311snn7nopIYzbaqfp
 dVPRLzJsNyAN6twwq2zRatp/Y/rrZzqK/8ZFMkojCjJ9n379WOiFBUwyWpGBr1Fa3k
 dc+bgfJCa2ZVFEZyQZGkQhA2Rdo+ThVHyFj721UoR9Gh4kZJDHwhSLHYPU8CIGmQj4
 NdtMkoyp8RHC5ID7k06/gbWk+wybN0bw40moyYK7E52Nt4drdkwyY3IERFdGyQA1k/
 R07zGMfUYWV+w==
Date: Wed, 23 Oct 2024 10:46:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <vvmrfkpzs4ns2bhvcx2k2fdvacxqjdx5p2oyygzgr7zjrbdl6h@cvfo6623oxl6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-5-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/14] dt-bindings: pinctrl: stm32: add
	RSVD mux function
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

On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Document the RSVD (Reserved) mux function, used to reserve pins
> for a coprocessor not running Linux.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
>  include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
>  2 files changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
