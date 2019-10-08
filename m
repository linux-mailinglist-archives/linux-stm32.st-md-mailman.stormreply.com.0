Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBDBD086C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 09:37:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3C5EC36B0C;
	Wed,  9 Oct 2019 07:37:38 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC73EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 23:46:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z19so965943ior.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2019 16:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
 b=I+N5hkvPCF8K1LY460NnH3Bs+ppv36e7pHAAko5cPGtVK7Q1xpMFtMk1sbwX3EL9Ae
 UX5ufwjfjE2WsQxxVvaJrkkGtrrD1A1swJroeZ6oWYFiFUD/gbGKkY6710T0F0X5S5Xo
 BF95rAFQKdDZy+9dBrgr05QKn2VguSytZtPaHPhpxauj1vAvK0o8UX1wBJzBZa1yl7EV
 jLHoqHF7Hse1l/Ohr1dGC6ATYWRzE6EftbRk42hoGB79bBRXmsmPeyS2gmRpO97jk05b
 X+CS58w6j5DGF3spjHV4AncNibrgaK8A9wTUdRqszmiSN3PwPwqQA/IsTfJ60gtOiuUB
 4Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
 b=HSBWMGg10XtCXtH2S62lnp09lG0aFj0J5w+hz0hUHBbylQuieMbmRkx7mHOWLY1FmC
 rAR2SsEPSBkE38nAA5W6DXdOZgQRjh/mpanl2Qk9I8nQwZimsnBzH/jV4M3UevvorG5C
 XO6JW7fokLW14pzgu+ctZiIU6DFZZ9QUCbtQ7oomchfgdEB2u0bmm22L5hD7So5w27a1
 0cViO9oAC12iTMaa7qWjD1nNOgWpCrsfXetsKEPzzUSVvrUvm0RpZyyudJ0yr+dwLjrA
 Jml+MkhswmvE6Qk/SLAuTEq5a8NhiEOqxXRBMFqalyqJfKYIwT8R9FIJzhh+C1juI0CN
 wNMw==
X-Gm-Message-State: APjAAAWiIBtZ8YJ9R59OJ6XFK+hqbZA1H/WLhnM824e+ttXK+23JH3Ng
 wgZjYJKknk8gxsPN03qORhpOBA==
X-Google-Smtp-Source: APXvYqz97nlCIt/+/P4PPfxa3nO+CVIeqE66+NVgtpZhnKj/IpAG2fhUxvCWOIqX/CoRt6DSjpBBFw==
X-Received: by 2002:a92:d084:: with SMTP id h4mr287013ilh.223.1570578372595;
 Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id m11sm250603ioq.5.2019.10.08.16.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Date: Tue, 8 Oct 2019 16:46:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1910081643220.11044@viisi.sifive.com>
References: <20191002164047.14499-1-krzk@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:37:37 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: pwm: Convert PWM
 bindings to json-schema
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

On Wed, 2 Oct 2019, Krzysztof Kozlowski wrote:

> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 

[ ... ]

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> index 36447e3c9378..3d1dd7b06efc 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -17,7 +17,7 @@ Required properties:
>    Please refer to sifive-blocks-ip-versioning.txt for details.
>  - reg: physical base address and length of the controller's registers
>  - clocks: Should contain a clock identifier for the PWM's parent clock.
> -- #pwm-cells: Should be 3. See pwm.txt in this directory
> +- #pwm-cells: Should be 3. See pwm.yaml in this directory
>    for a description of the cell format.
>  - interrupts: one interrupt per PWM channel

For the SiFive PWM driver documentation:

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
