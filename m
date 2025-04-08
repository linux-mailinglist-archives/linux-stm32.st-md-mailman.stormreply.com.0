Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555AA7F517
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 08:38:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C61CDC7A826;
	Tue,  8 Apr 2025 06:38:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91694C7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 06:38:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F08F060007;
 Tue,  8 Apr 2025 06:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D6C4CEE5;
 Tue,  8 Apr 2025 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744094291;
 bh=JJC94Lz0zUD4TEdlGfqwtlcTdbmhju2+3wATQkMNeAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlG2w4d1ftsFi3+kIshkvaX7VWEwC6HwHzXnTSaF6evp0X1jTXGKIjCBd65eozkCg
 M+CZo7XyGTpPZ+9tfEfAT3PTrz1dfUV07ukl6cDMa+8IGTpoFgy5IZRDZCOmMBDFyG
 /NG7KxnFTI2dY354YY0FDkknGa8KFijMpBjsgfoHp79I73Qi2+D27EGapia0oymHL/
 PNDok9S4lYahSgRKW/SROAc4L0BVe9zRhxu1o66cX7lxKF/USkmVQ5EIg8PRaqTlEA
 /VO90PH1qAfyHzsOWwD5iedRHvvnYFYt9iuW4mLtrk17B8C/k0BjGYqpJOIkBYl3KY
 Vdby+VLZWxnUA==
Date: Tue, 8 Apr 2025 08:38:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
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

On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (7):
>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>       memory: Add STM32 Octo Memory Manager driver
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> 
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>  MAINTAINERS                                        |   6 +
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/memory/Kconfig                             |  17 +
>  drivers/memory/Makefile                            |   1 +
>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>  9 files changed, 863 insertions(+)
> ---
> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f

That's unknown commit.

b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
Using cached copy of the lookup
---
Analyzing 81 messages in the thread
Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
ERROR: Could not write fake-am tree
---
Could not create fake-am range for lower series v7

I tried on latest next, on some March next, on latest mainline. It seems
you use some weird base here, so anyway I won't be able to apply it.

Please split the patchset per subsystem and send something based on
maintainer tree (so for me my for-next branch), mainline (which is the
same as for-next currently) or linux-next.... which would be the same as
my for-next branch currently.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
