Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F791B42716
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 18:41:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D19C36B2E;
	Wed,  3 Sep 2025 16:41:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 924ABC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 16:40:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 623496024F;
 Wed,  3 Sep 2025 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A0BC4CEE7;
 Wed,  3 Sep 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756917658;
 bh=SsiclISk443zkOK/H3wMBLBs3D4jxyQEPB6xGixEaKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZOZ8YC6UQdFrcZMTGlBg7kafdrpx+RnTT8cCfWGSESuJ8j4KdS0rbRM+1MCroxyU
 Z4pooXVOYQ8SHc0uWLKMQBmNq/Pr6E3VF+1zWS/bdtgxEidW2zi1wzC6/DSqrtNHKl
 5W9c4/IDSCOJ5fPusqW3HNNq1GdDRy/MjIFfFNIxzfDrWbdy8C36fkTDsQPSHYqXBD
 X7864DmEJ9Pq6D3WHYk9yxwcIGZEJyd4xh+EUuyrYS/h6Ivq732V22jN+9or3bvJ6F
 3T8eahvr8M7uHRyKBnNUxggnNLoE2mBbIupVTvjsIdzF2EWQZm/3Db4Z4127t0lEfw
 6SERT7dpGm/fQ==
Date: Wed, 3 Sep 2025 11:40:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <175691765626.2450401.13914030815174267647.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: net: altr,
 socfpga-stmmac: Constrain interrupts
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


On Tue, 02 Sep 2025 17:40:52 +0200, Krzysztof Kozlowski wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
