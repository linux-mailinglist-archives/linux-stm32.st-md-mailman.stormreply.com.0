Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9485A5B5
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 15:19:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3986AC69063;
	Mon, 19 Feb 2024 14:19:51 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18499C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:19:50 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708352389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4BDaZLTqv8flVHLwBSBJzsZbl4g4KjMo2i9irEnI714=;
 b=frQ8kNRhOUDh9H45iDzVKlbTHnj6Y0VsAOHRIlY49tvj1LZNBXe+PezwDEnItsNxMZsh8p
 2Z5aLH4SCKuy2M/5lqgziKmvuYJURIi1JhwdjVbpY5R50hzu3C0w0766Z5r3NjGc/EmH0u
 /+uMF5UYZpy3HFGPj+0PRHsvkTMYMDr1v+dNdWHdbdEgPq3Ouote5UJRyx5xnv1VzH93do
 sI80DW9bltBOzL9W4dB7am3ieelxqr1yI6uuTZPnEOw1XguJg/xArA9RIyITsvIj/LyLWY
 LKILtM7XbgSL4Y6cmISaVsS2PaCH1ELIzlzS6fWg1j3ZNTcxZ32YnFFyciRmeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708352389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4BDaZLTqv8flVHLwBSBJzsZbl4g4KjMo2i9irEnI714=;
 b=sODlc3KthGTOnTfdZReeQ2PwJhyHyChOWXADSoZEp8mz7uT5blWEZDsmWvtvbQZl7Tols7
 XVU/WmdT4Aw/EtBQ==
To: Antonio Borneo <antonio.borneo@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
In-Reply-To: <20240216094758.916722-3-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-3-antonio.borneo@foss.st.com>
Date: Mon, 19 Feb 2024 15:19:49 +0100
Message-ID: <87cyssa64a.ffs@tglx>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: interrupt-controller:
 stm32-exti: Add irq nexus child node
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
> The mapping of EXTI interrupts to its parent interrupt controller
> is both SoC and instance dependent.
> The current implementation requires adding a new table to the
> driver's code and a new compatible for each new EXTI instance.
>
> Add to the binding an interrupt nexus child node that will be
> used on the new EXTI instances and can be optionally used on the
> existing instances.
> The property 'interrupt-map' in the nexus node maps each EXTI
> interrupt to the parent interrupt.
> Align #address-cells and #interrupt-cells between the EXTI node
> and its nexus node.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

This S-O-B chain is broken as it suggests that you wrote the patch and
Fabrice relayed it.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

But that's not the case. If you co-developed this with Fabrice then
please use Co-developed-by. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Thanks,

        tglx

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
