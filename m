Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F245A94E2D9
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Aug 2024 22:12:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89379C78006;
	Sun, 11 Aug 2024 20:12:03 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D19AC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Aug 2024 20:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 46E80418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1723407120; bh=9Rm/lSrsRJ+DyBRDGWfjb0Jlly6yythN96aq7WE+WOE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PrUz/95sju0GqBBXkSIwIq8KblLp7jGXmkz+1xDO3ez2nb1EJw69K4lFKHKp6Ujbn
 pEEGjlycg7cOOZOfBfPV0RkuaGj65mOdzSKDCQx7F50Tidfguo2NarxNkzlffgm29o
 xcteuCJvxzXPc/sX8kJfLvTYloM0Se95fM6I2A7xkCsjsoTmIb/bam/07RxaLS4oNh
 ZYiOMfTcQQKINwDXVhyFlgdwjcWLMU5pGFy2d5jrQdimzLd/ciWnrd59f30px1wdNd
 Frf5RRHTp0obZKIRTKscK0H3GSf8B4EK0992REApc9DbFC28vGWlD/pSxZGxJHxcMM
 XSaAOkrr5HaVQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 46E80418A0;
 Sun, 11 Aug 2024 20:12:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Amit Vadhavana
 <av2082000@gmail.com>, linux-doc@vger.kernel.org, ricardo@marliere.net
In-Reply-To: <13beb34b-3ff7-4b88-876f-0a7f65254970@gmail.com>
References: <20240810183238.34481-1-av2082000@gmail.com>
 <13beb34b-3ff7-4b88-876f-0a7f65254970@gmail.com>
Date: Sun, 11 Aug 2024 14:11:59 -0600
Message-ID: <87h6bqbz00.fsf@trenco.lwn.net>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 conor.dooley@microchip.com, hpa@zytor.com, skhan@linuxfoundation.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel-mentees@lists.linux.dev, costa.shul@redhat.com,
 mpe@ellerman.id.au, x86@kernel.org, christophe.leroy@csgroup.eu,
 mingo@redhat.com, workflows@vger.kernel.org, aou@eecs.berkeley.edu,
 naveen@kernel.org, npiggin@gmail.com, bp@alien8.de, paul.walmsley@sifive.com,
 bhelgaas@google.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] Documentation: Fix spelling mistakes
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

Ivan Orlov <ivan.orlov0322@gmail.com> writes:

> On 8/10/24 19:32, Amit Vadhavana wrote:
>> Corrected spelling mistakes in the documentation to improve readability.
>> 
>
> Hi Amit,
>
> Since this patch contains changes for multiple files from different 
> subsystems, it should be divided into file-specific changes (so you have 
> one patch per updated file).

Often that is the best thing to do but, honestly, in this case I think I
should just take the set through the docs tree.  I don't see much point
in making things harder.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
