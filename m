Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB26E4354
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 11:13:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE0E0C6B454;
	Mon, 17 Apr 2023 09:13:04 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 188C8C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 09:13:03 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 bg38-20020a056820082600b005421db6ed5bso1830738oob.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 02:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681722781; x=1684314781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ugn0tF7BDKzSh48Bi2FzY0cxR1IhIvrfHVPHfcTin10=;
 b=KzBc4intvncUAhG+aSbO+IV+LEfH2uHrB0Iuq7Dm8ZF6Bi6fSv6QCdsyvCgdyCEY3X
 99pH3uuwqHbOw9DY5I3eEkbwXaGy6tJtOH108iY6K7L373R3rRp3AGX6AySePH4B1CDM
 pw3Y3cZP7hkXWkliJcRiwX9Vhw1fLiFYmTKcsREVzBswm3YLR7ZwUKb5mh5/g1gqcOIi
 dhr1EVMxhWagE7cn6fsuTRRQYi8rOhc1acfMJ+TRY5YhKX47Z8ofQSrip0T4kJDbByyV
 M9S4PbG1NXTcu5SICvRC3SiJlVVBnRrb9eShVoBiECeb8lqfHPY8aUBbC10ZXEqRcp/Z
 7TQQ==
X-Gm-Message-State: AAQBX9d+KoJCBKsl/h3Cw2okyAWJFTxOyC80PvgSya7raXReES5b7D0j
 sSNRK42dFb1kR2LY+Iy49JBe+5uUeqR4mw==
X-Google-Smtp-Source: AKy350aRqGqlLGigtfy/aYIad3EWI8kenUm0aeFgcaFq77J/J74j4o094MuUYCW21imaSXsCRfS76A==
X-Received: by 2002:a4a:458c:0:b0:542:642b:8e8 with SMTP id
 y134-20020a4a458c000000b00542642b08e8mr3295437ooa.3.1681722781721; 
 Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 o138-20020a4a2c90000000b0054574f35b8esm770508ooo.41.2023.04.17.02.13.01
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id
 k1-20020a4ab281000000b0053e8b5524abso1147910ooo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 02:13:01 -0700 (PDT)
X-Received: by 2002:a25:d057:0:b0:b8f:5c64:cc2e with SMTP id
 h84-20020a25d057000000b00b8f5c64cc2emr6890649ybg.12.1681722760298; Mon, 17
 Apr 2023 02:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 11:12:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=H_ypo82C4G8e_ytS9R6GNwnvVD_0L2GzPQdyaUHhdw@mail.gmail.com>
Message-ID: <CAMuHMdX=H_ypo82C4G8e_ytS9R6GNwnvVD_0L2GzPQdyaUHhdw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-renesas-soc@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>, Evan Benn <evanbenn@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-watchdog@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU2F0LCBBcHIgMTUsIDIwMjMgYXQgMTE6NTjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+IE1pbm9yIGNsZWFudXAgd2l0
aG91dCBmdW5jdGlvbmFsIGltcGFjdDoKPiAxLiBJbmRlbnQgRFRTIGV4YW1wbGVzIHRvIHByZWZl
cnJlZCBmb3VyLXNwYWNlcyAobW9yZSByZWFkYWJsZSBmb3IgRFRTKSwKPiAyLiBEcm9wIHVubmVl
ZGVkIHF1b3RlcywKPiAzLiBBZGQvZHJvcCBibGFuayBsaW5lcyB0byBtYWtlIHRoZSBjb2RlIHJl
YWRhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPgoKPiAgLi4uL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMs
d2R0LnlhbWwgICAgICAgIHwgMTQgKysrKy0tLS0KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
