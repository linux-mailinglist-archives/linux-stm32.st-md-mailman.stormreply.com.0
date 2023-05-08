Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710A6FB6CB
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 21:38:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1216AC6A60C;
	Mon,  8 May 2023 19:38:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB8E5C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 19:38:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9619095f479so788703966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 May 2023 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1683574732; x=1686166732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
 b=LdKR+DvwekVyUqgb/OT5xTqhw/MViMQ2grjMX3F9EokLXqNtqQu+Yaq832aoIGmDUD
 lhFJulZucMOiVKprfDsGQg9GFm2RX72N6K4RFjcwnLALtfKYtElM4ySRQMBQ1AvOcDqt
 8P4dmntcKQTi5iP7QRCEAwIgDsBHatpoJLQksY2CBr0/CbuVNwuxoIne1er9XhoRQI+C
 Ifcf1ZXUagIN/A33dX2c5xKrqXa+QMwky6t/Mba+jSXTPJHMtanSbaWx9Uo87ctCq6Np
 FIonibR0S5vhRSKVOKruXgY14G/yJg8NCal6Ar8m/NHKoxaj1g7jRcJvWV+49tuOAONI
 5UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683574732; x=1686166732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
 b=BrlxGSz2cqyMtlaZ7dL5p8OWwNA1sfN6gZ+usIcplZKo12tZtpWMoTSexWFVSfBI7g
 4L1a/xI5VzO+RchfIjmexzN5S7ARqoF96GXJEJH7ZDprXysPvQ4BZ9ZQogLMtlm0CkZ6
 gE3HZu2S6HuqHWG6MsYFX3ELLuwinqHRQZnKG1bQ8i/e05o+5rVcYqO2TnuAzf5jOIOz
 Zmk3OWIR9PCLPQ9XMROJlnTgjubh4PDUL03V+hz7yWcj9eFf4gSvxgh6PaXPKA+r4Obc
 WXwL9ss4FHmkvcsQOgau608b2WExLIBtMhcwREbimmfcZFLhmHg/85nY3yYj0iW9OW8f
 ruLQ==
X-Gm-Message-State: AC+VfDzfkaxsix0EcJHqaLAynSnLqzVWZ+5OzmrlJ0oDFJFsJHl4dmaL
 GQw9AyMRlUO9CNQ6U6v518xU8txqDePo9fjV9L4=
X-Google-Smtp-Source: ACHHUZ6dsVgo1prYYtLrJg0gIiYhBjQNx+st7OeU+cr1SkPuxS+S4CB5SSBSFTCcvBvNJKZ/6ClIl+DTCz2pkxjEmWc=
X-Received: by 2002:a17:906:dac5:b0:94a:4fc5:4c2e with SMTP id
 xi5-20020a170906dac500b0094a4fc54c2emr9330195ejb.49.1683574732223; Mon, 08
 May 2023 12:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:38:41 +0200
Message-ID: <CAFBinCAXQywWReBbqRCgB36gKGjhX9Tx6g-8OTewt_xipdhp3w@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Simon Horman <simon.horman@corigine.com>, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/11] net: stmmac: Make
 stmmac_pltfr_remove() return void
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCA0OjI34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gcmV0dXJu
cyB6ZXJvIHVuY29uZGl0aW9uYWxseS4gQ2hhbmdlIGl0IHRvIHJldHVybiB2b2lkIGluc3RlYWQK
PiB3aGljaCBzaW1wbGlmaWVzIHNvbWUgY2FsbGVycyBhcyBlcnJvciBoYW5kaW5nIGJlY29tZXMg
dW5uZWNlc3NhcnkuCj4KPiBUaGUgZnVuY3Rpb24gaXMgYWxzbyB1c2VkIGZvciBzb21lIGRyaXZl
cnMgYXMgcmVtb3ZlIGNhbGxiYWNrLiBTd2l0Y2ggdGhlc2UKPiB0byB0aGUgLnJlbW92ZV9uZXco
KSBjYWxsYmFjay4gRm9yIHNvbWUgb3RoZXJzIG5vIGVycm9yIGNhbiBoYXBwZW4gaW4gdGhlCj4g
cmVtb3ZlIGNhbGxiYWNrIG5vdywgY29udmVydCB0aGVtIHRvIC5yZW1vdmVfbmV3KCksIHRvby4K
Pgo+IEFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+
IFJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+Cj4g
QWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtYW5hcmlvbi5jICAgICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jICAgICB8IDIgKy0KPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW14LmMgICAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jICAgICB8
IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50ZWwt
cGxhdC5jICB8IDkgKysrLS0tLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWlwcTgwNnguYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWxwYzE4eHguYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgICAgfCA5ICsrKy0tLS0tLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbi5jICAgICAg
IHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNv
bjhiLmMgICAgIHwgMiArLQpGb3IgdGhlc2UgdHdvIEFtbG9naWMgTWVzb24gZHJpdmVyczoKUmV2
aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
