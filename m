Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BEB8E206
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Sep 2025 19:32:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1005CC349C3;
	Sun, 21 Sep 2025 17:32:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DF13C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Sep 2025 17:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D911D408BC;
 Sun, 21 Sep 2025 17:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EA0C4CEE7;
 Sun, 21 Sep 2025 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758475935;
 bh=qepFOU8T20KaFaLq8hgY/wsf4nLF6or1PKzI4CKHSjo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=koEmKzV1JfTshEqlFj/6c7QvIt4O4+AHiKmF7yCgAUnIyKNJIxq9QY9yReUExzRoo
 RSvhAKRzWIrcDfEalNx1esu/opu2awkjrnj422ZaEVyM8UAiBR5Y1tlzXYyPQu1471
 aLqmqmtZYDSsdLGvO1EOWFqtUD6CP+miBuTkvXhV0V8CZbZP9TFSkXVFAkPmy49Jhr
 Svj0EkBVcIOOcxkobOQjkJGeKUgLFJprmv4hWdfvhZ8fsavVZ/kIrGFHsuzv8lHStU
 h5wLbIr3AQrfTmrDxio/6aC84uqYlgnMEjSPV+BsvAsow1UtRBq124elLPoaPI8WGQ
 mamP7+Lpb83rQ==
MIME-Version: 1.0
In-Reply-To: <20250625-upstream_rcc_mp21-v4-1-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
 <20250625-upstream_rcc_mp21-v4-1-9368a86c8515@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:32:14 -0700
Message-ID: <175847593403.4354.864826415550352713@lazor>
User-Agent: alot/0.11
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v4 1/3] dt-bindings: stm32: add
	STM32MP21 clocks and reset bindings
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

Quoting Gabriel Fernandez (2025-06-25 02:07:24)
> Adds clock and reset binding entries for STM32MP21 SoC family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
