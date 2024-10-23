Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AAF9AC232
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 10:52:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3248EC71287;
	Wed, 23 Oct 2024 08:52:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95595C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:52:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA6505C5EE9;
 Wed, 23 Oct 2024 08:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEAAC4CEC6;
 Wed, 23 Oct 2024 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673538;
 bh=QgZQZAHGGjtLGHw0LYRXygNDG1h6h/5BqjGMqhJ4MY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ul/d/0kA8oYv0b0iR4ZobZJUIPwE8UkhlbBGQJZgtI5x/3Y2GVY4TOTDqhLRqoXP5
 VQMkLXSrvdG5GJAOOa2ODisyt02vLuAXBd4Cl4zsQuqQQlqBXkYJMj+3Gp3U3uACYf
 lNpmbTDdHATEgy6R1SffQh9ltcr2S4A+OwNO0yqfWLTJCap4xFBiZTCCMsUvBbrJ+j
 NbZ6qB6LcfkXgR4fiJJX1sF5HUQdAE7F1E88ErsFaJjFkpOUqFJlpkIohHx/vuMt8Z
 to0pYq6PjN9A1ROSrb4g3ZicCaISb7kBvzNm9J6GJmKuIMOg6aXkdZLhj+fHyh6mT+
 8DY/roqSm7nLg==
Date: Wed, 23 Oct 2024 10:52:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <p7lms5ouffudkszvzrf5pioqmt6ngvf2k4vrzu4hncfxf2oo4p@kbksruiaiqis>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-14-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-14-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/14] dt-bindings: pinctrl: stm32: add
 support for stm32mp235
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

On Tue, Oct 22, 2024 at 05:56:57PM +0200, Antonio Borneo wrote:
> Add the compatibles st,stm32mp235-pinctrl and st,stm32mp235-z-pinctrl.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
