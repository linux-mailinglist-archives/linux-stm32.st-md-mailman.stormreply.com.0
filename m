Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE485A59E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 15:16:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF75EC69063;
	Mon, 19 Feb 2024 14:16:33 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 110C6C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:16:32 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708352192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xH4JzvZDylh2Zn1ZVDw/BnRi6fetrxAuJedKHz5rKTg=;
 b=x1dqBjRW3HGe19iGHfetAQ3/V+tdpcCr/UZBaSD5KfmFSPEWp0KaUEgqhRlr0jutsdTedd
 68p/CtcLWEmdrioBvgqPbtPYR+Qr83E/EZ65HxI8Sho68Hs/w97BUkrtC8OdJgJ9v/LS8a
 pVm17ABVkshmFpLpruXmW6XVmcec32qAxEUSMYjsZmnu1UKBYAO5zGD455qluuVTa8EhRP
 +nP9KsGN4AWwBWNSY8x+8/gP1EzZzjoWrlhyir9kJ+eVIw35Dei6c1WWTFqQBmBLz59FbZ
 x0nfm6xyh36frWSZ0Eq/7k/yUdS0N+hTg4byvftXWZzMjBPYW1o64yW7uxrRwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708352192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xH4JzvZDylh2Zn1ZVDw/BnRi6fetrxAuJedKHz5rKTg=;
 b=ZdgxCb3v/fmB0RsOoIgRyXhCnWLE/zcs96uNnuHnF75KAn+D9DQqiQY8yQeCtmpZNY9M+W
 y7bj8efFd6hkh8DA==
To: Antonio Borneo <antonio.borneo@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
In-Reply-To: <20240216094758.916722-2-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-2-antonio.borneo@foss.st.com>
Date: Mon, 19 Feb 2024 15:16:32 +0100
Message-ID: <87frxoa69r.ffs@tglx>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/12] irqchip/stm32-exti: Fix minor
	indentation issue
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

On Fri, Feb 16 2024 at 10:47, Antonio Borneo wrote:
> Use only TAB for indentation, removing a leading space.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Fixes: 046a6ee2343b ("irqchip: Bulk conversion to generic_handle_domain_irq()")

A whitespace cleanup really does not justify a Fixes tag.

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
