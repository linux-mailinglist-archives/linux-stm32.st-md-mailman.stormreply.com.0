Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025A99286C
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E62A5C78F6E;
	Mon,  7 Oct 2024 09:42:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0E96C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2024 17:15:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20b58f2e1f4so21445895ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Oct 2024 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728148510; x=1728753310;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
 b=YG/bfiBI76RMy2u0FTXv7fGPSxETANXh2Tgook+zZe1UMOrtKG1UUMm6Boed1dpi7/
 mRGpjO3VQuP/Ylc+2u2r+0Ks3QhLC/NXJyxvlPYXHmjorrcUtx/7J1eu6eptn5Y/4bPo
 d9OTAs4QAmeIEDQ90MYrgv+f/6Jbgez75ThhWCrkn8P/WJAqVmh8uaH2i+iR94aExz+0
 gWNVKe+jx9uINN4YuL9nwrjD6IxwHUlI9pSvMrVAmk3/PTSs2EXWEj8h2xtM2DGxNWvE
 5JRyhoo7UUvmUBWsPjkemDFvVtARLxLTSUB3gUDzh4H/QMHL7l1DRI/iQG9D4gxcmkeT
 PyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728148510; x=1728753310;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
 b=pgZjv4B1g8y00jWCQGkFayTeqtp3TyNcoDaeQCWEOW586UUEGXz4ShazIhk44nFR0T
 e09evjOJsFsRtKaX2LlLtzX0Ht2ML2OTtzDdqJm+Ox7PWJM5nlpY21yIEsRSU5OM4ZN9
 GvoaJWLBb5DnsN+Idu428PjQGpS1INWjQ/Q6cTAEXSmIhD5snjgiK08V7GfHKYx/iTp0
 pD1PbQqdGDjEOz+7g+a53bscJ3A42G0dg/yXpLSGrE6WSbv+iFF/GTL+oeMHwPKHcD5U
 TV9djmn9ZhfUWr9hqrOQDMGkP6uI8yII29FoiG79+UEu7ZggxW0epmbC7mivNmef+CGo
 eNfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPsCfhu+3f2OAXpZCVgsmQWLlmAfZpRZwrIcFGSbII2WRyso1MkZ0tiroRd3X7wFMfkCB2JD/Qr/e7Gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxesoRA83ud7fhRfo/9A7ax3s/1swbc4HPF9J+4DA0QLAHfFX4y
 yjmIjdsvCx9HJSI5Bd6CAYa4vEp9yzwAq5YgZW3dtpvzef5Y9aYdr+K9b/zoyi0=
X-Google-Smtp-Source: AGHT+IENbFDG/A+fVoOl/3+aASUI1BapHoAWqdH3kxJgz5oqEs9gbrypUJkbtSsFqXqIWpDd5XosEA==
X-Received: by 2002:a17:902:fc46:b0:20b:8bd0:7387 with SMTP id
 d9443c01a7336-20bff1ca475mr95440335ad.52.1728148510524; 
 Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c139317desm15149965ad.125.2024.10.05.10.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Message-ID: <99346751-30b3-4245-974b-94be618cf5bd@linaro.org>
Date: Sat, 5 Oct 2024 10:15:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-5-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240925210615.2572360-5-arnd@kernel.org>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Matt Turner <mattst88@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 4/5] asm-generic: use
 asm-generic/mman-common.h on parisc and alpha
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

On 9/25/24 14:06, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> These two architectures each have their own set of MAP_* flags, like
> powerpc, mips and others do. In addition, the msync() flags are also
> different, here both define the same flags but in a different order.
> Finally, alpha also has a custom MADV_DONTNEED flag for madvise.
> 
> Make the generic MADV_DONTNEED and MS_* definitions conditional on
> them already being defined and then include the common header
> header from both architectures, to remove the bulk of the contents.
> 
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   arch/alpha/include/uapi/asm/mman.h     | 68 +++-----------------------
>   arch/parisc/include/uapi/asm/mman.h    | 66 +------------------------
>   include/uapi/asm-generic/mman-common.h |  5 ++
>   3 files changed, 13 insertions(+), 126 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
