Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE419A66E7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 13:44:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AA98C78035;
	Mon, 21 Oct 2024 11:44:11 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73D69C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 11:44:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38968A42771;
 Mon, 21 Oct 2024 11:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AA8C4CEC3;
 Mon, 21 Oct 2024 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729511042;
 bh=AJ/DqPzoLPYjvF0DStKqvbOtkyW/e+moS4T9f9nXyqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPFG2UnDVHfwXTPxm6/dIYV2yc8SrdzSZjAUbW5bfUU9txzgGGCDLhEveKdAqHc+0
 WfC7DIo7X1e7eisVg7uwKVasVx6+hUkKkSuQXaVpEOTy/FvGJzco3VnSNoTv+92scF
 WWJgX+rwjhW3AOlhM5b7gtA1pCqvF3KEEGbdSl/steiVuxGqvQrdMP9mbvWm19ezzU
 j+syt2dsRwW6p3fHyFmxQ+isz8rl6180ifHI2cbt49Yck1ecLQXqEra4QJ6ty695Fc
 WkaoG2t9iBRyZjxmo2sydyVzk6imdEtruIvB/ceaODruCdKixQ3QGkvpsBSImK8qwq
 gbhSxRwyxfYow==
Date: Mon, 21 Oct 2024 12:43:54 +0100
From: Simon Horman <horms@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <20241021114354.GF402847@kernel.org>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Drew Fustini <drew@pdp7.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/3] Add the dwmac driver
 support for T-HEAD TH1520 SoC
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

On Sun, Oct 20, 2024 at 07:35:59PM -0700, Drew Fustini wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC along with dts patches to enable the ethernet ports on the
> BeagleV Ahead and the LicheePi 4A.
> 
> The pinctrl-th1520 driver, pinctrl binding, and related dts patches are
> in linux-next so there are no longer any prerequisite series that need
> to be applied first.
> 
> Changes in v4:
>  - Rebase on next for pinctrl dependency
>  - Add 'net-next' prefix to subject per maintainer-netdev.rst
>  - Add clocks, clock-names, interrupts and interrupt-names to binding
>  - Simplify driver code by switching from regmap to regualar mmio
> 
> Changes in v3:
>  - Rebase on v6.12-rc1
>  - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
>  - Remove unneeded call to thead_dwmac_fix_speed() during probe
>  - Fix filename for the yaml file in MAINTAINERS patch
>  - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/
> 
> Changes in v2:
>  - Drop the first patch as it is no longer needed due to upstream commit
>    d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
>  - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
>  - Add thead,rx-internal-delay and thead,tx-internal-delay properties
>    and check that it does not exceed the maximum value
>  - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
>    delete the .remove_new hook as it is no longer needed
>  - Handle return value of regmap_write() in case it fails
>  - Add phy reset delay properties to the BeagleV Ahead device tree
>  - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/
> 
> Changes in v1:
>  - remove thead,gmacapb that references syscon for APB registers
>  - add a second memory region to gmac nodes for the APB registers
>  - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/
> 
> ---
> Emil Renner Berthing (1):
>       riscv: dts: thead: Add TH1520 ethernet nodes
> 
> Jisheng Zhang (2):
>       dt-bindings: net: Add T-HEAD dwmac support
>       net: stmmac: Add glue layer for T-HEAD TH1520 SoC
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 115 +++++++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
>  9 files changed, 657 insertions(+)
> ---
> base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
> change-id: 20241020-th1520-dwmac-e14cc8f8427b

Hi Drew, all,

This series is targeted at net-next, but it doesn't apply there.
I'm unsure what the way forwards is, but I expect that at a minimum
the patchset will need to be reposted in some form.

-- 
pw-bot: cr

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
