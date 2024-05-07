Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86E28BEF49
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 23:59:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0ECDC6907A;
	Tue,  7 May 2024 21:59:36 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42F24C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 21:59:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60919CE170B;
 Tue,  7 May 2024 21:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844D2C2BBFC;
 Tue,  7 May 2024 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715119165;
 bh=6Tx8Ao+c88e5pawNIUE7BBmPVhW/I8eksE19lk+ATSQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=usY0vJvABlPssee3xoVzWRzL6N2TqDEtGQsy8HjAY0JGe4v6mn1Mr7Zy7wDjz4BWR
 4bGxp/3AnOzYCx8pS2mr85FtqgcegYk/OYxDVuDBCb/RCE24Eej521k6TPkZeAVsxM
 UDTYyrZlouGxS4FRW3fgeVbA6Hjv6dej6GIGk4BfzVovH+516EsTx4n2G1csJcfd35
 af9h43MHsYPD2XZyE44vx/9Z2yqB3gga5xjDnShwlh2imoM7KiQjCHA0Wu7fY1dwPc
 hMR9zj2aj83eVQy4TjXLIFRV8I/7T70nWgS6uvyMWy2l6FGYZRSYNkV49pyjQDqnQv
 EK807WczBp45g==
Message-ID: <dab1901cc1de2688977340734c252e98.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240419152723.570159-2-gabriel.fernandez@foss.st.com>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
 <20240419152723.570159-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 07 May 2024 14:59:23 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: clocks: stm32mp25: add
	access-controllers description
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

Quoting gabriel.fernandez@foss.st.com (2024-04-19 08:27:20)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> access-controllers is an optional property that allows to refer to
> domain access controller.
> The RCC driver will be able to check if we are allowed to register
> clocks for a peripheral.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
