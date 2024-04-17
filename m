Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC838A8AD1
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 20:09:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D8E7C6C858;
	Wed, 17 Apr 2024 18:09:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD095C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 18:09:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 93A2E61680;
 Wed, 17 Apr 2024 18:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC76C072AA;
 Wed, 17 Apr 2024 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713377356;
 bh=LsqwIAcZ9xcslbdJWJ70Q/boOMwoOC+KtWr2ruc17ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tOOzaQVY7IKpmitflD7aGK/iY/ASXphAdImXLfa6QAfAbfMVwINXSPAO4cHn3UalV
 R4uZmQYNu+egtGbtC+03z0Zw5QZWvjOhaDRl3VE+kleWvVZmzGUTHYD+NI7X7c4BT9
 xYFA3wcq0D/EjBROFS/bqwyoSaxIXyXKNskkczk3+/4dtVUWzCeLZyNZhhHDV3XAgE
 rd69uifcKflEwLSaU4/ruoGhRN2dWxW5tn0sK22l4k45dxB5y8/5c0FgluyfZMM1SU
 AnOwzU6R2lO3HylDgmNFPqOhPYvSNjsEaXz4lNyWujAi54fdO4UiTb6+RMTG0qgew/
 ERKLx3R0CxktQ==
Date: Wed, 17 Apr 2024 13:09:14 -0500
From: Rob Herring <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <171337733789.2907077.14650412956995048525.robh@kernel.org>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240415134926.1254428-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415134926.1254428-3-antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings:
 interrupt-controller: stm32-exti: Add irq mapping to parent
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


On Mon, 15 Apr 2024 15:49:17 +0200, Antonio Borneo wrote:
> The mapping of EXTI events to its parent interrupt controller is
> both SoC and instance dependent.
> The current implementation requires adding a new mapping table to
> the driver's code and a new compatible for each new EXTI instance.
> 
> Use the interrupts-extended property to list, for each EXTI event,
> the associated parent interrupt.
> 
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../interrupt-controller/st,stm32-exti.yaml     | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
