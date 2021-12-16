Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1E476A8E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 07:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D56E3C5E2C6;
	Thu, 16 Dec 2021 06:45:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 624C2C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 06:45:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC11A61C0A;
 Thu, 16 Dec 2021 06:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50385C36AE2;
 Thu, 16 Dec 2021 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639637156;
 bh=DAHiQZ/A9fSoAedgWlGLb4HM/aUKVwB/P8OFL5cQTpE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uzi1gsDjoSzvtQLPxTsFIOiMBj4s//5SeulcHvdqPHR9atceMdIJLt8sxPvBf24j1
 VLfOnw13I3CdNY9dT47QSX8zknqH0AEosCTpB7XAeVB5+XRMjtbRZZb4oS0vBml4U2
 2SzgVz0cm4QtDnDQliCeTk8oB3cNq27VqNilQCXwbYEAfCDrbDdqnZGqzhLH9COBhc
 yjTzT8VMeUQHyzu6wjpc6BMSga04o+zs/1+dlqNs67kMyByakhDU/y5bXCUx1uwhNn
 DbCXaobSA9y81til1dzqnK76XTqlp2hO6fz9q+BTjADqpPfOXsffUpX3238d/H8sTc
 qsHS6pzIfOhZQ==
MIME-Version: 1.0
In-Reply-To: <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
 <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dillon Min <dillon.minfei@gmail.com>, alexandre.torgue@foss.st.com,
 ezequiel@collabora.com, gabriel.fernandez@foss.st.com,
 gabriel.fernandez@st.com, gnurou@gmail.com, hverkuil-cisco@xs4all.nl,
 mchehab+huawei@kernel.org, mchehab@kernel.org, mcoquelin.stm32@gmail.com,
 mturquette@baylibre.com, pihsun@chromium.org, robh+dt@kernel.org
Date: Wed, 15 Dec 2021 22:45:55 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216064556.50385C36AE2@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 09/10] clk: stm32: Fix ltdc's clock
	turn off by clk_disable_unused() after system enter shell
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

Quoting Dillon Min (2021-10-26 00:11:21)
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
> 
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> 
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> 
> stm32f469/746/769 have the same issue, fix it.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
