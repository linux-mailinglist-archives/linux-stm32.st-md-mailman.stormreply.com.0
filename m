Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ECA8A0443
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 01:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A898C6C820;
	Wed, 10 Apr 2024 23:56:10 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C46D5C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 23:56:08 +0000 (UTC)
Received: from [192.168.68.112]
 (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A6E062013B;
 Thu, 11 Apr 2024 07:56:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1712793365;
 bh=YdxX0RS+h6nnSZiOcpAQraGy37X8lj1yr1mlmdxdFNo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=eNNBNOCVIBdeD6MA602CoeG+fv9TZcwoHIND3RU9f2n7kGCuger+yYTZok3wq2C36
 liHerJ2SOwUnHsI6TRvmCea/DyDOba2R/+WURTKua5t7Q0zg0FJ3iWaY4xkJAVHnRg
 /QTFDkuarqYPx3oSFOV5HGr4ITEqSwxj+P5mh5YaFZsjNrlVvuIVUAYSRlA0H8r0Cs
 zCNMclRDoOd1PCOA3eqbLvX17FoqRPc2S73GGtB6nLuyQ9zSWiVHv32Xk70EujLQJI
 409aUYNElt5WrWmrT1UwNrKA3vJYnYMGeDHhgfHeFGlx5jA2FdO48pSxfcL30OA/3s
 DSmyNjBO/vJBQ==
Message-ID: <6de98551118955bf68f4835b888730222a9ae015.camel@codeconstruct.com.au>
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 11 Apr 2024 09:25:54 +0930
In-Reply-To: <20240410-rtc_dtschema-v2-1-d32a11ab0745@gmail.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-1-d32a11ab0745@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: rtc: convert trivial
 devices into dtschema
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

On Wed, 2024-04-10 at 17:55 +0200, Javier Carrasco wrote:
> These RTCs meet the requirements for a direct conversion into
> trivial-rtc:
> 
> - orion-rtc
> - google,goldfish-rtc
> - maxim,ds1742
> - rtc-aspped

Nit: s/aspped/aspeed/, but otherwise it still looks fine for the Aspeed
bits and you can keep my R-b tag.

Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
