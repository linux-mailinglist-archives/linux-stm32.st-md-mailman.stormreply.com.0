Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A452F860
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:16:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54761C5F1ED;
	Sat, 21 May 2022 04:16:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B50BC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:16:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3526360905;
 Sat, 21 May 2022 04:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C38C385AA;
 Sat, 21 May 2022 04:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106588;
 bh=4wNqefbzGqvHmEmwIjbKQ79o6ZIZqb1FpmXJ7eMWmVs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mXrTBOLkUTk9NIIuBmLk+PsjjlsRVlzb5ppywkNfus6xDNVwfhSFNyKX8sFk2T9jQ
 f2AIUBno2z1WKXU2e6VOQjW/D7exSZGAtpmisrLaCyyftDWUPq6Gm+F7EWi4/DBL1q
 tIAdXtxi7dZWWMCDZZNFl4zVry6pIvnScNMWhQULWzgt1xzhbTTG1t1LaATkIJdJgy
 8VtTcnsyTQ4RcZMJzWSuZ76redz44iJD8+578kSbkpziJ2J/m732V8TUhU+q1l9hPs
 PinwljdRK2T7Dz+pfoWgqjSikpPhYlngMy9AJ7ZI+sgprb3dftxeJm3Wxb+TOUYMcF
 2wF/q07n0BDnQ==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-12-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-12-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:16:26 -0700
User-Agent: alot/0.10
Message-Id: <20220521041628.86C38C385AA@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 11/14] clk: stm32mp13: add safe mux
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:57)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Some muxes need to set a the safe position when clock is off.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
