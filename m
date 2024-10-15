Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5899F24C
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 18:07:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF40C78030;
	Tue, 15 Oct 2024 16:07:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9DF0C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 16:07:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0871A5C549C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 16:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151A0C4CEC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729008433;
 bh=D7JyEOlwv7WG/d5IV3rEXIgpdsFELO1WX45XePGFoRo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BcHw95OqEetqK+AIcrg8jY24AQZrA4JWT/u9EQs5kVDD8X5Ld1SIO8faBBUelRvJ8
 B+MUH2Dx0NAT2q6jFLbY5UBCvVNz+p46VhlRKvMXet3+zAj7bTLYmyVMbdg6ZADNAn
 x2owNcWSh6mjLDbkMA/F68BZJ4gTiSmu9U/lMlQfyDlI42dMJ3SZw6VrT9Bt9xNdR/
 hQ18frBTq5YOwnr6Pbteq1W0dGEPMNFxhzabEf226Me1bFQS6e+6Fo1UrE+R/dl9D+
 iD7Qhnn9yQo/i6L+GGQ1pfbyzY7LLLlwir+hZT/LnRIuwy8MqoGeGaPKvhPga+ibB5
 sSBXc/CDvt0qw==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539f72c913aso2652967e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 09:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXu9tcWjm3B8gqrHjRXQIqIYmy029XaF+wL6+canX+/x0pxKUIg0XDQ14RfosfXufuqo/6cnm3fYGWbkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwncEXFRzBxeoOgNh7qvciOl6nPKUChZnffkXwm2nrWhMu3z7L8
 PXqA8mwjTNqsF4TvuKuDkZeyCwj0tZRfrHPMqJM122hFgF8/ZLfBToJxBox8eGXys02rpwB9GTI
 3098wLfNUe1j/ucNSDr6x/eDF2LI=
X-Google-Smtp-Source: AGHT+IHzzQVqqolf9ERW72m7zA2TZMqTrNbIF8nK7gXzM+liLJ/+eIDKS0f4wIrQ+zaQmKdMqDvYpV5KLtGuVaCQW4I=
X-Received: by 2002:a05:6512:1382:b0:539:f675:84d7 with SMTP id
 2adb3069b0e04-53a03f484e6mr680756e87.32.1729008431443; Tue, 15 Oct 2024
 09:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Oct 2024 18:07:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
Message-ID: <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
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

T24gVHVlLCAxNSBPY3QgMjAyNCBhdCAxNzoyNiwgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAwNDo0NDo1NlBNICsw
MjAwLCBBcmQgQmllc2hldXZlbCB3cm90ZToKPiA+IE9uIFR1ZSwgMTUgT2N0IDIwMjQgYXQgMTY6
MzUsIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAwNDoyMjoyMFBNICswMjAwLCBBcmQgQmllc2hldXZl
bCB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDE1IE9jdCAyMDI0IGF0IDE2OjAwLCBNYXJrIFJ1dGxh
bmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBU
dWUsIE9jdCAxNSwgMjAyNCBhdCAwMzo1MTowMlBNICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAxMjoyOOKAr1BNIE1hcmsgUnV0
bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwg
T2N0IDE0LCAyMDI0IGF0IDAzOjE5OjQ5UE0gKzAyMDAsIENsZW1lbnQgTEUgR09GRklDIHdyb3Rl
Ogo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgd2hhdCdzIGhhcHBlbmluZyBoZXJl
IGlzIHRoYXQgd2hlbiBzd2l0Y2hpbmcgZnJvbSBwcmV2IHRvIG5leHQKPiA+ID4gPiA+ID4gPiBp
biB0aGUgc2NoZWR1bGVyLCB3ZSBzd2l0Y2ggdG8gbmV4dCdzIG1tIGJlZm9yZSB3ZSBhY3R1YWxs
eSBzd2l0Y2ggdG8KPiA+ID4gPiA+ID4gPiBuZXh0J3MgcmVnaXN0ZXIgc3RhdGUsIGFuZCB0aGVy
ZSdzIGEgdHJhbnNpZW50IHdpbmRvdyB3aGVyZSBwcmV2IGlzCj4gPiA+ID4gPiA+ID4gZXhlY3V0
ZWQgdXNpbmcgbmV4dCdzIG1tLiBBRkFJQ1Qgd2UgZG9uJ3QgbWFwIHByZXYncyBLQVNBTiBzdGFj
ayBzaGFkb3cKPiA+ID4gPiA+ID4gPiBpbnRvIG5leHQncyBtbSBhbnl3aGVyZSwgYW5kIHNvIGlu
bGluZWQgS0FTQU5fU1RBQ0sgY2hlY2tzIHJlY3Vyc2l2ZWx5Cj4gPiA+ID4gPiA+ID4gZmF1bHQg
b24gdGhpcyB1bnRpbCB3ZSBzd2l0Y2ggdG8gdGhlIG92ZXJmbG93IHN0YWNrLgo+ID4gPgo+ID4g
PiBbLi4uXQo+ID4gPgo+ID4gPiA+ID4gPiBZZWFoIGl0IGxvb2tzIGxpa2UgYSBzcG90LW9uIGlk
ZW50aWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtLCBJIGNhbiB0cnkgdG8KPiA+ID4gPiA+ID4gdGhp
bmsgYWJvdXQgaG93IHdlIGNvdWxkIGZpeCB0aGlzIGlmIEkgY2FuIHJlcHJvZHVjZSBpdCwgSSBr
ZWVwIHRyeWluZwo+ID4gPiA+ID4gPiB0byBwcm92b2tlIHRoZSBjcmFzaCA6Lwo+ID4gPiA+ID4K
PiA+ID4gPiA+IEl0J3MgYSBiaXQgZ3JvdHR5IC0tIEFGQUlDVCB5b3UnZCBlaXRoZXIgbmVlZCB0
byBwcmVmYXVsdCBpbiB0aGUKPiA+ID4gPiA+IHNwZWNpZmljIHBhcnQgb2YgdGhlIHZtYWxsb2Mg
c3BhY2Ugd2hlbiBzd2l0Y2hpbmcgdGFza3MsIG9yIHdlJ2QgbmVlZCB0bwo+ID4gPiA+ID4gcHJl
YWxsb2NhdGUgYWxsIHRoZSBzaGFyZWQgdm1hbGxvYyB0YWJsZXMgYXQgdGhlIHN0YXJ0IG9mIHRp
bWUgc28gdGhhdAo+ID4gPiA+ID4gdGhleSdyZSBhbHdheXMgdXAtdG8tZGF0ZS4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBXaGlsZSB3ZSBjb3VsZCBkaXNhYmxlIEtBU0FOX1NUQUNLLCB0aGF0J3Mgb25s
eSBnb2luZyB0byBtYXNrIHRoZQo+ID4gPiA+ID4gcHJvYmxlbSB1bnRpbCB0aGlzIGhhcHBlbnMg
Zm9yIGFueSBvdGhlciB2bWFsbG9jIHNoYWRvdy4uLgo+ID4gPiA+Cj4gPiA+ID4gSXMgdGhlIG90
aGVyIHZtYWxsb2Mgc2hhZG93IG5vdCBjb3ZlcmVkIGJ5IHRoZSBvcmRpbmFyeSBvbi1kZW1hbmQg
ZmF1bHRpbmc/Cj4gPiA+Cj4gPiA+IEl0IGRlcGVuZHMgb24gd2hhdCB0aGUgdm1hbGxvYyBtZW1v
cnkgaXMgdXNlZCBmb3I7IGlmIGl0J3MgYW55dGhpbmcgZWxzZQo+ID4gPiB1c2VkIGluIHRoZSBm
YXVsdCBoYW5kbGluZyBwYXRoLCB0aGF0J2xsIGZhdWx0IHJlY3Vyc2l2ZWx5LCBhbmQgaXQncwo+
ID4gPiBwb3NzaWJsZSB0aGF0J2xsIGhhcHBlbiBpbmRpcmVjdGx5IHZpYSBvdGhlciBpbnN0cnVt
ZW50YXRpb24uCj4gPiA+Cj4gPiA+ID4gV2hlbiBJIGltcGxlbWVudGVkIFZNQVBfU1RBQ0sgZm9y
IEFSTSwgSSBhZGRlZCBhbiBleHBsaWNpdCBsb2FkIGZyb20KPiA+ID4gPiB0aGUgbmV3IHN0YWNr
IHdoaWxlIHN0aWxsIHJ1bm5pbmcgZnJvbSB0aGUgb2xkIG9uZSAoaW4gX19zd2l0Y2hfdG8pIHNv
Cj4gPiA+ID4gdGhhdCB0aGUgb3JkaW5hcnkgZmF1bHRpbmcgY29kZSBjYW4gZGVhbCB3aXRoIGl0
LiBDb3VsZG4ndCB3ZSBkbyB0aGUKPiA+ID4gPiBzYW1lIGZvciB0aGUgdm1hbGxvYyBzaGFkb3cg
b2YgdGhlIG5ldyBzdGFjaz8KPiA+ID4KPiA+ID4gV2UgY291bGQgZG8gc29tZXRoaW5nIHNpbWls
YXIsIGJ1dCBub3RlIHRoYXQgaXQncyBiYWNrd2FyZHM6IHdlIG5lZWQgdG8KPiA+ID4gZW5zdXJl
IHRoYXQgdGhlIG9sZC9jdXJyZW50IHN0YWNrIHNoYWRvdyB3aWxsIGJlIG1hcHBlZCBpbiB0aGUg
bmV3IG1tLgo+ID4gPgo+ID4gPiBTbyB0aGUgdXN1YWwgZmF1bHQgaGFuZGxpbmcgY2FuJ3QgaGFu
ZGxlIHRoYXQgYXMtaXMsIGJlY2F1c2UgeW91IG5lZWQgdG8KPiA+ID4gZmF1bHQtaW4gcGFnZXMg
Zm9yIGFuIG1tIHdoaWNoIGlzbid0IHlldCBpbiB1c2UuIFRoYXQgbG9naWMgY291bGQgYmUKPiA+
ID4gZmFjdG9yZWQgb3V0IGFuZCBzaGFyZWQsIHRob3VnaC4KPiA+Cj4gPiBOb3Qgc3VyZSBJIGZv
bGxvdyB5b3UgaGVyZS4gVGhlIGNyYXNoIGlzIGluIHRoZSBrZXJuZWwsIG5vPwo+Cj4gWWVwOyBJ
J20gcmVmZXJyaW5nIHRvIHRoZSB2bWFsbG9jIHNwYWNlIGJlaW5nIGxhemlseSBmYXVsdGVkLWlu
IGFuZAo+IGNvcGllZCBmcm9tIGluaXRfbW0gaW50byB0aGUgYWN0aXZlIHBnZCB1bmRlciBkb190
cmFuc2xhdGlvbl9mYXVsdCgpLgo+Cj4gTG9va2luZyBzb21lIG1vcmUsIEkgZG9uJ3Qgc2VlIGhv
dyBWTUFQX1NUQUNLIGd1YXJhbnRlZXMgdGhhdCB0aGUKPiBvbGQvYWN0aXZlIHN0YWNrIGlzIG1h
cHBlZCBpbiB0aGUgbmV3IG1tIHdoZW4gc3dpdGNoaW5nIGZyb20gdGhlIG9sZCBtbQo+IHRvIHRo
ZSBuZXcgbW0gKHdoaWNoIGhhcHBlbnMgYmVmb3JlIF9fc3dpdGNoX3RvKCkpLgo+Cj4gRWl0aGVy
IEknbSBtaXNzaW5nIHNvbWV0aGluZywgb3Igd2UgaGF2ZSBhIGxhdGVudCBidWcuIE1heWJlIHdl
IGhhdmUKPiBzb21lIGV4cGxpY2l0IGNvcHlpbmcvcHJlZmF1bHRpbmcgZWxzZXdoZXJlIEknbSBt
aXNzaW5nPwo+CgpXZSBidW1wIHRoZSB2bWFsbG9jX3NlcSBjb3VudGVyIGZvciB0aGF0LiBHaXZl
biB0aGF0IHRoZSB0b3AtbGV2ZWwKcGFnZSB0YWJsZSBjYW4gb25seSBnYWluIGVudHJpZXMgY292
ZXJpbmcgdGhlIGtlcm5lbCBzcGFjZSwgdGhpcwpzaG91bGQgYmUgc3VmZmljaWVudCBmb3IgdGhl
IG9sZCB0YXNrJ3Mgc3RhY2sgdG8gYmUgbWFwcGVkIGluIHRoZSBuZXcKdGFzaydzIHBhZ2UgdGFi
bGVzLgoKPiBXaGF0IGhhcHBlbnMgd2hlbiBzd2l0Y2hpbmcgYmV0d2VlbiB0d28gdGFza3Mgd2hv
c2Ugc3RhY2tzIGhhcHBlbiB0byBiZQo+IGluIGRpc3RpbmN0IHN1Yi10cmVlcyBvZiB0aGUgdm1h
bGxvYyB0YWJsZXM/Cj4KPiA+IFNvIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgdm1hbGxvYyBzcGFj
ZSB3aGVyZSBhbGwgdGhlIG1hcHBpbmdzIHNob3VsZAo+ID4gcmVzaWRlLCBidXQgZWFjaCBwcm9j
ZXNzIGhhcyBpdHMgb3duIGNvcHkgb2YgdGhlIHRvcCBsZXZlbCBwYWdlIHRhYmxlLAo+ID4gd2hp
Y2ggbmVlZHMgdG8gYmUgc3luY2VkIHVwIHdoZW4gaXQgZ29lcyBzdGFsZS4KPgo+IFllcCAtLSB0
aGUgcHJvYmxlbSBpcyB3aGVuIHdlIGNhbiBzYWZlbHkgZG8gdGhhdCBzeW5jaW5nIHVwLCBzaW5j
ZSB0aGUKPiBsYXp5IHN5bmNpbmcgaW4gZG9fdHJhbnNsYXRpb25fZmF1bHQoKSBjYW4ndCBzYWZl
bHkgYmUgdXNlZCB0byBzeW5jCj4gYW55dGhpbmcgdGhhdCdzIHVzZWQgZHVyaW5nIGRvX3RyYW5z
bGF0aW9uX2ZhdWx0KCksIGluY2x1ZGluZyB0aGUgc3RhY2ssCj4gZXRjLgo+CgpJbmRlZWQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
