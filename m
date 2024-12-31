Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8729FEE0A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 09:43:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BAEAC7802C;
	Tue, 31 Dec 2024 08:43:06 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89F97C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 08:42:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15158A40117;
 Tue, 31 Dec 2024 08:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C0BC4CED6;
 Tue, 31 Dec 2024 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735634578;
 bh=sEVwsEUE+NBGeWQW5kfxfUmeuQ0OvQKO90sgRc/dEtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OfDVkJpomnmEJ8oDf9sOP5VICaSs2vALcrI6QlE9SEAEPvdMkgIgY+6PnOmzjxmO6
 G8VAZtJwMihHusD37VZfN/J5UbVfTJHgI7YxdGr9ctQT5jcO9ASjgC12ILNjmvjn6c
 XpcMIavXHuGTZdhllDPRSv0vke5hOnSzZX5HiZ/U2JJVHbuEEKaxXlkdZYlVtposNJ
 fLlBWH/0xkAeoc6PdQ1KHnwNIcDQlB+fCXrSZvHV7SbaKkFV/adjRwTqbObYBCNm5Z
 BrvG0SAYr65cRz0g/e5AMvGZ6uHwDqv0zcnDY6HAw5Odkew+Uubi0LesI3mPF6yRtR
 brPb4wksCLDVA==
Date: Tue, 31 Dec 2024 09:42:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <mqkkf4vgd25mq3xvial2unlyumtsbrei7ajkouvrsvkn7pc66y@j5do2qzlgysc>
References: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-can@vger.kernel.org,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: can: st, stm32-bxcan: fix st,
 gcan property type
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

On Sat, Dec 28, 2024 at 04:00:30PM +0100, Dario Binacchi wrote:
> The SRAM memory shared pointed to by the st,gcan property is unique, so
> we don't need an array of phandles.
> 

You should mention also that Linux implementation does not expect any
argument.

> Fixes: e43250c0ac81 ("dt-bindings: net: can: add STM32 bxcan DT bindings")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
