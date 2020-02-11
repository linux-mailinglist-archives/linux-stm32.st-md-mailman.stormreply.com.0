Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E870F1592B9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 16:16:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A40F0C36B0B;
	Tue, 11 Feb 2020 15:16:59 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B5CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 15:16:57 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id g15so6539956vsf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WENS2WcOxHmXvDO2pe8ifXBhkcUA3hWBPLeNHKN8EoM=;
 b=C+5ascRqzPXGryltERKgpy4StkE4UDqzTw3z3ftMWMC3RwhZOcWM2KgPIGW6uTN7J7
 si3ykSCHDvO4YTBpTF+fg/HXJdnzBJLgkqSW3lD080sgfeb58FaWgAmjAjogA7/v1nbI
 DrBuwN/GHIMAMJgJzWS3GFcIdi24lIE8Tc0fYv2ERDU3MiUL0aAkHcyCKDepr/UU7usu
 NJfGsdAQuyeQ4cvjkorfm4XpVogPPGbMOVux0+WFsU9o3zKwerLaQ9weCyCtuEpxpl/O
 T05diV41zPXxkMmdYBtZObEYoxu5XCsB4ZgPd9WMT8MZE2bOaM/HNKk/BgefwQ9F1qHZ
 wrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WENS2WcOxHmXvDO2pe8ifXBhkcUA3hWBPLeNHKN8EoM=;
 b=sd/SvY2AUecXt2keoCf1/agW2w/xZn5r+XxmgCpMdVqdYlvR5hMvkF27NL8LMQiyhN
 Jmn7Pz1f+Bp+BpNcJhryE93GqWjiwKqYqE5yYeM+MSx7qrgDS+nt+x7MuldPy1UCUaak
 aWTt2JpDU8urIcE5M1DYP4v2KOedAYvbEKBKeB8rVw+WqIG8IU8KBa4kaOSC846fRq7F
 SnvouOh/k6rZ8OdOOtNOEHEKYMJ1XOAsXVDCTwD2GNksg7NFkf7XRE3aNiBNVv+eTrxC
 Uf5tjhErYhwfkXqn1hDMrOAUfRN2DVDqBi31pK7AiaidDc+rQMK7QW2y1+/B7z96Q2yi
 BR5Q==
X-Gm-Message-State: APjAAAXxORMfL9mDehH8K+8MhVwr94v/VgqX7UxUhVjf3pTLFmJB5Q4X
 cBYlfoo5gbtHWxYXVoYOU3AA91muSjDT76g9W5nOUw==
X-Google-Smtp-Source: APXvYqxX+g30kIlrE7sS/CTlKwzqSp/4IyXR9L+m+r5akbnOHy+rmb/ItP0h3AjrD+kKmmUxf62c/e8ix4e9zhDSy+c=
X-Received: by 2002:a67:ee02:: with SMTP id f2mr9380622vsp.165.1581434215966; 
 Tue, 11 Feb 2020 07:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20200128090636.13689-1-ludovic.barre@st.com>
 <0d4a3df8-fd1a-4839-116c-149f9e478f42@st.com>
In-Reply-To: <0d4a3df8-fd1a-4839-116c-149f9e478f42@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Feb 2020 16:16:20 +0100
Message-ID: <CAPDyKFpD9GS2FNt2DOsnELtopzhAmyKizU6xhBrP5_uokFFHTw@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/9] mmc: mmci: sdmmc: add sdr104
	support
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

T24gVHVlLCAxMSBGZWIgMjAyMCBhdCAxNTo0NywgTHVkb3ZpYyBCQVJSRSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Cj4gaGkgVWxmCj4KPiBKdXN0IGEgImdlbnRsZW1hbiBwaW5nIiBv
biB0aGlzIHNlcmllcwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tbWMvbGlzdC8/c2VyaWVzPTIzNDAxMQoKSSB3aWxsIGhhdmUgYSBsb29rIGxhdGVyIHRoaXMg
d2Vlay4gVGhlIG1lcmdlIHdpbmRvdyBjbG9zZWQgeWVzdGVyZGF5CmFuZCBub3JtYWxseSBJIGRv
bid0IHF1ZXVlIGFueXRoaW5nIGJ1dCBmaXhlcyBkdXJpbmcgdGhlIG1lcmdlIHdpbmRvdy4KCkFu
eXdheSwgYXBvbG9naXplIGZvciB0aGUgZGVsYXlzLgoKS2luZCByZWdhcmRzClVmZmUKCj4KPiBS
ZWdhcmRzCj4gTHVkbwo+Cj4gTGUgMS8yOC8yMCDDoCAxMDowNiBBTSwgTHVkb3ZpYyBCYXJyZSBh
IMOpY3JpdCA6Cj4gPiBUbyBzdXBwb3J0IHRoZSBzZHIxMDQgbW9kZSwgc2RtbWMgdmFyaWFudCBu
ZWVkczoKPiA+IC1IYXJkd2FyZSBkZWxheSBibG9jayBzdXBwb3J0IGZvciBzZG1tYyB2YXJpYW50
Cj4gPiAgIHdpdGggdHVuaW5nIHByb2NlZHVyZQo+ID4gLVZvbHRhZ2Ugc3dpdGNoIGNhbGxiYWNr
cwo+ID4gLXNkbW1jIHJldmlzaW9uIDIuMAo+ID4KPiA+IFYyOgo+ID4gLXJlZ3JvdXAgaG9zdC0+
bW1jX29wcyAmIG1tYy0+b3BzIGFzc2lnbm1lbnQKPiA+IC1hZGQgdGltZW91dCBkZWZpbmUKPiA+
IC1yZW5hbWUgcHJlcF92b2x0X3N3aXRjaCB0byBwcmVfc2lnX3ZvbHRfc3dpdGNoCj4gPiAtcmVu
YW1lIHZvbHRfc3dpdGNoIHRvIHBvc3Rfc2lnX3ZvbHRfc3dpdGNoCj4gPiAtYWRkICd3aHknIGNv
bW1lbnQgZm9yICJtbWM6IG1tY2k6IGFkZCB2b2x0X3N3aXRjaCBjYWxsYmFja3MiCj4gPgo+ID4g
THVkb3ZpYyBCYXJyZSAoOSk6Cj4gPiAgICBtbWM6IG1tY2k6IHNkbW1jOiByZXBsYWNlIHNnX2Rt
YV94eHggbWFjcm9zCj4gPiAgICBtbWM6IG1tY2k6IHNkbW1jOiByZW5hbWUgc2RtbWNfcHJpdiBz
dHJ1Y3QgdG8gc2RtbWNfaWRtYQo+ID4gICAgbW1jOiBtbWNpOiBhZGQgYSByZWZlcmVuY2UgYXQg
bW1jX2hvc3Rfb3BzIGluIG1tY2kgc3RydWN0Cj4gPiAgICBtbWM6IG1tY2k6IGFkZCBwcml2YXRl
IHBvaW50ZXIgZm9yIHZhcmlhbnQKPiA+ICAgIGR0LWJpbmRpbmdzOiBtbWM6IG1tY2k6IGFkZCBk
ZWxheSBibG9jayBiYXNlIHJlZ2lzdGVyIGZvciBzZG1tYwo+ID4gICAgbW1jOiBtbWNpOiBzZG1t
YzogYWRkIGV4ZWN1dGUgdHVuaW5nIHdpdGggZGVsYXkgYmxvY2sKPiA+ICAgIG1tYzogbW1jaTog
YWRkIHZvbHRfc3dpdGNoIGNhbGxiYWNrcwo+ID4gICAgbW1jOiBtbWNpOiBzZG1tYzogYWRkIHZv
bHRhZ2Ugc3dpdGNoIGZ1bmN0aW9ucwo+ID4gICAgbW1jOiBtbWNpOiBhZGQgc2RtbWMgdmFyaWFu
dCByZXZpc2lvbiAyLjAKPiA+Cj4gPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWNp
LnR4dCAgICAgICAgICB8ICAgMiArCj4gPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jICAgICAg
ICAgICAgICAgICAgICAgICB8ICA0MiArKystCj4gPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5o
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCj4gPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1j
aV9zdG0zMl9zZG1tYy5jICAgICAgICAgICB8IDIwNCArKysrKysrKysrKysrKysrKy0KPiA+ICAg
NCBmaWxlcyBjaGFuZ2VkLCAyNDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
