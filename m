Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF447BACCDC
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 14:23:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 551BFC424C3;
	Tue, 30 Sep 2025 12:23:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FC20C3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 12:23:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so50415621fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759235017; x=1759839817;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
 b=KQDScV/tTo3cLVXsyuplaIo03PTJY88EQnOFGYPKBrH7sBddGIqdKhvt3VUMzDjubY
 307ZezmIv7p6Q1hF2KjUM2UqPhUy3T8ENNfSp2nl/5BYKyGka5j9Mtp4CYrwfzGEL9mb
 9NrYR9JBULNPbpQ/fKl7WD2ZNw5cdGm2inXffqtnJv2pJtOUbwC3QRErffPty7ijD0F8
 vw6PT6M6tYXuEDxRSdWWcqndANuola1l7LUppx5Xjkf7T5jXY9YM12Hmh4QCrpGM3/7x
 Dtzix+9qVPWGcQTkMlEIXo469GRKqjvxmn0/Ti0nQ86Tir5E5psf5+u71BfIQ+hUQEmf
 9wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759235017; x=1759839817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
 b=XhBj8vBHlCV+32drkZ9Ezr2mtzoeUfoaPTsLySVXBGLck5oU6/Uay3NRG2goW3eehH
 ZolncnpJEyNnRr44n5OiXTLPlSzmDY9DT/Wn+CFxdA0LjVq73HSdBaypHu9wJRNfE80u
 93UysGauNCb7x6zu0Axl2g4YJbK7FLjXSaGNZFRIpOKmloVFUuYrIBS187KzK5tIHT56
 OBfJ9bdB+Pw42cCoh+JQk9VbpyiA9i2HNfpS5Yc89D4G44LVkVYtUDmdqIMRceZ5yflx
 IYD+bM+lJ2JI6FHLVMPf+bOmwdjl4AB5/zDvR9UoWXPBZ4fCo3rZmbkGUavksprhqtfr
 TDrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhG+KB3VAqZe4Irz4aiDfIfxZLjZ0jASkFCID4m+9JodgrdCwaKaoS2W6ZxO5S0/TjINT9asR82zJacg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKH3tZou8B3a65/OLrZMF1pY/RY1nG3uy4IXNpPiqslg4PQYOm
 rSZMO378PwdnwFGbpTX+cr4UbSzhPgHztL0n4R0jB0GgG6mHIo7LAk1QsaK8U9RpWdyGp26gsG/
 5FLKDWuD3uWwa5dzs+dHIPWzUsO7N4ffwGPK2T4sSJg==
X-Gm-Gg: ASbGncvNEzmY0FjBJS1mgdpT/6Nt3dHHCIK6QkimK8d+8GJ8r08CNlUoBdBSwVNEkea
 4GnK9Gs0rW2eg5M5qPgMF9Exm7RkpPEheauEzavi8ZXAgLRcF04M5KgbMP94YlXhsi8THNmvyiv
 02m7NCgI86+gvU3JyJXBwR5DgIh4neUW5oG00/PomTrDa+uUIPsvDMuCNzss5BO9xNMiNyhsRe0
 FL939z9hj+Z6rDrbWw2N/UlljOw/D5gcjhhFBTEtQ==
X-Google-Smtp-Source: AGHT+IGSs2X9ijyFw3JfP/dbcoV1x5reGxsDzHTGImekBQcST65Fp+vF2qwnOoDfoooKD5etndPOpCBR4hOz+YmTkyE=
X-Received: by 2002:a05:651c:1541:b0:363:f65f:ddcb with SMTP id
 38308e7fff4ca-36f7d8c0278mr61009281fa.18.1759235016634; Tue, 30 Sep 2025
 05:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-3-antonio.borneo@foss.st.com>
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:23:25 +0200
X-Gm-Features: AS18NWDLuT_uRRtCvqxguuDTeW5zZ6aEk6iy9iHLeu2I6jlVchqTLlkeIzQ-p-Y
Message-ID: <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/9] dt-bindings: pincfg-node: Add
	property "skew-delay-direction"
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

SGkgQW50b25pbywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCkFuZCBzb3JyeSB0aGF0IGl0IHRh
a2VzIHNvIGxvbmcgZm9yIG1lIHRvIHJldmlldyBpdCEgOigKCk9uIEZyaSwgU2VwIDUsIDIwMjUg
YXQgMzo1NuKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4g
d3JvdGU6Cgo+IEFkZCB0aGUgcHJvcGVydHkgInNrZXctZGVsYXktZGlyZWN0aW9uIiB0byBzcGVj
aWZ5IG9uIHdoaWNoIHBpbidzCj4gZGlyZWN0aW9uIChlaXRoZXIgaW5wdXQsIG91dHB1dCBvciBi
b3RoKSB0aGUgdmFsdWUgb2YgdGhlIGdlbmVyaWMKPiBwcm9wZXJ0eSAnc2tldy1kZWxheScgYXBw
bGllcy4KPiBGb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgJ3NrZXctZGVsYXknIGFwcGxpZXMg
b24gYm90aCBpbnB1dCBhbmQKPiBvdXRwdXQgZGlyZWN0aW9ucyB3aGVuIHRoZSBuZXcgcHJvcGVy
dHkgaXMgbm90IHByZXNlbnQgb3IgaGFzCj4gdmFsdWUgJzAnLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgooLi4uKQo+ICsgIHNr
ZXctZGVsYXktZGlyZWN0aW9uOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyCj4gKyAgICBlbnVtOiBbMCwgMSwgMl0KPiArICAgIGRlZmF1bHQ6IDAK
PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgIDA6IHNrZXctZGVsYXkgYXBwbGllcyB0byBi
b3RoIGlucHV0IGFuZCBvdXRwdXQgZGlyZWN0aW9ucwo+ICsgICAgICAxOiBza2V3LWRlbGF5IGFw
cGxpZXMgb25seSB0byB0aGUgb3V0cHV0IGRpcmVjdGlvbgo+ICsgICAgICAyOiBza2V3LWRlbGF5
IGFwcGxpZXMgb25seSB0byB0aGUgaW5wdXQgZGlyZWN0aW9uCgpVbmZvcnR1bmF0ZWx5IEkgZG9u
J3QgdGhpbmsgdGhpcyB3aWxsIHdvcmssIGJlY2F1c2Ugc2tldy1kZWxheQpoYXMgYSB2YWx1ZSwg
YW5kIHdpdGggdGhpcyBzY2hlbWUgd2UgY2FuIG9ubHkgc3BlY2lmeSB0aGF0IHdlCndhbnQgdGhp
cyB2YWx1ZSB0byBhZmZlY3QgYm90aCBpbi9vdXQsIG9ubHkgaW4gb3Igb25seSBvdXQuCgpXaGF0
IGhhcHBlbnMgd2hlbiBzb21lb25lIHdhbnQgdG8gY29uZmlndXJlIGRpZmZlcmVudApza2V3IGRl
bGF5IGZvciBpbnB1dCBhbmQgb3V0cHV0PwoKSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gYWRkOgoK
c2tldy1kZWxheS1pbnB1dCA9IDx1MzI+Owpza2V3LWRlbGF5LW91dHB1dCA9IDx1MzI+OwoKU28g
dGhlIGRyaXZlcnMgdGhhdCBuZWVkIHRoaXMgZXhwbGljaXRseSBzcGVjaWZpZWQgd2lsbCBuZWVk
CnRvIGp1c3QgZGVmaW5lIG9uZSBvZiB0aGVzZSBpbnN0ZWFkLgoKSWYgeW91IHdhbnQgdG8gYmUg
dmVyeSBkZXRlcm1pbmVkLCBtYWtlIHRoZSBzY2hlbWEKbm90IGFjY2VwdCBza2V3LWRlbGF5IGlm
IGVpdGhlciBza2V3LWRlbGF5LWlucHV0Cm9yIHNrZXctZGVsYXktb3V0cHV0IGlzIHNwZWNpZmll
ZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
