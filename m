Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0AA3AAC0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 22:21:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E26B1C78F6D;
	Tue, 18 Feb 2025 21:21:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9B39C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 21:21:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78F3F5C2570;
 Tue, 18 Feb 2025 21:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6D0C4CEE2;
 Tue, 18 Feb 2025 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739913699;
 bh=B9lSIUKtKaBWlF14BOO6dZrB7G6K1Zk063vl/H8dksY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rRRl3Oft5D1yNq8A/9GdXQlhT4a0/layZcEr6m168EFyUt483vukkReL1VrsLfdVW
 zOO6npRBlyNM4X9gkvxRqfp6wI453gdsRZlmJofmiL8zFsCY0YRhJuey7zQfw9fWFU
 xogFI9TFgXaaOcQZYVUhiS3aMAEuqHwyWwWSH0Dzt2B5hsdZV/dN0urTVADAhSk6G0
 V9Ut2rkKOCfMDY7wY1cEm2cEiHavDVfRO2cvjELFHVIb0Z+e80RwGR/n6Z2ptYlHVt
 r5EzUyJauBdauhOBLVtjpVAvKiMVdxIfXO/TXeUhmiYpot8O+xydOproUw8+D0zbPb
 GGcv6XBWrNaOQ==
Date: Tue, 18 Feb 2025 15:21:38 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20250218212138.GA1092771-robh@kernel.org>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218130000.87889-1-patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/8] Add STM32MP25 SPI NOR support
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

On Tue, Feb 18, 2025 at 01:59:52PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint 
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for: 
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> The device tree files adds Octo Memory Manager and its 2 associated Octo 
> SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
> board.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v4:
>   - Add default value requested by Krzysztof for st,omm-req2ack-ns, 
>     st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
>   - Remove constraint in free form test for st,omm-mux property.
>   - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
>   - Fix SPDX-License-Identifier for stm32-omm.c.
>   - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
>   - Add missing pm_runtime_disable() in the error handling path in
>     stm32-omm.c.
>   - Replace an int by an unsigned int in stm32-omm.c
>   - Remove uneeded "," after terminator in stm32-omm.c.
>   - Update cover letter description to explain dependecies between 
>     Octo Memory Manager and its 2 Octo SPI children.
>   - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.

No, you didn't.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
