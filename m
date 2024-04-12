Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1C8A2663
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 08:22:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8938EC6DD67;
	Fri, 12 Apr 2024 06:22:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE9EC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 06:22:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 993F561EB3;
 Fri, 12 Apr 2024 06:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258B4C4AF0C;
 Fri, 12 Apr 2024 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712902926;
 bh=pZYfYfvm+jnX/RwGqdypPJz84vtXIB+UYrSq9SPSCuI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KNo0dQhwNSlTYrQz2rTgROGsm/QrvfLZGW44bDnZK90DIu5dtDZBsieYfjQjQZYRd
 wwWqFc7iOomf7ArYi+0RzxnEUlZpzXO4Xs6NKOCqU39GtAbMhHzyXxbedCaAohkAz3
 cyZWgSNiE14MYuAoP/H9ighfq9fmnlEvqU9NmegUg2/qn5OLJ72E0cQoN8TbYSsbMK
 csLz3rouTscy5p63r7TP3fqLfK9tJi5iZDL43MWTE9DkIl5EAqcsrrTB/Ij7NA890o
 M2syH3ypg5eKEaDw5hT2d8pyXVh8QECtHmVrZJ/DdxCYXFp8DirHrWa4+mQKb3Oga/
 EQL5aoVGLrk+A==
Message-ID: <7efb8858995d0c97ad2deccb24318353.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240411092453.243633-4-gabriel.fernandez@foss.st.com>
References: <20240411092453.243633-1-gabriel.fernandez@foss.st.com>
 <20240411092453.243633-4-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 23:22:03 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 3/4] clk: stm32: introduce clocks for
	STM32MP257 platform
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

Quoting gabriel.fernandez@foss.st.com (2024-04-11 02:24:52)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> This driver is intended for the STM32MP25 clock family and utilizes
> the stm32-core API, similar to the stm32mp13 clock driver.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
