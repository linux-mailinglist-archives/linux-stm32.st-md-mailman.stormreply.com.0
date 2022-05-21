Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D252F85E
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:16:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33BF8C5F1ED;
	Sat, 21 May 2022 04:16:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F17C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:16:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13049B80011;
 Sat, 21 May 2022 04:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD67DC34115;
 Sat, 21 May 2022 04:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106563;
 bh=fzfuUIxGZ8p8zrC5r/YfbXG+uhgNGHUT6VJrg95Ma/U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eufWsIrbRGWCqwBq5dySPW8/xQiRG0rR0r9ufLl2k3JZexRI+qWmjo0c9cqOuN6AA
 U+z9aXhPDs7OqLRShyEnieyjxo8+z+dgblGNfo0fR/9tek5YZePJMlI050p69Smn4h
 Wa+CZYE/y/A+4VaeEhKVvNeQc1+QiwVSWVpBGcYJWzkd4nHABNzOnwMpfbqxQ/sbnz
 5O8+jXmZK6WJdheRZxMRFle2G627FxjZ7UH0rzjHJKJlSdsUbWHc0ypNgbNMKNpR5O
 DpAu2znwcLD2t1HpFO+F0/Rn/hPVYN3x4UUL/NELNZsEaDc/6MrxXjhA7ONUsyVTkj
 jC+2LPJS8h5HQ==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-10-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-10-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:16:01 -0700
User-Agent: alot/0.10
Message-Id: <20220521041603.BD67DC34115@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 09/14] clk: stm32mp13: add all
	STM32MP13 kernel clocks
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:55)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Complete all kernel clocks of stm32mp13.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
