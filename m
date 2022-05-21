Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6052F844
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:14:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B7BC56630;
	Sat, 21 May 2022 04:14:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1B73C03FD1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:14:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC55560A64;
 Sat, 21 May 2022 04:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4AFC34116;
 Sat, 21 May 2022 04:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106496;
 bh=Yr+zPfiQun8GK92zEq4Xft6+56O3vdTOZLYaH1m3eBw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cy1KYMbG8YZnNyDMAlyK8rhpk0SJKGq7dxAx2EnCT/3hEe/NZbWxnDGcmC6nu+WY7
 cTinbzdHKNdQIwWuvOeFsgOeE3a1tNQNSwxd+iWND39V+CCAN00VQ2LYAkKpwoBbrP
 prpirbHhUHCbApfX30LhyuSy05ZOd2qthPFzV+sFTcrOM9ccMhC6+ttdAWPFKwGmbY
 b/WDp6HJwn/WhDolkDRlxfDb9NcoUMApktvlDp15uYdCoaAvYgahkkHvkaWgGJJKSD
 HSb++VLDQXeb5BExKLdq0wLqld6vPZTdiIah4CrHlY+vctS1di2W1Xmdaee8Su569D
 rHozoi7reKg7g==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-3-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:14:54 -0700
User-Agent: alot/0.10
Message-Id: <20220521041456.7A4AFC34116@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 02/14] clk: stm32: Introduce STM32MP13
	RCC drivers (Reset Clock Controller)
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:48)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> This driver manages Reset and Clock of STM32MP13 soc.
> It uses a clk-stm32-core module to manage stm32 gate, mux and divider
> for STM32MP13 and for new future soc.
> 
> All gates, muxes, dividers are identify by an index and information
> are stored in array (register address, shift, with, flags...)
> This is useful when we have two clocks with the same gate or
> when one mux manages two output clocks.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
