Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FF337622
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:50:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF6ECC5718B;
	Thu, 11 Mar 2021 14:50:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B385C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:50:38 +0000 (UTC)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKMe5-0001X1-3g
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 14:50:37 +0000
Received: by mail-wm1-f69.google.com with SMTP id n25so4161500wmk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 06:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uKAiLuqa2i9OZl7ygZkPLgKIbolSbL3Tro2Nub/Uk4Y=;
 b=bAubrl9NcyZbaYqfOnbBWdqJY5tFqo5CFl+FHKKsOsAXyDtMoZ5FIe5ovukkOrmAvp
 Ycj6B0aMOyDe17DvWr8lzG/IJe6AFnUgTB7xxOlQ5CoVhl34RcQT8E62e851ioqLjMZ2
 Aj9j6Mp4izGGAjP/ce4W9raK0FI+dKsL/0FdrZfaAAKLrwb68RQnaHDiCtvHKqSET4dG
 h9TFfHOo48fIdaUqeivbliaWIlNBRh6rRDnqbCb75EycyZ1R9IqIb6Fba3YhsjwxbX6F
 4hjRKOtRdBMitJX16p5hLhr8p1Wzquna/tl9Ae81BPpkwyJj9T213tX8dE9RXqUN0ZZb
 pTXQ==
X-Gm-Message-State: AOAM531vPQziTcdZGZSsSPhHvGaGSK2N2lfq+qPOQ68Gc8t7x0ycfi9y
 +yf3lmVh5tC3bXq1+DTgESV8PQkb/nhl+rGpYm2BFp9rnVx+m4Z23ZyJDBjxiNT00CimKDlERjW
 Erol/2K+k2yKcbAj4QOSYTWctaF0Ei9mV1WQKhfxGHavAnablXIXWAxgQPA==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342168wrq.210.1615474236738; 
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyesJMeh5P/4D8iW/copAeKCALuE0/kYNU8cA4lvJq7myQHewdqjAfZPd2tqbyUu+ezagHw4g==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342138wrq.210.1615474236553; 
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id 4sm4433053wma.0.2021.03.11.06.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
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
 <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
 <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <30ba7549-c60d-4ee9-3502-b863bca8d3a7@canonical.com>
Date: Thu, 11 Mar 2021 15:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
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

On 11/03/2021 10:14, Arnd Bergmann wrote:
> On Thu, Mar 11, 2021 at 8:08 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 17:42, Arnd Bergmann wrote:
>>> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>>>> This edac Altera driver is very weird... it uses the same compatible
>>>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>>>> legacy, so it should never have been accepted...
>>>>
>>>> Oh, it's not that horrible as it sounds. They actually have different
>>>> compatibles for edac driver with these differences (e.g. in interrupts).
>>>> They just do not use them and instead check for the basic (common?)
>>>> compatible and architecture... Anyway without testing I am not the
>>>> person to fix the edac driver.
>>>
>>> Ok, This should be fixed properly as you describe, but as a quick hack
>>> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
>>> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
>>> symbol.
>>
>> This would work. The trouble with renaming ARCH_SOCFPGA into
>> ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
>> Kconfig symbols or even directory paths.
>>
>> Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
>> little bit later.
> 
> Maybe you can introduce a hidden 'ARCH_INTEL_SOCFPGA' option first
> and select that from both the 32-bit and the 64-bit platforms in the first step.
> 
> That should decouple the cleanups, so you can change the drivers to
> (only) 'depends on ARCH_INTEL_SOCFPGA' before removing the other
> names.

Sure, let me try that. I have a v3 almost ready.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
