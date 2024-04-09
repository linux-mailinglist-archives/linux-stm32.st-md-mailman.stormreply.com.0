Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8D89D6EF
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 12:27:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B612CC7128A;
	Tue,  9 Apr 2024 10:27:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0181C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 10:27:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12DC6240008;
 Tue,  9 Apr 2024 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712658421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IgLT556EQ1sZdDx/D7AZFOXHnmen1aI83W1NiohbSlY=;
 b=B4iPBcOVkx3mfxd+rg95RkbF9UEK4k+DdgW7xqj7tT7F/2vpHwnjQmDQ01ZtZ2oPa6qb4o
 09hXRQXlI1bqDHQc7MN0KzWmcS8dC3mmiBR3PcE1J4p1rg96l1Z2iHM1zoIv581lXIUG8K
 NfCKCTjkTH2u2kWQgbzhk5E9pvoWfSAHVii0/ZMTyKKOcRkJR7qjWrv6ImsjDKaWJStKgs
 ZSueTSYdbsYsNielAvIp9rUoLonaww1JS5vne6O47pRkr+IIEkMbjlzieJrNosCxKvivb1
 YyKnTxhiVH2u+bOnBIuKc3KzzumhN9k6vojpT6uYw0Vz5TWnPch2JjL1wVrwzg==
Date: Tue, 9 Apr 2024 12:26:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Message-ID: <20240409102658d86fb2bd@mail.local>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] rtc: convert multiple bindings into
	dtschema
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

On 08/04/2024 17:53:00+0200, Javier Carrasco wrote:
> This series converts the following bindings into dtschema, moving them
> to trivial-rtc whenever possible:
> 
> - orion-rtc: trival-rtc, referenced in arm arch.
> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
> - lpc32xx-rtc: trival-rtc, referenced in arm arch.
> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
> - stmp3xxx-rtc: convert, referenced in arm arch.
> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Probably all the moves to trivial-rtc can be squashed.

> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (9):
>       dt-bindings: rtc: orion-rtc: move to trivial-rtc
>       dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
>       dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
>       dt-bindings: rtc: maxim,ds1742: move to trivial-rtc
>       dt-bindings: rtc: rtc-aspeed: move to trivial-rtc
>       dt-bindings: rtc: pxa-rtc: convert to dtschema
>       dt-bindings: rtc: spear-rtc: move to trivial-rtc
>       dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
>       dt-bindings: rtc: via,vt8500-rtc: move to trivial-rtc
> 
>  .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
>  .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>  .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++++
>  .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 ------
>  .../devicetree/bindings/rtc/orion-rtc.txt          | 18 ---------
>  Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 -------
>  .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 -----------
>  .../devicetree/bindings/rtc/spear-rtc.txt          | 15 --------
>  .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 +++++++++
>  .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 --------
>  12 files changed, 103 insertions(+), 149 deletions(-)
> ---
> base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
> change-id: 20240406-rtc_dtschema-302824d1ec20
> 
> Best regards,
> -- 
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
