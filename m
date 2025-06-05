Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F42ACF018
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 15:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A8CBC32EB5;
	Thu,  5 Jun 2025 13:16:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8169C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 13:16:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so1278761e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749129406; x=1749734206;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
 b=qI1b19BqQYnTp30pCjEAuuzFDShqSP9y1kUOYj3+LZWYmwQbMJAg8pWU0o8CtmmJ8N
 xchTJ+K7g5GumAUYeFsaYwSIETSLAKPiOg2yJlbkAmjYhQp7Sdq4sVrgprXnv90kxTwr
 GK+SlISdIsl4UbyqMOVexydW+tEio3nbIoCb1CI+tKvts4dD0+8SLuin+LibvqUEK+BH
 XCdfJ8cWSAIFWtjMrgiN48H4/rVCB6M1J/eYgSd3Luglx5U9nRK9aEsXy7L8Ni0epPMm
 lWFE3PpPbRfQCpn5DCJiXqEQDsaBYlkTCbl2wGPfS1awtr0MOHwEUdsR0o3KgBu1jmKa
 Dw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129406; x=1749734206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
 b=gfnK0/Es9hrsgWOeXUQuW/9modLRlOfABH6sUsWmeEo2FMGa//sW9S0Y4HD5AqgFpc
 Fz/pGxUer9pL++7SOydJZhpO6pSyWVGdR4byIZENH7BPG1iixNERltOKrGtRQtTo/rgu
 HT6vXv0omA59WxiGxlH8UW5tYilcEbbg6raghMlcZsnA6qA52p6g1Rnd3clVCR2njX9s
 m+mZkKhFBj5HWeiVIatO1WEHiOoVmWeMwyHZxgOPCOGtopZDBrxc80crnck+3d0B5mzk
 xlsUm2wOoRSJs/tj/XV6Mn8NyW31EJJ+NyoSd9lXiQafkyeq5txIBwNbz7mOrI5rEiFm
 vQmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiIrrniGOi14djwzzqtLiNGYusBTBeE1J20PVfPkul0pNDYMkChQ9FzrH0mW/sB9Ip2uZN7rQt5sozCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVptu9ifdhfCZK2k1z2Vmqbrub+RwDcHIgg40VBCR9VD3DUoMs
 MUlYtBrH4vTTlyBZ4iN98E1TWsnfFBaTaWqmXg/k/QLKmiL8hjY6GEKUJzgw9xYEufkc6K2mw+D
 R0ngwZm7gklKNKk7d2Hh4wYjJQz9f3fvb7FIgaXmXWQ==
X-Gm-Gg: ASbGncsu/0XzuY/bxuPhKSKLSzcbymwQcI1y65mbmMv4po1lFqXLTl1VLujSNXTw5jr
 mlg9lhXXKipzKjjKCc1HnjILSoB3ntLvQGuj/MIlI9VB5uL+0gheqkLNhCPV5Uj8GslM4OxbH9s
 mLiEO0cgMbkhHXcJ3pIKV1VrWSwrqRyFqEuw8T9ZfPwMj4htATB1p1l1BAz4VZmB8=
X-Google-Smtp-Source: AGHT+IG1FLIfsa6ezMp3MccDVHC5XAJOHj0QyInfJVqCTEun1SDxwdcWFvKFJCuA2PNkGlpvqJmb88wRcDaLGqLLsh0=
X-Received: by 2002:a05:6512:10ce:b0:553:37e7:867c with SMTP id
 2adb3069b0e04-55356df2a9emr2071437e87.50.1749129405586; Thu, 05 Jun 2025
 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 15:16:34 +0200
X-Gm-Features: AX0GCFt62eNdDo8nSZ5fnuh_lgkPFAVa1oZqnviWb6rgA9ggBUhsLTEWXYkHUBU
Message-ID: <CAMRc=Mddp=rmogziQ2XrzsO-TiRh9A5U3v8UxJqz_so1otPMLw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/9] Introduce HDP support for STM32MP
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAzOjA04oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDM6MzPi
gK9QTSBDbMOpbWVudCBMZSBHb2ZmaWMKPiA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4g
d3JvdGU6Cj4KPiA+IENsw6ltZW50IExlIEdvZmZpYyAoOSk6Cj4gPiAgICAgICBncGlvOiBtbWlv
OiBhZGQgQkdQSU9GX05PX0lOUFVUIGZsYWcgZm9yIEdQTyBncGlvY2hpcAo+ID4gICAgICAgZHQt
YmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQCj4gPiAgICAgICBwaW5jdHJs
OiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKPiA+ICAgICAgIE1BSU5UQUlORVJTOiBhZGQg
Q2zDqW1lbnQgTGUgR29mZmljIGFzIFNUTTMyIEhEUCBtYWludGFpbmVyCj4KPiBDYW4gSSBhcHBs
eSB0aGUgZHJpdmVyIGFuZCBiaW5kaW5ncyBwYXRjaGVzIDEtNCBzZXBhcmF0ZWx5Cj4gZnJvbSB0
aGUgcmVzdCBvZiB0aGUgc2VyaWVzPwo+Cj4gPiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBI
YXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxMwo+ID4gICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUKPiA+ICAg
ICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3Rt
MzJtcDI1Cj4gPiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBhbHRlcm5hdGUgcGlubXV4IGZv
ciBIRFAgcGluIGFuZCBhZGQgSERQIHBpbmN0cmwgbm9kZQo+ID4gICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9h
cmQKPgo+IE9yIGRvZXMgaXQgbmVlZCB0byBiZSBtZXJnZWQgYWxvbmcgd2l0aCB0aGVzZT8KPgoK
V291bGQgeW91IG1pbmQgbWUgdGFraW5nIHBhdGNoIDEvOSB0aHJvdWdoIHRoZSBHUElPIHRyZWUg
YXMgSSdsbCBoYXZlCnNvbWUgZ3Bpby1tbWlvIHJld29yayBnb2luZyBvbiBuZXh0IGN5Y2xlPyBJ
IHdpbGwgdGhlbiBzZW5kIHlvdSBhbgppbW11dGFibGUgdGFnIHRvIHB1bGwuCgpCYXJ0b3N6Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
