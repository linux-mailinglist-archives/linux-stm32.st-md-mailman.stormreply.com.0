Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D66787D4
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 21:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BDEFC65E71;
	Mon, 23 Jan 2023 20:33:47 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67AE4C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 20:33:45 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v17so11450039oie.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 12:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrqI5Ij0O95gCzmKCmcYaV3PIFWC+QL1zw9c0VIbm+A=;
 b=3XPu7j23l2Rf2veUYFnPqThvMpubgGJFFQsNzVeP9ws7W3DCGpTUkcuA8zSz/Wm1qv
 qr0kHjxGdO42sqz6JChtQ0K0L1oDg8knGd62Y9szemAQhlF2C4o2G4AqkP3S5hkA6kDr
 8NCL16JvDA582GHDy2/Hp0O5iYPZbCBMg/pIzwiR3ZCCAKLLstJ6FbDSxCGHvpGmX8c8
 NTHJ6zEVX+43K/PPvVrO5Ws2L8/2pcD1G49a9hC1/Qc6U8EQfdN99aLyOqO0nKFCsJy0
 UBnxg4EX7zqM0Dy2xna5y3KDZDRtSXa1YPPy0g8bOCr0HOIDjnK9ki3+xhbQt2AV4Vtb
 86Qw==
X-Gm-Message-State: AFqh2krwyi0etRLmDBbvXxR4XM5yQijlTC5ekjvabHPxpCukwW4gXHmx
 pvDiOtfGKoQOI/KObZnHFg==
X-Google-Smtp-Source: AMrXdXsGKKWCKC87sdHRroBTg34rpaNG4pqP2GTedN+HwXhwJK32IDUo9Nlm9V/lhJeTRuJUTQ1oeQ==
X-Received: by 2002:a05:6808:2819:b0:360:cd17:6968 with SMTP id
 et25-20020a056808281900b00360cd176968mr18783885oib.15.1674506024074; 
 Mon, 23 Jan 2023 12:33:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bx35-20020a0568081b2300b0036701c185basm135326oib.55.2023.01.23.12.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 12:33:43 -0800 (PST)
Received: (nullmailer pid 2476342 invoked by uid 1000);
 Mon, 23 Jan 2023 20:33:41 -0000
Date: Mon, 23 Jan 2023 14:33:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20230123203341.GA2459877-robh@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
 <20230121171709.5eb75e94@jic23-huawei>
 <45b9b378-6619-c47a-b5ea-6b6b7edca785@linaro.org>
 <20230122170105.6a1a9766@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230122170105.6a1a9766@jic23-huawei>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On Sun, Jan 22, 2023 at 05:01:05PM +0000, Jonathan Cameron wrote:
> On Sat, 21 Jan 2023 19:31:23 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> > On 21/01/2023 18:17, Jonathan Cameron wrote:
> > > On Wed, 18 Jan 2023 19:44:11 +0100
> > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > >   
> > >> Do not use underscores and unneeded suffixes (e.g. i2c0) in node name in
> > >> examples.
> > >>
> > >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >> ---  
> > >   
> > >> diff --git a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> > >> index 6c5ad426a016..12f75ddc4a70 100644
> > >> --- a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> > >> +++ b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
> > >> @@ -42,7 +42,7 @@ examples:
> > >>          #address-cells = <1>;
> > >>          #size-cells = <0>;
> > >>  
> > >> -        heart_mon@0 {
> > >> +        heart-rate@0 {  
> > > 
> > > These are both heart-rate and pulse oximeters so measure more than just
> > > the rate (oxygen saturation in the blood). Reality is they actually
> > > measure light absorption over time, but you can calculate an estimate
> > > of both rate and oxygen saturation from that.
> > > 
> > > I don't really mind simplifying that to heart-rate, but wanted to
> > > call this out for possible discussion.  
> > 
> > They could be heart-mon. The fix is mostly around the underscore. I
> > don't have any arguments for changing it to heart-rate, thus we can go
> > with whatever you prefer.
> I'm fine with either and as we have a patch with heart-rate that wins
> currently. I'll just let this sit for a little longer than
> normal to see if we get any other responses!

I don't care all that much until we've documented something. Otherwise, 
we may be just changing things twice. We have the list in the spec, but 
really I'd like that in schema form. We'd also need to figure out how to 
use that. There's always going to be odd things which we don't have any 
defined name.

For now, I'd just do 's/_/-/'.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
