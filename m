Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFF99F851
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 22:55:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB63C78030;
	Tue, 15 Oct 2024 20:55:25 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78174C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 20:55:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb470a8b27so2319281fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729025718; x=1729630518;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OveL9OkkUYT89uwk8KUSuuswqvLtHm2FwK5hFo31JeI=;
 b=KC8f0D0fC6QyVoSaBcf3ABYQIPpoT0SkkMUwYHb3QVB+ONFxDU0kKzfUZIOXXHAQjr
 aYa3xmzeIBbbWzJbrx3FCIv+lGqfwKS9hi9cBr7W4BVDmznMxfltKmgXcK1ffcUnou9z
 prAB0O68GvrK5lixZNbf71nPQ83x7BHKUi5mQZxia+f4BVenW0ErLfvEpKyymlE15BOc
 24NFGSRF79bjblxoVvDIAKvWcyBcQwLdfFsGww5euq0TplU/6xNxqTtKBju/tIv9P/r4
 HyBCe8R/ezwq8eRzTw0UXVtJm3Ffb8IYf2XyZrSp86rJ7wz4JlMMY0ZT4kbznmAWQ8s4
 pczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729025718; x=1729630518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OveL9OkkUYT89uwk8KUSuuswqvLtHm2FwK5hFo31JeI=;
 b=fxjUINdZzVf6WdyxqfGSHDRZEGYuK7E8tbrhKA9tD8kmH2GtqNUKL02881fIkzfhBp
 A9PMIGsFqcObqUSFjao0Zp6jtW95hz27/37HJyELZFgxjA5PE4RjyAInHV0H4e5anczA
 fqsVPbWm1QRjUiFdOsdck8r4fUqbAtlywGsEGL9hDjbgzfAKMTRJAlCp7B+q679Ljnk4
 TTRnOzaew60TcgFUuu4CPOikY3y8kkeJMtbYLs5faeCWQYNmpbaD/8kbOKRW9nhcW9z5
 NP6Qvot29wL/lWiKVufsd3OeupxmsorRfd27xecTvLKLagCHj41PhzXO3KsFP9UGonYj
 CdWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIV/UpMeDtqIJA35kg1Y3rizst9Ac29FjI4tXbRFSS7EBV1o+LVhwchb94DPc2zYwrVOWoM3M+T+Ixnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuz1zLjFTN0YzW2HloH2ngpg1b/pZxKDqM2g66sFRSbWBSUKnN
 tKtZPEiLYmsUYqkV8+ns21Nv4XDGPvnolmNhkcB6xa/1wgaX0UTy06cEGTJ2HwuZHtTSH8tIWBq
 D3/9/p1adXoHm7/SJl0iY0dYwJVzMz9I1dLwNag==
X-Google-Smtp-Source: AGHT+IFOOonFjuOmrmQsFSHFjFOQ9JFHw7vA8rdJ8lawX19nbkfAelelU/UtUtsKBZt648QElRUS59pX21IXDAakbJ0=
X-Received: by 2002:a2e:a587:0:b0:2fb:62ad:89e4 with SMTP id
 38308e7fff4ca-2fb62ad8d54mr3977931fa.19.1729025717399; Tue, 15 Oct 2024
 13:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
In-Reply-To: <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 22:55:05 +0200
Message-ID: <CACRpkdYjeqaRzz+hBOGGLEAJn5QmFGof2ysQuVNC_+vV49WPRw@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgNzoyOOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiA+IEZyb20gYSBzdXBlcmZpY2lhbCBsb29rLCBpdCBzb3VuZHMg
bGlrZSBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZXh0ZW5kCj4gPiB0aGF0IHRvIGFsc28gaGFu
ZGxlIHRoZSBLQVNBTiBzaGFkb3cgb2YgdGhlIHZtYWxsb2MgYXJlYSAod2hpY2gKPiA+IF9fY2hl
Y2tfdm1hbGxvY19zZXEoKSBjdXJyZW50bHkgZG9lc24ndCBjb3B5KSwgYnV0IEknbSBub3Qgc3Vy
ZSBvZgo+ID4gZXhhY3RseSB3aGVuIHdlIGluaXRpYWxpc2UgdGhlIHNoYWRvdyBmb3IgYSB2bWFs
bG9jIGFsbG9jYXRpb24gcmVsYXRpdmUKPiA+IHRvIHVwZGF0aW5nIHZtYWxsb2Nfc2VxLgo+Cj4g
SW5kZWVkLiBJdCBhcHBlYXJzIGJvdGggdm1hbGxvY19zZXEoKSBhbmQgYXJjaF9zeW5jX2tlcm5l
bF9tYXBwaW5ncygpCj4gbmVlZCB0byB0YWtlIHRoZSB2bWFsbG9jIHNoYWRvdyBpbnRvIGFjY291
bnQgc3BlY2lmaWNhbGx5LgoKSSdtIHRyeWluZyB0byBsb29rIGludG8gdGhhdC4KCj4gQW5kIHdl
IG1heQo+IGFsc28gbmVlZCB0aGUgZHVtbXkgcmVhZCBmcm9tIHRoZSBzdGFjaydzIHNoYWRvdyBp
biBfX3N3aXRjaF90byAtIEkgYW0KPiBwcmV0dHkgc3VyZSBJIGFkZGVkIHRoYXQgZm9yIGEgcmVh
c29uLgoKSSBhZGRlZCB0aGF0IHNpbmNlIGl0IHdhcyBzaW1wbGU6CgpGcm9tIGMzYzc2ZGYyYTli
ODEzMmIxNjk4MDlkY2RmOTM0ODhjYjQzYTI2ODggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZy
b206IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KRGF0ZTogVHVlLCAx
NSBPY3QgMjAyNCAyMjo1MDozOCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIEFSTTogZW50cnk6IERv
IGEgZHVtbXkgcmVhZCBmcm9tIFZNQVAgc2hhZG93CgpXaGVuIHN3aXRjaGluZyB0YXNrLCBpbiBh
ZGRpdGlvbiB0byBhIGR1bW15IHJlYWQgZnJvbSB0aGUgbmV3ClZNQVAgc3RhY2ssIGFsc28gZG8g
YSBkdW1teSByZWFkIGZyb20gdGhlIFZNQVAgc3RhY2sncwpjb3JyZXNwb25kaW5nIEtBU0FOIHNo
YWRvdyBtZW1vcnkgdG8gc3luYyB0aGluZ3MgdXAgaW4KdGhlIG5ldyBNTSBjb250ZXh0LgoKU2ln
bmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0K
IGFyY2gvYXJtL2tlcm5lbC9lbnRyeS1hcm12LlMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL2VudHJ5LWFy
bXYuUyBiL2FyY2gvYXJtL2tlcm5lbC9lbnRyeS1hcm12LlMKaW5kZXggMWRmYWUxYWY4ZTMxLi5l
ZDJkMGQ4OWUyZTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC9lbnRyeS1hcm12LlMKKysr
IGIvYXJjaC9hcm0va2VybmVsL2VudHJ5LWFybXYuUwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1
ZGUgPGFzbS90bHMuaD4KICNpbmNsdWRlIDxhc20vc3lzdGVtX2luZm8uaD4KICNpbmNsdWRlIDxh
c20vdWFjY2Vzcy1hc20uaD4KKyNpbmNsdWRlIDxhc20va2FzYW5fZGVmLmg+CgogI2luY2x1ZGUg
ImVudHJ5LWhlYWRlci5TIgogI2luY2x1ZGUgPGFzbS9wcm9iZXMuaD4KQEAgLTU2MSw2ICs1NjIs
MTMgQEAgRU5UUlkoX19zd2l0Y2hfdG8pCiAgICAgQCBlbnRyaWVzIGNvdmVyaW5nIHRoZSB2bWFs
bG9jIHJlZ2lvbi4KICAgICBACiAgICAgbGRyICAgIHIyLCBbaXBdCisjaWZkZWYgQ09ORklHX0tB
U0FOCisgICAgQCBBbHNvIGR1bW15IHJlYWQgZnJvbSB0aGUgS0FTQU4gc2hhZG93IG1lbW9yeSBm
b3IgdGhlIG5ldyBzdGFjayBpZiB3ZQorICAgIEAgYXJlIHVzaW5nIEtBU0FOCisgICAgbW92X2wg
ICAgcjIsIEtBU0FOX1NIQURPV19PRkZTRVQKKyAgICBhZGQgICAgcjIsIGlwLCBsc3IgI0tBU0FO
X1NIQURPV19TQ0FMRV9TSElGVAorICAgIGxkciAgICByMiwgW3IyXQorI2VuZGlmCiAjZW5kaWYK
CiAgICAgQCBXaGVuIENPTkZJR19USFJFQURfSU5GT19JTl9UQVNLPW4sIHRoZSB1cGRhdGUgb2Yg
U1AgaXRzZWxmIGlzIHdoYXQKLS0gCjIuNDYuMgoKV2Ugc3RpbGwgZ2V0IGNyYXNoZXMgaW4gZG9f
dHJhbnNsYXRpb25fZmF1bHQoKSBzbyB3ZSBuZWVkIHRoZSBtb3JlCnRob3JvdWdoIHNvbHV0aW9u
LiBNYXliZSB0aGlzIGlzIG5lZWRlZCB0b28uCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
