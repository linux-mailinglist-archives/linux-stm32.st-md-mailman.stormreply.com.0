Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A90103B56C9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 03:36:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 688ADC59784;
	Mon, 28 Jun 2021 01:36:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 877EDC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 01:36:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 092DF6144B;
 Mon, 28 Jun 2021 01:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624844167;
 bh=GK6DyH3hn+24TS37u/9qHV8EgG5KUbj3jhDKMHPc8HQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Dmq92Qd4OxVbtx18UafyjlMmEyHuJI7tBroSEu5iX6zy1YeVFdpr32d9VcEyeW+oI
 ksCYN0cI7GYd31e05QqDab4UtzILPGamptXOa3R0xnKU9L8e/epK0R5OKmsh0W7JtE
 CZMWEILInTp+Ktsh8wx8vp0UbM35ij44KwY+WowzyLj3y+iUTwx2VrJrkvxoY4brvB
 hwxDf/3d7nIgNO/BKx95ZBOGgHcqR2FFJgbcUNOBX1Sl7iB4USpXCyVveJRRn0tAug
 q8YQ8HStzG354gJlJeXigBzFsgNwE3m4zx7SI5DtfXatZQnZyCykPubFDpKGZDjnen
 eCzPUbdS/lDlQ==
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-10-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-10-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Sun, 27 Jun 2021 18:36:05 -0700
Message-ID: <162484416592.3259633.4238481639719859797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v3 09/11] dt-bindings: reset: add
	MCU HOLD BOOT ID for SCMI reset domains on stm32mp15
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

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:12)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Add ID to SCMI0 to exposes reset controller for the MCU HOLD BOOT resource.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
