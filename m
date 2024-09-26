Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B202A992860
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EEAFC78034;
	Mon,  7 Oct 2024 09:42:37 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D98E0C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727342299; x=1727947099; i=deller@gmx.de;
 bh=hp1g5yHqQ+Hi3UUQ0ip+nhr2opua2JZiyoX1o8S6xJ0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eLqErHt5Ba6qZEoQ+y8GVgeZp906IERMrpf8ljYAgm9BiO6PBERPFKYXEC5NHKEZ
 afJ/YrIxfOguW2XSuvSGzpV2izAI+B7h/d0689tMA32PeUnGr0bvXPbl2jfXYNNW9
 Q19EJrmwUZ2exUv870dM1IX4bJjcGPJxage5Fcy5Vjp0j5wV0EbS3OnjODPhci/2h
 uSbLEQMXmZA++cPr2XrBt2M3Rlq8ptRO0Q4lM0UKloQ2n1HZQKSuQQon3hWMTf7O0
 2HCn13s/EYSYJ+OOw/cMdFW9HMAD+U4nSukB8Ny5wO1HTUw+KIP6z0BYElfX3JYwc
 /23dGiJv4IV6Nd+q0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1slkQh2YiD-00HUUz; Thu, 26
 Sep 2024 11:18:18 +0200
Message-ID: <079aea54-a3ab-413e-aa4f-0dce06c8e142@gmx.de>
Date: Thu, 26 Sep 2024 11:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-6-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240925210615.2572360-6-arnd@kernel.org>
X-Provags-ID: V03:K1:WVTwXBYhl0Y58rXbk2q3f3SuYIyCmvd23/kLX/L1R30zbhrUvK3
 keZ1TMrPYYxhudRxaM5DQ0iL9Ukkq3q58BcipKt7WVJh5tJjPGX7DTcWDtNjY8BkEMwTYEu
 PqlrVuhBLqGxv5FuFkAXLE+CICuh2VJyknKdSOA2asvPCVC/GlaGfkTS9obPavrX6mLI2vw
 znB/EjUyJbiiUU/1jtCjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5AqLW6LzBuc=;lEWGb+vGlZp2y0L3WRKt+GluO5g
 Q3XJIJGUFwtkYyFa4GUGbauv53z2kpIs+6gbjE3ELr6j3rPwBw0A6CBnQ66EuteKKmsdNXF1m
 OWHalzqGPz3AmRVyL/cIr5kZx+4jqLSEOs/1q6wkb90HGNsUvcbm47GdEud8zgrykWEcaYp9Y
 ENKK5efr5od3XrMDScr0LhBgvmYbAuvLYzAGGOyNaQZkQzZRrijQA2Ty6jM3RVU+egn7d9Moj
 H/EzHFegppKtf17ATu/Nx7bUrK+2vYuf/YEwHYF5hzGJNozAHrpiwK8VMjGe4XcdXtgLuhpCF
 9/GZraXsXIbUk2P7FpgxilfRG6MSdIj+dLyX4CHPTXQTRV75lKxD8EOCfhJ0O2mBGN3G5d+z4
 elYAqK6G/EwJUAz3QW/LeitSONKSu61uHg6S42Gaffr/gd1wZ2LHD0q4rQrDD1Zt4HtvZFMgZ
 Eh9twnHb0iD+cjlqKVlo48iedgJTkHk6N0eOKkUcuMAvmFkZgEeRK3kVUm1w1z0KfzJJEDKXi
 t2QuT5cMEiWAIibkobQeE+e70VYoL5VivaGfyHAP1pqqvK6hZohOwrxhGVpLEs9YFCQ5hC16Z
 tvITgslO2CTemcPPXsxCb88cp3ax3Do8eyE8g1IscmbBkMvRZDpRqMkN1GKKTGxkZkNq5nuyL
 jehx6/j4DAq+DZXpPuDcj7gF+Umtrb1b+MwilVibj4Ie1jUgaDQbj2b911XdeJO5HrDM8YExi
 MTNok0nMUWNUEKOklRKHfB7UDcVK8jaVnOI1Y8e78R3rvLaEynLHrSqDNxyM7BuNJZ52q8G47
 6aDxX1qhXqFnt2xEbafEBZvQ==
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Matt Turner <mattst88@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/25/24 23:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> MAP_UNINITIALIZED was added back in 2009 for NOMMU kernels, specifically
> for blackfin, which is long gone. MAP_HUGE_SHIFT/MAP_HUGE_MASK were
> added in 2012 for architectures supporting hugepages, which at the time
> did not overlap with the ones supporting NOMMU.
>
> Adding the macro under an #ifdef was obviously a mistake, which
> Christoph Hellwig tried to address by making it unconditionally defined
> to 0x4000000 as part of the series to support RISC-V NOMMU kernels. At
> this point linux/mman.h contained two conflicting definitions for bit 26,
> though the two are still mutually exclusive at runtime in all supported
> configurations.
>
> According to the commit 854e9ed09ded ("mm: support madvise(MADV_FREE)")
> description, it was previously used internally by facebook, which
> would have resulted in MAP_HUGE_1MB turning into MAP_HUGE_2MB
> with MAP_UNINITIALIZED enabled, and every other page size implying
> MAP_UNINITIALIZED. I assume there are no remaining out of tree users
> on MMU-enabled kernels today.
>
> I do not see any sensible way to redefine the macros for the ABI in
> a way avoids breaking something. The only ideas so far are:
>
>   - do nothing, try to document the bug, hope for the best
>
>   - remove the kernel implementation and redefine MAP_UNINITIALIZED to
>     zero in the header to silently turn it off for everyone. There are
>     few NOMMU users left, and the ones that do use NOMMU usually turn
>     off MMAP_ALLOW_UNINITIALIZED, as it still has the potential to cause
>     bugs and even security issues on systems with a memory protection
>     unit.
>
>   - remove both the implementation and the macro to force a build
>     failure for anyone trying to use the feature. This way we can
>     see who complains and whether we need to put it back in some
>     form or change the userspace sources to no longer pass the flag.
>
> Implement the third option here for the sake of discussion.

Usually I'd vote for option #2, which means remove the kernel implementation and
redefine MAP_UNINITIALIZED to zero in the header.
A few years back this turned out to be the "most compatible" solution.

But today, and specifically regarding MAP_UNINITIALIZED, I think we should get rid of it now.
This flag is useless and build issues will force people to drop it.

Helge
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
