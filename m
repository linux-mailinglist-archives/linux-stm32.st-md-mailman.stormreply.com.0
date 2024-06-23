Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272A913EEB
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 00:15:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01C52C71287;
	Sun, 23 Jun 2024 22:15:28 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E6B7C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 22:15:20 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1719180919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmbIxEHyudMcmEN/Glce1AdKQowVKBCpY9q1Z9sFbRw=;
 b=JzH81ulCpEtaVeGMI1J2L1R6ji5LvY9zrnwkiucdy7vVwfSnpzVznK+hWi7PqkPNvbV5ke
 A3T3QMOiP5AOuFSzzeBBFe++RG6JTx/mEtgXN6SpTznS6brLjhVwzxK45xZBXhBOAzm8Wz
 djpwyKmqTlT1R81gobd+50pGnMtJzxRNlbElC+0E9Cj4rR0dz9rcpZ8+xprLNzLkr7OXTu
 1Vnx7Ao2beA2Y+cWRp6JuPoxi/zoGFXko8E4STy8dUTa63Xj8DPNbeqf2/k+3lFNO7z3nz
 WCGIu44FWqeDJOsMCDNJjs32hYYH1OjLpC2FsaHaCpGd2PaXU/HuSDBXA4PXew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1719180919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmbIxEHyudMcmEN/Glce1AdKQowVKBCpY9q1Z9sFbRw=;
 b=ud+IPWYyKigV7M+ajOikatqcvTn2KDFbbdbnR9EBcmOcUQDu+Vmnnceac5diWI5r5Kr637
 64+jePSVNOx3E0CQ==
To: Antonio Borneo <antonio.borneo@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
In-Reply-To: <2ee5ec54d3aff6e37ec1245eeb019d52e6a3d63f.camel@foss.st.com>
References: <20240620083115.204362-1-antonio.borneo@foss.st.com>
 <20240620083115.204362-8-antonio.borneo@foss.st.com> <87le2va7t5.ffs@tglx>
 <2ee5ec54d3aff6e37ec1245eeb019d52e6a3d63f.camel@foss.st.com>
Date: Mon, 24 Jun 2024 00:15:18 +0200
Message-ID: <87cyo79uh5.ffs@tglx>
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

On Sun, Jun 23 2024 at 19:38, Antonio Borneo wrote:
> On Sun, 2024-06-23 at 19:27 +0200, Thomas Gleixner wrote:
>> On Thu, Jun 20 2024 at 10:31, Antonio Borneo wrote:
>> 
>> > Drop auto-selecting the driver, so it can be built either as a
>> > module or built-in.
>> 
>> How is the driver selected then? Has this to be done manually now?
>> 
>> If so, doesn't that break things when starting from an empty config?
>
> In patch 6/8 it is already selected through:
>
> +	depends on (ARCH_STM32 && !ARM_SINGLE_ARMV7M) || COMPILE_TEST
> +	default y

Missed that. Thanks for the clarification!

       tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
