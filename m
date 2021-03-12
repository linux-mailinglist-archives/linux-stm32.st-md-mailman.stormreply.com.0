Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67370338EE1
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 14:34:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA0DC57B53;
	Fri, 12 Mar 2021 13:34:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49ECFC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:47:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43AFC64FA8;
 Fri, 12 Mar 2021 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553225;
 bh=tKxo7sljt+pkSDWh1mUmM5NEnGtDl1u9sBRuSQ9gqRc=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=B3Wff/4KDmmI4bxbuLnCVv/MwYiNVGTqwGqUPpD8YXC6MroBQPb8N+EnosWeJCJ2y
 Rkp7GdjehEX1HMV3fPxNO7aKArRqwH6TrHVpzL4ryxEl70Lzbax1YbTihd7p+v3wLi
 F/vgUsvYwllSpTtiN3jZhkOFVNUz2QLObR9b7zLUrx98RXMWrgmD7MB7rebtqDmvOM
 FVXb6gGhhc78VVIZZlmPvJJqjIh1an/WBxQHhzuE0Q1unaoDjymZt7zaDFiFzoYUbq
 yaZP/LSuHch01stzO64G9IeE+HgpEIjCVxMIZDa/Xm3msx8lukkNSFJOIykNnOw3TT
 kYlzkQX5Dj6Nw==
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
 <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <658d380b-c043-06be-a7b9-f96e73aa03f9@kernel.org>
Date: Fri, 12 Mar 2021 06:47:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 12 Mar 2021 13:34:48 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
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
>   drivers/clk/Kconfig          | 1 +
>   drivers/clk/Makefile         | 1 +
>   drivers/clk/socfpga/Kconfig  | 6 ++++++
>   drivers/clk/socfpga/Makefile | 4 ++--
>   4 files changed, 10 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/clk/socfpga/Kconfig
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index a588d56502d4..1d1891b9cad2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -394,6 +394,7 @@ source "drivers/clk/renesas/Kconfig"
>   source "drivers/clk/rockchip/Kconfig"
>   source "drivers/clk/samsung/Kconfig"
>   source "drivers/clk/sifive/Kconfig"
> +source "drivers/clk/socfpga/Kconfig"
>   source "drivers/clk/sprd/Kconfig"
>   source "drivers/clk/sunxi/Kconfig"
>   source "drivers/clk/sunxi-ng/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b22ae4f81e0b..12e46b12e587 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -106,6 +106,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>   obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
>   obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
> +obj-$(CONFIG_ARCH_N5X)			+= socfpga/
>   obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> new file mode 100644
> index 000000000000..3c30617169bf
> --- /dev/null
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config CLK_INTEL_SOCFPGA64
> +	bool
> +	# Intel Agilex / N5X clock controller support
> +	default (ARCH_AGILEX || ARCH_N5X)
> +	depends on ARCH_AGILEX || ARCH_N5X
> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
> index bf736f8d201a..c6db8dd4ab35 100644
> --- a/drivers/clk/socfpga/Makefile
> +++ b/drivers/clk/socfpga/Makefile
> @@ -3,5 +3,5 @@ obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
>   obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>   obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
>   obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> -obj-$(CONFIG_ARCH_AGILEX) += clk-agilex.o
> -obj-$(CONFIG_ARCH_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-agilex.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
