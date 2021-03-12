Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9988338EE4
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 14:34:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C1D5C58D42;
	Fri, 12 Mar 2021 13:34:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A380DC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:47:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A47A264F09;
 Fri, 12 Mar 2021 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553267;
 bh=awQ6d7P1pAN97VdaNOlxDQLyaL1R4wg5mSfN6uui2Cs=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=snYRkE8OdVItCuahvzED4D/CcrPgHCrfl8Tex+db/QhBid/F+FfGc6+ZkwGoMRlsE
 S1ntrBtgjSMyZ2walfpsuK7o43DQiHVsmmZKa+8I2TydDMmNHfJWoF3HwYdMkD1RvN
 947m7YyhTXgfrY1tAOlX6JcvVlzBF0j5DgUG4u9lMPUBBg3EvMdtuXOkStJkTlrF7p
 AZp1UDWUKGRb25ZrkiN6XwcvWl2D2H39lbFzdqF315MATP3i33St98u/5TdtufUabZ
 Bz+BR7YC52HWPkGJvDuYdAfjdUYJgP0pFHyOImgg13BUNgBzO4tdNG1lVRFEva03G/
 nY1cKBXgBXIew==
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <5f7b49e2-db29-cc19-9dc1-09bcded43e28@kernel.org>
Date: Fri, 12 Mar 2021 06:47:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 12 Mar 2021 13:34:48 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 12e46b12e587..1e29e5ad107a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -104,10 +104,9 @@ obj-y					+= renesas/
>   obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>   obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> -obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
> +obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
>   obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
>   obj-$(CONFIG_ARCH_N5X)			+= socfpga/
> -obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
>   obj-$(CONFIG_ARCH_STI)			+= st/
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
