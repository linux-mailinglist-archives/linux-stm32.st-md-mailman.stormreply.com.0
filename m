Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55186336E98
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 10:15:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEBD9C5718D;
	Thu, 11 Mar 2021 09:15:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B61ACCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 09:15:07 +0000 (UTC)
Received: from mail-ot1-f47.google.com ([209.85.210.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MxEYY-1ldqWQ2F6u-00xcvH for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 10:15:06 +0100
Received: by mail-ot1-f47.google.com with SMTP id r24so822014otq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 01:15:06 -0800 (PST)
X-Gm-Message-State: AOAM531WzYD1ELYAGRUrIp+sMf10/QPyyQ9kecnbv64bePx8c2UpnFZi
 Cp1T8Ohk/JfmtACFPDdTQG59SnyBlHgL1r85LlM=
X-Google-Smtp-Source: ABdhPJyn+biUFqeUpWbgYz+onSoY1lB5lZXnaVdOJ59ivfe6fWw6B/LYP9dm97k0WNF1I7ZVkGTZlALTwC9lFjwxZew=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr6129948otq.305.1615454105254; 
 Thu, 11 Mar 2021 01:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
 <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
In-Reply-To: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Mar 2021 10:14:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Message-ID: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Provags-ID: V03:K1:/nD6y02Z2eRuK5Gb6v3cfqR0b5HvHJOtn7C5QrVsN0kE6XyRUa3
 pWP+w9kVHon3hvugl57Y2PMvjcvI1Q5/elZZXUok2+smrEBfZ3cXK3oNNcmE+agi9tydfl0
 5ptlMIEFYERsNGpC+MvMUSV4F1kTvS5CrLo956imIZkHO56IpKKUkf4xJMrx4UYJntKpcix
 2u4abZz+OgmuxvML/GrRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbdhY+O7BpI=:6y2oW8JfOO4pB2gIMkqcse
 vk2xQYNXhh1WlJHiXHhryvPxEQN90pgmk+qeQWFLy+VLqFpd3Fq5Ui+bRQ/HEk+BfP0vWATZu
 1hu5Fm9/dbA5rnxi32Sq0H72jLiEasoe+tFZGpjwLRdJbQf0ik74o0V8RKSctKtVerB2zXKMI
 mkPGS/L9E2YCUqkpJSXDWTE0ymSDNVy8wVUcYwbodPllcuVfYnG+gf00Fioz/5GRPM4iMBKVK
 b5UtmwI5AA1I+2XndDkbbqht6W24NaIHsSxElV21yi7eVJHc3qVK2sOwj1XKD5csoTLPPHn6U
 XwYYZBrzCqyHlrw15t6XxqAO+rf2PhRdGDHxHtiPErsgHOqgJxbBFS126af6PWHHjC2ZZuxDF
 KOeXZtd67A2s8ug6zANHfiS3iEdw3XQtmipuZFhLSOxM+l2ryqKxjvjmed1QV4KnQjH0EI22C
 EtJB2AN8oamcTcbok5BhiQT89zCe1oX96xF3QtlAK1OU+AKYy86rVsYGNzCioqB3UaA8n+tJ7
 y3WHj4quf9L4h9dD4BhgFEFOY+I7NwH9OvSM9gnetFwwpdQIyRMIbHUHHg3kmoUpw==
Cc: DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>,
 Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Dinh Nguyen <dinguyen@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Olof Johansson <olof@lixom.net>, linux-fpga@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC v2 3/5] arm64: socfpga: rename
	ARCH_STRATIX10 to ARCH_SOCFPGA64
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

On Thu, Mar 11, 2021 at 8:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 17:42, Arnd Bergmann wrote:
> > On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
> >>> This edac Altera driver is very weird... it uses the same compatible
> >>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
> >>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
> >>> have two. It's quite a new code (2019 from Intel), not some ancient
> >>> legacy, so it should never have been accepted...
> >>
> >> Oh, it's not that horrible as it sounds. They actually have different
> >> compatibles for edac driver with these differences (e.g. in interrupts).
> >> They just do not use them and instead check for the basic (common?)
> >> compatible and architecture... Anyway without testing I am not the
> >> person to fix the edac driver.
> >
> > Ok, This should be fixed properly as you describe, but as a quick hack
> > it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
> > instead of CONFIG_ARCH_STRATIX10 during the rename of the config
> > symbol.
>
> This would work. The trouble with renaming ARCH_SOCFPGA into
> ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
> Kconfig symbols or even directory paths.
>
> Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
> little bit later.

Maybe you can introduce a hidden 'ARCH_INTEL_SOCFPGA' option first
and select that from both the 32-bit and the 64-bit platforms in the first step.

That should decouple the cleanups, so you can change the drivers to
(only) 'depends on ARCH_INTEL_SOCFPGA' before removing the other
names.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
