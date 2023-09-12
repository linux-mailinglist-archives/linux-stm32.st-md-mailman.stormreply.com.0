Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A023479D398
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 16:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 331C4C6B46F;
	Tue, 12 Sep 2023 14:29:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AE7CC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 14:29:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7294DCE180E;
 Tue, 12 Sep 2023 14:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E40C433C8;
 Tue, 12 Sep 2023 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694528957;
 bh=51edGkZ7783Z2mPfwBbVsUX+4b8Z6WBJFR6Cg5U+Xxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GK9lxXw/TAmm75A28OnnkW7VWKbpRnzn2B76mkVGvKGMXNMDlfIX/DaY4oqqpqb6j
 H0/h84rL2u9gApx0u8WIfgnpIoVeHtagWO1zGs4+nzdCsnwnlg0jf0OD/NuK+mjXVG
 Y7cJ9D/JzIkvgjn3tyUBlbqMJf491VO7JapS44BHl2LJwzsvwb4lHP7ChT2kCIAMxu
 2OMBlzzIUIin3MaZqLnRoZ/s1bhBYXc5jJ8dsYpwnbh5y8BGSk400XMFy1wnNj3tBI
 E3nA9a7KZYYchzvg1W269CK6yYaFl4yDfNx1hVYgMdlw1OFbOKjMC+RaGPMVePUAo2
 YAhQdiU8oIhMQ==
Received: (nullmailer pid 751949 invoked by uid 1000);
 Tue, 12 Sep 2023 14:29:15 -0000
Date: Tue, 12 Sep 2023 09:29:15 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <169452894267.751273.3176397821021102917.robh@kernel.org>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
 <20230911120203.774632-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230911120203.774632-2-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/10] dt-bindings: rng: introduce new
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


On Mon, 11 Sep 2023 14:01:54 +0200, Gatien Chevallier wrote:
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
