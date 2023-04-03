Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9076D50C2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 20:37:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35731C6A610;
	Mon,  3 Apr 2023 18:37:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4CE5C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 18:37:44 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i5so121298465eda.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 11:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680547064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
 b=bFvBbagm8aL0eG1WpkUMpZ7aBLUx6PKp4lseK3TKYNSJLKFTvbdAL/UOpVLQNG7W80
 6+T9nAIO+CFbrpm+FWmXGLv3iRlsx77POHfwFU7a9hg24cauINgniJsEiBKhlm45+9Zt
 jdiSe4FQmK1ZDt9moJ7wCgte6na7VoYwXmxWvsdvyoUvAbqvjIPbDOZoIrfa+thb2oen
 pJKuwQuT1MPNg+BYN/L+ZUa0yIcZL3V7ad9X2JSCYn+GbtBET4ExYrhzv/dGLWNKMrX0
 aY8Wq8zP6tmnwHk2JvG3m5+v2BlZ5wTQPHX9GIHg7/lCDDWcpU5ePfRmEIyP882gWeQr
 nULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680547064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
 b=y6Tpfm8xFBC2irhK3a0erq+VliQhWoEwrV+CdoHwzDkRrb/mlwImitJjGItKhR0B2c
 FiBO5lPAeQoNeYwQTvXFHVwVqbu3g20MU+a95BXO2rwE/JNjGYRlfIL5z/Ce3yo96s0T
 FU7tks9zdBmJy3n/pH06nxbMLZ98FqnMB3YmFseYIX0F3JDyQZjaCPk8zwO5sMYdv4Q3
 0cN/N0Kzx0+DsQn7/hV5KikSDWMSinb0A2e9qaxiSNiYE7hgnMdQPQSUnKasKTOQRXMW
 WgVrrTmRdEgbTzkiFy2nVi0H6Wn0GlzQ/cmCP6k3XACsGeyiKeWeM7nZoR0o2DNp4rsG
 NaQQ==
X-Gm-Message-State: AAQBX9d1ck0un85HoTQfRnToVD6VugQVy4HZ/UHxBsyzihKP9kYl93z3
 XVYoBQuZF3h/w3jXpy1qhx1TiA==
X-Google-Smtp-Source: AKy350aGwqQCodZpb/gzcGe1S8OGxNbhVHt1iC2+Dk0P5OGvd+2PK7IQlx/UQ3iZewsFT9iUWIorCA==
X-Received: by 2002:a17:906:1c19:b0:92b:f118:ef32 with SMTP id
 k25-20020a1709061c1900b0092bf118ef32mr36754487ejg.48.1680547064210; 
 Mon, 03 Apr 2023 11:37:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170906491100b008e57b5e0ce9sm4826642ejq.108.2023.04.03.11.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:37:43 -0700 (PDT)
Message-ID: <ba5cf9c5-50b2-b31b-eba4-d22eda2de0f3@linaro.org>
Date: Mon, 3 Apr 2023 20:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 19/20] dt-bindings:
 interrupt-controller: arm,
 versatile-fpga-irq: mark oxnas compatible as deprecated
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, mark the
> OX810 and OX820 IRQ compatible as deprecated.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
