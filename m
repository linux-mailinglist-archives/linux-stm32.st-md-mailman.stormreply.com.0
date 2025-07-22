Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC5B0CEA0
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 02:13:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C210C3F933;
	Tue, 22 Jul 2025 00:13:10 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8597C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 00:13:08 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-87c46159b24so50053339f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753143187; x=1753747987;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nI2QMNGgMj3J8RDFB4fygTxaPTI02cve37bjkV39hu4=;
 b=JZdE3T1VDqvz/+0nJ03xxEBYXrNvlaAb8Vk9cDvgdmy00HUMScBeO07MtvUR+m4Dxe
 mhqVyONIZDFZ5twcijWGdoNk568/8qWMAMhGI8lDcElaIDWKRCVOVl7oz4C5ZCILHZ7A
 PpBygBFzZeLX62qK5dHopWAmCArC6isOF7GisCMaTXTpXbx2DlrLZyvKsWethSw0QtYk
 o7V53Tx9ATm+ylIHpxsZ19mjs7mHwPA6UWEOasf3dnT+lKOl6WSXA9NhbYRul9MVH9RG
 C5eHpYLss06su6baQ8iI5heHiElP7Yl5vCKZHuBYgJMyQX2ACGEhttUGLj/yEs4Z0pFF
 2miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753143187; x=1753747987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nI2QMNGgMj3J8RDFB4fygTxaPTI02cve37bjkV39hu4=;
 b=itrO2kc+jbE3P6qTgyh8fql0yLTcLx6Qii4eAcNj0xT4/lMQl+I7pTs++1ZJGrWRfQ
 2IFtKrC/GqmZCjZ0phgmza60nv1Z4afnQeKuW24pkgnKdu4Bc0Qxa3ucNvrwb41vrX+E
 //jZQYjgudBesQkuWspYkvtsMclVeoS48irnNSf4NBpFMlHO0he7wlP3cXuZrBmw/Tna
 ZPmwHzSI2iPskyaJpNsB8x91voChBppS4mvmM1Z/8rodgYdM1KilU7ExGT3lU3qGe5H3
 8sXW0VK9a+hGLUYDiZQsKiWierKrtjnUA62jgF0pv9VG8qUfKCgAF7vMyj/Ytil0CMnh
 9jbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfPMl3htk103VOTezi2Jda8IFxpTcdkh3QdRWHVciphPewvtM7vN2GCvDL5MxgC9sNbfKm6zlMInT60Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAUm9mrvhvh1uIOT27oBAwsuag9z3zFnpygzzLkbiulCXVetGk
 JaFc+KP9Hsc7tlyhGIHRsvY6PQQMrmkG2eR6NnffWUttbAShts80lukew2JDzqEl3q2hOhnk4GC
 3UTaRKaitn4ZsSOEAF+nNP5farPLY+nU=
X-Gm-Gg: ASbGnctMQ4B1Ruvnv6E+CMjno5nO31clBN0V1N5d0DenvXdFktL9TrFf+G62DwYwkIN
 uOf0E2G48jzZjJ9SRleH2xi3P/kNGnvrre1Tqm1a5MwKreLgY8j1KY//tfdxpBuUa51qucKCFh4
 dCL/AeMZFkV9aSo3quBXfu55qccwwrGOw5fO5tqBvRzm6vTTcZIPuF43u5J3BhOwjhswZ76Pn/R
 0nzVaM=
X-Google-Smtp-Source: AGHT+IHkIo1E+xz5iEr8q7c7k+6dv3JOxmpiAY/Iii9TcI5lbuWd/CS88OtlDMQETFPvj7tY1e+BLPWawYxnyx/DaCw=
X-Received: by 2002:a05:6e02:3c87:b0:3df:5333:c2ab with SMTP id
 e9e14a558f8ab-3e282e64ee3mr249275185ab.17.1753143187112; Mon, 21 Jul 2025
 17:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <aH5exXo_BdonTfmf@mini-arch>
 <CAL+tcoB9U-YnJ7MPn7FQ4+ZsW5cgQXE3Tks-7=kGMhUE6nNprg@mail.gmail.com>
In-Reply-To: <CAL+tcoB9U-YnJ7MPn7FQ4+ZsW5cgQXE3Tks-7=kGMhUE6nNprg@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 22 Jul 2025 08:12:30 +0800
X-Gm-Features: Ac12FXwDqdw8CTdPU0GZ9MGtwXJTttOt4N3GfGIw0dI8oN7Gjar3PdzKubKY-XQ
Message-ID: <CAL+tcoDo3p52+j8hahpDVAcWF-pGPAoGY5Z_=wkn25C=eH3FNA@mail.gmail.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] stmmac: xsk: fix underflow
 of budget in zerocopy mode
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgNzowNeKAr0FNIEphc29uIFhpbmcgPGtlcm5lbGphc29u
eGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMTE6Mzfi
gK9QTSBTdGFuaXNsYXYgRm9taWNoZXYKPiA8c3Rmb21pY2hldkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IE9uIDA3LzIxLCBKYXNvbiBYaW5nIHdyb3RlOgo+ID4gPiBGcm9tOiBKYXNvbiBYaW5n
IDxrZXJuZWx4aW5nQHRlbmNlbnQuY29tPgo+ID4gPgo+ID4gPiBUaGUgaXNzdWUgY2FuIGhhcHBl
biB3aGVuIHRoZSBidWRnZXQgbnVtYmVyIG9mIGRlc2NzIGFyZSBjb25zdW1lZC4gQXMKPiA+ID4g
bG9uZyBhcyB0aGUgYnVkZ2V0IGlzIGRlY3JlYXNlZCB0byB6ZXJvLCBpdCB3aWxsIGFnYWluIGdv
IGludG8KPiA+ID4gd2hpbGUgKGJ1ZGdldC0tID4gMCkgc3RhdGVtZW50IGFuZCBnZXQgZGVjcmVh
c2VkIGJ5IG9uZSwgc28gdGhlCj4gPiA+IHVuZGVyZmxvdyBpc3N1ZSBjYW4gaGFwcGVuLiBJdCB3
aWxsIGxlYWQgdG8gcmV0dXJuaW5nIHRydWUgd2hlcmVhcyB0aGUKPiA+ID4gZXhwZWN0ZWQgdmFs
dWUgc2hvdWxkIGJlIGZhbHNlLgo+ID4gPgo+ID4gPiBJbiB0aGlzIGNhc2Ugd2hlcmUgYWxsIHRo
ZSBidWRnZXQgYXJlIHVzZWQgdXAsIGl0IG1lYW5zIHpjIGZ1bmN0aW9uCj4gPiA+IHNob3VsZCBy
ZXR1cm4gZmFsc2UgdG8gbGV0IHRoZSBwb2xsIHJ1biBhZ2FpbiBiZWNhdXNlIG5vcm1hbGx5IHdl
Cj4gPiA+IG1pZ2h0IGhhdmUgbW9yZSBkYXRhIHRvIHByb2Nlc3MuCj4gPiA+Cj4gPiA+IEZpeGVz
OiAxMzJjMzJlZTViYzAgKCJuZXQ6IHN0bW1hYzogQWRkIFRYIHZpYSBYRFAgemVyby1jb3B5IHNv
Y2tldCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFhpbmcgPGtlcm5lbHhpbmdAdGVuY2Vu
dC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX21haW4uYyB8IDQgKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+ID4gaW5kZXggZjM1MGE2NjYy
ODgwLi5lYTU1NDFmOWU5YTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gPiBAQCAtMjU5Niw3ICsyNTk2
LDcgQEAgc3RhdGljIGJvb2wgc3RtbWFjX3hkcF94bWl0X3pjKHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdiwgdTMyIHF1ZXVlLCB1MzIgYnVkZ2V0KQo+ID4gPgo+ID4gPiAgICAgICBidWRnZXQgPSBt
aW4oYnVkZ2V0LCBzdG1tYWNfdHhfYXZhaWwocHJpdiwgcXVldWUpKTsKPiA+ID4KPiA+ID4gLSAg
ICAgd2hpbGUgKGJ1ZGdldC0tID4gMCkgewo+ID4gPiArICAgICB3aGlsZSAoYnVkZ2V0ID4gMCkg
ewo+ID4KPiA+IFRoZXJlIGlzIGEgY29udGludWUgb24gbGluZSAyNjIxLgo+Cj4gVGhhbmtzIGZv
ciBjYXRjaGluZyB0aGlzIQo+Cj4gPiBTaG91bGQgd2UgZG8gJ2ZvciAoOyBidWRnZXQgPiAwOyBi
dWRnZXQtLSknCj4gPiBpbnN0ZWFkPyBBbmQgbWF5YmUgdGhlIHNhbWUgZm9yIGl4Z2JlIFswXT8K
Pgo+IE5vdCByZWFsbHkuIEkgdGhpbmsgSSBjYW4gbW92ZSB0aGUgJ2J1ZGdldC0tJyBqdXN0IGJl
Zm9yZSB0aGUKPiAnY29udGludWUnIHBhcnQuIElmIHdlIGNvbnZlcnQgaXQgdG8gdXNlICdmb3In
IGxvb3AgYW5kIHRoZW4gd2UgZW5kIHVwCj4gd2l0aCBvbmUgb2YgJ2JyZWFrJyBzdGF0ZW1lbnRz
LCB0aGUgYnVkZ2V0IHN0aWxsIGdldHMgYWNjaWRlbnRseQo+IGluY3JlYXNlZCBieSBvbmUgd2hl
cmVhcyBpeGdiZSBkcml2ZXIgZXZlbiBkb2Vzbid0IGhhbmRsZSB0aGUgZGVzYwo+IHRoaXMgdGlt
ZS4gSUlVQywgaXQgc2hvdWxkIG5vdCBoYXBwZW4sIHJpZ2h0PwoKU29ycnksIEkgd2FzIHRvdGFs
bHkgd3JvbmcuIFlvdXIgc3VnZ2VzdGlvbnMgd29yayBhbmQgSSB3aWxsIHJldmlzZQp0aGVtIGFz
IHlvdSBzYWlkIDopCgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
