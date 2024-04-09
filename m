Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325F89D8F3
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 14:12:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 259C4C7128A;
	Tue,  9 Apr 2024 12:12:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78251C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 12:11:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91EBBE0004;
 Tue,  9 Apr 2024 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712664719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZfWm8vYO3mDEuNQxKWMBm2paN+K8NdDcQizKVDcIoC4=;
 b=my38CGISljwiJ5IwyCJK8F66IO6v+ZQoKG8dNf48uMYkp6aWgPzFutmbt0GJP2xSYK/Rh3
 JoJ2t/QZruB2XuoNFZYqXUDc6qtPUp4rIvI1DzmCi2bZikWmYcXYKkgwd3f2UN3nO7xxIr
 Ma/RleoaEAPuSsj5A4rI8Y+gWy3Sns0quh7Ybo8dgjGo9Cxt9DRPHs7Exum5rnesjLwAYR
 kmnZD0ZMLoiE5GM95Atw5sZLGKYDX6xVVWai8iv/ggPqDuohI90RnD7DwDxJTJju27cmHm
 m88JatRVGUgGG27aqS4R/sNXVBrzXc6j2xkGm1yse3fhIeDkcR9RLbvy/TcF5Q==
Date: Tue, 9 Apr 2024 14:11:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Message-ID: <20240409121153e2941468@mail.local>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
 <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
 <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move
	to trivial-rtc
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

On 09/04/2024 10:52:54+0200, Javier Carrasco wrote:
> On 4/9/24 09:34, Krzysztof Kozlowski wrote:
> > On 08/04/2024 17:53, Javier Carrasco wrote:
> >> This RTC requires a compatible, a reg and a single interrupt,
> >> which makes it suitable for a direct conversion into trivial-rtc.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
> >>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
> >>  2 files changed, 2 insertions(+), 15 deletions(-)
> > 
> > This one no... and if you tested DTS you would see errors, although you
> > need to test specific lpc config, not multi_v7.
> > 
> > It does not look like you tested the DTS against bindings. Please run
> > `make dtbs_check W=1` (see
> > Documentation/devicetree/bindings/writing-schema.rst or
> > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> > for instructions).
> > 
> > Anyway, you *must* check all DTS before moving anything to trivial.
> > 
> > Does it mean all other bindings were not checked against DTS at all?
> > 
> > Best regards,
> > Krzysztof
> > 
> Hi,
> 
> I did check the conversion against nxp/lpc/lpc3250-phy3250.dts, which
> throws a message about the 'clocks' property.
> 
> That property is not documented in the original binding, and even though
> it could be missing, I could not find any function to get a clock (i.e.
> any form of clk_get()) in rtc-lpc32xx.c, which is the only file where
> the compatible can be found.
> 
> Is therefore the property not useless in the dts? My apologies if I am
> missing something here.

The bindings doesn't document the driver but the hardware. In this case,
the only input clock seems to be a 32kHz crystal.

> 
> Thanks and best regards,
> Javier Carrasco

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
