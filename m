Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DAAA78B7
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 19:36:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 130B3C78F7D;
	Fri,  2 May 2025 17:36:30 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4B66C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 17:36:28 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4c32f1f7801so638847137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 10:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746207384; x=1746812184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTBU8KDuaw0MZ5mo3TpQxjrSQh6hNnlJMMU6puM7atA=;
 b=t4tBXeDBKp8M+OVZlCwvXwy9oMz9b4gxlHUGtsQIRgyF1Bqv3/ZHgW/lsbLEeaFc0P
 MIRcRIZxipjkzEDzz4UCaMQiENdumlAo4uaTX9pM+dR6nUBie9CGwCpS69BAY+uOZAFG
 M92ZR+ze2A6bIRQ6rfseZDlTO15ZLk8kLiWg+q/Yj04q51lQs531AIHTL9Wh4v2lgeGk
 nmqEXiV9r7+bj4OVGHGfAIxTKM5wjE3tLLtWhz7gBh9FfFnmSgjUo0GYROIxIwgww2N7
 GdW/SuKjy0CafNvxcdjEf8LjBvxDZiPW6G9yobNXwg5wvzKGlSHcQ3TFGqOQFKAFOID1
 KgHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/BXFJ6yTB4z9Mn5jSNV/FyhxuHa2UEljM/15zxh1SIv7KEzflYeCK2oII5svOCreMXTQ0+LbRrM7o2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLkX+GFQsJ86JrD4oEI1AwmRTJf79OAmyDkRXyT1ZtTWQzFXKQ
 bvkqjuThnOMaZn6NyyPUNWJvUyVdRHuHxntXwaqH8MwE40Hvrn+gbEOVOkrO
X-Gm-Gg: ASbGncu6vw7rz7qYGYrnt7QFaZjqI9kjSA4//wbWDQCDlaZC8kZbZqpZnPVVkadyAZ0
 4mm9fNOYYGrx69PG2X0yaHQ6ta3BRYv+6xQLufaLAZ2zKjhWuNZl9w0vXO4AMNLR51UifysDrdw
 Ew7KV4fROvIfcqBtBX84UGkdNx7RGO9+rNOINSohahWsUJaDuLpBIZYLiczedB1Aw3FeTtpa9Tp
 tuCLkZRtYQNxPoc5CWmOnLcz4jHbuspx/EExBgxnLYtJCgd5JoxU5UZuCOKzTd3DSqk1BYjWsDX
 qOqwbQmOWFOeUVGIIXjJc+mwgS5YlOpq/PryJDfb98U/WouDGZrJaFWlHEX9KxQkeRwYqc6OwYd
 lvdg=
X-Google-Smtp-Source: AGHT+IFX9SPDVMW5NWnPZ3WsyVxuJ/gQGWJ82HvEDDU4mg6XbzMvNPBy8t8Au0rB+x+UOV44BnW4FA==
X-Received: by 2002:a05:6102:5493:b0:4da:fc9d:f00 with SMTP id
 ada2fe7eead31-4dafc9d11b5mr2437726137.13.1746207384165; 
 Fri, 02 May 2025 10:36:24 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8780b02018fsm338809241.18.2025.05.02.10.36.22
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 10:36:23 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4c32f1f7801so638826137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 10:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtRR/4Feu4B1prMaTLR1wIkodpmbubSerR+lFCKlD8OqoFdTpnFmYn8t+vHGjDwIHntI1i8fPiGa96Pw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:14a0:b0:4c1:8928:cefb with SMTP id
 ada2fe7eead31-4dafb568c8fmr2928071137.12.1746207382273; Fri, 02 May 2025
 10:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
 <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
In-Reply-To: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 19:36:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
X-Gm-Features: ATxdqUFl-CkBYyUk_oNIA07GJwlne1SaC3Up0FBSpuVt_Yz_D6ZlhAvA_mVeIEQ
Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] clocksource/drivers/renesas-ostm:
 Enable reprobe for all ARM64 SoCs
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCAyIE1heSAyMDI1IGF0IDE4OjEwLCBMYWQsIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDIsIDIw
MjUgYXQgMzozN+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4gT24gRnJpLCAyIE1heSAyMDI1IGF0IDE0OjQ3LCBQcmFiaGFrYXIgPHByYWJo
YWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gPgo+ID4gPiBDaGFu
Z2UgdGhlIE9TVE0gZHJpdmVyJ3MgcHJvYmUgY29uZGl0aW9uIHRvIGBDT05GSUdfQVJNNjRgIHNv
IHRoYXQgdGhlCj4gPiA+IHBsYXRmb3JtIGRyaXZlciB3aWxsIGRlZmVyIGFuZCByZXByb2JlIG9u
IGFueSBBUk02NCBSZW5lc2FzIFNvQyBvbmNlIGl0cwo+ID4gPiByZXNldCBjb250cm9sbGVyIGlz
IGF2YWlsYWJsZS4gUHJldmlvdXNseSwgb25seSBSWi9HMkwgYW5kIFJaL1YySChQKQo+ID4gPiB3
ZXJlIGNvdmVyZWQuCj4gPiA+Cj4gPiA+IEJ5IG1hdGNoaW5nIG9uIGBDT05GSUdfQVJNNjRgLCB0
aGlzIGF2b2lkcyBhZGRpbmcgYSBuZXcgY29uZmlnIGVudHJ5Cj4gPiA+IGZvciBlYWNoIGZ1dHVy
ZSBBUk02NCBSZW5lc2FzIFNvQyB3aXRoIE9TVE0gSVAuIFJaL0ExIGFuZCBSWi9BMiAoQVJNMzIp
Cj4gPiA+IGFyZSB1bmFmZmVjdGVkLXRoZXkgc3RpbGwgdXNlIE9TVE0gYnV0IGRvIG5vdCBkZWZp
bmUgYSByZXNldHMgcHJvcGVydHksCj4gPiA+IHNvIHRoZSBkZWZlcnJlZCByZXByb2JlIG1lY2hh
bmlzbSBpcyB1bm5lY2Vzc2FyeS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJo
YWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gPiBSZXZp
ZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+
ID4gLS0tCj4gPiA+IEhpIEdlZXJ0LAo+ID4gPiBJJ3ZlIHJlc3RvcmVkIHRoZSBSZXZpZXdlZC1i
eSB0YWcgZnJvbSB2MSB3aXRoIHlvdXIgc3VnZ2VzdGlvbnMgYXBwbGllZC4KPiA+ID4gSSBob3Bl
IHlvdSdyZSBva2F5IHdpdGggdGhpcy4KPiA+ID4gQ2hlZXJzLCBQcmFiaGFrYXIKPiA+ID4KPiA+
ID4gdjEtPnYyOgo+ID4gPiAtIEluc3RlYWQgb2YgYWRkaW5nIGNvbmZpZyBmb3IgbmV3IFNvQywg
Y2hhbmdlZCB0aGUgcHJvYmUgY29uZGl0aW9uIHRvCj4gPiA+ICAgYENPTkZJR19BUk02NGAuCj4g
PiA+IC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ID4gPiAtIEFkZGVkIGEgUmV2aWV3ZWQtYnkg
dGFnIGZyb20gR2VlcnQuCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5l
c2FzLW9zdG0uYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJj
ZS9yZW5lc2FzLW9zdG0uYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMKPiA+
ID4gaW5kZXggM2ZjYmQwMmIyNDgzLi42YTU3ODVmOWM5YzEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9jbG9j
a3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+ID4gPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gPgo+ID4gPiAg
VElNRVJfT0ZfREVDTEFSRShvc3RtLCAicmVuZXNhcyxvc3RtIiwgb3N0bV9pbml0KTsKPiA+ID4K
PiA+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19BUkNIX1JaRzJMKSB8fCBkZWZpbmVkKENPTkZJR19B
UkNIX1I5QTA5RzA1NykKPiA+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19BUk02NCkKPiA+Cj4gPiBT
b3JyeSwgSSd2ZSBqdXN0IHJlYWxpemVkIFJaL0ZpdmUgYWxzbyB3YW50cyB0aGlzLgo+ID4KPiBP
dWNoLCBJIG1pc3NlZCB0aGF0IHRvby4KPgo+ID4gIiNpZm5kZWYgQ09ORklHX0FSTSI/Cj4gPgo+
IEltIHdvbmRlcmluZyB3aWxsIGl0IGhhcm0gaWYgd2UgaGF2ZSBpdCBlbmFibGVkIGZvciBBUk0g
dG9vIChJIGRvbnQKPiBoYXZlIFJaL0F4IHRvIHRlc3QgaXQpPwoKSVNUUiBpdCBjYXVzZWQgaXNz
dWVzIG9uIFJaL0F4LgoKT2ggcmlnaHQsIGFuZCB0aG9zZSBnb3QgZml4ZWQgYnkgY29tbWl0IDM3
Mzg1YzA3NzJhNGZjNmIKKCJjbG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVzYXMtb3N0bTogQXZvaWQg
cmVwcm9iZSBhZnRlciBzdWNjZXNzZnVsCmVhcmx5IHByb2JlIikgaW4gdjYuMTAuIFNvIEkgdGhp
bmsgaXQgaXMgc2FmZSB0byBkcm9wIHRoZSAjaWZkZWYKY2hlY2sgaW5zdGVhZCBvZiBleHRlbmRp
bmcgaXQuCgpGVFIsIHdpdGggdGhlIHBsYXRmb3JtIHByb2JlIGVuYWJsZWQsIGFuZCAzNzM4NWMw
NzcyYTRmYzZiIHJldmVydGVkOgoKICAgIC9zb2MvdGltZXJAZTgwM2IwMDA6IHVzZWQgZm9yIGNs
b2NrIGV2ZW50cwogICAgZ2VuaXJxOiBGbGFncyBtaXNtYXRjaCBpcnEgMTYuIDAwMjE1MjAxICh0
aW1lckBlODAzYzAwMCkgdnMuCjAwMjE1MjAxICh0aW1lckBlODAzYzAwMCkKICAgIEZhaWxlZCB0
byByZXF1ZXN0IGlycSAxNiBmb3IgL3NvYy90aW1lckBlODAzYzAwMAogICAgcmVuZXNhc19vc3Rt
IGU4MDNjMDAwLnRpbWVyOiBwcm9iZSB3aXRoIGRyaXZlciByZW5lc2FzX29zdG0gZmFpbGVkCndp
dGggZXJyb3IgLTE2CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
