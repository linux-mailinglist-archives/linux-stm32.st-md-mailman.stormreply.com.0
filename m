Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7E80AD7B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 21:04:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA828C6A613;
	Fri,  8 Dec 2023 20:04:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27064C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 20:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4F556258E;
 Fri,  8 Dec 2023 20:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4782C433C7;
 Fri,  8 Dec 2023 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702065871;
 bh=dAzTKis/A168Bq4izb0pTdVXcvwbLPWwjZhbjyGsfuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOVNZuLtre13kBHgee4m2/HCdLbvfRd1C1jVy8YMKKwP7MMWca0oI/drSpeiVxYA6
 d0LAbuKH3mFEpct4nl2L0b8av5Ow5koo0UDmh9UgFhOP+DVBfG2nP5N0tR8sboReaY
 mzPU/LM0PrPw8axcAzodwT5pjvtKfDrMYWlGUBYSWQLYWfmgVt3ZKEA8N2qkajdR9q
 sEQa6D0oUosCDitw3268nUaQTbX7ppmAr5dK1heV605xNr9bhdO8OWsNcjjTOqoch6
 yy41038aEt2+gqOQs7YShU9VmIUGDCI8cZSLrdW5cLADPB2qVeTN4okZyp0VFvMsVM
 lAVXGb7aruChg==
Date: Fri, 8 Dec 2023 21:04:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231208200425.zli2j6b4lt4shasn@zenone.zhora.eu>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-2-alain.volmat@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/7] i2c: stm32f7: perform most of irq
 job in threaded handler
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

Hi Alain,

On Fri, Dec 08, 2023 at 05:47:10PM +0100, Alain Volmat wrote:
> The irq handling is currently split between the irq handler
> and the threaded irq handler.  Some of the handling (such as
> dma related stuffs) done within the irq handler might sleep or
> take some time leading to issues if the kernel is built with
> realtime constraints.  In order to fix that, perform an overall
> rework to perform most of the job within the threaded handler
> and only keep fifo access in the non threaded handler.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

quite a difficult review because this git diff algorithm makes it
difficult to read throuhg.

But it looks like just a copy paste from to
stm32f7_i2c_isr_event() to stm32f7_i2c_isr_event_thread() of the
STM32F7_I2C_ISR_NACKF, STM32F7_I2C_ISR_STOPF, STM32F7_I2C_ISR_TC
and STM32F7_I2C_ISR_TCR.

[...]

> +static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = data;
> +	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
> +	struct stm32_i2c_dma *dma = i2c_dev->dma;
> +	void __iomem *base = i2c_dev->base;
> +	u32 status, mask;
> +	int ret;
> +
> +	if (!i2c_dev->master_mode)
> +		return stm32f7_i2c_slave_isr_event(i2c_dev);
> +
> +	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);

looks to me like this readl_relaxed is read too many times during
the whole irq handling.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
