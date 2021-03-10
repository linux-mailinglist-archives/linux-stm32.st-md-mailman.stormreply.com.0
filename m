Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBB33434A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 17:42:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8A2C5718D;
	Wed, 10 Mar 2021 16:42:35 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB65AC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 16:42:32 +0000 (UTC)
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N4A1h-1lkSkb0no1-01062Y for <linux-stm32@st-md-mailman.stormreply.com>; Wed,
 10 Mar 2021 17:42:32 +0100
Received: by mail-ot1-f53.google.com with SMTP id x28so2234317otr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 08:42:31 -0800 (PST)
X-Gm-Message-State: AOAM532RXZzza5LicRKwnZ+JqcNNnbYXlJIlQ+L53yZM6a4zNKXtpbeO
 hZPfkl0CWAE3GNAXUEvluA7ByqE0bETc8GcCAR0=
X-Google-Smtp-Source: ABdhPJwWKWol/izxVLT1AnVOt4GuD9z3iMz5KYY704sE+gXiB+rSpGmz56qGx1HmOVASlj0OW4Sd2OtpS9wyLv30UgQ=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr3205568otq.305.1615394550932; 
 Wed, 10 Mar 2021 08:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
In-Reply-To: <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 17:42:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Message-ID: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Provags-ID: V03:K1:DSUprnHvMLAG/9jVRG/dY2/ejgfylu4zDGUyqVQHTjRUUUJtpup
 P6EcBPrBtLntuFYvcjRpnzk2TdPoUmxT/tm4knQFSVuD/SNZygmHrHevjx2ur1I4xr/URFj
 C90FhLI1hJtqqXnCyi9BlZtP3cOni79rYDOnaI+d/PXfM3XQkKOGDKZSd1GqeCDhmb9UnBn
 x42N9YqJ72uJZxYxFrGFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SCI9WchWKgU=:b8ZS9NBMkefPh3BdcHQftc
 rkyGjEf+ZUR9bfmME+RBg8VhCDkfivzjrDar8DkGkGj9M5bgcmtuCII4o6KV/PZ2I7I+BMBDb
 r5E2vahFUNOBVridrygeZHt3Y7udthyB/8zHI92MmVTkSfsyYQaY+5wBL74r/NtmG6FJqBMkz
 Zg8uBrS5tJ5eRhsGndycd5iekADWxkiNGM+yWWc51sB0F30KmZ+dO1A5KUAyumSJyaD3JIBXu
 5mX70jh4PfdOvYzH+XDLb4cZB9GDzdWeA9WpWOH6BrsJLwt5BaDluR9iQAHXlJ3Tv8csDiJfV
 cKDNW0/bFjIlGZWbp7/p7hzXp7WBJs9W7DzUTklmbkA7kVwtxGJTgO6QZUXbjubDYHtrezlC4
 uwDEWi3e23elwipYf8qPfRkeBZHeTF2FRwRWjQFGLzmCXA9olik9Sus1sHpSDHQq12hYXq4ES
 DPYbdymN2HI7598vk4xG230f69M2qAIfiztu7WIYvhvxFQq7qvdqM6+AzsNZgtYQH0dSXAJdK
 JNm+b2UXREOI3sQnA2uxGG8WXGu7YT6ts6wjrk0W6GTqbKSA7OuMq4QwxsJwM6z8w==
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

On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
> > This edac Altera driver is very weird... it uses the same compatible
> > differently depending whether this is 32-bit or 64-bit (e.g. Stratix
> > 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
> > have two. It's quite a new code (2019 from Intel), not some ancient
> > legacy, so it should never have been accepted...
>
> Oh, it's not that horrible as it sounds. They actually have different
> compatibles for edac driver with these differences (e.g. in interrupts).
> They just do not use them and instead check for the basic (common?)
> compatible and architecture... Anyway without testing I am not the
> person to fix the edac driver.

Ok, This should be fixed properly as you describe, but as a quick hack
it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
instead of CONFIG_ARCH_STRATIX10 during the rename of the config
symbol.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
