Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B08A4641
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 02:09:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAF7C6B444;
	Mon, 15 Apr 2024 00:09:35 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80422C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 00:09:32 +0000 (UTC)
Received: from [192.168.68.112]
 (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0901020178;
 Mon, 15 Apr 2024 08:09:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1713139768;
 bh=fn0cP6jHQy9x0E71RjlI6piVigamd0rjnbvWW/k3m8c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=giUT0sXrneLxTzQYgCq5jqn57d27IX2/GFoKfYX+JCY8+ofHGvxXcFgdIfpxcmJTn
 jUmOlCOv3LHdaojgs/5Mzh0YddGrpC/RI8UKg9WasG4onjtXOCgZeJ0JmvkuX7kyBT
 qz8a8dKkJZTsgtx0O8IXrmztq4QkGmza6igXPyoAJXvC2xE+8+q0QINGwDdgm7rHbw
 7PxzbgURR818zIPA/v+KFKWEdMy5Lf2/1JBBHWdmvgiAszW21rCh/k5WAW0DihhNrC
 po1vlz/3HZjNlDp4ySUp8tF886a4EpMd+c9olDGwtPDCt3+Zehl2h+zvYTqRJR6pt7
 maoIywYca5U8A==
Message-ID: <82fcd7a4532df119f82ea55208f592460ba5358e.camel@codeconstruct.com.au>
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 15 Apr 2024 09:39:22 +0930
In-Reply-To: <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
 <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: rtc: convert trivial
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

On Sat, 2024-04-13 at 22:22 +0200, Javier Carrasco wrote:
> These RTCs meet the requirements for a direct conversion into
> trivial-rtc:
> 
> - google,goldfish-rtc
> - maxim,ds1742
> - lpc32xx-rtc
> - orion-rtc
> - rtc-aspeed
> - spear-rtc
> - via,vt8500-rtc
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

We have trailers above but then there's more commit message content
below. Looks like what's below should be trimmed out (bad squash)?
Maybe the trimming could be done as its applied?

> 
> dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
> 
> Convert existing binding to dtschema to support validation.
> 
> Add the undocumented 'clocks' property.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
