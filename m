Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964909EAB20
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 09:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37944C78014;
	Tue, 10 Dec 2024 08:55:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2391AC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 08:55:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D13A5C5693;
 Tue, 10 Dec 2024 08:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8418C4CED6;
 Tue, 10 Dec 2024 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733820949;
 bh=gw1Ki9tOSz/6K2XiNToVAsaBw9K+65jKOt8YfYBIqes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMJimCVwxwJn65lxmQON5iGxkTGy2uI85uJRw2p2XnPuwU2bkmNOc9jExbwtRph5m
 88Sik+uW3O/2sGHlVzs/NVhOpcB6xgjVR1zNRQYdrsvxiGBqywRIB8cFasQpRF7z4Y
 iEyEjDjGezRNr5nrpca9JgBhMHqOmZfg85RtQrruYZvtN6zpkvgtvIk96dU/Y32yGV
 ZAcYuQoo18nDsYGt2Kc2cQ2VEGLMoaTP67Clsx9rSsOoeXmkMTZDYZ22icPpDh6icC
 JxgCxMOcwParI+8sEAB30l6N216+vHA3svxSVHFvuHMQvF4GRqDGU2WL/VebrXoFsX
 uodrAJywpma8A==
Date: Tue, 10 Dec 2024 09:55:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <kybhaanlgznymzbqw3dhykt7rhdr3dehyib7l6lghsbhsnsvtr@rlsvk3zdzbks>
References: <20241209103434.359522-1-o.rempel@pengutronix.de>
 <20241209103434.359522-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241209103434.359522-3-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: arm: stm32: Add Priva
 E-Measuringbox board
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

On Mon, Dec 09, 2024 at 11:34:32AM +0100, Oleksij Rempel wrote:
> Add support for the Priva E-Measuringbox ('pri,prihmb') board based on
> the ST STM32MP133 SoC to the STM32 devicetree bindings.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
