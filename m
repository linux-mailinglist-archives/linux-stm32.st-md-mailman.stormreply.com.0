Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB62355906
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 18:16:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9463C5719D;
	Tue,  6 Apr 2021 16:16:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDC87CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 16:16:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D02D613BD;
 Tue,  6 Apr 2021 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617725778;
 bh=f33FNwuOiX9RsCyTqxsQy8FT+twXquGLQQ4HL+p2Ttg=;
 h=Subject:To:List-Id:Cc:References:From:Date:In-Reply-To:From;
 b=AAdsq12NS/mQAfxDUrufZq5wM2lbSPXhhgK80GGEM5djvMzDStAtMTMl279qYjsLJ
 cLaKXBXNnIToLDPALBGSo0i4Q4qOGzRwTsTLX/aWhMlKfP+8QXbiRMU3+AHS9vHIM3
 +e6KJOS5+61nfhq6k0Mfatwu2jDcItT2s7fQxhkCX8uyOBAu+nb7jZm9Ppi0w6apA0
 HuyG2F4I1puYsXJIYc0kQfzBCIefqx6gPBAu6FJvECOAic2H+GULrQrpm+VxOin/46
 c03RT03BgYxJLWvWonG7ecwgMt/TWS4AZGXa61VnFTvTC5OsXhVa8cxwWC2ct2mxDY
 a++K49LzHYkFg==
To: Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
 <20210406160959.GA208060@roeck-us.net>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <62dc6f31-b488-64b6-7a05-0a68a678fdd5@kernel.org>
Date: Tue, 6 Apr 2021 11:16:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406160959.GA208060@roeck-us.net>
Content-Language: en-US
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Tom Rix <trix@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 08/15] arm64: socfpga: merge Agilex and
 N5X into ARCH_INTEL_SOCFPGA
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



On 4/6/21 11:09 AM, Guenter Roeck wrote:
> On Thu, Mar 11, 2021 at 04:25:38PM +0100, Krzysztof Kozlowski wrote:
>> Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
>> SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
>> the Linux kernel point of view these are flavors of the same
>> architecture so there is no need for three top-level arm64
>> architectures.  Simplify this by merging all three architectures into
>> ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.
>>
>> The side effect is that the INTEL_STRATIX10_SERVICE will now be
>> available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
>> used only for 64-bit.
> 
> Did you try to compile, say, arm:allmodconfig with this patch applied ?
> Because for me that results in:
> 
> In file included from <command-line>:
> drivers/firmware/stratix10-rsu.c: In function 'rsu_status_callback':
> include/linux/compiler_types.h:320:38: error:
> 	call to '__compiletime_assert_177' declared with attribute error:
> 	FIELD_GET: type of reg too small for mask
> 
> and lots of similar errors.
> 

There's a patch to fix this in flight to the arm-soc tree.

Dinh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
