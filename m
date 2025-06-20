Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA21AE14C3
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jun 2025 09:21:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98AADC3F931;
	Fri, 20 Jun 2025 07:21:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AFFCC36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jun 2025 07:21:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 674175C537D;
 Fri, 20 Jun 2025 07:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480B4C4CEE3;
 Fri, 20 Jun 2025 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750404083;
 bh=FSM2izM9vl5e3Hqb+oIj0xlTknp96G+HXI6ROxmh4SA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=UoRRXQiLO+R0p4ZlmRLdszbRQ3CXGasmrKwf0KJAtOE1m1aqiOcZyZsaIRvWQ0pe2
 MGK4ZpAvNswj+g4TDkFL74RdrdwXEHDGiGJ5GutrNTSYny0w/xp1YBHBFqW0TQ4vV5
 2598p67FYgF/tkW5qSsuJVOJky9F/iaivYRZPf5Mj8TrNvU/f2SYzG0/Cll171zt1F
 /1mexlZS5/AwibSZ16WWqdJ1jIqKHZF8CGTeMrZLsjA9QtNdPbE3kDRYzCJ3L4JEuu
 G+vrC0+S2bM1j4RUdvuWezHWIcPv//+lNBM4SW1c1E1ojLb1BOk6V+0nH1tcvzPs0Q
 4TUEO7h88wtLw==
MIME-Version: 1.0
In-Reply-To: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Date: Fri, 20 Jun 2025 00:21:21 -0700
Message-ID: <175040408188.4372.10647064030431437175@lazor>
User-Agent: alot/0.11
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] clk: nuvoton: Do not enable by
	default during compile testing
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

Quoting Krzysztof Kozlowski (2025-04-04 04:56:58)
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
