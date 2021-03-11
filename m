Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7480336D09
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 08:29:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A502C5718D;
	Thu, 11 Mar 2021 07:29:45 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55B31C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 07:29:44 +0000 (UTC)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKFlP-00030F-Ip
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 07:29:43 +0000
Received: by mail-wm1-f71.google.com with SMTP id w10so2002467wmk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 23:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UM3RKX0XCDpJCuubU4GyjNFkIs45HL7bg2XqkxuxPoo=;
 b=TWnfAGXcKs3FQ/EdYujNcTb8s7SxsvyE4c36S9qd9Lq5nTWxzFqQ/2p8EkcYDL3XA/
 Cd4+Yw+t4JNL6+Iix7nWkL8/a0EgXjAypuovELKfIEhTsmd/YSmOVIookVAYyT2E3k9e
 1JFIR5XbjtG4P5Wr+B1Ce8noKSLu7uFpuc0nb7+Y4pNQ9rFXfBSFSyvPArfqMciezykj
 8ilpeDkq4LSDNKzzIuH9g+SpWVrhv1VmV181wprljGszgojMij3AYZu3NCaBuwtYt0TS
 jdAv5NMOQylHZ8JkxvIIeDuI6huMP2phBtvI2zYVZ/Dcrlr5dWk65OLnPGtjzs6piVF/
 isoA==
X-Gm-Message-State: AOAM531bPZbeasUyxuM0KZtN3F6ZE7cF/ECbNgSZr+MN2kbvT3CB7xwH
 nRbm/l0hKbCqOVfpW8hRwJxLXl8IOvGyvcWhkCV1Qg9xK6os9HB6xLQsZn47FBHBv0ujNvC5eHA
 sw76OANiNtnrjNWHNwcq7z9b5naScHRa/x10RJ8uVzd7PElA8FqNixwilEw==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr7473148wrq.382.1615447783379; 
 Wed, 10 Mar 2021 23:29:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwntEUdVEQpqMsRTDpIua5kEKJ6BAuZNIC5Far5vVjfExGBGIXOrXsOxt/q5mJ8+gEXtFcFdw==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr7473131wrq.382.1615447783295; 
 Wed, 10 Mar 2021 23:29:43 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id z3sm2323807wrw.96.2021.03.10.23.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 23:29:42 -0800 (PST)
To: Arnd Bergmann <arnd@arndb.de>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
 <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a1f296ad-19db-824e-5d33-c93c6af87e70@canonical.com>
Date: Thu, 11 Mar 2021 08:29:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
Content-Language: en-US
Cc: DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Dinh Nguyen <dinguyen@kernel.org>,
 linux-fpga@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC v2 5/5] clk: socfpga: allow compile testing
 of Stratix 10 / Agilex clocks
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

On 10/03/2021 17:48, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 9:38 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> --- a/drivers/clk/socfpga/Kconfig
>> +++ b/drivers/clk/socfpga/Kconfig
>> @@ -1,6 +1,17 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +config COMMON_CLK_SOCFPGA
>> +       bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
>> +       depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
>> +       default y if ARCH_SOCFPGA || ARCH_SOCFPGA64
> 
> I think the 'depends on' line here is redundant if you also have the
> 'if' line and the default.

Yes, you're right.
Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
