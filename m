Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA6760215
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 00:17:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC58FC6B442;
	Mon, 24 Jul 2023 22:17:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE263C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 22:17:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A97E4613C5;
 Mon, 24 Jul 2023 22:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712FAC433C7;
 Mon, 24 Jul 2023 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690237040;
 bh=oGdT49PMKcFXsNyj44mx+Yx2XSjpJK4Q9Be2rHyZEmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m4cHNhTjzfUqMOqTsecbMCF1qHTAGGPkpiuQZVRsFnRng/CBKyEixwTbjLmEoRyZD
 OKdUWiFoSVrz/qChBNUNa1MPwEkmIg5lgm+ipO1bbQre1yp0XyWY+vtt9WTIv511wB
 UiTpaCn6Mx/TMmDKlIYBpGgIUsgXLwhznkieUNuUfTJMz4qLGUkMs/VueJuyqQKpIV
 3K+Oz0t7jSxFrOeUA6k5HVToiH0KSkhiRHnfGapghpDV3GXe/sDbqtQRz6xNfSbETN
 1WQkpazBeQxhwpUesHZVu0JqhYvhs4RkXmOk6UQi6a45mWSYPdxkVod3moyZJaI8br
 u1A5EtbSyQRlw==
Date: Mon, 24 Jul 2023 15:17:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20230724151719.145d16b9@kernel.org>
In-Reply-To: <20230723161029.1345-1-jszhang@kernel.org>
References: <20230723161029.1345-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: stmmac: add new
	features to xgmac
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

On Mon, 24 Jul 2023 00:10:19 +0800 Jisheng Zhang wrote:
> This series add below new features to xgmac:
> 
> correct RX COE parsing
> add more feature parsing from hw cap
> enlarge C22 ADDR and rx/tx channels
> support parse safety ce/ue irq from DT
> support per channel irq

Giuseppe, please take a look (try 3/3).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
