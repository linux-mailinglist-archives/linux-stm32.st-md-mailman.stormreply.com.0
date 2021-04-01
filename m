Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1F350BFB
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 03:34:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9347DC57B5E;
	Thu,  1 Apr 2021 01:34:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E747C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 01:34:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A977660FEE;
 Thu,  1 Apr 2021 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617240884;
 bh=y68C6IcS4m9PdNpuDWn6Qfoy8NqdkF9RgAyAEM3FH7I=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=Ix2FykBgr2c3lT6X7vOJbbeRHaCnO4Al8p1iBMXYa38InTFl1x+QJY3Gi3ECAKnDx
 Ae6xhoOLYyS//Gu6nvCp5MmNGPOFoah/fmL6cCeltP1zvoza0p1ybnjIwEJhdO3Raw
 Q+5+5WFCVKBq3pkHVoZKeAgAs/qeGS875YMewOFupQxSYHZgX3T9XIzAsflYtHXGeK
 ElsmH/q+KavxtTwjU8hKR4RMpcfrNguCyt2lQRiOosXb7hRlhpQ0QMb8YWZasDmRF2
 9AMmtrY62i9V2ww2aNiTNu4G+E60bfwRxsHBiDw+LKTAxtmak432N4oyMhbTgOkXrU
 Mfy5oBtmYYfeA==
MIME-Version: 1.0
In-Reply-To: <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
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
Date: Wed, 31 Mar 2021 18:34:43 -0700
Message-ID: <161724088358.2260335.5735095120413931039@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [Linux-stm32] [PATCH v3 10/15] clk: socfpga: use
	ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs (and compile test)
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

Quoting Krzysztof Kozlowski (2021-03-11 07:27:15)
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
> 
> There is little point to share clock controller drivers between 32-bit
> and 64-bit platforms because there will not be a generic image for both
> of them.  Therefore add a new Kconfig entry for building 32-bit clock
> driverss, similar to one for 64-bit.  This allows enabling compile
> testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
