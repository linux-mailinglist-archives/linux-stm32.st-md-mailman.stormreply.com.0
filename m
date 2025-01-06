Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D49A0337E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 00:48:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABC78C78013;
	Mon,  6 Jan 2025 23:48:30 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56AC7C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 23:48:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B793AA41EFC;
 Mon,  6 Jan 2025 23:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF2C4CED2;
 Mon,  6 Jan 2025 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736207308;
 bh=2C+piIFBCEMvDxMS2yr7zW+/zN9TQ+BeI1mYmfP1vEs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rtx9m59D3tlEqhPXfLZPMQObyYKTgR3aEx9acpP8+qa8iMQD9ajlTJbZhf67LhzYY
 TSFOweT75yjjrArLJ0mbrH7cVyfRJMw0zN9VuDQ7zsgX1x0MGnQb+S7xWZpbQdEAZn
 316WXcyUofy0A/CtV3/yXJF4oPXkvjJQhP67qND7JzpdDbJoM7bv/GL6KFlQWdioEl
 4QR1FQBaCF+lgwz4WQSnCNIVqhFmBc8C+15mga9xtxgYtBcpKQJn5EoQNYmJmruiCP
 bOdylbVTaFpAP2RwcbzeNk4ubawo46pY/A0y0U90p7Qjhy1+yVbGmWA5jDrrrvDAYS
 kkGUQ5NrYACrg==
Message-ID: <d7440445064e515e7cb517c80a78820c.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: clock: st,
	stm32mp1-rcc: fix reference paths
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

Quoting Dario Binacchi (2024-12-31 07:01:40)
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
> 
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
