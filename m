Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28110ADAA34
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 10:05:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C958EC36B17;
	Mon, 16 Jun 2025 08:05:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8186AC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:05:24 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so4248515e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750061123; x=1750665923;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
 b=qroH41P+SELdMwNZJLViwiZb/LWwBPUVZRpoUYdGV2pQ0lQvW1WZOT15bVkTPSssau
 bHF3OnKL6sT1uhdIEGm+qNTHUByZ2/4v3CdWTJ8kA8hbWoH9cm32GfjsCjLDSS5tEPgJ
 kAosRYpggKn9RF46POv+L53vYlXjSOuVp9vED95aLmxrACsoAd94KsdQZ2mwdwYzTlzl
 jZkz/adZmkigNqOGJBkrypBZbuxvNZCil6K3eZfkO6LQVOYuMbNKNlwy8whGApmymLRX
 BWn35eeS2vlHHqY5479i7xm9nvzKcNXcuMfNxD9woCDziKPWfumJZBwjnIC9lSLCchyt
 dcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750061123; x=1750665923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
 b=VqjS7MSZHklMcep8E5OH0YnMlJswQKkJlGX0vsszuZ7dgm+OfaacKbEUVM0eUgfPOu
 0n5eyBE78whL9XTRM3Qoq4WdONc0yKOOLS5nr3GVE5lz6zj+iIthRiUwOXP6H8win0AV
 wccKgZZDDEAG8eFmG1i007bf5dHwOxTQkKq2vfiFj8VhpjiF++qCyij/0y9btdqL0u05
 JVMxZihsLkql7QPwmFj5P73iRw3riych4fT/SIvvcEPzgAvRAOGQ0gkK3eMt0tV5Zjf3
 PspiWr8qlpWmkYuWtpiYrlNqHxcciy7u+7PPu/SLSk15XT+4qUksnF0v0e1bxvto6j9u
 T0vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYJJoCgan9RZDy9cfR8GxHvuUFnGwepjGoo1RpCvB1/VjrUr/Px6nE+UcEXSe405ZX4zyNwI2t23S+IQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyv3eMA8JlfMfv2WnlZWKMfvtcio20NIsyCGdeAY4PwIuKyKesa
 dYfiy4W4xQJp9EYqALbAxcrmOmpvwphsChJ/hNMS8EEfmj6abNr5fcxUzPn8sT8GKdwePjcHxw5
 6zyUf0KSvZ9sHhFJFPiB0aoGQV+oBxKupyYDLQgqTOA==
X-Gm-Gg: ASbGnctM2l9M++IPApl1vjHKAhD04tmZSviatsaDNWM6NKLre+2mrr2AOCisvCg9Mvu
 /Jf/MLtKjbLgP5hdCmuLjPVTr8LDX2nmtVRes+JAiIf8V0sqdXNSNfl+NK7TqLutcKYg3w4SOuv
 gJeUvXURLfnvpJv2SxKZ4bx9lQUBJIxjcf8wFo/HaYMTVlMgKP5PoqiPaSnRP67ldQWfYs1Wo4M
 /4=
X-Google-Smtp-Source: AGHT+IHui39rGOe78ZVv1GL/qozjTCuN+gIRPTaD2LzbbRuwGK+ExSJGXv1lf4f3l/OzpiTJL7GG+3gb2jdEJtZBUck=
X-Received: by 2002:a05:6512:3e07:b0:553:2fa8:8405 with SMTP id
 2adb3069b0e04-553b6f4f34bmr2175898e87.56.1750061123552; Mon, 16 Jun 2025
 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 10:05:12 +0200
X-Gm-Features: AX0GCFsKseF3x4tMXUWhM7GW0aQJySrNOOS0VJu19t9Ohnme0LPMU6-HMe9h4i0
Message-ID: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/9] Introduce HDP support for STM32MP
	platforms
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTI6MTbigK9QTSBDbMOpbWVudCBMZSBHb2ZmaWMKPGNs
ZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMg
aW50cm9kdWNlcyB0aGUgSGFyZHdhcmUgRGVidWcgUG9ydCAoSERQKSBzdXBwb3J0IGZvcgo+IFNU
TTMyTVAgcGxhdGZvcm1zLgo+Cj4gSXQgaW5jbHVkZXMgdXBkYXRlcyB0byB0aGUgbW1pbyBncGlv
IGRyaXZlciwgdGhlIGFkZGl0aW9uIG9mIGRldmljZSB0cmVlCj4gYmluZGluZ3MsIHRoZSBIRFAg
ZHJpdmVyLCBhbmQgdXBkYXRlcyB0byB0aGUgZGV2aWNlIHRyZWUgZmlsZXMgZm9yCj4gU1RNMzJN
UDEzLCBTVE0zMk1QMTUsCj4gYW5kIFNUTTMyTVAyNSBTb0NzLgo+IFRoZSBzZXJpZXMgYWxzbyB1
cGRhdGVzIHRoZSBNQUlOVEFJTkVSUyBmaWxlIHRvIGluY2x1ZGUgbXlzZWxmIGFzIHRoZQo+IG1h
aW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3NhcnkK
PiBwaW5tdXggY29uZmlndXJhdGlvbnMgZm9yIEhEUCBwaW5zIG9uIFNUTTMyTVAxNTdDLURLMiBh
cyBleGFtcGxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50
LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+IC0tLQoKW3NuaXBdCgo+IC0tLQo+IENsw6ltZW50IExl
IEdvZmZpYyAoOSk6Cj4gICAgICAgZ3BpbzogbW1pbzogYWRkIEJHUElPRl9OT19JTlBVVCBmbGFn
IGZvciBHUE8gZ3Bpb2NoaXAKPiAgICAgICBkdC1iaW5kaW5nczogcGluY3RybDogc3RtMzI6IElu
dHJvZHVjZSBIRFAKPiAgICAgICBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIK
PiAgICAgICBNQUlOVEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAg
bWFpbnRhaW5lcgo+ICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBv
cnQgKEhEUCkgb24gc3RtMzJtcDEzCj4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdh
cmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUKPiAgICAgICBBUk06IGR0czogc3RtMzI6
IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAyNQo+ICAgICAgIEFSTTog
ZHRzOiBzdG0zMjogYWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIEhEUCBwaW4gYW5kIGFkZCBIRFAg
cGluY3RybCBub2RlCj4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcg
cG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9hcmQKPgoKUGF0Y2hlcyAxLTQgYW5kIDUt
OSBjYW4gZ28gdXBzdHJlYW0gaW5kZXBlbmRlbnRseS4gSSBzdWdnZXN0IHRha2luZwpwYXRjaCAx
LzkgdGhyb3VnaCB0aGUgR1BJTyB0cmVlIGFuZCBwcm92aWRpbmcgYW4gaW1tdXRhYmxlIHRhZyB0
bwpMaW51cyB0byB0YWtlIHBhdGNoZXMgMi00IHRocm91Z2ggdGhlIHBpbmN0cmwgdHJlZS4gTGlu
dXM6IGFyZSB5b3UgT0sKd2l0aCB0aGF0PwoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
