Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A81679DD6
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 16:47:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96F15C69056;
	Tue, 24 Jan 2023 15:47:23 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3BEFC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 22:05:21 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id bn6so6912150ljb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=47bQYYvwoc4QnN6fF+m3+7Uy31DycYW7WL3pijAuHrc=;
 b=KvPPeMjcYz60GhdROsv9YwE8uv6xdcPv1k4AoX89i567SWpqXcTQSLDK/flblBKQaK
 cfAwGOzXB55ObBgNsuBR/aS/ZWS73BbHA/j30YrvThOJ8sklQ4vSCuYCTT8/aQzKd7x0
 ED9B0EpAuuFXHRhyTAE2rYJAIefWE3cRMQT+JXdOSX+nqVPxt1tECmSugDkFBGKmqaIe
 6MDATr+REE+laIkFeEGl7Baxej1BF+lzV1ySkQv7XTAq7tOHtm6EgBpTeWGjnRwbXi4k
 o/CUW40k/L54EJCQepVRJ5CWNNQh0cJ5hbe2XRT19mSa+4VgezmJ8OO8kHFU25o+EiBV
 +VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47bQYYvwoc4QnN6fF+m3+7Uy31DycYW7WL3pijAuHrc=;
 b=p+vFen3fAILOMmD+2x+4hodJicfpiDs9T+CmcyceHgeQRwo604Qua0eaNc8BMUeKIG
 h7Fo1PadxCHJosoKN7XwXCu3zE5jMrzRWnvsf23sI6ZILJZaoQyDfYG2ubpCJrtYX/3g
 ZZ5Q9EbHAsMs2II3PdpXq+yZy63S6WZCH/4Yjz1Yh7zpYB7xhRKjoKOLePBjkQcb3Di9
 O6MDZJqB9yC+ModUkzAwgpYiQzsbNCzKAklT9neTWBZ8Jqajl0L2DAjl7xVun9zLwNKn
 Q5R13e/8yyCppK9qQACvL13NiL+j1b8yqOVDPr3at0qMRsgruWFjW2kBRhxkNp+BKe+v
 cr6g==
X-Gm-Message-State: AFqh2kofwB7cLRzBU6chUMaRd7Bc/sqpkULU8o12kqPXcL/Wny+aIldj
 g6SXLBh8xqVvjrcsHGfCbYJIpDQOR+5qlw2Vu4Q=
X-Google-Smtp-Source: AMrXdXsEvy2zUx8pBtqvlaMNQXcMQiU5wj9qFfZWFmAJ8mJ3iDwd2PNDfGEnDLQioMNqbk8VGMyCnxB99EQkJx6YjZ8=
X-Received: by 2002:a2e:b752:0:b0:28b:77fd:d92b with SMTP id
 k18-20020a2eb752000000b0028b77fdd92bmr1424117ljo.86.1674252320747; Fri, 20
 Jan 2023 14:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 20 Jan 2023 23:05:09 +0100
Message-ID: <CANk7y0jpC4Hz5cEzdO2WQkRbqNfBKKgKXTrL142D5Ldr_dhBjA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Tue, 24 Jan 2023 15:47:20 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
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
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 linux-fbdev@vger.kernel.org, Renato Lui Geh <renatogeh@gmail.com>,
 Phil Reid <preid@electromag.com.au>, Benson Leung <bleung@chromium.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>, Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Stefan Agner <stefan@agner.ch>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
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

On Wed, Jan 18, 2023 at 7:44 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/memsensing,msa311.yaml  | 5 ++---
>  Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml | 2 +-
>  .../devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++--
>  .../devicetree/bindings/iio/adc/ingenic,adc.yaml          | 4 ++--
>  .../devicetree/bindings/iio/adc/microchip,mcp3911.yaml    | 4 ++--
>  .../devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml    | 2 +-
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++----
>  .../devicetree/bindings/iio/adc/ti,ads131e08.yaml         | 2 +-
>  Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml | 2 +-
>  .../devicetree/bindings/iio/dac/lltc,ltc1660.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/lltc,ltc2632.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml | 2 +-
>  .../devicetree/bindings/iio/temperature/ti,tmp117.yaml    | 6 +++---

For ti,tmp117.yaml
Reviewed-by: Puranjay Mohan <puranjay12@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
