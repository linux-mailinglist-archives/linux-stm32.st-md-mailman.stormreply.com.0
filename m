Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C7AD9E6A
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 19:16:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7376FC36B3D;
	Sat, 14 Jun 2025 17:16:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BF24C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 17:16:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1CCCDA4F308;
 Sat, 14 Jun 2025 17:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA60C4CEEB;
 Sat, 14 Jun 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749921410;
 bh=SyhuSHTiP7kYh6dQdHpRWX3b0foHA/A5vUWOW9/wys4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ju9KVuUtGxQXCAjdaMZnZyfnQ7oL9HN0ghc7Crpm6kBXNpPwCv6vUHTg81o8eQtHn
 7N/vjHsfsXTGqG5TEg+tfGzsKAMV2QMQ5SOmAfhVkKxN2/xjOOQj3g5YCBIw3EDqp/
 /0ObAIAI2A2ImOL6KOHef1moBxj1Z28yzGSVTPURTkbHslRidL0NBQOsky9Pj2v0iX
 j45c5+u3wZCb9dgin1Ll+yTXMkq7gdr2ySd6x+V5gHLalOb65MnULoXDA3aCpMB+C1
 cNOkCekXOmUPb8vJ6ttwcI2vcj75E5ECH3sAUH3UHaTCiScHKRWN6OHUeZktGsaue2
 bC0pOIKwGCPog==
Date: Sat, 14 Jun 2025 18:16:42 +0100
From: Simon Horman <horms@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <20250614171642.GU414686@horms.kernel.org>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-2-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613100255.2131800-2-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 peng.fan@nxp.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, will@kernel.org, xiaoning.wang@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ye.li@nxp.com, mcoquelin.stm32@gmail.com,
 linux-pm@vger.kernel.org, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91
	11x11 evk board
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

On Fri, Jun 13, 2025 at 06:02:47PM +0800, Joy Zou wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Add the board imx91-11x11-evk in the binding docuemnt.

nit: document

> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
