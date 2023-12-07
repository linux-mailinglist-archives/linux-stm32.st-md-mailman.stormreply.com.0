Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442480850D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 10:59:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F977C6C85F;
	Thu,  7 Dec 2023 09:59:15 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D364C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 09:59:14 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso850624276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701943153; x=1702547953;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6K465pI4zAWlwCamlpDG3HILRkV9gPVUA692gl6Sek=;
 b=dYJq/E3r6Mamf2jA8t4ghKMFB4yDQflmaXsD10kWd09GIe/U6C/jXqRLlJrUDmb0Rd
 o6gJNi6f46DJn4GgswguFmKM5ageHvi+5KIffhYVe218w8xKPVUJEIVyD/Q2+g6f8jqV
 EZBPpeMEYrL5EQv10nHWNzV95f6OcYpKmuJ3bndriuBnAsXqt0/zer3Y8/90SEx9XH6w
 MalLAZvs/XX/EJC1/5FCLm8qebIKl7/3LyYVVnGcNCsoaaOaGdLJsUBHx0c1Nvo/WNZF
 dvzda3ZXWH8QCNASrs9Zb7Ef7gEf940gMHNeuw7MNQbZ6N6tBtkIDJM86dGMWG0gSsTt
 p9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701943153; x=1702547953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6K465pI4zAWlwCamlpDG3HILRkV9gPVUA692gl6Sek=;
 b=EDlyvQPzQNdl5mfdnn14DdMfLOIyqleMhE8G0nYeSLAnkx4TbHl9x2YlYoR9RKnd+T
 fSsGjBtAN8n8u96/UpWIQ0FJGxivG+b1Nfkx5ix39W0fWacY/XOf04vpN/qIzXo82CoX
 80fE8BzrkQbz7rwn3HL991EsqM2/xXbVTrC+zrXyu6uaf/dlLmZD87DDkXMFcSUzlfvR
 j4XAjOk1a8ognUy4OUyu2FmWR2WSHc+xVyOJ4dtt0jA7+OKO1hz8x8CRPayGV8xop+ND
 in2sFKZjYqXfeGwp28k/FdsjSWs+IWBMZWfz/Z3Ng9ahK2GAtyZF5gQcewM49h0/51bC
 6PGg==
X-Gm-Message-State: AOJu0YzJ6uelnbZrTT3c4iXOL+c6eHieqMdUEvbT8bIYFi48UG1PgOD7
 mU3HyT9hdtqt21lGhVRfEqI9f6Nc+v908ISO2IWcBA==
X-Google-Smtp-Source: AGHT+IHcD5fIoEp/CcfEh8HnMUMO2l3b3jKL0vWFNg+litPEiRW5cySzVq5LBwYkPm8QSog0pjXe77K4eJFUFT+j6Y4=
X-Received: by 2002:a25:b8b:0:b0:db7:dacf:ed91 with SMTP id
 133-20020a250b8b000000b00db7dacfed91mr830253ybl.114.1701943153500; Thu, 07
 Dec 2023 01:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
 <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:59:24 +0100
Message-ID: <CACRpkdaqZ4+oefozT863YbsY7e1kVJvSMBuiFmwhKSeXtPsE2w@mail.gmail.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level
	interrupts
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

T24gVGh1LCBEZWMgNywgMjAyMyBhdCAxMDo1NuKAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBEZWMgNCwgMjAyMyBhdCA5OjM14oCv
UE0gQmVuIFdvbHNpZWZmZXIKCj4gPGJlbi53b2xzaWVmZmVyQGhlZnJpbmcuY29tPiB3cm90ZToK
Pgo+ID4gVGhlIFNUTTMyIGRvZXNuJ3Qgc3VwcG9ydCBHUElPIGxldmVsIGludGVycnVwdHMgaW4g
aGFyZHdhcmUsIHNvIHRoZQo+ID4gZHJpdmVyIHRyaWVzIHRvIGVtdWxhdGUgdGhlbSB1c2luZyBl
ZGdlIGludGVycnVwdHMsIGJ5IHJldHJpZ2dlcmluZyB0aGUKPiA+IGludGVycnVwdCBpZiBuZWNl
c3NhcnkgYmFzZWQgb24gdGhlIHBpbiBzdGF0ZSBhZnRlciB0aGUgaGFuZGxlcgo+ID4gZmluaXNo
ZXMuCj4gPgo+ID4gQ3VycmVudGx5LCB0aGlzIGZ1bmN0aW9uYWxpdHkgZG9lcyBub3Qgd29yayBi
ZWNhdXNlIHRoZSBpcnFjaGlwIHVzZXMKPiA+IGhhbmRsZV9lZGdlX2lycSgpLCB3aGljaCBkb2Vz
bid0IHJ1biB0aGUgaXJxX2VvaSgpIG9yIGlycV91bm1hc2soKQo+ID4gY2FsbGJhY2tzIGFmdGVy
IGhhbmRsaW5nIHRoZSBpbnRlcnJ1cHQuIFRoaXMgcGF0Y2ggZml4ZXMgdGhpcyBieSB1c2luZwo+
ID4gaGFuZGxlX2xldmVsX2lycSgpIGZvciBsZXZlbCBpbnRlcnJ1cHRzLCB3aGljaCBjYXVzZXMg
aXJxX3VubWFzaygpIHRvIGJlCj4gPiBjYWxsZWQgdG8gcmV0cmlnZ2VyIHRoZSBpbnRlcnJ1cHQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVuIFdvbHNpZWZmZXIgPGJlbi53b2xzaWVmZmVyQGhl
ZnJpbmcuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KPgo+IE1hcmMgWiBjYW4gYXBwbHkgYWxsIHRoZSBwYXRjaGVzIHRvIHRoZSBp
cnEgdHJlZSBvbmNlIGhlJ3MgaGFwcHkKPiB3aXRoIHRoZSBzb2x1dGlvbi4KCkkgc2VlIE1hcmMg
c3RvcHBlZCBkb2luZyBpcnFfY2hpcHMsIHNvIHRnbHggdGhlbiEKCllvdXJzLApMaW51cyBXYWxs
ZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
