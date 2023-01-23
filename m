Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA228678799
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:21:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C5A0C65E72;
	Mon, 23 Jan 2023 20:21:35 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B3B8C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:21:34 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-12c8312131fso15350827fac.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIXb14l8qXPqTW/PtL9Jyd2nlt/GYyXK1O+1ZgxBBnc=;
 b=SZr7xoRxV6d86EaVetfSr2lcgMo/z+3kbYXx0Awa8UXiou5FVL8yuS58ae/5ZlknL4
 O6PQkUHBzpBUXnTyppb5gPGt9uw+JiHugyf8cprXn7+iuuGpcosRi8mhvwQzur2BGF77
 8SYLBYfsZGuDL6/XrETSmmY9bJ4s/oOz18qcdCKOIJh3cJQc58U76gG9NsNlVL4+zLqj
 1OHBMoeGYy4inTNtg4Zf/FViwRDvOeQE8VEl5/ARMSb8HfrIiz3L8X2YGVch4sxELsXV
 +jQA3b/HwVie3+eon5maZUve9k0derIe3CpP+ZL2PUm4fRDwcDSnplgtROTTxkEA6lfL
 dkKQ==
X-Gm-Message-State: AFqh2kplyfTInpxbJsIUg2XeJChhbuAoXpYISb+QYGd2AxDofppiQoBv
 qUUGsddda2cYZXl3Fd7aaw==
X-Google-Smtp-Source: AMrXdXuK8kDdEc2x7uYT25rzCUabXOb/nurq2zZCYeuPju4G3OhwCu+TOZB5uMPQMcHtcgqdDT83XQ==
X-Received: by 2002:a05:6870:3d96:b0:14f:eb44:afde with SMTP id
 lm22-20020a0568703d9600b0014feb44afdemr13270485oab.26.1674505292384; 
 Mon, 23 Jan 2023 12:21:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o41-20020a056870912900b0015f9cc16ef7sm7295004oae.46.2023.01.23.12.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:21:31 -0800 (PST)
Received: (nullmailer pid 2459648 invoked by uid 1000);
 Mon, 23 Jan 2023 20:21:30 -0000
Date: Mon, 23 Jan 2023 14:21:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167450528964.2459590.15791649664134666125.robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118184413.395820-2-krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org, ",
 Jean-Baptiste Maneyrol" <jmaneyrol@invensense.com>,
 linux-kernel@vger.kernel.org, Sankar Velliangiri <navin@linumiz.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Artur Rojek <contact@artur-rojek.eu>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, ", Michael Hennerich" <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-samsung-soc@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>,
 Renato Lui Geh <renatogeh@gmail.com>, Phil Reid <preid@electromag.com.au>,
 Benson Leung <bleung@chromium.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Puranjay Mohan <puranjay12@gmail.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, "linux-renesas-soc@vger.kernel.org ,
 Stefan Agner" <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/5] dt-bindings: iio: minor whitespace
	cleanups
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


On Wed, 18 Jan 2023 19:44:10 +0100, Krzysztof Kozlowski wrote:
> Drop redundant blank lines and add such when needed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml        | 1 +
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
