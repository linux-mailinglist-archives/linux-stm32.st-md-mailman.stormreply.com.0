Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B4D913D42
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 19:27:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E2AEC71287;
	Sun, 23 Jun 2024 17:27:27 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BE14C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 17:27:19 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1719163638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNQgs/jtsewNi1//a25BPwNZEq0Iu3ZSb+SWVutwhWg=;
 b=AuTNeJggR3UvCNRht7/Vqfkhk8Ie1Ert61cYfMxSqB2CktWozBSGp+rZIInLL8CY4gwM8R
 kS357bdUvzZHW5l2/HnEunX7g0EOKOCfEIyZ14RYLdDzZ2q/2HlcNH+/bFRqHl7s3XpZeA
 XNzp6R7F3psZxSQwvrhJTaA725AY+1JdZZH5fZ49jBOBlYwJ1t8u7H6/O9AVETAmNYU//n
 ztKE+3cm7xy5PphUj5mojkKDxLqidgyIc7bcZ/EiWIquibWxT2JLC8CDG3yVJuyFWZTSAT
 lEO0xAwY3f3QTlqCqglrWp4jt4PjcS4UBOgXaJBO/Bsh+MSChPTZeywY9pKhAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1719163638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNQgs/jtsewNi1//a25BPwNZEq0Iu3ZSb+SWVutwhWg=;
 b=gVt5W9RJ8ec7jGLru9vnYm+Rd69c6ItC2Y7aPjw79ygAc6tl4YQyxvD6EWoBiwr+iH58T5
 KIfKaOKW2zM4cKBQ==
To: Antonio Borneo <antonio.borneo@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
In-Reply-To: <20240620083115.204362-8-antonio.borneo@foss.st.com>
References: <20240620083115.204362-1-antonio.borneo@foss.st.com>
 <20240620083115.204362-8-antonio.borneo@foss.st.com>
Date: Sun, 23 Jun 2024 19:27:18 +0200
Message-ID: <87le2va7t5.ffs@tglx>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 7/8] ARM: stm32: allow build
 irq-stm32mp-exti driver as module
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

On Thu, Jun 20 2024 at 10:31, Antonio Borneo wrote:

> Drop auto-selecting the driver, so it can be built either as a
> module or built-in.

How is the driver selected then? Has this to be done manually now?

If so, doesn't that break things when starting from an empty config?

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
