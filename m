Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BCB95533E
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Aug 2024 00:21:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CED4C7129D;
	Fri, 16 Aug 2024 22:21:22 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A588AC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 22:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03142418AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1723846872; bh=DDlzN91pqXetBWEzbxhP44nWK82/0rSseDZiI/Y4Umc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G5jYwPPeNcNFIy3YNcuiJ4LAI0kkXtuup5gU3UeKBjoTDqzOcvYZr6a1FwxSwa3CQ
 4ZD4O2m3jKu1hmB9ZAUe3RUNAI7JiuczHk7KoxgLrpG1E6+sdiYYQwx/AweUhCAM4l
 BWRd/+eh+8XR60LcHuSDyYbSJNCo7e359kfLkGsCMDOyHQYsyrWZsL0I3I4UNOZ9en
 NwGhKdHedKCwPuztjKUhSnk8YqNOD7KkujA0hRhv5mJ7C2OiO36I7mignBfWY3Dl+I
 CtKwZEp4OMfEotN/irzGcvmRZcPVuKpgKtT6rnX4GVAwmEzHi2Jz5gIWEiPJTa21Q1
 f1hCwg9+4X7xg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 03142418AB;
 Fri, 16 Aug 2024 22:21:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amit Vadhavana <av2082000@gmail.com>, linux-doc@vger.kernel.org,
 ricardo@marliere.net
In-Reply-To: <20240810183238.34481-1-av2082000@gmail.com>
References: <20240810183238.34481-1-av2082000@gmail.com>
Date: Fri, 16 Aug 2024 16:21:11 -0600
Message-ID: <87y14whzxk.fsf@trenco.lwn.net>
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

Now that I have looked at these, I have a couple of comments...

Amit Vadhavana <av2082000@gmail.com> writes:

> Corrected spelling mistakes in the documentation to improve readability.

Normal form for a changelog is to use the imperative mode; some
maintainers are insistent about that.  So "Correct spelling ... "

> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
>  Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst | 4 ++--
>  Documentation/arch/arm64/cpu-hotplug.rst                 | 2 +-
>  Documentation/arch/powerpc/ultravisor.rst                | 2 +-
>  Documentation/arch/riscv/vector.rst                      | 2 +-
>  Documentation/arch/sparc/oradax/oracle-dax.rst           | 2 +-
>  Documentation/arch/x86/mds.rst                           | 2 +-
>  Documentation/arch/x86/x86_64/fsgs.rst                   | 4 ++--
>  Documentation/process/backporting.rst                    | 6 +++---
>  8 files changed, 12 insertions(+), 12 deletions(-)

[...]

> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> index 75dd88a62e1d..e4a28def318a 100644
> --- a/Documentation/arch/riscv/vector.rst
> +++ b/Documentation/arch/riscv/vector.rst
> @@ -15,7 +15,7 @@ status for the use of Vector in userspace. The intended usage guideline for
>  these interfaces is to give init systems a way to modify the availability of V
>  for processes running under its domain. Calling these interfaces is not
>  recommended in libraries routines because libraries should not override policies
> -configured from the parant process. Also, users must noted that these interfaces
> +configured from the parent process. Also, users must noted that these interfaces

As long as you are fixing this line, s/noted/note/

>  are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
>  to use in a portable code. To get the availability of V in an ELF program,
>  please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
> diff --git a/Documentation/arch/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
> index d1e14d572918..54ccb35ed51d 100644
> --- a/Documentation/arch/sparc/oradax/oracle-dax.rst
> +++ b/Documentation/arch/sparc/oradax/oracle-dax.rst
> @@ -197,7 +197,7 @@ Memory Constraints
>  ==================
>  
>  The DAX hardware operates only on physical addresses. Therefore, it is
> -not aware of virtual memory mappings and the discontiguities that may
> +not aware of virtual memory mappings and the discontinuities that may

Whether "discontiguities" is recognized by a spelling checker or not, I
expect that is the word that was intended by the author of this
document.  I would not change it.

>  exist in the physical memory that a virtual buffer maps to. There is
>  no I/O TLB or any scatter/gather mechanism. All buffers, whether input
>  or output, must reside in a physically contiguous region of memory.
> diff --git a/Documentation/arch/x86/mds.rst b/Documentation/arch/x86/mds.rst
> index c58c72362911..5a2e6c0ef04a 100644
> --- a/Documentation/arch/x86/mds.rst
> +++ b/Documentation/arch/x86/mds.rst
> @@ -162,7 +162,7 @@ Mitigation points
>     3. It would take a large number of these precisely-timed NMIs to mount
>        an actual attack.  There's presumably not enough bandwidth.
>     4. The NMI in question occurs after a VERW, i.e. when user state is
> -      restored and most interesting data is already scrubbed. Whats left
> +      restored and most interesting data is already scrubbed. What's left
>        is only the data that NMI touches, and that may or may not be of
>        any interest.
>  
> diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
> index 50960e09e1f6..d07e445dac5c 100644
> --- a/Documentation/arch/x86/x86_64/fsgs.rst
> +++ b/Documentation/arch/x86/x86_64/fsgs.rst
> @@ -125,7 +125,7 @@ FSGSBASE instructions enablement
>  FSGSBASE instructions compiler support
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -GCC version 4.6.4 and newer provide instrinsics for the FSGSBASE
> +GCC version 4.6.4 and newer provide intrinsics for the FSGSBASE
>  instructions. Clang 5 supports them as well.

Note that current kernels require rather newer versions of both
compilers than this, so this information does not need to be here at
all.  If you do not want to edit at that level, though, the change is an
improvement.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
