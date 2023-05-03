Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456E6F58D3
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 15:17:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 249E5C6A60C;
	Wed,  3 May 2023 13:17:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19B0EC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:17:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E36C862D94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4316C433AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683119821;
 bh=CA9HUUoFcRTgCBgzgu0IWVlQEyRERVDtXqxkChGQSj8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ole+wwu+SdPiS2aUQcX3tEt0J62DoRGG/xDwP1Q2hBI3sfPftXI2W3kkH/F/59E4N
 Rj2AmEaDcZT0BpGUnm84lYZ85cuHO/HgCWs2zlik5IUL41OlHfPOy59tbtDy7fBx5t
 ZgCFMVN0XHQ4LSBsXc2sJOPg8GrUyA3vIDNzPLKgT+G9Ro3CYUUGu+kdRKJu/W/qY+
 Pcq0qEWFbXc19qYZkj9ZXfSABwacLhUspZQ8xEAXDZ4dRCU4ngqd8rEoQ4x7LNLiYU
 jPAiVOLzrxahB5/VVJTZBCBCdKtT7WYvy7hBlO4AI4UaDtDdPD5K3xc7KZXakiNinj
 sK7EXobVb5Tog==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso51341211fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 06:17:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDxtsnNQEAYUCzZ254NDgHqC7CP7BZlTpuOX80jWTe5lZlo4cohz
 UrYro0XS8GIVMhHH1DZyFOFy91eVqu7sRipBHA==
X-Google-Smtp-Source: ACHHUZ4XoUscEY44VabA5tNDJYMyOoaF7CDhHSN63Jv4Bd86fg89uBNzW43NBIrFuEuIivWhSP0hKhXIoN/CJGAf91U=
X-Received: by 2002:ac2:5198:0:b0:4ed:b842:3a99 with SMTP id
 u24-20020ac25198000000b004edb8423a99mr934135lfi.59.1683119819681; Wed, 03 May
 2023 06:16:59 -0700 (PDT)
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
In-Reply-To: <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 08:16:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
Message-ID: <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCA3OjE54oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAzLCAyMDIzLCBhdCAxNDoxMywgRG1pdHJ5IEJh
cnlzaGtvdiB3cm90ZToKPiA+IE9uIFdlZCwgMyBNYXkgMjAyMyBhdCAxMzozOSwgQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiA+PiBTbyB3aXRoIHB4YTkzeCBvdXQgb2Yg
dGhlIHBpY3R1cmUsIHdlIGNhbiBzaW1wbGlmeSBpdCBhcyB1c2luZwo+ID4+ICdweGEnIGFzIHRo
ZSBuYW1lIGZvciBhbGwgdGhlIGFib3ZlIGNoaXBzIHdpdGggYW4gSW50ZWwgWFNjYWxlCj4gPj4g
Y29yZSwgYW5kICdtYXJ2ZWxsJyBmb3IgYWxsIHRoZSBvdGhlciBvbmVzIHRoYXQgaGF2ZSBhIE1h
cnZlbGwKPiA+PiBjb3JlIGFuZCBleGlzdCBpbiBtYWNoLW1tcC4KPiA+Cj4gPiBTaG91bGQgaXQg
YmUgJ2ludGVsJyBmb3IgcHhhWzIzXXh4IHRoZW4/Cj4KPiBQcm9iYWJseSB5ZXMsIHRoYXQgd291
bGQgcHV0IGl0IG5leHQgdG8gaXhwNHh4LCB3aGljaCBtYWtlcwo+IGEgbG90IG9mIHNlbnNlIChz
YW1lIHZpbnRhZ2UsIHNhbWUgY3B1IGNvcmUpLCB0aG91Z2ggaXQgaXMKPiBhIGJpdCBmdW5ueSB0
byBoYXZlIHRoZXNlIHRvZ2V0aGVyIHdpdGggbHNpIGF4eGlhIGFuZAo+IGFsdGVyYSBzb2NmcGdh
LCBib3RoIG9mIHdoaWNoIGFyZSBhbHNvIGluIHRoZSBpbnRlbAo+IGRpcmVjdG9yeS4gc29jZnBn
YSBpcyBvZiBjb3Vyc2UgdGhlIG9ubHkgb25lIHRoYXQgYW55Ym9keQo+IGF0IEludGVsIGNhcmVz
IGFib3V0IHRoZXNlIGRheXMuCgpXZSBjb3VsZCBkbyBhIHNlY29uZCBsZXZlbCBvZiBkaXJlY3Rv
cmllcyBoZXJlOgoKaW50ZWwvcHhhLwppbnRlbC9peHAvCmludGVsL3NvY2ZwZ2EvCgphcm02NCBi
cm9hZGNvbSBkdHMgZmlsZXMgYXJlIHN0cnVjdHVyZWQgdGhhdCB3YXkuCgpSb2IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
