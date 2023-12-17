Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662A81638F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 00:54:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203F0C6DD6F;
	Sun, 17 Dec 2023 23:54:39 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBD6BC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 23:54:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5999DCE0B2A;
 Sun, 17 Dec 2023 23:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FC2C433C7;
 Sun, 17 Dec 2023 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702857275;
 bh=hUw/dqLJ8c9mp0C2ocR/kSRcZ8F+vi76KvW9vcL+1TA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YHTE7p3hbgb/pUEPYH2XW/kIJtcmQ7uQy+BluxzlQYQcr2faxjNTHzxzkEmJKe89X
 IJZagjZjFgs3UNL2kYJGOJfk0pOZSzRq3IJfJBCNscXuyc5IVuyI4om43UxEizE4YV
 0FHjRFqrhFANzkIKXWMjgFqEM0exCa9LMF0PcxA5QRKPci3NRqFldrgt3TF7CRMWhB
 9/+ICgIJwmyAf18+X/jhkAJBDEMHTTO7Jrk+cgY5EJtLXj+5Ior3hy7pVXgoSH3ThD
 CSo4CKvXfmF3Vr7BMse75V7lveOY2qkr1GI+BYhWxVtMhfTyJ6XVfpZCAu/N2TEdPj
 axOBN5DXMcJ4A==
Message-ID: <d833e349ad841b1a3389ba475833e903.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231208143700.354785-4-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
 <20231208143700.354785-4-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:54:33 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 3/5] dt-bindings: stm32: add clocks and
	reset binding for stm32mp25 platform
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

Quoting gabriel.fernandez@foss.st.com (2023-12-08 06:36:58)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Adds clock and reset binding entries for STM32MP25 SoC family
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
