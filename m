Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB34D6C25
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Mar 2022 03:54:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF67C628A4;
	Sat, 12 Mar 2022 02:54:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03ECEC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Mar 2022 02:54:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 500A5B80EDF;
 Sat, 12 Mar 2022 02:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95DDC340E9;
 Sat, 12 Mar 2022 02:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647053664;
 bh=L4dUQRs8FoT7ROYgs/J7sfaL9SDWe4mhi6JsExSzNDs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=l7yjZgl5Zs4/1YsZLJP+XlbpOY6ZDQj3ir5Ga0PymbXAGuaKswus3xXuPhXNSDxhi
 ugL2CEgZo/4FgbqFLRpoAsDv2vbRiex0M2PmTV3Y6aqozZL03VWll4fjtal9K+TL7B
 0fMnPEVh4lnCNGt5/0WgfeSBJ5r2xH8MkKGJtWeCQYq+4aemMSR2DUc4K0vN/RKaBg
 WhaskJ2DgHNKpXHGwcZ579loFOwIzq0dYIek+nIuwcm3C2B4Ztn/ywC1aE364XWZiU
 RyssdFo/q7qtP3vdb0+DC/jQijepzm9bUXxZRSz7D2jWlIm5w5xjSC5rTjPq4PacdA
 Uv2yS1OW9zQFw==
MIME-Version: 1.0
In-Reply-To: <20220225133137.813919-10-gabriel.fernandez@foss.st.com>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
 <20220225133137.813919-10-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Mar 2022 18:54:20 -0800
User-Agent: alot/0.10
Message-Id: <20220312025423.E95DDC340E9@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 09/13] clk: stm32mp13: add all
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

Quoting gabriel.fernandez@foss.st.com (2022-02-25 05:31:33)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Completed all kernel clocks of stm32mp13.
> 
> Change-Id: If47ae88e48d418534d6c3a9488cc803b62e0dde5

No changeid please.

> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
