Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE081495637
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jan 2022 23:03:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2D7C5F1EB;
	Thu, 20 Jan 2022 22:03:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B16C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 22:03:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23E57618F6;
 Thu, 20 Jan 2022 22:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C3CC340E0;
 Thu, 20 Jan 2022 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642716236;
 bh=5jYAKSQZEZ+oypimInAn0kWHu0t6ZHj8FVn661Mwy9E=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SAmv6F9hkc4VXRpPlVUKsR1JcQCEoLghPWin/iMNJzSHaxBjiNJDoYTQx1ePjvg9E
 AXO+8jDhXh9tjqlFwdmRzTqZ+lQ54nIJSwxyDI/zLvhO4coXuZU/SVIfm10qKT3d7w
 vHIBh9G2c+6DUelpFwiB+Qr0l+0kMGypxJpsxPYoySvmH/21yjxgk9OTIhYSzQgSxV
 NACzFTfj2o15+cnR7CXm5HQCr84k0OsPtz4NS9q3RACyaPpYtRj+FJdSQXss9C2G9q
 mU7ExSKO/ZIle8aOO75qyv1Kea5kquT5vuPJWcb57m9G4xvng3JfRoZQD2mikTfe2K
 G3lEDN+/pCmuA==
MIME-Version: 1.0
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
References: <20220118202958.1840431-1-marex@denx.de>
From: Stephen Boyd <sboyd@kernel.org>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Date: Thu, 20 Jan 2022 14:03:54 -0800
User-Agent: alot/0.10
Message-Id: <20220120220356.79C3CC340E0@smtp.kernel.org>
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jneuhauser@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into
	separate MUX and GATE clock
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

Quoting Marek Vasut (2022-01-18 12:29:54)
> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
> in use, ETHCKEN gate can be turned off. Current driver does not permit
> that, fix it.
> 
> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
> ETHPTP_K remain functional as before.
> 
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>     Figure 83. Peripheral clock distribution for Ethernet
>     https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---

Any cover letter? What is the merge strategy of this patch series? Do I
need to ack the patches?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
