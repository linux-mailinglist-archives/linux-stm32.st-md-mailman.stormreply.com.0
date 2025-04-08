Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D5A7F56B
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 09:02:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88338C7A827;
	Tue,  8 Apr 2025 07:02:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D1E5C7A826
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 07:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CBCE4A030;
 Tue,  8 Apr 2025 07:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B82C4CEE5;
 Tue,  8 Apr 2025 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744095727;
 bh=n5s/LEoEQT9NSU6XeyqlvUReVnAp5oh6ZpPr1vmJWlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWK6hpiKl5YRKO1XST0DS4G1798u4QPzV/BYigAc7enKX9RvtfbHVZiIyWLipOFNq
 R/TI9O0yCS5wZAOjM3gUxOGG8kzT8ZfEscsNFE+cdoEabPjcPBX+eqizMRGHd2XQhE
 wMoFS5FBU9Q5I5jPyg01niVBXZsCkXhf5ZUGW7XIHNYkuu0yRx6BMVUkkkCFN9XtC4
 JArmSuarCNVcbj+kNHG8QIz5FV9j+QXgqgAFJrE4C5/3HCklP4QdgsDJBip5WC0TUx
 t/ZQJD52d9OnT3Kgmj9mtlKP7XfL0pXlXKEJp0kwo32dByen14GJSaQHzP24ksgM7H
 //0NShTXgPthQ==
Date: Tue, 8 Apr 2025 09:02:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20250408-offbeat-esoteric-millipede-ed8a2a@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 0/7] Add STM32MP25 SPI NOR support
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

On Tue, Apr 08, 2025 at 08:38:08AM GMT, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> > Patrice Chotard (7):
> >       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> >       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
> >       memory: Add STM32 Octo Memory Manager driver
> >       arm64: dts: st: Add OMM node on stm32mp251
> >       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
> >       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> >       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> > 
> >  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
> >  MAINTAINERS                                        |   6 +
> >  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
> >  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
> >  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
> >  arch/arm64/configs/defconfig                       |   2 +
> >  drivers/memory/Kconfig                             |  17 +
> >  drivers/memory/Makefile                            |   1 +
> >  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
> >  9 files changed, 863 insertions(+)
> > ---
> > base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
> 
> That's unknown commit.
> 
> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
> Using cached copy of the lookup
> ---
> Analyzing 81 messages in the thread
> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for lower series v7

Hm, both v7 and v8 apply cleanly on next, so not sure why fake-am
failed.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
