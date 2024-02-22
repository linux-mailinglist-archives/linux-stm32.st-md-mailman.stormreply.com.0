Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BBF860717
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 00:43:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6D29C69063;
	Thu, 22 Feb 2024 23:43:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F2F0C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 23:43:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9A38ECE29D6;
 Thu, 22 Feb 2024 23:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3385EC433F1;
 Thu, 22 Feb 2024 23:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708645384;
 bh=orYPHvKEF7pNsfLnqS3JuQ7jmo0kJmxsHCs+Py+BljA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jnJy0g8aJUy/nsIbPKzZliYyca0yhygNbHrmb8qSxM9IRSUuonUBjN6cqCGiQPs7t
 sinQph2fUfALhfnfpUT+l0JSThKKjSVvJkRtH+chmJYXTaWkISRtTzM1H1qxPKZ7Z0
 XLw1swd88spcG3rvy3Ts3unIJLjo5G5UCye+DlcyDHRtWAa9e26hKlFH3FGdmUrOU3
 E0hiarafAkSIvMbvLMG/egu1oKGeUll0sJq9ExZ6oHzpX2Xop7tAqpemff2KWx6Yy1
 kwE7TSSNCsvBNiIhxz/PEwmOGs2fh/vgnCYqVv/Pc0OH9RQQ8mDNbBnRfdiXSC7mUq
 RsVPZsDPDk7UQ==
Date: Thu, 22 Feb 2024 16:43:00 -0700
From: Rob Herring <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20240222234300.GA3809915-robh@kernel.org>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240216094758.916722-3-antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
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

On Fri, Feb 16, 2024 at 10:47:47AM +0100, Antonio Borneo wrote:
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

Looks like an abuse of interrupt-map. You avoid adding yourself to the 
abuser list by putting it in a child node. Clever. (See list in 
drivers/of/irq.c if you don't know what I'm talking about)

I assume the EXTI has 0..N interrupts. Just define 'interrupts' with N 
entries with each entry mapping EXTI interrupt N to 'interrupts' entry 
N.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
