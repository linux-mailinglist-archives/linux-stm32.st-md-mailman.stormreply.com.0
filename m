Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D197D75F559
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 13:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81F58C6B459;
	Mon, 24 Jul 2023 11:44:13 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 813ABC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1690199052; x=1721735052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AhAV6EXXTRBcrPub9eD6b5LPrOcw+eceIVL16f8Xp7s=;
 b=kvIn8ScRcjo44hUWFH3GDuVxyAVxGM7gz4zQkelsJ6vhe6OWXWDzIYU4
 tnByKDzlpgla/LgoksqGbfqbEmh2Ha1eAo21IoSt2dbx9kup7qksU8NzE
 GAia6lLva6icZEGmZTk9hNNoKBaAOhVUIofgESMB4/Vh8IrsAxatm43oF
 AzAUB1HnlGQkOIZZhJ0hSRAE3jYqOJZMc1KTIzSLfHNkGfweHwm440F/s
 z8UKqD8OYxZMnu2igQ5h6HlxPWp0L6h2Mp1wEMNjk85BBZgV72n2tBwLi
 i48Jwg/h82ahHPyQAVByCp1w1ahE72wTwGjFnrPwNrzvFXg5/6/CLZM9B Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; d="scan'208";a="32080086"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jul 2023 13:44:11 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6F9B2280078;
 Mon, 24 Jul 2023 13:44:11 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 24 Jul 2023 13:44:11 +0200
Message-ID: <4285919.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <21957396.EfDdHjke4D@steina-w>
 <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: gpio: Add
	gpio-line-names to STMPE GPIO
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am Montag, 24. Juli 2023, 11:54:12 CEST schrieb Krzysztof Kozlowski:
> On 24/07/2023 09:58, Alexander Stein wrote:
> > Hi,
> > =

> > Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
> >> On 24/07/2023 08:35, Alexander Stein wrote:
> >>> This is a gpio-controller, so gpio-line-names should be allowed as we=
ll.
> >>> stmpe2403 supports up to 24 GPIOs.
> >>> =

> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>> Changes in v2:
> >>> * Add min/maxItems
> >>> =

> >>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>> =

> >>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
> >>> 22c0cae73425..4555f1644a4d 100644
> >>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>> =

> >>> @@ -28,6 +28,10 @@ properties:
> >>>    gpio-controller: true
> >>> =

> >>> +  gpio-line-names:
> >>> +    minItems: 1
> >>> +    maxItems: 24
> >>> +
> >> =

> >> I am sure there is no variant with one GPIO.
> > =

> > That's true. But if only one GPIO is actually connected there is no use
> > enforcing to add empty entries.
> > AFAIK it is also allowed to provide an incomplete array.
> =

> Did you test it? Linux prints warning. Warning means "not allowed".

I did and I don't see any warnings.
I using the following (modified) GPIO subnode on an stmpe811 chip:
gpio {
	compatible =3D "st,stmpe-gpio";
	gpio-controller;
	#gpio-cells =3D <2>;
	interrupt-controller;
	#interrupt-cells =3D <2>;
	/* GPIO 5-7 used for touch */
	st,norequest-mask =3D <0xf0>;
	gpio-line-names =3D "GPIO_ADC_I2C1_1";
};

I only see the warning "stmpe-gpio stmpe-gpio: DMA mask not set", but that'=
s a =

different matter.
Only GPIO 0-3 are connected. Original property is
gpio-line-names =3D "GPIO_ADC_I2C1_1",
	        "GPIO_ADC_I2C1_2",
	        "GPIO_ADC_I2C1_3",
	        "GPIO_ADC_I2C1_4";

Also gpioinfo shows that the gpiochip has 8 pins while only the first one i=
s =

named.

gpiochip7 - 8 lines:
        line   0: "GPIO_ADC_I2C1_1" unused input active-high =

        line   1:      unnamed       unused   input  active-high =

        line   2:      unnamed       unused   input  active-high =

        line   3:      unnamed       unused   input  active-high =

        line   4:      unnamed       unused   input  active-high =

        line   5:      unnamed       unused   input  active-high =

        line   6:      unnamed       unused   input  active-high =

        line   7:      unnamed       unused   input  active-high


If 4 GPIOs are named the output shows names for lines 1-3 accordingly, but =
no =

errors/warnings as well.

> The expectation is that the rest are named "NC".

Where does this expectation come from? Is there any pending change I am not =

aware of?

Best regards,
Alexander

-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
