Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A49FF6DB
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2025 09:25:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AB82C78002;
	Thu,  2 Jan 2025 08:25:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4CF8C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2025 08:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 56CF8A40EF1;
 Thu,  2 Jan 2025 08:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A1C4CED0;
 Thu,  2 Jan 2025 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735806348;
 bh=zqtih7F5QTw8cdGtFnNIYjYSoyZ5b/s0GMAq8CTYW9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rvdVGpThiWus2lbx6a4iHGNPtvkye3FNK4O2wf3cIB3+QXJUVtpBYAal+9h8CM92K
 7Y72IjDFsnBJkJ6iArmhdE7TAC/meveP97aIr0BP9T8GPwXmHjOOQKmwNrScHijLWn
 1H6sDnFQfy3kwNsmUREiSp+Rmd8Cc06pU9/1u0sqooo2yWlb2CqpPJL8A75XY8oIt5
 oDJW2TE8v9PsDqF3/cJI8CO6HcUNlyndaGLh+4r8B0M10Wn8WK2wo6gHqz6DmA3kmd
 PkfHPCwZLsMSnuy1+/ebxNxFX164HG3z0jTZfXIfgsBgZ1eH/fSsqRHvMsxIFk/qt1
 WA6npbXDYN0kg==
Date: Thu, 2 Jan 2025 09:25:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <dphltmk47oticmxe6cd2ozcnmhdq6m4mgjybc3dyyqiyiemaxd@q63eeuu7rwnn>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 31, 2024 at 04:01:40PM +0100, Dario Binacchi wrote:
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
> 
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
