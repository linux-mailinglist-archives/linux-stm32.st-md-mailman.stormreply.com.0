Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF65350BF7
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 03:32:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E37C5662E;
	Thu,  1 Apr 2021 01:32:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C74C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 01:32:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DFB61002;
 Thu,  1 Apr 2021 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617240750;
 bh=1pKzTV1rSUrVvS8ear40uiy8cJ8WKDAJLPyT943wPt8=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=hvo7booBTicx2YIuvBa7JRSRk0xF8QRfxoGJ3xNaNqQ8zq8B+UmUzLVFKDrWXTMIQ
 5mNS68qGD9DQ3jx/uyCrPb4LVl1df+SxgejeKfjUHfxmdjA18EQ05wNcbvIZK4R704
 Wcxfx7rJ261yGmN/zMOtkk4qnoGgvundVPRSle/8o7dGVBxcvDz1Y4O42a4T3miNSl
 XDLFdd40T+chnxyKFRFxRpH37H1DzCE7Fcd+BejN3wuotFFNSfnuNsMAdFNc+wnB7k
 GAsd6EXeWHsR8l2Clm7zPhAYjRwUfVYGM+CObn7h3VsUnDMHahts5uvIoefxjMzNIO
 Fp3We/0p0LExQ==
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David S.Miller <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Lee Jones <lee.jones@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>,
	Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
	lin@stm-ict-prod-mailman-01.stormreply.prv, ux-fpga@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	soc@kernel.org
Date: Wed, 31 Mar 2021 18:32:28 -0700
Message-ID: <161724074854.2260335.2479133227977254546@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [Linux-stm32] [PATCH v3 01/15] clk: socfpga: allow building N5X
	clocks with ARCH_N5X
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

Quoting Krzysztof Kozlowski (2021-03-11 07:25:31)
> The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
> (ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
> changes.  Also the clock drivers are the same.
> 
> However the clock drivers won't be build without ARCH_AGILEX.  One could
> assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
> modeled in Kconfig.  In current stage the ARCH_N5X is simply
> unbootable.
> 
> Add a separate Kconfig entry for clocks used by both ARCH_N5X and
> ARCH_AGILEX so the necessary objects will be built if either of them is
> selected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

FYI, Dinh sent some patches to change socfpga code to use clk_hw so it
may conflict.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
