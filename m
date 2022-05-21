Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085852F85F
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:16:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44D57C5F1ED;
	Sat, 21 May 2022 04:16:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A97FBC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:16:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 548D6B82F27;
 Sat, 21 May 2022 04:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AFFC385A9;
 Sat, 21 May 2022 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106573;
 bh=GXl4fheAypsewLYAFsARnQq1bewWK3sUj5kcyqf5yWU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZZeL7ePzvWKDwyML5KIiDZki/JJ2k7cpAZWZou/I7no8XtySimIkf4MKcuuI6Pp1b
 DNtoIAiCgzU4EPGSlE+m1jEviNCoFOD2tOWlYoL6fWrKTuTisqwrU9mRa9FEgVW/Yk
 NGIgKrADonEpyCUtkt2Ai0HDH9MwvyRXIAdm61B7EPmg9Sd9q2ZUiWulWwvjYf9p7D
 wCpafkCBmok11k+oVbYjYeJ7sV72LHDnGfS05/Az//rOh5d5ATrczuYngScbWEC0uw
 MazJnfptUTk+kroIUQagBAIDAbDmq+wi+GXLUYUmeUmoK9Nyr4q1aU4a1VvUTY3D+F
 /6RhBvub1FzKw==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-11-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-11-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:16:11 -0700
User-Agent: alot/0.10
Message-Id: <20220521041613.07AFFC385A9@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/14] clk: stm32mp13: add multi mux
	function
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:56)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Some RCC muxes can manages two output clocks with same register.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
