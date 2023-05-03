Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF266F603A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 22:40:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 388C5C69073;
	Wed,  3 May 2023 20:40:09 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE39C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 20:40:08 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so5536399276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683146408; x=1685738408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgRsKnqFosP21nRhvJTwDb+9jWUZ4oTCBD+B9SUv1+c=;
 b=PpH7MTH5m9dkyEXVIA4ICZkEIVn6fbuhrX3P1BdP3if0uOROgJ2F72A2yUx7yz3sXS
 HWtVkM2kQYKv0Z/8qhzueuBS50AQOyk7K3BJwxgGieroePKE8eXjAn/Rs2ABvHBf1Ijz
 U1P79PfFgwkyyx9FoqJJyXG0FJZj0hjbpTgXC89JzuVKxRrHt/Ymllp9Jk2sJJ4tWbfw
 y4m4tu9rb4QhSiyNaqi6I7vrNrgcUZvWsj2crRyd3wJnXlNcu8YGFm5WF58h1WRW0V1s
 LqLygvOy2n4JrcJ0Gc4Jwlxu7AuH88CzuoSB7p+d0z+N11Z8y9Tc5gacDsefTGoZl+E/
 SfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683146408; x=1685738408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgRsKnqFosP21nRhvJTwDb+9jWUZ4oTCBD+B9SUv1+c=;
 b=ktKDM9w8Ifcudw41+owou45Xa8i+CxS3Yx3JJ2jxBRhr4k7lqrRZzpIvO3u9lj3FN4
 guqZKx+cwOOJeNqtsysPtL9hTSZ57lgXpTDA6am0+IE1EPuXnWej2IrL/ouoiv+5stue
 BbGOdYeW4OU9mPhp6gFzKCvouT4iPgCqX7nrQnrdLF6UHzQP44k4P6p/O3NqxHiZojlK
 Jp1l0C6roQ5sv72SPUhPUkrYPjbHX+h40EdmVcw6BsCvo17KIVe2VQ1ClhRxNiD3J4kT
 MC4Cw98Erq00d8pcQcS4KosAmM0RuhjkW5pGx+nVbBsLnNcZmyAFkzp2rN0WVqcDqe53
 QVtw==
X-Gm-Message-State: AC+VfDxFHwgnEITZWU9IxzKLAtVFl89pyMCP1VrYTiKInczyzb5WQT3I
 T24ZNP19bNy0GXkLuPR/vBfXPT2N+PkpKd+lsUa5Ng==
X-Google-Smtp-Source: ACHHUZ504wPVYlURitbUXR0w6GF5Hd5chFJsuF27bLfRTjvW8/vWf4wN9zc7VHWrnnoXqNvPfLtTOnqfU50Ll8hIGF4=
X-Received: by 2002:a25:656:0:b0:b25:a1e1:5b65 with SMTP id
 83-20020a250656000000b00b25a1e15b65mr3778724ybg.5.1683146407758; Wed, 03 May
 2023 13:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
 <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
 <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
 <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
In-Reply-To: <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 22:39:55 +0200
Message-ID: <CACRpkdZBFqhoK7WhERX8yfBHL8kxYqnOZGgBCcWaHpT8qB2S4Q@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCAxMDozN+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+IE9uIFdlZCwgTWF5IDMsIDIwMjMsIGF0IDE1OjE2LCBSb2IgSGVycmlu
ZyB3cm90ZToKPgo+ID4gV2UgY291bGQgZG8gYSBzZWNvbmQgbGV2ZWwgb2YgZGlyZWN0b3JpZXMg
aGVyZToKPgo+IFdvcmtzIGZvciBtZSwgYnV0IGF0IHRoYXQgcG9pbnQsIEknZCByZWFsbHkgYWxz
byB3YW50IHRvIGRvIGl0Cj4gZm9yIG54cCB3aXRoIGl0cyBmaXZlIG9yIG1vcmUgcHJvZHVjdCBs
aW5lcyAobXhzLCBpbXgsIGxwYywKPiBzMzIsIGxheWVyc2NhcGUsIHZ5YnJpZCkKPgo+ID4gaW50
ZWwvcHhhLwo+ID4gaW50ZWwvaXhwLwo+ID4gaW50ZWwvc29jZnBnYS8KPgo+IGFuZCBpbnRlbC9h
eHhpYSBJIGd1ZXNzLgoKVGhpcyBsb29rcyBuZWF0LiBJIGxpa2UgaXQuCgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
