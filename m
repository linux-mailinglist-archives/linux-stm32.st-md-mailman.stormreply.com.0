Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD99FA12F14
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 00:22:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 829C8C78F7B;
	Wed, 15 Jan 2025 23:22:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8551EC78F7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 23:22:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D410A4264F;
 Wed, 15 Jan 2025 23:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01311C4CED1;
 Wed, 15 Jan 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736983365;
 bh=BO+8gUrMYtjwhGtLnfcOVQRae2UvKhRyXsiVHIp04Yk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LDBJyv1xAPiQ8OCfWXU6EpFIHgkh4MEsISk7KwOyyjt1uaMJV5hcdoZlPFsh+9EWI
 26C1r2GsMdvncAHrRzi9Lj2IpoVa4BGyiLMFEl/xtK8fR3CitwTAEOlmEB4DuOJrnf
 rqYKoOV2PKZv5qO8ZB0HhFLOV5FT9k3wjUpvS2S+AjHiMLFrQnwYTbg9vWYvqIlI0I
 PQX5jnLvq1Jv/gTn5PVJwoEQky/DLlNwyeyYuTTFbfcV3D2ayHun4mjXlEtss3Ae2n
 /JapwHKSEw1o+qyr5p1yHmQSe3JocrpIsN8psa/wDyd5/e2kCBj0YrMM4cRhnkrQXI
 RaA75ETzeAmcQ==
Message-ID: <aab7227a048a822ba7f228930d3a4eec.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: clock: convert stm32
	rcc bindings to json-schema
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

Quoting Dario Binacchi (2025-01-14 10:19:46)
> The patch converts st,stm32-rcc.txt to the JSON schema, but it does more
> than that. The old bindings, in fact, only covered the stm32f{4,7}
> platforms and not the stm32h7. Therefore, to avoid patch submission tests
> failing, it was necessary to add the corresponding compatible (i. e.
> st,stm32h743-rcc) and specify that, in this case, 3 are the clocks instead
> of the 2 required for the stm32f{4,7} platforms.
> Additionally, the old bindings made no mention of the st,syscfg property,
> which is used by both the stm32f{4,7} and the stm32h7 platforms.
> 
> The patch also fixes the files referencing to the old st,stm32-rcc.txt.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
