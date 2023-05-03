Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6EA6F57AC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 14:13:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 743A2C6A60C;
	Wed,  3 May 2023 12:13:53 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D31DC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 12:13:52 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-55af4277904so16148237b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683116031; x=1685708031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
 b=w24SJl1jEsx1dsysGc/JqXn8TRE0UMobpr8S9T3y+gEnR/nI+CHCSx5trFpTNAVCVG
 8XS7YABKoVXwdqhydgmtWe9LQJJ7LBPnr1fCtb0rshbAxTDbaTU+5U0WNdSypx0SKblE
 0CP6meVuOVDCtCX96ONGJ58N4h4LCh6KY7HQXwOPLcftT7CWUqTxxZHaVMF/ygVuJ3xU
 KtX9ixUBAF79tkLLjx9Hg+1rarQ5Su54dehEmdGZNBkbkoufEbwweYd9rnB2Q94mEjKe
 bYeSIwtnrv7tEjxTeB2h1XUenyGb9cWojKfDEo4AC69c880iPhtph2axVQ7WlTkbXxO7
 +S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683116031; x=1685708031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLFpTw4Opsx0SIhXDBcwLEPI4lObbahA52WBgGIUVsM=;
 b=WPtv7EzAsLCiUAXa+FR64fb+ldIzaq6e68sYO/M3fMMO7o7Jtt7g9uQrtCygDDD5mS
 4qs7K8kdf4w36ou6pJx4Ue/V0G7hyToYH9rkbhRhHe6H8Pi4VelX6LaTuxCC3xs4s6ii
 /faVeEFZ26PAjykgv8Kkq3kWa9uUMzy4eDkuSec3LscQdP3eJgpTQsJa8IG42WCY0RE3
 7Cz+QASktuSJq7mfQ4A5DZqHSni0kdf411oTxecOlmBZzEhQICfg5M3uamYgcoR/kPVc
 uaBcPfRGGxlE9QMCIw7vDYv+QdyXM90VXkv4Gk6VrApv185KtvBVfwGYjcSBGoB5Fbfr
 daWw==
X-Gm-Message-State: AC+VfDyHSYq8bdx4iPJs2TrYLCYMC42SJj4NewBo4BjBHDqusCf8j0/4
 9MrYddO3Xw0bd24FoXDAS72BV30JWRivxV4FU1E4vg==
X-Google-Smtp-Source: ACHHUZ66hRgZLiqP0HgNywmuyEJNjQjxpzuYU/Ewr0nLiWAs/k7+ydf4eMIyKQKo0mpz4nSzQd/diYDGzmnUCVXeNlI=
X-Received: by 2002:a81:4f04:0:b0:54f:ddb9:95e7 with SMTP id
 d4-20020a814f04000000b0054fddb995e7mr20136923ywb.34.1683116031053; Wed, 03
 May 2023 05:13:51 -0700 (PDT)
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
In-Reply-To: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 May 2023 15:13:39 +0300
Message-ID: <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
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

T24gV2VkLCAzIE1heSAyMDIzIGF0IDEzOjM5LCBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDMsIDIwMjMsIGF0IDAzOjE3LCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgNTo1MuKAr1BNIERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4gT24gMDIvMDUvMjAy
MyAyMjo0MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPj4gPiAgICAgICdiZXJsaW4nIDogJ2Jlcmxp
bicsCj4gPj4gPiAgICAgICdweGEyJyA6ICdweGEnLAo+ID4+ID4gICAgICAncHhhMycgOiAncHhh
JywKPiA+PiA+ICAgICAgJ3B4YScgOiAnbWFydmVsbCcsCj4gPj4KPiA+PiBJJ2QgcXVlc3Rpb24g
aWYgaXQgbWFrZXMgc2Vuc2UgdG8gc3BsaXQgdGhlIHB4YSBsaW5lLiBZZXMsIGl0IHdhcyBzb2xk
Cj4gPj4gYnkgSW50ZWwgdG8gTWFydmVsbCwgYnV0IElJUkMgdGhlIGRldmljZXMgc3RpbGwgaGFk
IHNvbWUgaW5oZXJpdGFuY2UuCj4gPj4gU28sIGlmIHdlIGhhdmUgdGhlICdweGEnIHN1YmRpciwg
SSdkIG1vdmUgTWFydmVsbCBQWEFzIHRvIHRoYXQgZGlyIHRvby4KPiA+Cj4gPiBJIHRoaW5rIEkg
cHJvYmFibHkgc3BsaXQgaXQgYmVjYXVzZSBpdCB3YXMgZGlmZmVyZW50IG1haW50YWluZXJzLgo+
ID4gVGhvdWdoIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHB4YTE2OCBvciBweGE5MTAgaGF2ZSBhbnkg
bWFpbnRhaW5lci4gVGhleQo+ID4gYXJlIGEgbWl4dHVyZSBvZiBweGEgYW5kIG1tcCBJIHRoaW5r
Lgo+Cj4gSSB0aGluayB0aGUgb3JpZ2luYWwgc3BsaXQgaGVyZSBpcyBwcm9iYWJseSB0aGUgYmVz
dCB3ZSBjYW4gZG8sCj4gYnV0IHRoZXJlIGlzIG5vIGdvb2Qgd2F5IHRvIGRvIGl0IGJlY2F1c2Ug
b2YgdGhlIGNvbmZ1c2luZyBuYW1pbmcKPiBhbmQgdGhlIHByb2JsZW0gdGhhdCB0aGVyZSBpcyBu
byBjbGVhciBsaW5lIGJldHdlZW4gcHhhIGFuZCBtbXAuCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGws
IHRoZSByZWxlYXNlIHRpbWVsaW5lIHdhczoKPgo+IEludGVsIHB4YTJ4eCAobWFjaC1weGEsIHhz
Y2FsZSwgc3RpbGwgZXhpc3RzKQo+IEludGVsIHB4YTN4eCAobWFjaC1weGEsIHhzY2FsZSwgc3Rp
bGwgZXhpc3RzKQo+IEludGVsIHB4YTkweCAobmV2ZXIgbWVyZ2VkKQo+IE1hcnZlbGwgcHhhOTN4
IChtYWNoLXB4YSwgeHNjYWxlLCByZW1vdmVkIGluIExpbnV4LTYuMywgbm8gRFQpCj4gTWFydmVs
bCBweGE5MnggKG5ldmVyIG1lcmdlZCkKPiBNYXJ2ZWxsIHB4YTkxeCAobWFjaC1tbXAsIHBqMSwg
c3RpbGwgZXhpc3RzKQo+IE1hcnZlbGwgcHhhMTY4IChtYWNoLW1tcCwgcGoxLCBzdGlsbCBleGlz
dHMpCj4gTWFydmVsbCBweGE5NXggKG1hY2gtcHhhLCBwajQsIGxvbmcgZ29uZSkKPiBNYXJ2ZWxs
IHB4YTY4OCAobWFjaC1tbXAsIHBqNCwga25vd24gYXMgbW1wMikKPgo+IFNvIHdpdGggcHhhOTN4
IG91dCBvZiB0aGUgcGljdHVyZSwgd2UgY2FuIHNpbXBsaWZ5IGl0IGFzIHVzaW5nCj4gJ3B4YScg
YXMgdGhlIG5hbWUgZm9yIGFsbCB0aGUgYWJvdmUgY2hpcHMgd2l0aCBhbiBJbnRlbCBYU2NhbGUK
PiBjb3JlLCBhbmQgJ21hcnZlbGwnIGZvciBhbGwgdGhlIG90aGVyIG9uZXMgdGhhdCBoYXZlIGEg
TWFydmVsbAo+IGNvcmUgYW5kIGV4aXN0IGluIG1hY2gtbW1wLgoKU2hvdWxkIGl0IGJlICdpbnRl
bCcgZm9yIHB4YVsyM114eCB0aGVuPwoKPgo+ICAgICAgQXJuZAoKCgotLSAKV2l0aCBiZXN0IHdp
c2hlcwpEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
