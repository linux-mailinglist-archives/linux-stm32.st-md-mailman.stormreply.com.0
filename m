Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D552F84A
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:15:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D26C7C56630;
	Sat, 21 May 2022 04:15:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A217C03FD1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:15:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C05560920;
 Sat, 21 May 2022 04:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A76C385A9;
 Sat, 21 May 2022 04:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106515;
 bh=ZOX6ujBcMnT7GDeHWouQ9gtLDH8gdmG9zioCEXGXYII=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SakLCbZLYal0PnCmDP06gQFnGApWEwK/hW5pccJ3X9GXrPGii0QrgpWQSjaXkjbkT
 AdIdJsptFfqFL1L2hAeEtvlCZmKjZlLArqikHTeCGmOEnaPKSxzwMuT9DAuHuuwou1
 qDElSNgVOet4HKcnA/5sRFa5Hek4QTU5k4Cqvkmq/0t2HevaMXfWVt+y97t2EaSVw5
 PJ636UG18l1KD8CzPeCJdB3E2Xv5SomaK907A6ubrSoyWDfBtKjdAwo6qQwnrLA6Ve
 GAbdaqY5Y4XCCWaam3jy0nRnZAatPvuUgvuy244FLFSUaaFz/k18/sc/Xl+SZhg8UP
 PliAJ9AIw69GA==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-5-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-5-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:15:13 -0700
User-Agent: alot/0.10
Message-Id: <20220521041515.B9A76C385A9@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 04/14] clk: stm32mp13: add stm32_gate
	management
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:50)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Just to introduce management of a stm32 gate clock.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
