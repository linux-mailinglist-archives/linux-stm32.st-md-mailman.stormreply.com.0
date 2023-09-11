Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6979A967
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 17:06:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 367D1C6B46E;
	Mon, 11 Sep 2023 15:06:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BF7BC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:06:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C495E6115C;
 Mon, 11 Sep 2023 15:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C584AC433CA;
 Mon, 11 Sep 2023 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694444804;
 bh=1jkS9Ats1JoDNaymOePPSbD5PM9h6PddgwPxnahLIiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NzW0fLfcR2ykeJzwkX/u0r/Yz3k3XIUyeCjbRtY8h+8VuXge1dOIb1AI/am7yyLFc
 VipgVDoQGEStg5piUu/uDQ+QnD9vJVDIdQmr5rlHkvaW9RbbwkgZaPpXRtwqMBBoVI
 /E1+YF58hIqBpeXOZnqxM1PyAoXI7RPkCBGpd9oybYLVaOQpgvh7fZ1GxLE7HLRUDe
 gHHFy6awF+1XinYQgWGn7xLzTv3cZG7iJ7rn2ZJENaulIunCtWGrYtjKC7kmkyAMIT
 kNnOGDFXc4fY08i7znUIzH3eBMU8ZD+PM1ok5mim/3lkJTqavTa3lJPzSYn5nYCpkK
 xzg3I4q348Oew==
Received: (nullmailer pid 1255885 invoked by uid 1000);
 Mon, 11 Sep 2023 15:06:41 -0000
Date: Mon, 11 Sep 2023 10:06:41 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <169444480100.1255834.17566582577816053132.robh@kernel.org>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
 <20230908165120.730867-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908165120.730867-2-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/10] dt-bindings: rng: introduce new
 compatible for STM32MP13x
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


On Fri, 08 Sep 2023 18:51:11 +0200, Gatien Chevallier wrote:
> Introduce st,stm32mp13-rng compatible.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
