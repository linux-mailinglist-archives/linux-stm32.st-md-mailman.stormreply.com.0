Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A00BE350BF9
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 03:33:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69F82C57B5E;
	Thu,  1 Apr 2021 01:33:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66138C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 01:33:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A3A60FEE;
 Thu,  1 Apr 2021 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617240827;
 bh=ZSMa4F5FXloJJQUx1kfzxITNV51gR6HaqXz0n/51KZk=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=BH9h/twYsSs5gg9Fx69VW9+TSLfOCwzW8d9snXPaJmKt+WmC5bG0v2vFrDa3YMbM2
 BIzXsUMp2KOrQAMY3A7j7/jk/2PVGClukY1YTcEvEGTjpq2kH1DfNyhfvMwLw8+nmj
 yx9bAsNpQF50YxZ+oR/8amCHby6/P8EClIbvy7tqJmQQkAY3hiwJub2Pv0DpNY/2OO
 5XGVL9KBeQG1qNaFuEvSN0lQ3Ee9BC6oZVV579A3027k5b+11CxEoV6/nwiZojKCRy
 pc5YSXjrrqmVcthwzgL20IKhV6j5a/zFu2yNkpE/38w5S+Vs1w3JT1bKfidNZEyskj
 Zr3471wPqZMYw==
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
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
Date: Wed, 31 Mar 2021 18:33:45 -0700
Message-ID: <161724082587.2260335.4838247818929514810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [Linux-stm32] [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA
	and ARCH_STRATIX10
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

Quoting Krzysztof Kozlowski (2021-03-11 07:25:36)
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
