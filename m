Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3F336CB9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 08:08:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46A83C5718D;
	Thu, 11 Mar 2021 07:08:51 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7AD1C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 07:08:50 +0000 (UTC)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKFRB-0001hW-VF
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 07:08:50 +0000
Received: by mail-wr1-f70.google.com with SMTP id 75so9026684wrl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zgH3nywQ4QyohOt2SMlSyPyC9OdZbO8xrqdRqBr6msM=;
 b=E64JNtk8onFlzD9Wfp/TvrtgZ0SLxMjdUM7Hq/NtQrf8P7XgjoaVpv6aCLqtBjkRoo
 9kBW4YTF9bGvCXyFTRU2Tg6UHeJOghk5lUPU4Jr79/WSvqrixLPQn4aKYio7mG4SIpqK
 juTOT82+NSt62F+gXrfSdiHf7RH2MmKEwTYs3njWZcgU91ua8jKkEewLoeW1tGEUR8d2
 RNFTZlmmGSIvizmQ9V1QylKOYjir8mGRswQdbybqYvvc47oWLJAddh/4AcBdTN/r7GaL
 3nKZVkeUV0aoltQNlJbgZh2fgtI+UB4zhdlkxfNihJ00OYJVR8L9lp5PgjwDNN/PSZDW
 yZPA==
X-Gm-Message-State: AOAM530M2W/JjSW9cQlCHakDjVDPixlKIjQWoFe9smroRW6zS362lOap
 6OjNGmZq/pMxN1yMdP3rUE1gcAuQdiDr4b5NKog629rrpCwLxZ/eKM3ZgVVYBS8Fjeg35Hhk2J0
 np9Lm1Kbaj3LUiQ5VXEXB0glLMZVZxGJUCWQpzxBZBo9RiEWGvh7qgzZKCQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850393wmc.65.1615446529670; 
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFSUTjS1JFmjO0hMPLkEAzm/KPuXrtY7IKz/mXB9yfWR7YE3pRWw0tap7L6t6boQLro+3hFQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850370wmc.65.1615446529545; 
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id a6sm2515137wmm.0.2021.03.10.23.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
To: Arnd Bergmann <arnd@arndb.de>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
Date: Thu, 11 Mar 2021 08:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Content-Language: en-US
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

On 10/03/2021 17:42, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>> This edac Altera driver is very weird... it uses the same compatible
>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>> legacy, so it should never have been accepted...
>>
>> Oh, it's not that horrible as it sounds. They actually have different
>> compatibles for edac driver with these differences (e.g. in interrupts).
>> They just do not use them and instead check for the basic (common?)
>> compatible and architecture... Anyway without testing I am not the
>> person to fix the edac driver.
> 
> Ok, This should be fixed properly as you describe, but as a quick hack
> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
> symbol.

This would work. The trouble with renaming ARCH_SOCFPGA into
ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
Kconfig symbols or even directory paths.

Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
little bit later.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
