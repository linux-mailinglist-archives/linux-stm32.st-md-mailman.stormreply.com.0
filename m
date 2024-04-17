Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328A8A8C2F
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 21:36:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA8C3C6C859;
	Wed, 17 Apr 2024 19:36:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BF6FC6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 19:36:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 897C81C0004;
 Wed, 17 Apr 2024 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713382596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7evEF4M6GPcsPmLEVtaklRbN3oddZv23iJJ5uZYo1w=;
 b=ghgGf2f45IeZTXjBpsGdPMuWd1ncRBP1tqlf2U9a+XPR5jSAhD4+4upvFNHMlyVPsCQSXS
 ZPMUAxlsZe3Poc2g1mfKVxsHZjKyzZcY/CSKtT+wx13A8fDkhPEb5OBekyEVmGq2Vi3IxQ
 HkCZ1eX5JNxCCh2Bx2gfvDdeI4XIxZrWbMKh9s1R/eoKAqhaZteRCf7jhRvpDk00wfo9fL
 ukWFfn4bFOfXq8NxS4XWkIaJFfj9dArEtefST2GeJiGv6jbjmWvlpWehVC+fM9nTM62le2
 vhXQnW/jGpc9fBEz0qUqKZHeEmP0LtHv/0qxVErouShhNPVwHO3jsflfEiWGeQ==
Date: Wed, 17 Apr 2024 21:36:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Message-ID: <171338250318.37347.8193747079895691565.b4-ty@bootlin.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/4] rtc: convert multiple
 bindings into dtschema
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

On Sat, 13 Apr 2024 22:22:15 +0200, Javier Carrasco wrote:
> This series converts the following bindings into dtschema, moving them
> to trivial-rtc whenever possible:
> 
> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
> - lpc32xx-rtc: trivial-rtc, referenced in arm arch.
> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
> - orion-rtc: trival-rtc, referenced in arm arch.
> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
> - stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: rtc: pxa-rtc: convert to dtschema
      https://git.kernel.org/abelloni/c/bbd3e43662d7
[4/4] dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
      https://git.kernel.org/abelloni/c/c3a0ee85f6e3
[2/4] dt-bindings: rtc: convert trivial devices into dtschema
      https://git.kernel.org/abelloni/c/1c431b92e21b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
