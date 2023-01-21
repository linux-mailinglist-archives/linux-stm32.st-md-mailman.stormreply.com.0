Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C0B67678B
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Jan 2023 18:03:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF34C65043;
	Sat, 21 Jan 2023 17:03:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7FCEC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 17:03:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAB15B80886;
 Sat, 21 Jan 2023 17:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6A7C433D2;
 Sat, 21 Jan 2023 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674320612;
 bh=KDw/+vNJAi/mknOa0WX6Ng3Q/0RA2pHOSwGQq7+EYNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HuAvhLjB/S0zc04GEtF9VGWcCB7qG5XdOX/vEN1tGnJurqUyU5Va8pjleX2BpqDMx
 1DBYEjVEnjBFx5TMJxCJXI7zrpQMWIMOexR1+df1B4bLny8/4vt2pzpJZmJyEfGgpQ
 VaalUoUBfg8Dg4BGmjUOzfEOW1RNNXiRf2hG+bdlbc+nqCoVFoQYaZC7SIcN3wQKYS
 vl/n8mO8rxnNzKFz6fOMO41bk802GYjzq+d/1MlwM8VFj0YnJsDTSbb/R2tuxHnaxy
 qtLkTzSJsB5UF4h5o5eq5Uixb94jhF7dkj3tZNB291jWt2N+6/jKr2Cl253RK7dQIq
 Y9ouSKjMPjr8g==
Date: Sat, 21 Jan 2023 17:17:09 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230121171709.5eb75e94@jic23-huawei>
In-Reply-To: <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
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

On Wed, 18 Jan 2023 19:44:11 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Do not use underscores and unneeded suffixes (e.g. i2c0) in node name in
> examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

> diff --git a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> index 6c5ad426a016..12f75ddc4a70 100644
> --- a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> +++ b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> @@ -42,7 +42,7 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        heart_mon@0 {
> +        heart-rate@0 {

These are both heart-rate and pulse oximeters so measure more than just
the rate (oxygen saturation in the blood). Reality is they actually
measure light absorption over time, but you can calculate an estimate
of both rate and oxygen saturation from that.

I don't really mind simplifying that to heart-rate, but wanted to
call this out for possible discussion.


>              compatible = "ti,afe4403";
>              reg = <0>;
>              spi-max-frequency = <10000000>;
> diff --git a/Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml b/Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml
> index c0e815d9999e..b334f3e356ad 100644
> --- a/Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml
> +++ b/Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml
> @@ -39,7 +39,7 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        heart_mon@58 {
> +        heart-rate@58 {
>              compatible = "ti,afe4404";
>              reg = <0x58>;
>              tx-supply = <&vbat>;

The rest are all fine.  If no one comments I'll pick this up as it is in a few
days.

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
