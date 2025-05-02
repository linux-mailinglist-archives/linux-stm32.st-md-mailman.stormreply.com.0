Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2451AA7BB8
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 23:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A3D8C7128F;
	Fri,  2 May 2025 21:56:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7226BCFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 21:56:11 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso2592140f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746222971; x=1746827771;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
 b=b3k2KzmsCMc56t/TFzwD9TCD6A+j8UzLApd6Cbnlj2yzL+2Lb9DkCtEuRfL8tjj8Gn
 Dqn0EOgJHsATLUG6izUNIWRTZZa1XUQ0+5GYPwS2dAHj5vT9q4tesRwR2x/ZwfySHakb
 ToNNnHJyuSjmQFQRhMaAXpBvcgeChnq64jMVzbfIoLt2L7EtPRdbsbok8/FkrGaPi1Cm
 Or93QWduFJ2p5xY4pfdHsyRViGJGDf2Fk/1BswkbzUDujw0vGHKRzXO3ojQ34sWGm6Gt
 GXC77mNf2J/n7/V8eGSj68Ke2+sz0nnZB/V2dJ4/wgjzizwotkjnwoUkP5sPBYf6BPx3
 oeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746222971; x=1746827771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
 b=pXyXFKs4Tjf8XdP9C0WcEyzEq6Hw/cZIuUtzhNp+SfAOOXf95mCCldDSw58YpAAl11
 ehEtPrTItnEE4y/4eTyLAWI+RI7nHCsn4D0oQZAHcYXmJC8Nzbq6rUHDrUQVI2crutdN
 3utLLzkLq+LG1Tr+erqjCZusgKBhJTKtzuY/DxpPxtXBtLPhCejfN4RaIRu+NAO8DQqL
 FObeaEaszRmxI38bS3KODUqC6gY6+EkigjDDspSBGeAWoh7A+GvMO2hLHHIiobbozeky
 FSmSyz9ez2x1fMiGkFTy4ZwwsZeEjDxlyi0h2BIFoyuEmFQqc6BJ7QmhQ47qxguoXhxe
 Zcbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtfPguYAKIuMkJ8Xq4prF1DZFR1249A993FuiK3abNgDw28i9yS3T5X2j9TWohXJ/WZfgq5Rtbhy9adg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK2YXHdqJy4F6ZrsySnPy5+lab7l6mc0pXefXF6TyXKhF4H/Rt
 h8E561nNDUnjANvpvauv5Fd1kalzQ6va2hh2WksZkh3A+cMOR3Ewit8sh53Jgeqa2B2tZ8Xf30l
 dCnSjHmCM+3iQCJSjonyDh5yXH54=
X-Gm-Gg: ASbGnctDsyltqUPsRjLgl0xObsfJrpvCc8exwVr221t2GM6YuYc5t4LrdzYAJmwTjA5
 5LV1TgZmHNxRDCg9DebkCl+S1FZ0sf637rwKaLeC1X2OIc1Jnez+fitxvniEDzYro1Stx4CZ+zP
 gOG7/W53SWPqyRHf2eXVKYOFdDQbFr7l1syA==
X-Google-Smtp-Source: AGHT+IFl+MRsV9J9nUptoXNbXZiIMrW6eP7y6f3wW7mfpaU2h2XmONvIp5/7UcNAkL9ozkcXMiTtg4dCMT3oBCA84EE=
X-Received: by 2002:a5d:47a6:0:b0:39f:b604:4691 with SMTP id
 ffacd0b85a97d-3a09cf6af9emr452963f8f.58.1746222970638; Fri, 02 May 2025
 14:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
 <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
 <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 22:55:44 +0100
X-Gm-Features: ATxdqUE8T1Mu-5AOrIjt5lex4I3-3FPgX7a_P5_IZCEHoJrMGwqdxjz8WFgR-To
Message-ID: <CA+V-a8tsjXVirSK8_Jnx6MQpkSPbxfiri_8b4-gU8hoKfVBZgw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

SGkgR2VlcnQsCgpPbiBGcmksIE1heSAyLCAyMDI1IGF0IDY6MzbigK9QTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+
IE9uIEZyaSwgMiBNYXkgMjAyNSBhdCAxODoxMCwgTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDIsIDIwMjUgYXQgMzozN+KA
r1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4g
PiBPbiBGcmksIDIgTWF5IDIwMjUgYXQgMTQ6NDcsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gPgo+ID4gPiA+IENoYW5nZSB0
aGUgT1NUTSBkcml2ZXIncyBwcm9iZSBjb25kaXRpb24gdG8gYENPTkZJR19BUk02NGAgc28gdGhh
dCB0aGUKPiA+ID4gPiBwbGF0Zm9ybSBkcml2ZXIgd2lsbCBkZWZlciBhbmQgcmVwcm9iZSBvbiBh
bnkgQVJNNjQgUmVuZXNhcyBTb0Mgb25jZSBpdHMKPiA+ID4gPiByZXNldCBjb250cm9sbGVyIGlz
IGF2YWlsYWJsZS4gUHJldmlvdXNseSwgb25seSBSWi9HMkwgYW5kIFJaL1YySChQKQo+ID4gPiA+
IHdlcmUgY292ZXJlZC4KPiA+ID4gPgo+ID4gPiA+IEJ5IG1hdGNoaW5nIG9uIGBDT05GSUdfQVJN
NjRgLCB0aGlzIGF2b2lkcyBhZGRpbmcgYSBuZXcgY29uZmlnIGVudHJ5Cj4gPiA+ID4gZm9yIGVh
Y2ggZnV0dXJlIEFSTTY0IFJlbmVzYXMgU29DIHdpdGggT1NUTSBJUC4gUlovQTEgYW5kIFJaL0Ey
IChBUk0zMikKPiA+ID4gPiBhcmUgdW5hZmZlY3RlZC10aGV5IHN0aWxsIHVzZSBPU1RNIGJ1dCBk
byBub3QgZGVmaW5lIGEgcmVzZXRzIHByb3BlcnR5LAo+ID4gPiA+IHNvIHRoZSBkZWZlcnJlZCBy
ZXByb2JlIG1lY2hhbmlzbSBpcyB1bm5lY2Vzc2FyeS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KPiA+ID4gPiAtLS0KPiA+ID4gPiBIaSBHZWVydCwKPiA+ID4gPiBJJ3Zl
IHJlc3RvcmVkIHRoZSBSZXZpZXdlZC1ieSB0YWcgZnJvbSB2MSB3aXRoIHlvdXIgc3VnZ2VzdGlv
bnMgYXBwbGllZC4KPiA+ID4gPiBJIGhvcGUgeW91J3JlIG9rYXkgd2l0aCB0aGlzLgo+ID4gPiA+
IENoZWVycywgUHJhYmhha2FyCj4gPiA+ID4KPiA+ID4gPiB2MS0+djI6Cj4gPiA+ID4gLSBJbnN0
ZWFkIG9mIGFkZGluZyBjb25maWcgZm9yIG5ldyBTb0MsIGNoYW5nZWQgdGhlIHByb2JlIGNvbmRp
dGlvbiB0bwo+ID4gPiA+ICAgYENPTkZJR19BUk02NGAuCj4gPiA+ID4gLSBVcGRhdGVkIGNvbW1p
dCBtZXNzYWdlCj4gPiA+ID4gLSBBZGRlZCBhIFJldmlld2VkLWJ5IHRhZyBmcm9tIEdlZXJ0Lgo+
ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jIHwg
MiArLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVz
YXMtb3N0bS5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+ID4gPiA+IGlu
ZGV4IDNmY2JkMDJiMjQ4My4uNmE1Nzg1ZjljOWMxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsb2Nr
c291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiA+ID4gQEAgLTIyNSw3ICsyMjUsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBvc3RtX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiA+ID4gPgo+ID4g
PiA+ICBUSU1FUl9PRl9ERUNMQVJFKG9zdG0sICJyZW5lc2FzLG9zdG0iLCBvc3RtX2luaXQpOwo+
ID4gPiA+Cj4gPiA+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19BUkNIX1JaRzJMKSB8fCBkZWZpbmVk
KENPTkZJR19BUkNIX1I5QTA5RzA1NykKPiA+ID4gPiArI2lmIGRlZmluZWQoQ09ORklHX0FSTTY0
KQo+ID4gPgo+ID4gPiBTb3JyeSwgSSd2ZSBqdXN0IHJlYWxpemVkIFJaL0ZpdmUgYWxzbyB3YW50
cyB0aGlzLgo+ID4gPgo+ID4gT3VjaCwgSSBtaXNzZWQgdGhhdCB0b28uCj4gPgo+ID4gPiAiI2lm
bmRlZiBDT05GSUdfQVJNIj8KPiA+ID4KPiA+IEltIHdvbmRlcmluZyB3aWxsIGl0IGhhcm0gaWYg
d2UgaGF2ZSBpdCBlbmFibGVkIGZvciBBUk0gdG9vIChJIGRvbnQKPiA+IGhhdmUgUlovQXggdG8g
dGVzdCBpdCk/Cj4KPiBJU1RSIGl0IGNhdXNlZCBpc3N1ZXMgb24gUlovQXguCj4KPiBPaCByaWdo
dCwgYW5kIHRob3NlIGdvdCBmaXhlZCBieSBjb21taXQgMzczODVjMDc3MmE0ZmM2Ygo+ICgiY2xv
Y2tzb3VyY2UvZHJpdmVycy9yZW5lc2FzLW9zdG06IEF2b2lkIHJlcHJvYmUgYWZ0ZXIgc3VjY2Vz
c2Z1bAo+IGVhcmx5IHByb2JlIikgaW4gdjYuMTAuIFNvIEkgdGhpbmsgaXQgaXMgc2FmZSB0byBk
cm9wIHRoZSAjaWZkZWYKPiBjaGVjayBpbnN0ZWFkIG9mIGV4dGVuZGluZyBpdC4KPgpUaGFua3Mg
Zm9yIHRoZSBjb25maXJtYXRpb24uIEknbGwgZHJvcCB0aGUgaWZkZWYgY2hlY2tzIGFuZCBzZW5k
IGEgdjMgZm9yIHRoaXMuCgo+IEZUUiwgd2l0aCB0aGUgcGxhdGZvcm0gcHJvYmUgZW5hYmxlZCwg
YW5kIDM3Mzg1YzA3NzJhNGZjNmIgcmV2ZXJ0ZWQ6Cj4KPiAgICAgL3NvYy90aW1lckBlODAzYjAw
MDogdXNlZCBmb3IgY2xvY2sgZXZlbnRzCj4gICAgIGdlbmlycTogRmxhZ3MgbWlzbWF0Y2ggaXJx
IDE2LiAwMDIxNTIwMSAodGltZXJAZTgwM2MwMDApIHZzLgo+IDAwMjE1MjAxICh0aW1lckBlODAz
YzAwMCkKPiAgICAgRmFpbGVkIHRvIHJlcXVlc3QgaXJxIDE2IGZvciAvc29jL3RpbWVyQGU4MDNj
MDAwCj4gICAgIHJlbmVzYXNfb3N0bSBlODAzYzAwMC50aW1lcjogcHJvYmUgd2l0aCBkcml2ZXIg
cmVuZXNhc19vc3RtIGZhaWxlZAo+IHdpdGggZXJyb3IgLTE2Cj4KQ2hlZXJzLApQcmFiaGFrYXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
