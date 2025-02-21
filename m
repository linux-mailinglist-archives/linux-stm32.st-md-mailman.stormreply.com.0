Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D6A4031B
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 23:58:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E869C7A83E;
	Fri, 21 Feb 2025 22:58:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AED38C7A83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 22:58:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C1226831F;
 Fri, 21 Feb 2025 22:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4604FC4CED6;
 Fri, 21 Feb 2025 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740178686;
 bh=UD1mJc3L2/1M1eMRVEKmlNYviOU+pPZbwPDjudm8YBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRmW6HFetk9gBcJVjmGedrpzJc9A5xydWmGgUh72T7lAekfxLErtovTbwri7P6iWX
 9UpIEdRt4wWFLLz+i05k8TMksdeLUu/AnBTFceKjeUKU3HyDcQdVt42LBkR99aoTS9
 9w5KKoRClz6TH5MDMLblw7fg+1uscFK6m8bzj7SAHNHeQr01+JEIz6FVAjUq4TfjOx
 6yKWSE9D9fiWAV/qs+aFIiseALoM4d5P1SSRP0X2UWgORso08uI5MEeAo+eEHpKrGc
 dlf/bIAkk2+VV+9t1I/9fZH9n4YXh6OLkUWsS4c52sLAm992bUDUG4zyiAywOtxuj5
 ZfspYHi4bM9sw==
Date: Fri, 21 Feb 2025 16:58:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <174017868413.223507.11279781037859848554.robh@kernel.org>
References: <20250220090155.2937620-1-o.rempel@pengutronix.de>
 <20250220090155.2937620-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220090155.2937620-3-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, kernel@pengutronix.de,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: Add
	Plymovent AQM board
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


On Thu, 20 Feb 2025 10:01:54 +0100, Oleksij Rempel wrote:
> Add support for the Plymovent AQM board based on the ST STM32MP151 SoC
> to the STM32 devicetree bindings.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v3:
> - fix alphabetical order
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
