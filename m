Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B94ED9517D5
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 11:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69A31C6DD9A;
	Wed, 14 Aug 2024 09:39:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D349C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 09:39:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69F1B60006;
 Wed, 14 Aug 2024 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723628374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7PpVU2JAYLxKsnkxtdTr7GFE8pxjv8qTyuS3hDNH+Q=;
 b=QyWuE/h8cmYYLNBdFzDeXZuImHX6/0ZCaGkoN2n9uZIojGLqzZ28P8Lkj4qqSVh6jZyXyJ
 iEAFvNjeQ9THhunepKlqhY/tvLoEQ5ZdrcV6X1Akgs/8Yftgdz+v98VWYiizXhPkVdAlWr
 jo9Ugb9Fl96+8jV6sqnD4Ua/cXXC02+DQTOy/jyyS6Aljfmp8eYrQ6YFry0DdOFdSuv4+z
 At5DFincINzpg9GEPgiWuGEIsE/4mZ/FEdGwDyE8+tKpIQUPzzj6MvfR0255bPTdsEX41t
 /GwIN+VMs2mFzkAyz72hRO6JpKZ1xMHKuB1Cw+iyCzbC9QwrQFwboEiJ3qumTA==
Date: Wed, 14 Aug 2024 11:39:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <172362832901.24631.16096665387858981074.b4-ty@bootlin.com>
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722160022.454226-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] rtc: stm32: add pinctrl interface
 to handle RTC outs
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

On Mon, 22 Jul 2024 18:00:18 +0200, Valentin Caron wrote:
> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
> 
> Theses two signals output are possible:
>  - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>    On STM32MPU Discovery boards, this feature is used to generate a clock
>    to Wifi/Bluetooth module.
>  - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>    expires.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: stm32: describe pinmux nodes
      https://git.kernel.org/abelloni/c/5b19519d4e6f
[2/4] rtc: stm32: add pinctrl and pinmux interfaces
      https://git.kernel.org/abelloni/c/16ad2bc09efb
[3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
      https://git.kernel.org/abelloni/c/bb7b0df2be5c
[4/4] rtc: stm32: add alarm A out feature
      https://git.kernel.org/abelloni/c/04dcadb87da6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
