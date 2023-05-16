Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE370523B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 17:34:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60991C6B441;
	Tue, 16 May 2023 15:34:33 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A05BC6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 15:34:31 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7837bbf690eso1889951241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684251270; x=1686843270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvdEFRzutnbNOOurn60T1w5qVmFLZEprgNl0tF1OCLU=;
 b=tZVNSEGczk6kIRbArRY4cT/mlLGwGfeFEZC4vS6WmlRMOls5d8PmqRrLKMEDSZ7GMO
 eJfDXy/lUNmgKxKOYPOirx0QdqTi2brRnvQas/Q5iwI1OY8cu634PHz2WZkYLlRJ5DM3
 wpOjIXL0HnUomCYNJemdDzBpvfWBBuIytX4NppipIL0y0B/tY0P3UZeGK341HTCTLTRT
 A7zGY3V4+y+0ors7BTT9n3iEnkvkbkSUZvXKu7foGVRPGUjZ8YSkUHn5tyfMzgz0D4oR
 xxIJxVa8F9xH0YeMWc1g+w2j3KWD5t6Ud8hg85Tgt5vTk3utd/0jzDJl93mHAhoZJdgl
 4Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684251270; x=1686843270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvdEFRzutnbNOOurn60T1w5qVmFLZEprgNl0tF1OCLU=;
 b=D9aXOcHrclP6foApLAlGYMrhnLdLzpzJr7LLQeO7wa6gwgsbWD0R5DSvYON+tEArmO
 seidqNc1bnuwNwvqSnBYRI7LgR4Z60j65jhXqaVESsgQW6kMT1fo1Pa/Szs6m5qq2qU2
 u3ZLASJo/sp070eIjEYDOnJMEzVgidlODwzk6RtyA+gcVm7mUyfxKyIyt86BPBh2BFYe
 H8DPnmAy8Olypdcpwy4zbiXIjf8SOouoxu+I/qjBA8dtVN5+yqzJxyic3Tx8Pq+lOG+m
 acXDaBoddEQtbDc2jom1PZSkek6PwCxts1IwZ9c1GFG2ojeYztyU9nHzff5NHpdxBTZq
 HHkw==
X-Gm-Message-State: AC+VfDygw366ul7GERw7JtN5N1GSu5iiZo6NnrU3jQ1kQVwleGTTL9vK
 x0sRhNHrtGyuWx/4yqgUcp//FzCHvloyClbZSGHO+g==
X-Google-Smtp-Source: ACHHUZ5sCb0e2/K3Uf+Pa17albTb/UYZ+MkMOgqzIyHbPaxLBkNnJDii6OJqSgfWeqRTkGUNL2gYv09etbeSxK8EXMo=
X-Received: by 2002:a67:ee55:0:b0:434:711e:e2c4 with SMTP id
 g21-20020a67ee55000000b00434711ee2c4mr15531301vsp.14.1684251270212; Tue, 16
 May 2023 08:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
 <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
 <CACRpkdaJrB1f13LB4aHSWys63448a4NQZORgwdk8z=C8qe-BDA@mail.gmail.com>
In-Reply-To: <CACRpkdaJrB1f13LB4aHSWys63448a4NQZORgwdk8z=C8qe-BDA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 May 2023 17:34:19 +0200
Message-ID: <CAMRc=Mf+RsU6PT7fwm=r9OLbmxNjiv9Ru8HEfpMEAqDN5-0Qig@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE
	GPIO to YAML schema
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

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMTA6MznigK9QTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgNDo1
OOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gPiBB
cHBsaWVkLCB0aGFua3MhCj4KPiBUaGF0IHdvcmtzIC4uLiBidXQgcGF0Y2ggMi8yIGRlcGVuZHMg
b24gdGhpcyBvbmUuICh1c2VzICRyZWYpLgo+IFlvdSdkIGhhdmUgdG8gZ2l2ZSBMZWUgYW4gaW1t
dXRhYmxlIGJyYW5jaCB0aGF0IGhlIGNhbiBwdWxsCj4gYmVmb3JlIGFwcGx5aW5nIHBhdGNoIDIv
MiBzbyBoZSBoYXMgdGhlIGRlcGVuZGVuY3ksIG9yIGxldCBoaW0KPiBhcHBseSBib3RoLgo+Cj4g
WW91cnMsCj4gTGludXMgV2FsbGVpagoKU3VyZToKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgYWM5YTc4NjgxYjkyMTg3NzUxODc2M2JhMGU4OTIwMjI1NDM0OWQxYjoKCiAgTGlu
dXggNi40LXJjMSAoMjAyMy0wNS0wNyAxMzozNDozNSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvYnJnbC9saW51eC5naXQKdGFncy92Ni40LXN0bXBlLWdwaW8KCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2YzE5OTc0ZDFlODNmYmEyY2NhMWNiZWEyZmJmMjUw
ZjA5M2ViNWVkOgoKICBkdC1iaW5kaW5nczogZ3BpbzogQ29udmVydCBTVE1QRSBHUElPIHRvIFlB
TUwgc2NoZW1hICgyMDIzLTA1LTExCjE2OjU4OjA0ICswMjAwKQoKQmFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
