Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C133410F
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 16:05:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2AA1C5718D;
	Wed, 10 Mar 2021 15:05:24 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3678BC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 15:05:22 +0000 (UTC)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lK0Oo-0000JZ-7e
 for linux-stm32@st-md-mailman.stormreply.com; Wed, 10 Mar 2021 15:05:22 +0000
Received: by mail-wm1-f72.google.com with SMTP id a65so1169144wmh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 07:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6O6+tOduwR48d8zZ29bwhvehUqmwn5KZAJpghN9/ZFw=;
 b=hfuGtfzbJuhkliCrPaSoTgmoAKH6xP1K9dzCcVA1nQdsFsmZW3WCguC6ZSDV4hRzId
 jAx0XdSUl/rx1A8kro+mQoNFf5Y/xkwinqF+IoH/aZiBQB8fVm2K7CAdWaOR1Uoa6Uwa
 yvozhfBDRrVoc3ObRMIan7KWGMoUH0ONF/QhhzsxC98c9joTKCzDZfyztWP5cFuRqi1W
 jeYoBs8mdc0i6QI9mx6r+BvPw0FjtKQ0ZpUKhB6Pkx3fpEYczw0L4LllxTDwo2bakuzo
 wiR2H5ORBuqgXgsbjQmynr66jagIT0eRV8AnNvlFXvtwMHG8u6LjGgVHNtOdl5Bc94nl
 Ms8A==
X-Gm-Message-State: AOAM530ApzRRz6mtz0ceWLSg7MMYVPhNblhnpUd4jlt3Dr1RLLgXy+8R
 h3buZ+YKF9/EaPAJtKtQM4sX2TCyhDYvvLQ5Zvgpcb3fzlMs16xgOCYY3atpYZsgoVKtSnTeqYp
 7T/bTAe62s99/KgMxZOrTaZ//uKv6MRqmySk5UCiZ6kKFtnSxvPnG/fy0LA==
X-Received: by 2002:adf:f303:: with SMTP id i3mr3936188wro.67.1615388721924;
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGJJurjVb7EYp0bgYqxrECEX4ZhpKbOThOV2/LSr/fZ3VGeNkWRh86xSztb8QWNx4T9B9Jfg==
X-Received: by 2002:adf:f303:: with SMTP id i3mr3936156wro.67.1615388721715;
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id c26sm32188982wrb.87.2021.03.10.07.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
To: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
Date: Wed, 10 Mar 2021 16:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Dinh Nguyen <dinguyen@kernel.org>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, netdev@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, linux-fpga@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
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

On 10/03/2021 15:45, Tom Rix wrote:
> 
> On 3/10/21 1:45 AM, Lee Jones wrote:
>> On Wed, 10 Mar 2021, Krzysztof Kozlowski wrote:
>>
>>> Prepare for merging Stratix 10, Agilex and N5X into one arm64
>>> architecture by first renaming the ARCH_STRATIX10 into ARCH_SOCFPGA64.
>>>
>>> The existing ARCH_SOCFPGA (in ARMv7) Kconfig symbol cannot be used
>>> because altera_edac driver builds differently between them (with
>>> ifdefs).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>  arch/arm64/Kconfig.platforms                |  7 ++++---
>>>  arch/arm64/boot/dts/altera/Makefile         |  2 +-
>>>  arch/arm64/configs/defconfig                |  2 +-
>>>  drivers/clk/Makefile                        |  2 +-
>>>  drivers/clk/socfpga/Kconfig                 |  4 ++--
>>>  drivers/edac/Kconfig                        |  2 +-
>>>  drivers/edac/altera_edac.c                  | 10 +++++-----
>>>  drivers/firmware/Kconfig                    |  2 +-
>>>  drivers/fpga/Kconfig                        |  2 +-
>>>  drivers/mfd/Kconfig                         |  2 +-
>> If it's okay with everyone else, it'll be okay with me:
>>
>> Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> I think the name is too broad, from the description in the config
> 
> +	bool "Intel's SoCFPGA ARMv8 Families"
> 
> A better name would be ARCH_INTEL_SOCFPGA64
> 
> So other vendors like Xilinx could do their own thing.

Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
the Altera EDAC driver depends on these symbols to be different.
Anyway, I don't mind using something else for the name.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
