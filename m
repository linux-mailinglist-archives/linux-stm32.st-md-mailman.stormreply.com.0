Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBA96E430
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 22:36:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 241AEC78013;
	Thu,  5 Sep 2024 20:36:48 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B37AAC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 20:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8461E42B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1725568598; bh=xNa+Q8PSCW7m4DRccVXfDl/4+sYRB5egVm1KwZDSX3o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h0zoMm502MrG8P+tHBYLhudhoCbq24HA1qpkZtuUbwUtZTwObc1fXJaRRAVp8FhcR
 nWvUYpxqk7s1CCA6d4ZAu87f2KG0CbR/VnnoPVuk9lrJafWcQ1J34H85Lvl6QXMctk
 KLTGOAz5vZsqRLCTwY9a6AuRjwhTz367BjTSMbmRf5Iv/RsBJPWZ45b6pQ4Mlc2N5P
 vKT+2Shk+oU/VZ6d+wxHOr8TVRNEzFrKQFe2xrVDnNqA1EOotMhzWEag/bPIy+p1na
 7RliLaleNk/AA3A5S6ceD25TJtqPxGrLtpWu453Kgj/JqRPvQXrzr0sGXm5eSVPugh
 nVaTWsMGo1sYA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8461E42B25;
 Thu,  5 Sep 2024 20:36:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amit Vadhavana <av2082000@gmail.com>, linux-doc@vger.kernel.org,
 ricardo@marliere.net
In-Reply-To: <20240817072724.6861-1-av2082000@gmail.com>
References: <20240817072724.6861-1-av2082000@gmail.com>
Date: Thu, 05 Sep 2024 14:36:37 -0600
Message-ID: <87ttetg7my.fsf@trenco.lwn.net>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 conor.dooley@microchip.com, aou@eecs.berkeley.edu, hpa@zytor.com,
 skhan@linuxfoundation.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel-mentees@lists.linux.dev,
 costa.shul@redhat.com, mpe@ellerman.id.au, x86@kernel.org,
 christophe.leroy@csgroup.eu, mingo@redhat.com, workflows@vger.kernel.org,
 av2082000@gmail.com, naveen@kernel.org, npiggin@gmail.com, bp@alien8.de,
 paul.walmsley@sifive.com, bhelgaas@google.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH V2] Documentation: Fix spelling mistakes
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

Amit Vadhavana <av2082000@gmail.com> writes:

> Correct spelling mistakes in the documentation to improve readability.
>
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
> V1: https://lore.kernel.org/all/20240810183238.34481-1-av2082000@gmail.com
> V1 -> V2:
> - Write the commit description in imperative mode.
> - Fix grammer mistakes in the sentence.
> ---
>  Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst | 4 ++--
>  Documentation/arch/arm64/cpu-hotplug.rst                 | 2 +-
>  Documentation/arch/powerpc/ultravisor.rst                | 2 +-
>  Documentation/arch/riscv/vector.rst                      | 2 +-
>  Documentation/arch/x86/mds.rst                           | 2 +-
>  Documentation/arch/x86/x86_64/fsgs.rst                   | 4 ++--
>  Documentation/process/backporting.rst                    | 6 +++---
>  7 files changed, 11 insertions(+), 11 deletions(-)
>

Applied, thanks.

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
