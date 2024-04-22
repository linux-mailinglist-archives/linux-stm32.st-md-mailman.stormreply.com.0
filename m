Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8578ACF89
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 16:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 186B8C7128B;
	Mon, 22 Apr 2024 14:34:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96ECDC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 14:34:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8EA08CE0B16;
 Mon, 22 Apr 2024 14:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72648C113CC;
 Mon, 22 Apr 2024 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713796488;
 bh=nXW/dGp76KSMhEsdyPgcY4LRy3/wNfDXNDI/mbg/66g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dT1qTkywsybV/NomyonjwXaYy4MOx0PozQcd7dGysPmLVUq790DAbcNKrJWqK7GyK
 ELjSzvEuELkuFdrOsnYjYOlK7pFpdxsnG2rTT5rCGucVQ/8ElTCCtCL97KbgtKuNw6
 jc3lh26lYgzDjpbE1RysS5D2Zh4QGlZwMRs2qJ9vnDs0LePC++9AKw0p7SmoHdqZuU
 rPkFQVzQIoNO3FKWlu6LDNslZNjW8GS1olJYMmZorENrtiG+ic9AFy3VYYLt+o4hHM
 HN/pgmxebJVh+wRGqhtI5+ym8yfWzG8JSZri5HL8Gm+pfhK67U213owbZ1D1Pi/Bap
 1Xhj8DSKhjXEg==
Date: Mon, 22 Apr 2024 09:34:46 -0500
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <171379647410.1220216.12174956651152279801.robh@kernel.org>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
 <20240419152723.570159-2-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419152723.570159-2-gabriel.fernandez@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: clocks: stm32mp25: add
 access-controllers description
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


On Fri, 19 Apr 2024 17:27:20 +0200, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> access-controllers is an optional property that allows to refer to
> domain access controller.
> The RCC driver will be able to check if we are allowed to register
> clocks for a peripheral.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
