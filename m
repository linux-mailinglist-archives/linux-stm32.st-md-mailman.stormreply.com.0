Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE443ADEBB5
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 14:21:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A57AC36B30;
	Wed, 18 Jun 2025 12:21:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F4EBC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 12:21:11 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32ac42bb4e4so60738271fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750249270; x=1750854070;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
 b=pJ8KUWOZmREwq5d9nb64rQAJrce7mv5MVeFG1LEc57C/PqZ0V7LSxP6/JL/YnYmejr
 X8rZVKDkVjI2Ua5PBWpasxuADelqdm4hbNslaRdi8zjgkYD0L9gyCkdJDcJJASRuMh0+
 v0NUVQ229yuAW2AGB9UcLEZiZb8GeOmN5h9VKyTB1n29N1QCV+FeUy8rrBai3dBsQCEh
 3Qsa0RQ1ETOkGWs0KZtqwqr6UVsREAN7mOxTTuoy7ndjElivBpRiO0ucUTxknOD58HXj
 a6a/WgsCOD6s761y52b1E/2irRgDwWAqxAUmLhKk3HyZY6P46Xesp6bkzM3o9XITbQCT
 mwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750249270; x=1750854070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
 b=QXlQkhRwIq1cFQdX1OHCagJ27bD8rATKb0joNoF9d0zBg5H/xV3OMepT7iQ2cBckdc
 W3s8bpmy1iXdGzNAxrodXcgSefos2Ffu/j6c4ftM+W1r9+Pr+AF1/hRvPPjikIIZZqFT
 0e/4CldfOL5otw34sAtXARZJGvOLwwDq7b0gEcNih4+ALJYULrmFF5wI967uuPPIMPA+
 iBTtWvxXZSU9W0as1TAJ38niB+W0WALRDeDEoT7vOum0n/FrKYJM4loHomjs1dgEjgjX
 +rUI/R5riI1zwSujZ8fsbFjijgYrQiTfEHMGwSwWn8tAZ1g0qmKNhSicRbx6xp/4pFgW
 CIKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf4egvmcD7DezB4j4D+Bywx7h9ozYAzdL7hYdMy8EIZkhR5/VsHWCXgKFVCHZ0QDACH+Z/Hf0fW9DnOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyGxHW0YrJxR7dq0C/6w8sdnCcW0myZWFL6ihlQa2IfFj9famVt
 +0dAjFIXn/fW2efwfkkbzmaIPJ5ck2G/d7WrWJHADtobieB/7kZg5N9uWQHMJJ0VlKYt0vrm7to
 ynWGI/3DJomtP7vk3neGydXTtdCW/UkmwZi8Nf0lxqw==
X-Gm-Gg: ASbGnctfMfzxHgFLZlOfpGfv8U8PGJyzPpDH1aM83pxIZKhQFatJfxZ30glsx9psfjJ
 zSgLH95mFpKyQcXyoVYpTz+LJ9W46zWW1A7YHDMZmA0ShhQahyT4OeDdg2vWWHf9+uPaiJMd5TC
 nBZTfMOVFZEBAprEgqZ4LxoXazNaTra3qcRcPfjVtPvjk=
X-Google-Smtp-Source: AGHT+IFxHCRWz//u1od0Lrwty9Yf9DHcSgaAHfAvrbBiimpXB2OEA85EDmSgQGSVRLhnSLdlgZURbr7ybwWz1kTTt2A=
X-Received: by 2002:a2e:a546:0:b0:32a:6312:bfc1 with SMTP id
 38308e7fff4ca-32b4a5a5c86mr42763701fa.24.1750249270277; Wed, 18 Jun 2025
 05:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
In-Reply-To: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:20:56 +0200
X-Gm-Features: AX0GCFvzIWiUTEnf7w2o5CriFQLwK7aVK0h_a_ivR8DSarlEz7uy-y-3wDCyAbg
Message-ID: <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMTA6MDXigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCAxMjoxNuKAr1BN
IENsw6ltZW50IExlIEdvZmZpYwo+IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90
ZToKPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHRoZSBIYXJkd2FyZSBEZWJ1
ZyBQb3J0IChIRFApIHN1cHBvcnQgZm9yCj4gPiBTVE0zMk1QIHBsYXRmb3Jtcy4KPiA+Cj4gPiBJ
dCBpbmNsdWRlcyB1cGRhdGVzIHRvIHRoZSBtbWlvIGdwaW8gZHJpdmVyLCB0aGUgYWRkaXRpb24g
b2YgZGV2aWNlIHRyZWUKPiA+IGJpbmRpbmdzLCB0aGUgSERQIGRyaXZlciwgYW5kIHVwZGF0ZXMg
dG8gdGhlIGRldmljZSB0cmVlIGZpbGVzIGZvcgo+ID4gU1RNMzJNUDEzLCBTVE0zMk1QMTUsCj4g
PiBhbmQgU1RNMzJNUDI1IFNvQ3MuCj4gPiBUaGUgc2VyaWVzIGFsc28gdXBkYXRlcyB0aGUgTUFJ
TlRBSU5FUlMgZmlsZSB0byBpbmNsdWRlIG15c2VsZiBhcyB0aGUKPiA+IG1haW50YWluZXIgZm9y
IHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3NhcnkKPiA+IHBpbm11eCBj
b25maWd1cmF0aW9ucyBmb3IgSERQIHBpbnMgb24gU1RNMzJNUDE1N0MtREsyIGFzIGV4YW1wbGUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29m
ZmljQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4KPiBbc25pcF0KPgo+ID4gLS0tCj4gPiBDbMOpbWVu
dCBMZSBHb2ZmaWMgKDkpOgo+ID4gICAgICAgZ3BpbzogbW1pbzogYWRkIEJHUElPRl9OT19JTlBV
VCBmbGFnIGZvciBHUE8gZ3Bpb2NoaXAKPiA+ICAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBz
dG0zMjogSW50cm9kdWNlIEhEUAo+ID4gICAgICAgcGluY3RybDogc3RtMzI6IEludHJvZHVjZSBI
RFAgZHJpdmVyCj4gPiAgICAgICBNQUlOVEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdvZmZpYyBh
cyBTVE0zMiBIRFAgbWFpbnRhaW5lcgo+ID4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFy
ZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTMKPiA+ICAgICAgIEFSTTogZHRzOiBz
dG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDE1Cj4gPiAgICAg
ICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMy
bXAyNQo+ID4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3Ig
SERQIHBpbiBhbmQgYWRkIEhEUCBwaW5jdHJsIG5vZGUKPiA+ICAgICAgIEFSTTogZHRzOiBzdG0z
MjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDE1N2MtZGsyIGJvYXJk
Cj4gPgo+Cj4gUGF0Y2hlcyAxLTQgYW5kIDUtOSBjYW4gZ28gdXBzdHJlYW0gaW5kZXBlbmRlbnRs
eS4gSSBzdWdnZXN0IHRha2luZwo+IHBhdGNoIDEvOSB0aHJvdWdoIHRoZSBHUElPIHRyZWUgYW5k
IHByb3ZpZGluZyBhbiBpbW11dGFibGUgdGFnIHRvCj4gTGludXMgdG8gdGFrZSBwYXRjaGVzIDIt
NCB0aHJvdWdoIHRoZSBwaW5jdHJsIHRyZWUuIExpbnVzOiBhcmUgeW91IE9LCj4gd2l0aCB0aGF0
PwoKWWVzIGdvIGFoZWFkIGlmIHlvdSB3YW50LCBhbiBpbW11dGFibGUgYnJhbmNoIGJhc2VkIG9u
IHY2LjE2LXJjMQppcyB0aGUgYmVzdCBmb3IgbWUsIHRoZW4gSSBwdWxsIHRoYXQgaW4uCgpJIGNv
dWxkIGFsc28ganVzdCBhcHBseSBpdCBhbmQgaG9wZSBmb3IgdGhlIGJlc3QuLi4gaXQgdXN1YWxs
eSB3b3Jrcy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
