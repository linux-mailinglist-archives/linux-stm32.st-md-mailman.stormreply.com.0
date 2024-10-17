Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F59A2011
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 12:31:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A983DC78032;
	Thu, 17 Oct 2024 10:31:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C77EC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:31:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57A695C60E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804A8C4AF09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729161104;
 bh=IzG5PSvcg1vpEWcQ5pdzWwgAf53vYWIA/ZY2d5FWYVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qfAG5xCMS+uLySyzuneiqKxlkYuKORVtpxAAHXFPYHp2oiKUGv+oLcx0Mdk0mtYVz
 ZdTNXN+z0WVNJ6V6/b+mWJNdvcC7HCWWp1B9r4nwsl+xv8rHAwloJjPBwxotbRizlJ
 IYwM6et9Am+0rfre6DDirMCG2wZi5C5UlduK1lpDXZQFJiQ1+oMJOsQCoJYNuS0Xfh
 78aeY6qcQSDtkCIkTuJfZnxE4cwtmcFtvjFNmtB5l6Y1gfaG2m6LWWAqe3rTfAi4pF
 AYYJjcHpx8EC7lbl21keBswGcAwEDe28M9XzZtDIh+vQMUmY0v2g0de17Tfr9BPBJ7
 l6dH4fbcjFORg==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb5743074bso5965761fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 03:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQhQKIUzS+6nUR48CPovDsgismjWBzPRkKWr35M4q94fiwgdf128jUG+L2rj+ANo3+k1xzEs2uTEQfgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkJCEfPOa9tKkGA8CBhR4fdEoTz2KIHko1YSDDru8DD42ssM3A
 sH8WKJPmdvIF/9QSppjip5Yaiv7+KW8M6MPetrERfDX7TcSSG6LiVS0y+KWc5TUJOEtmDaX7Cpe
 6h18K6wBIxORhiNdc/RqUwhm/j/U=
X-Google-Smtp-Source: AGHT+IG1iOVo01ioiJTuaWXBujUXqJA0F8wivCSNMdi49h9T8U1BFgLJAG603Xrkgr3FsDpqsimBwMI+O2ws1JJ6zW8=
X-Received: by 2002:a2e:611:0:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2fb6d9c6270mr7476021fa.2.1729161102830; Thu, 17 Oct 2024
 03:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
 <Zw9_imsl2KLf7_GY@J2N7QTR9R3>
 <CACRpkda8tO=QLF_zznoNjdNfNZJVntY_3+247E=qK6zNqRnVSA@mail.gmail.com>
 <ZxDh9biUbf9W8gNN@J2N7QTR9R3>
In-Reply-To: <ZxDh9biUbf9W8gNN@J2N7QTR9R3>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Oct 2024 12:31:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFn=pfJqTrMrnqT+OLi3UqAq0PieROQhbC2M3B2uAzyEQ@mail.gmail.com>
Message-ID: <CAMj1kXFn=pfJqTrMrnqT+OLi3UqAq0PieROQhbC2M3B2uAzyEQ@mail.gmail.com>
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

T24gVGh1LCAxNyBPY3QgMjAyNCBhdCAxMjoxMCwgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAwOTowMDoyMlBNICsw
MjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6
NTXigK9BTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4g
PiA+IEkgYmVsaWV2ZSB0aGF0J3MgbmVjZXNzYXJ5IGZvciB0aGUgbGF6eSBUTEIgc3dpdGNoLCBh
dCBsZWFzdCBmb3IgU01QOgo+ID4gPgo+ID4gPiAgICAgICAgIC8vIENQVSAwICAgICAgICAgICAg
ICAgICAgICAgICAgLy8gQ1BVIDEKPiA+ID4KPiA+ID4gICAgICAgICA8PCBzd2l0Y2hlcyB0byB0
YXNrIFgncyBtbSA+Pgo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPDwgY3JlYXRlcyBrdGhyZWFkIHRhc2sgWSA+Pgo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPDwgbWFwcyB0YXNrIFkncyBuZXcgc3RhY2sgPj4K
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw8IG1hcHMgdGFz
ayBZJ3MgbmV3IHNoYWRvdyA+Pgo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLy8gWSBzd2l0Y2hlZCBvdXQKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRleHRfc3dpdGNoKC4uLiwgWSwgLi4uLCAuLi4pOwo+
ID4gPgo+ID4gPiAgICAgICAgIC8vIFN3aXRjaCBmcm9tIFggdG8gWQo+ID4gPiAgICAgICAgIGNv
bnRleHRfc3dpdGNoKC4uLiwgWCwgWSwgLi4uKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAvLyBw
cmV2ID0gWAo+ID4gPiAgICAgICAgICAgICAgICAgLy8gbmV4dCA9IFkKPiA+ID4KPiA+ID4gICAg
ICAgICAgICAgICAgIGlmICghbmV4dC0+bW0pIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgLy8gWSBoYXMgbm8gbW0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLy8gTm8gc3dp
dGNoX21tKCkgaGVyZQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAvLyAuLi4gc28gbm8g
Y2hlY2tfdm1hbGxvY19zZXEoKQo+ID4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgLy8gbm90IHRha2VuCj4gPiA+ICAgICAgICAgICAgICAg
ICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAuLi4KPiA+ID4KPiA+ID4gICAgICAgICAg
ICAgICAgIC8vIFgncyBtbSBzdGlsbCBsYWNrcyBZJ3Mgc3RhY2sgKyBzaGFkb3cgaGVyZQo+ID4g
Pgo+ID4gPiAgICAgICAgICAgICAgICAgc3dpdGNoX3RvKHByZXYsIG5leHQsIHByZXYpOwo+ID4g
PiAgICAgICAgIH0KPiA+ID4KPiA+ID4gLi4uIHNvIHByb2JhYmx5IHdvcnRoIGEgY29tbWVudCB0
aGF0IHdlJ3JlIGZhdWx0aW5nIGluIHRoZSBuZXcKPiA+ID4gc3RhY2src2hhZG93IGZvciBmb3Ig
bGF6eSB0bGIgd2hlbiBzd2l0Y2hpbmcgdG8gYSB0YXNrIHdpdGggbm8gbW0/Cj4gPgo+ID4gU3dp
dGNoaW5nIHRvIGEgdGFzayB3aXRoIG5vIG1tID09IHN3aXRjaGluZyB0byBhIGtlcm5lbCBkYWVt
b24uCj4KPiBBIGNvbW1vbiBtaXNjb25jZXB0aW9uLCBidXQgbm90IGFsd2F5cyB0cnVlOgo+Cj4g
KiBBIGtlcm5lbCB0aHJlYWQgY2FuIGhhdmUgYW4gbW06IHNlZSBrdGhyZWFkX3VzZV9tbSgpIGFu
ZAo+ICAga3RocmVhZF91bnVzZV9tbSgpLgo+Cj4gKiBBIHVzZXIgdGhyZWFkIGNhbiBsb3NlIGl0
cyBtbSB3aGlsZSBleGl0aW5nOiBzZWUgaG93IGRvX2V4aXQoKSBjYWxscwo+ICAgZXhpdF9tbSgp
LCBhbmQgaG93IGh0ZSB0YXNrIHJlbWFpbnMgcHJlZW1wdGlibGUgZm9yIGEgd2hpbGUKPiAgIHRo
ZXJlYWZ0ZXIuCj4KPiAuLi4gc28gd2UgcmVhbGx5IGRvIGp1c3QgbWVhbiAiYSB0YXNrIHdpdGgg
bm8gbW0iLgo+Cj4gPiBBbmQgdGhvc2Ugb25seSB1c2UgdGhlIGtlcm5lbCBtZW1vcnkgYW5kIHJl
bGllcyBvbiB0aGF0IGFsd2F5cwo+ID4gYmVpbmcgbWFwcGVkIGluIGFueSBwcmV2aW91cyBtbSBj
b250ZXh0LCByaWdodC4KPgo+IEEgdGFzayB3aXRoIG5vIG1tIG9ubHkgdXNlcyBrZXJuZWwgbWVt
b3J5LiBBbnl0aGluZyBpdCB1c2VzIG11c3QgYmUKPiBtYXBwZWQgaW4gaW5pdF9tbSwgYnV0ICpt
aWdodCogbm90IGhhdmUgYmVlbiBjb3BpZWQgaW50byBldmVyeSBvdGhlciBtbSwKPiBhbmQgaGVu
Y2UgbWlnaHQgbm90IGJlIGluIHRoZSBwcmV2aW91cyBtbSBjb250ZXh0IGFzIHBlciB0aGUgZXhh
bXBsZQo+IGFib3ZlLgo+Cj4gPiBCdXQgd2hlcmUgZG8gd2UgcHV0IHRoYXQgY29tbWVudD8gSW4g
a2VybmVsL3NjaGVkL2NvcmUuYwo+ID4gY29udGV4dF9zd2l0Y2goKT8KPgo+IEkgd2FzIHRyeWlu
ZyB0byBzdWdnZXN0IHdlIHVwZGF0ZSB0aGUgZXhpc3RpbmcgY29tbWVudCBpbiBzd2l0Y2hfdG8o
KSB0bwo+IGJlIG1vcmUgZXhwbGljaXQuIGUuZy4gZXhwYW5kIHRoZSBleGlzdGluZyBjb21tZW50
Ogo+Cj4gICAgICAgICBACj4gICAgICAgICBAIERvIGEgZHVtbXkgcmVhZCBmcm9tIHRoZSBuZXcg
c3RhY2sgd2hpbGUgcnVubmluZyBmcm9tIHRoZSBvbGQgb25lIHNvCj4gICAgICAgICBAIHRoYXQg
d2UgY2FuIHJlbHkgb24gZG9fdHJhbnNsYXRpb25fZmF1bHQoKSB0byBmaXggdXAgYW55IHN0YWxl
IFBNRAo+ICAgICAgICAgQCBlbnRyaWVzIGNvdmVyaW5nIHRoZSB2bWFsbG9jIHJlZ2lvbi4KPiAg
ICAgICAgIEAKPgo+IC4uLiB3aXRoOgo+Cj4gICAgICAgICBACj4gICAgICAgICBAIEZvciBhIG5v
bi1sYXp5IG1tIHN3aXRjaCwgY2hlY2tfdm1hbGxvY19zZXEoKSBoYXMgZW5zdXJlZCB0aGF0Cj4g
ICAgICAgICBAIHRoYXQgdGhlIGFjdGl2ZSBtbSdzIHBhZ2UgdGFibGVzIGhhdmUgbWFwcGluZ3Mg
Zm9yIHRoZSBwcmV2Cj4gICAgICAgICBAIHRhc2sncyBzdGFjayBhbmQgdGhlIG5leHQgdGFzaydz
IHN0YWNrLgo+ICAgICAgICAgQAo+ICAgICAgICAgQCBGb3IgYSBsYXp5IG1tIHN3aXRjaCB0aGUg
YWN0aXZlIG1tJ3MgcGFnZSB0YWJsZXMgaGF2ZSBtYXBwaW5ncwo+ICAgICAgICAgQCBmb3IgdGhl
IHByZXYgdGFzaydzIHN0YWNrIGJ1dCBtaWdodCBub3QgaGF2ZSBtYXBwaW5ncyBmb3IgdGhlCj4g
ICAgICAgICBAIG5ldyB0YWtzIHN0YWNrLiBEbyBhIGR1bW15IHJlYWQgZnJvbSB0aGUgbmV3IHN0
YWNrIHdoaWxlCgp0YXNrCgo+ICAgICAgICAgQCBydW5uaW5nIGZyb20gdGhlIG9sZCBzdGFjayBz
byB0aGF0IHdlIGNhbiByZWx5IG9uCj4gICAgICAgICBAIGRvX3RyYW5zbGF0aW9uX2ZhdWx0KCkg
dG8gZml4IHVwIGFueSBzdGFsZSBQTUQgZW50cmllcwo+ICAgICAgICAgQCBjb3ZlcmluZyB0aGUg
dm1hbGxvYyByZWdpb24uCgpNaWdodCBhcyB3ZWxsIGJlIG1vcmUgcHJlY2lzZSBoZXJlLCBhbmQg
c2F5ICJwb3B1bGF0ZSBtaXNzaW5nIFBNRAplbnRyaWVzIGNvdmVyaW5nIHRoZSBuZXcgdGFzaydz
IHN0YWNrIGluIHRoZSBvbGQgdGFzaydzIHBhZ2UgdGFibGVzIgoKPiAgICAgICAgIEAKPgo+IEFy
ZCwgZG9lcyB0aGF0IHNvdW5kIGdvb2QgdG8geW91Pwo+CgpZZXMuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
