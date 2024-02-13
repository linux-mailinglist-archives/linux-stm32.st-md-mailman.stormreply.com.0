Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65172852DC7
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 11:23:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B1B1C6C83D;
	Tue, 13 Feb 2024 10:23:26 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14819C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 10:23:25 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4c0232861afso841895e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707819804; x=1708424604;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6kghJqnnvzrivpJN4qYxQyxAg/hb6vlcHjDQwTaVHk=;
 b=TUo0jBQaPJyWwCv8a9zMMwm4b+kyEMHYcz6NAITOIlunfhVzmFdET4YtRAWlesTcIi
 mHrqLHjlZSMes6fVYAOWY+7h7lyN9eTvUAWUD9M3IAr4skQADLQYFLE2ihfAGrEHHf0b
 oHTUcPLaHvHCrKGvwLowSnrvgEcdPvtPV225ks6gemC+iDjAfzwNByWUkaD4rm05zxIJ
 x4MlNf04x8GS29mq6HLP0dpIaIg2qp9VdeXxi6YavojXN6ccC1VWRF8IKIGS0xj5Tdx3
 vp6blF/aTNn8FlCs/8oyDcg5qvfOcQjTxkMm/B1qYHv5GDrdAUj+6fNtdQjcxXXkV4Jc
 Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707819804; x=1708424604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6kghJqnnvzrivpJN4qYxQyxAg/hb6vlcHjDQwTaVHk=;
 b=UL9LXXkBeOCyg8dAv9CvR9dlJUe8ZZRDulwb4OZZnNECH7OJqf5x3+/Xoy8kER33en
 kJQ5JxLJXMdgeTB2cIvk1CPlH6Lw0xTKpMJCfQZr2cte5sbCYkczdCJ246mZI1eHRLfu
 rVQzaa+C1St/8pQg27+yxClJ+3FZeDDs2F6pXyG8yZo01zrBPWoDb/N05AABOF49Lga+
 +rYt8Vav9UVv2XxnOcNT99ci1No8ziLhNRB8rG7yL9PcLNONjnIMZMVBsXR3z+BsBUWO
 x8tzInywqBlFLg6vLQLmI5Jg75F0y8qQe+7UYDp9fxfy4hF05pa+uqDQBAhEWTuCNI5y
 GYrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLI2JnJI1infYPP/c+u6cRfA5+pMDnDrFj/cKUnRaJiaivJaiSxKjMI9m2SEShNmrxnBuzK7lkN1x07ZcnO5jD1MHqXy0dwGf5smKrlUljDRUDxU9bvGep
X-Gm-Message-State: AOJu0YzYa2KG5QjsIDpKcFkF0QHc17IjkWHz4MLShMJl80LB/67PM+hm
 uPbpemnrm3DKSEiASsCaQwRkkxQbuZC4VM6tYl6ymQvGR1JkAHV3B+MysBuMxH08Hp9ehxVt7JL
 6dZJdGPcZYdzhuq74bXfNZAEyz1A=
X-Google-Smtp-Source: AGHT+IGxPHOACF2JseXG6DKdDUst+O0caNbXHJGDrvhj/rQJCEfV2PnlmnoNFdOp6iYQAL14j19DKNfZ5oOrEiMlHBI=
X-Received: by 2002:a1f:cbc3:0:b0:4c0:34e8:d55d with SMTP id
 b186-20020a1fcbc3000000b004c034e8d55dmr5118655vkg.11.1707819803720; Tue, 13
 Feb 2024 02:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Feb 2024 10:22:57 +0000
Message-ID: <CA+V-a8tN-qn8zuimte=-riahJBWGgGi8i5botNfWqdWwJ7w-4g@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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

SGkgRGFuaWVsLAoKT24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgOToyOeKAr1BNIFByYWJoYWthciA8
cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVGhlIE9TVE0g
YmxvY2sgb24gdGhlIFJaL0ZpdmUgU29DIGlzIGlkZW50aWNhbCB0byBvbmUgZm91bmQgb24gdGhl
IFJaL0cyVUwKPiBTb0MuICJyZW5lc2FzLHI5YTA3ZzA0My1vc3RtIiBjb21wYXRpYmxlIHN0cmlu
ZyB3aWxsIGJlIHVzZWQgb24gdGhlIFJaL0ZpdmUKPiBTb0Mgc28gdG8gbWFrZSB0aGlzIGNsZWFy
IGFuZCB0byBrZWVwIHRoaXMgZmlsZSBjb25zaXN0ZW50LCB1cGRhdGUgdGhlCj4gY29tbWVudCB0
byBpbmNsdWRlIFJaL0ZpdmUgU29DLgo+Cj4gTm8gZHJpdmVyIGNoYW5nZXMgYXJlIHJlcXVpcmVk
IGFzIGdlbmVyaWMgY29tcGF0aWJsZSBzdHJpbmcgInJlbmVzYXMsb3N0bSIKPiB3aWxsIGJlIHVz
ZWQgYXMgYSBmYWxsYmFjayBvbiBSWi9GaXZlIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiAtLS0K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsb3N0bS55
YW1sIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgpHZW50bGUgcGluZyEKCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3RtLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3RtLnlhbWwK
PiBpbmRleCA3MjA3OTI5ZTVjZDYuLjhiMDZhNjgxNzY0ZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3RtLnlhbWwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3RtLnlh
bWwKPiBAQCAtMjMsNyArMjMsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAtIGVudW06Cj4gICAg
ICAgICAgICAtIHJlbmVzYXMscjdzNzIxMDAtb3N0bSAgIyBSWi9BMUgKPiAgICAgICAgICAgIC0g
cmVuZXNhcyxyN3M5MjEwLW9zdG0gICAjIFJaL0EyTQo+IC0gICAgICAgICAgLSByZW5lc2FzLHI5
YTA3ZzA0My1vc3RtICMgUlovRzJVTAo+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0My1v
c3RtICMgUlovRzJVTCBhbmQgUlovRml2ZQo+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0
NC1vc3RtICMgUlovRzJ7TCxMQ30KPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNTQtb3N0
bSAjIFJaL1YyTAo+ICAgICAgICAtIGNvbnN0OiByZW5lc2FzLG9zdG0gICAgICAgICMgR2VuZXJp
Ywo+IC0tCj4gMi4zNC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
