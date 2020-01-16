Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590213DF16
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 16:44:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3494C36B0F;
	Thu, 16 Jan 2020 15:44:39 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C13C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 15:44:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w30so19161922qtd.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gS/fHlu1Oq+hOaHui9eyrfBYKZOt+Ph3ppYSp+KEj84=;
 b=TuZrRDRrFT+WCptl4jtudlerse96sZuVq1zCdH/vK0dfPQ5xrQ8yUIzMfOapTXR9y4
 2ibPZdeO3cq4uS1KiYsYbV9RRHau1FtdADF2iknc6ur7M5Hbe02w+NYCZSev5tkOuh9y
 ePPUYQ5Bh8gV7wWIJjAdFBo2Fr7l9sacP/LpMALL0xuGORiaeTm3/ovoKyoLmwkFKklD
 6sSWGaW4m6iXLGFz46GxeiCxLNa8KvJnVQcgvCjOULKu8FKZMzC5iRUJ3iQ4JETxnPHt
 2cnmYanX1iTd7BIvnEBMBduu9aAm6DnKlJHyGdk6ZlhC2lQ9nUkBPOSsLwHSjr/FwcCE
 zFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gS/fHlu1Oq+hOaHui9eyrfBYKZOt+Ph3ppYSp+KEj84=;
 b=qBBBk6XDSc+eWrYjYDGRzuEdPzk2RW+xXnGLoZrFGM4NTIsuhWo6OrZzI2acbaBp8+
 +V/NimMmQiY7tuw/ytW5SfPzKCXm1cJeJaTO5lZ/6Y0IhO8yt+rVvlgk8BJTXVnpCDja
 8mjBPmp0GpTmH2KUNbrLo59yny4ozuvOJ7RdPdBCEhG2UhyAGuWIgVRVw1pAlzvd5HKA
 JKrCZIAV09wPkO5L4jJ0XBkPMFdfWEQTZNLy/Pjm7iQv1jddmu837PMwOjgjEkkPQs+3
 S9ux3sYmUw0MBXkKDN+Dhsn+3S16Bj8uYyGqPA4TqAgyT+GTjpTjNjGiOtHbE4JrTQwL
 NmMA==
X-Gm-Message-State: APjAAAXk7Na3viwiq6J4OLBMjol1BoIOUCho2D2mQ8wQQk5yTd3cEaUI
 0DcmVL656105nNjeBwtKImZMI7swMkBT/b3whmOpXA==
X-Google-Smtp-Source: APXvYqxNeltlsFc5Dxrse9Z755UY41N7ksUFlORuO7LHPKeYC0Mo2wcnrf5mqiMyXQzUM4vECUHukncA86I8+8DwzWQ=
X-Received: by 2002:aed:2d01:: with SMTP id h1mr2976756qtd.239.1579189477572; 
 Thu, 16 Jan 2020 07:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-3-benjamin.gaignard@st.com>
 <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
In-Reply-To: <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 16 Jan 2020 16:44:26 +0100
Message-ID: <CA+M3ks7s_KOhXciJPZc3N4z9GNkiKa=fWdQ3hC_HTtrWMWYHtQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Pascal PAILLET-LME <p.paillet@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] clocksource: Add Low Power STM32
	timers driver
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

TGUgamV1LiAxNiBqYW52LiAyMDIwIMOgIDEwOjA3LCBMaW51cyBXYWxsZWlqCjxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IE9uIFRodSwgSmFuIDksIDIwMjAgYXQgMzo1
NCBQTSBCZW5qYW1pbiBHYWlnbmFyZAo+IDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+IHdyb3Rl
Ogo+Cj4gPiBJbXBsZW1lbnQgY2xvY2sgZXZlbnQgZHJpdmVyIHVzaW5nIGxvdyBwb3dlciBTVE0z
MiB0aW1lcnMuCj4gPiBMb3cgcG93ZXIgdGltZXJzIGNvdW50ZXIgcyBydW5uaW5nIGV2ZW4gaW4g
d2hlbiBDUFUgaXMgaW4gc3RvcCBtb2RlLgo+ID4gSXQgY291bGQgYmUgdXNlZCBhcyBjbG9jayBl
dmVudCBicm9hZGNhc3RlciB0byB3YWtlIHVwIENQVXMgYnV0IG5vdCBsaWtlCj4gPiBhIGNsb2Nr
c291cmNlIGJlY2F1c2UgZWFjaCBpdCByaXNlIGFuIGludGVycnVwdCB0aGUgY291bnRlciByZXN0
YXJ0IGZyb20gMC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUGFzY2FsIFBhaWxsZXQg
PHAucGFpbGxldEBzdC5jb20+Cj4KPiBMb29rcyBnb29kIHRvIG1lOgo+IFJldmlld2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpIaSBMaW51cywKClRoYW5r
cyBmb3IgeW91ciByZXZpZXcuIEkgaGFkIHRvIHJld29yayBhIGJpdCB0aGUgZHJpdmVyIHRvIHNv
bHZlIHRoZQpiaW5kaW5ncyBpc3N1ZXMKc28gSSBoYXZlbid0IHB1dCB5b3VyIFJCIG9uIHZlcnNp
b24gMi4KCj4KPiBJZiB5b3UgaGF2ZSBhIHNwYXJlIGFsd2F5cy1vbiB0aW1lciAoYW5kIGl0IGxv
b2tzIGxpa2UgeW91IGhhdmUpIHdoaWNoCj4geW91IGNhbiBzZXQgYXMgZnJlZS1ydW5uaW5nLCB5
b3UgY291bGQgcmVnaXN0ZXIgaXQgd2l0aAo+IENMT0NLX1NPVVJDRV9TVVNQRU5EX05PTlNUT1Ag
c28gaXQKClRoZSBkcml2ZXIgb25seSBpbXBsZW1lbnQgY2xvY2sgZXZlbnQgZmVhdHVyZSBzbyBJ
IGRvbid0IHRoaW5rIHRoYXQgaXMKZmxhZyBpcyBhcHBsaWNhYmxlLgoKUmVnYXJkcywKQmVuamFt
aW4KPiBrZWVwcyB0aGUgc3lzdGVtIGNsb2NrIHRpY2tpbmcgYWxzbyBkdXJpbmcgc3VzcGVuZCBh
cwo+IGFsdGVybmF0aXZlIGNsb2NrIHNvdXJjZS4KPgo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
