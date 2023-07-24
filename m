Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9975ECF1
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 09:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0B44C6B459;
	Mon, 24 Jul 2023 07:58:54 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E262C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1690185533; x=1721721533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ltxnX2YkLxc1mlUpJTfiZUtpEKMS1HNVGtECbRDSkgE=;
 b=FFNr5MR0S4MaR5S974mxq2WYR5HCpt0TKK+0dzZC/S7+NZZ7g5Z0P0lS
 obsHcqa+FrIuIDl1OhrZ6XOSfr50Ov5KX0GJc3HttX6HAHa/KCRpboIp6
 NW/daCb8PRb0VxPGed5cTAvYLgk8Iw7yk3YeCYITRtnKBNlHVJXqdlG/r
 Hn4ZLgX741Hno306R93v9O4ey9C05j9DrwhBvr9Xz0X3VTPC0+VMNG11a
 9L8S/gSSpDk347iS18hkb/e11Vzw0zWBgUSJ7QCB/O4ERrHSwwO2fhJmF
 /6xgXdtlxiWc1pRcTeNf5IJq02JeBH195JWousoad0wvERXtDkKDRQUF+ w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; d="scan'208";a="32073505"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jul 2023 09:58:52 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B418A280078;
 Mon, 24 Jul 2023 09:58:52 +0200 (CEST)
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
Date: Mon, 24 Jul 2023 09:58:52 +0200
Message-ID: <21957396.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
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

Hi,

Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
> On 24/07/2023 08:35, Alexander Stein wrote:
> > This is a gpio-controller, so gpio-line-names should be allowed as well.
> > stmpe2403 supports up to 24 GPIOs.
> > =

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Add min/maxItems
> > =

> >  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> > b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
> > 22c0cae73425..4555f1644a4d 100644
> > --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> > =

> > @@ -28,6 +28,10 @@ properties:
> >    gpio-controller: true
> > =

> > +  gpio-line-names:
> > +    minItems: 1
> > +    maxItems: 24
> > +
> =

> I am sure there is no variant with one GPIO.

That's true. But if only one GPIO is actually connected there is no use =

enforcing to add empty entries.
AFAIK it is also allowed to provide an incomplete array.

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
