Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B826267922B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 08:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FCB7C65E72;
	Tue, 24 Jan 2023 07:40:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9E49C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 07:40:18 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so10239465wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mqgrYYoh+EWOFvzfNiDUZjtAea3Dxak9qwqCg1uYmZs=;
 b=Iw6RmCnB7UYWK7kSGR74JYXm36gVuMD2oo69ktEWRjIlPFJ3uJKXdHINKBsnvNa20K
 a6s62IgiALmtBdqhwlm38anPhhtKphIymExmhaarIuTy5WOIM18iqW5M2vQxqHzOL0Ob
 VAB6f44+e/uitx/Jz2LE91zlKQvD1trBEC6H52BTjjkr5zt9DXFqLogf95s7DRDamiLv
 gqhITmZDiJjRp2ecP1LeQh4bcxQTtGI8kgAgNoKpRi6J+fZglBjyXPY071TJYlGDxZ1S
 RZt2VXIe0bs3W7Tit02TVq/emcJZk9j7wxUZP38Q6Kord2ejBzNtOJgfb7krcUMQvKSX
 XXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqgrYYoh+EWOFvzfNiDUZjtAea3Dxak9qwqCg1uYmZs=;
 b=Y+13rbzP/oeQbOVo5NQrnF/tbJRXfYh0ksKKJl8eR1lqf2qEYDg37UkE3LHV6oDSpd
 ViPA49NHv1B2J0xREDNIKtqf/zpZBm6qTAL+0lFhXA4rHqTL1hBSoqKRuI3dzSYeins0
 sGsFtb8qbVMx/0gUB/GG3KhS5K+I2zCgRIMSzJTiYdocNKO6P+tfILrhz3zQsnUFZASY
 fc67Dp/hY1wCeY3y80FRypVmmP7m6ZBALoG0YmzUxjS6Uj/ZQkfLEMioHvudDUp4Ips5
 BEaQbCn/J7Xl/QAuvUm9CIVFAcZ46cc4q8+M/WVrHAU81xLyF0g4lV8QADqlQRrNT3cT
 YYMQ==
X-Gm-Message-State: AFqh2kprsxyWWp/I4Fg2v/IY2CZt+LOkvm/Ey+xpjRMDuDUcjMLKz5xV
 +9Y3Fc83aKLdOe2J3KY8pmVzCg==
X-Google-Smtp-Source: AMrXdXvjUqFczdJEB1osktna21bsflhjC5XBWkXYjahNjJYeA03Is1n5wsbfsMieycER48v2a2JOKg==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id
 y9-20020a1c4b09000000b003db0f0a8726mr23769294wma.28.1674546018235; 
 Mon, 23 Jan 2023 23:40:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a1c3b0a000000b003dc0c5e257esm1480972wma.39.2023.01.23.23.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:40:17 -0800 (PST)
Message-ID: <d6be59b8-b0e1-172d-0d04-f18dca1e1342@linaro.org>
Date: Tue, 24 Jan 2023 08:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
 <20230121171709.5eb75e94@jic23-huawei>
 <45b9b378-6619-c47a-b5ea-6b6b7edca785@linaro.org>
 <20230122170105.6a1a9766@jic23-huawei>
 <20230123203341.GA2459877-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123203341.GA2459877-robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Sankar Velliangiri <navin@linumiz.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Artur Rojek <contact@artur-rojek.eu>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>, linux-samsung-soc@vger.kernel.org,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Andreas Klinger <ak@it-klinger.de>, linux-fbdev@vger.kernel.org,
 Renato Lui Geh <renatogeh@gmail.com>, Phil Reid <preid@electromag.com.au>,
 Benson Leung <bleung@chromium.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Puranjay Mohan <puranjay12@gmail.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Stefan Agner <stefan@agner.ch>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: iio: correct node names
	in examples
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

On 23/01/2023 21:33, Rob Herring wrote:
until we've documented something. Otherwise,
> we may be just changing things twice. We have the list in the spec, but 
> really I'd like that in schema form. We'd also need to figure out how to 
> use that. There's always going to be odd things which we don't have any 
> defined name.
> 
> For now, I'd just do 's/_/-/'.

I'll send a v2 with fixes.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
