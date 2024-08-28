Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 552079628D8
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 15:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07B36C6C855;
	Wed, 28 Aug 2024 13:39:34 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4921C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 13:39:26 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f5064816edso44947491fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724852366; x=1725457166;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SejgfaziBvf3ywT/hXGpHO0SD6lU2CgDcFAnpPmIkyk=;
 b=V5N6tjviUiPSf11xacNBu1+m5bMwQe6RfVmABZpU5b8yprXdntPlTbhyWYcOwOWoal
 vF/yVca7BeXIZ9tsMtAA7l/deZXdlPue1TKDrBaiOnozuadzHoWAyu9EjUrqku8FxoEn
 bgqI7+wmW/bN2yxO4zmMK2jgd1wThjlAF88FjZO5zU1QC9munQAhMOLVKULrcd2VhwE/
 HkGyxs0BMWKUjg1z7EWLpKtpfE17kQzBkroYg1w3GKEYff7Wwazh8OHiJWX50gRn0vyb
 XcnYZdUHdaNq16x/g+naGxV2RVpDNWyQWSYofxbtjdiyY+Eb4j3eaAtdSUWNl5wtpc0X
 CGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852366; x=1725457166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SejgfaziBvf3ywT/hXGpHO0SD6lU2CgDcFAnpPmIkyk=;
 b=Hi6KK70Sk79sPqApJT6cu0yVzYbk0TXgddSqdEFFn3D3NGTQDr6R2WJWKMg+bNlVaD
 VtkiGCb3wUavk/PiaBJkFmdUys8szc9CWNfrgfaZSWA4O6oLwKJkbFmKjmirUHIHg6LC
 K50wpqbkJmh3ogZzszN6mTC7ol+G88UbglRNrs70ERVaUJsSSrO8wQgL81M4wmsTEXgB
 bCbw+D2bbGvu/gf1CIp+QqsumsFmPFtfxNN+uTdqWVAAJz8ttyipybxbhE1veRjlRcQt
 HFhmAdTF/QzstcrFVnunjGHBS8tYt8SRkLo5LptEv0sesYjtF4F/jRG/sxyo6D5sZSxj
 hW6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxiEG+xlEhdh4MbeOn2mZfeJVIDM9bMwM4dqKa8ZUvV/utUaKkeYjaQN/pmBmAIegnX1irOVZKo0SiOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqKJwWHO4uu5rdEcyEaGGB58Gvd/0unKIgSXzfzwtIzPq8j9q+
 oV8rOViB731lzyA98lpm2A2NW2Yx80/PPOTUK/wxhP8zhwJ9TCjXE1DuXbZNwu7jtt/p0fQK5IJ
 vXe9VVWJdaEbDKpjVSeY6zHcE9Ac=
X-Google-Smtp-Source: AGHT+IF1j0/XuSeyS+V+F50Lkv+7c66HDqI+QdyGb4khqrR99cm5DXDpfLXKjxX83aGJMgsh01nC63Kz0qOxDSlRja8=
X-Received: by 2002:a2e:be8b:0:b0:2ef:296d:1dd5 with SMTP id
 38308e7fff4ca-2f549f6759emr16112381fa.0.1724852365280; Wed, 28 Aug 2024
 06:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com>
 <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
 <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
In-Reply-To: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Wed, 28 Aug 2024 15:39:13 +0200
Message-ID: <CAHzn2R2kCdetAu248LeDdWtOnsRVUL05kNwWbbshp8U=QPumaA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: andrew@lunn.ch, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 Yangtao Li <frank.li@vivo.com>, ulli.kroll@googlemail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 8/9] net: mvpp2: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

xZtyLiwgMjggc2llIDIwMjQgbyAwOToxMyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiBuYXBpc2HFgihhKToKPgo+IEhpIE1hcmNpbiwKPgo+IE9uIFdlZCwgQXVnIDI4
LCAyMDI0IGF0IDg6MjbigK9BTSBNYXJjaW4gV29qdGFzIDxtYXJjaW4ucy53b2p0YXNAZ21haWwu
Y29tPiB3cm90ZToKPiA+IHd0LiwgMjcgc2llIDIwMjQgbyAxMzowOSBKb25hdGhhbiBDYW1lcm9u
Cj4gPiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiBuYXBpc2HFgihhKToKPiA+ID4gT24g
VHVlLCAyNyBBdWcgMjAyNCAwMzo1NzoxMSAtMDYwMAo+ID4gPiBZYW5ndGFvIExpIDxmcmFuay5s
aUB2aXZvLmNvbT4gd3JvdGU6Cj4gPiA+ID4gVXNlIGRldm1fY2xrX2dldF9lbmFibGVkKCkgYW5k
IGRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKCkKPiA+ID4gPiB0byBzaW1wbGlmeSBjb2Rl
Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2
by5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IE1heGltZSBDaGV2YWxsaWVyIDxtYXhpbWUuY2hl
dmFsbGllckBib290bGluLmNvbT4KPiA+ID4gPiBUZXN0ZWQtYnk6IE1heGltZSBDaGV2YWxsaWVy
IDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IENo
cmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Cj4gPiA+ID4g
UmV2aWV3ZWQtYnk6IE1hcmNpbiBXb2p0YXMgPG1hcmNpbi5zLndvanRhc0BnbWFpbC5jb20+Cj4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBAQCAtNzc0NSwxMiArNzcxMCw2IEBAIHN0YXRpYyB2b2lkIG12
cHAyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+Cj4gPiA+ID4g
ICAgICAgaWYgKCFkZXZfb2Zfbm9kZSgmcGRldi0+ZGV2KSkKPiA+ID4gPiAgICAgICAgICAgICAg
IHJldHVybjsKPiA+ID4KPiA+ID4gR2l2ZW4gdGhpcyBtYWtlcyBubyBkaWZmZXJlbmNlIGFueSBt
b3JlLCBkcm9wIHRoZSBhYm92ZSBkZXZfb2Zfbm9kZSgpIGNoZWNrLgo+ID4KPiA+IFRoaXMgY2hl
Y2sgaXMgdG8gbm90IGV4ZWN1dGUgdGhlIGNsay1yZWxhdGVkIGNvZGUgd2hlbiBib290aW5nIHdp
dGgKPiA+IEFDUEkuIEl0IHNob3VsZCByZW1haW4gYXMtaXMsIHVubGVzcyB0aGUgbmV3IGRldm1f
Y2xrX2dldCogYXBpIGlzCj4gPiBjYXBhYmxlIG9mIG5vdCBleHBsb2RpbmcgaW4gbm9uLURUIGNh
c2UuIENhbiB5b3UgY29uZmlybT8KPgo+IEFzIHBlciB0aGUgcmVtb3ZhbHMgYmVsb3csIHRoZXJl
IGlzIG5vIGNvZGUgbGVmdCBpbiB0aGlzIGZ1bmN0aW9uIGFmdGVyCj4gdGhlIGNoZWNrIChpLmUu
IHRoZSAiZWxzZSIgcGFydCBiZWNhbWUgZW1wdHkpLgo+Cj4gPiA+ID4gLQo+ID4gPiA+IC0gICAg
IGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5heGlfY2xrKTsKPiA+ID4gPiAtICAgICBjbGtf
ZGlzYWJsZV91bnByZXBhcmUocHJpdi0+bWdfY29yZV9jbGspOwo+ID4gPiA+IC0gICAgIGNsa19k
aXNhYmxlX3VucHJlcGFyZShwcml2LT5tZ19jbGspOwo+ID4gPiA+IC0gICAgIGNsa19kaXNhYmxl
X3VucHJlcGFyZShwcml2LT5wcF9jbGspOwo+ID4gPiA+IC0gICAgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShwcml2LT5nb3BfY2xrKTsKPiA+ID4gPiAgfQo+Cj4gR3J7b2V0amUsZWV0aW5nfXMsCj4K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+CgpZb3UgYXJlIHJpZ2h0LCBJIG1pc3Jl
YWQgdGhhdCBpdCB3YXMgbXZwcDJfcHJvYmUgOikgSSBjb25maXJtLCB3ZSBjYW4KcmVtb3ZlIGlu
IG12cHAyX3JlbW92ZS4KCkJlc3QgcmVnYXJkcywKTWFyY2luCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
