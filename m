Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2EB42722
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 18:43:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BBBC36B2E;
	Wed,  3 Sep 2025 16:43:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE601C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 16:43:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0ABE060248;
 Wed,  3 Sep 2025 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F85BC4CEE7;
 Wed,  3 Sep 2025 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756917806;
 bh=AkA4dzUeMeAnqy5b40dZ57UDlURr08Yuge2wOJ7h2Lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bq91ZOLsPXtnywSL0n01fUFf3HGbluHxTTlrKq4YOWy+oSiYHQUb8lH9kDHubCn3r
 y5gNxmYsAiIK3CH9q0yk0xu01AsEU/Z2pZd5Q/1aFa8aeKR+nrpXtcabeqzr+D502y
 rByVLKZblyDw7pQOQ7L38CDLNJ++FfwiPvddveK6RIHLPtmnm3Y1Wug2f+9WiW/ryS
 jhCmrok2BLBGvhmpUTx4plIHYBrLYWVV8nbwyruYul4jDYoHnYAd/QMJLYv5/anwR1
 EctRN/T6egnHSW3kKkCMoImAJ772lynQ1mtEHt+K++Jlv0y7ubSfJw2lX3ZS5RUdY1
 OFkdPx/DBKZzA==
Date: Wed, 3 Sep 2025 11:43:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <175691780521.2465839.12589280217452124752.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: renesas,
 rzn1-gmac: Constrain interrupts
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


On Tue, 02 Sep 2025 17:40:53 +0200, Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
