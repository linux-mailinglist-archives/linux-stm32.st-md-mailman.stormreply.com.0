Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D2A33A75
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 09:59:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1CDBC78F6D;
	Thu, 13 Feb 2025 08:59:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0FB3C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 08:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F7F45C4B09;
 Thu, 13 Feb 2025 08:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6283C4CEE2;
 Thu, 13 Feb 2025 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437186;
 bh=HtS9SMt+0MPO7eISiOD7sGZONSitaIQg3tVcG7gVoH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PzxvSXAg1ue2/+iuo1Xs+759D/A1NmSuaCCLotOOa0xh+7UJLGIK5PPKCIzQII+ra
 4LyExYHm5c+g9+m6KROUOfXV+sw7wx57EfU3LaMHQXXxi8nqbPeZF695e4nqmIaDEk
 fu8JL/euV8YMuISDiPJ4FfLrmmBrg7l79NkTTt5VsSh51QkP4yr18JUDvHsQZEs7uH
 ADit+sj+ZFG+0EgHURmu5oDswtIesoDUaTdDZn0U+xQNYQFrfVx0F3V+k0s50erb6X
 sorUyCpNHL6Bm/009CD/98x9VfWWlWZ1D0eZjUUbo46MHeQBfkARhikgREn56FLl6X
 v0V/xK6SZrgRQ==
Date: Thu, 13 Feb 2025 09:59:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250213-unyielding-accelerated-moose-9faba6@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-10-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-10-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/10] arm64: dts: st: add stm32mp215f-dk
	board support
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

On Mon, Feb 10, 2025 at 04:21:04PM +0100, Amelie Delaunay wrote:
> Add STM32MP215F Discovery Kit board support. It embeds a STM32MP235FAN SoC,
> with 2GB of LPDDR4, 1*USB2 peripheral bus powered typeC, 1*ETH, wifi/BT
> combo, LCD 18bit connector, CSI camera connector, ...
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/Makefile           |  1 +
>  arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 49 +++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
