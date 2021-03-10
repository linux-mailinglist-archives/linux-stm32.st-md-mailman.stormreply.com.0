Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFD3341B5
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 16:39:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1ABDC5718D;
	Wed, 10 Mar 2021 15:39:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1004EC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 15:39:56 +0000 (UTC)
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MF39M-1lUzJ60FSq-00FRF1 for <linux-stm32@st-md-mailman.stormreply.com>; Wed,
 10 Mar 2021 16:39:56 +0100
Received: by mail-ot1-f44.google.com with SMTP id j8so16801869otc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 07:39:55 -0800 (PST)
X-Gm-Message-State: AOAM530XeuQQJKiA0jGIKzGd0xW6Zmnnhr8mFKqZhktYriwbcgsekSYn
 hoV/kHrZXT7BFUYTrG/cIoY3wT5E2JexziQb18E=
X-Google-Smtp-Source: ABdhPJyz+OU7gvgIrSIrSop4e8azU44xAIwSKa5HpTc5C9P44C7QC3z/u5GcCJR7jvFrP3vF9cowRntGlUhuRjPALp4=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr2985547otq.305.1615390794792; 
 Wed, 10 Mar 2021 07:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
In-Reply-To: <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 16:39:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Provags-ID: V03:K1:9QK1ZBHeM66FFoT3C7tttK4UxcrTH0aEYC7RlfDhq1CeNvrahxJ
 Ib3WSidDiuCRKvnGvdwFUt4smHthXsP1uhDHJpK3UEM0vD5cK4IDJtXVFjshtqWnqfSlQTl
 GpM8Bpla0QXzIM5dx6ft3kbJl7ZowQSr0B03KiU6BHSRo8/Tt6amJ6XDUSnOKPanFXqf6P4
 kgXWttfR4Ltc1WAr6L8LQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G7vExkSJycA=:gmjwnf8WOH4MzzCmveaj7x
 Zzk4JcVVdD8gKqztmaSiHAPPr8kGjvwmJ1y2P2U0N5obCesKN4hh/A991Aecg0EEItWZ5Aza0
 dSIhuHizBhngymiyu9ZeqIBEg5aXH6lTuDyavmT6CVNBa+hsxPFKtI18CpHNteeo7uQ173Dnl
 leRD2+wotvzRwpUk7yddrPJczkn90gbBzdWxJugYvg6QElqFHa59cNLsAcWRZCixRxuUzziLE
 e48hJdI0DOBLVgw9G+TfKNNTGbhLaC9u0s0148Zb8KR5mPQdXugQIc5G4VWm83Ar/zjCQFZJI
 ahArz0QhmG7XA1JGyPjbo5f+G8+lI3k00uUVtB/AcsxZUUd7utMytnUXYu8/PtmKNirSyEqww
 zCG7Y8YrYwM61tlyi5LNq9Ue+VEoIA1KQRNm1VG1IV2ty8n/tUWeDhvP+Ss9o
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

On Wed, Mar 10, 2021 at 4:06 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 15:45, Tom Rix wrote:
> > On 3/10/21 1:45 AM, Lee Jones wrote:
>
> Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
> ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
> the Altera EDAC driver depends on these symbols to be different.
> Anyway, I don't mind using something else for the name.

I agree the name SOCFPGA is confusing, since it is really a class of
device that is made by multiple manufacturers rather than a brand name,
but renaming that now would be equally confusing. If the Intel folks
could suggest a better name that describes all products in the platform
and is less ambiguous, we could rename it to that. I think ARCH_ALTERA
would make sense, but I don't know if that is a name that is getting
phased out. (We once renamed the Marvell Orion platform to ARCH_MVEBU,
but shortly afterwards, Marvell renamed their embedded business unit (EBU)
and the name has no longer made sense since).

Regardless of what name we end up with, I do think we should have the
same name for 32-bit and 64-bit and instead fix the edac driver to do
runtime detection based on the compatible string.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
