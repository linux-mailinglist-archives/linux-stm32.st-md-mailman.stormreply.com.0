Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F88CFCE74
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:38:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A14C8F281;
	Wed,  7 Jan 2026 09:38:34 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E85C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:38:31 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-65ecd7fcf36so1002605eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767778710; x=1768383510;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzcLdE5lW6KjrMioL4MVcYHG8ltNGC1zHqzO2YGzVIs=;
 b=KWIwfFOy3I5COvrj1sBMpy9DbMzOuhIiZvsLD//r6rTeFvSaMaiSadKCnijq4hNaDV
 O7oXYQbzBurs/r4t3n7DWGQCpRA0pt/8JGYlO3T2cC1LfG/AN8sC89iGGhFHeKrFCWeh
 PKAa0tvnQ7TYKwvhthaCo9RHKo3F5cq058nc78pnuh19TuEBzP0qRmz2h7kWhiYodb55
 2FDb0knXuwHDbGGfwN+X6mJzShPRnDj+hbc62jCk90tV13Jkm+xUyiFHYOFgwFYcA5eK
 /G3cixk6dVyS7W65A7tBFRyYEiNtkEVO3HNEH0zYfwREA/Zm9m1BTl+A2LSuTjVhWI6b
 mLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767778710; x=1768383510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lzcLdE5lW6KjrMioL4MVcYHG8ltNGC1zHqzO2YGzVIs=;
 b=aFbEi6zPNNAce1xeGvNxs30bnAxaabfNsO0nALSatxBw+B1BhA1fIMaGslOXD5aXoT
 Z84+cAbTw/kTEra5m+wHfnq5+p6yZ/Blz2TPZ4zFKtBhGb81JgzAXS6kth1U30CR2lfK
 toeVUFQYurYT+R+D2D6n6KydiO3969Z8fgcTNJiUs+XXVk+XqQ0o+Si5/CgZzZED/UQf
 RMa+NGQ9zOiouFc4oFKZ7xiJ4ua9qhzTh4k2ew5ODnZfHRsZj8xwrMblAw4v3efnVH+G
 ExcnyLjbBY3wvKO2vBrv6cri5aMXwIxzAdNg0n6EvzibiFe/jMoQvRmblu59mroozRM0
 0XAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXWL2YGCuEnaiasW9BCZFDTiLHEXjZQJ5DvmTXHWpvQam/Lxume4JL5pTCtpsGq/bY2oXQCf+j9K94aA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiONU5vrbSq1gfqCFWu0H8f1SpDSNG4uvTFSu2mqbgEr9tywLq
 gR8ch14iCA0oC+DFqkjKWu3v6s2QkxCr7GsnWqspIim7rxVmeQWy0dTPkb8NJhKSrdphF27xgWX
 L/Ik3NQQDQs/n5XGr3tRpqobnuuSWDRUhzd91d0fvaw==
X-Gm-Gg: AY/fxX7u58DMU9wMwu7JniX7IUEdUYkLmz7XSrFUok9Z71da6miDnLyLkitEvn/UQRb
 v4t9D8FneAsg0ZTUNCgPI57LrBli9SmvacpbI7bCwsTBXkYbEpLZs6r/W5fTLDP5ba3xiw7orAu
 MtQLpoZL+ubhcMiWDFQdYxpaN7UEmsPbjVs10r8RP3Cezqt6t35c/fNFwjAeKumNTtoqk1jU2UK
 j6NfsvFsm9Nq0X9GGaVc7aF7FY2a4YWQ1o/DHa+WUMxQCjqyAfYxC4Su8hAIU4UfBuZo5dX+fLp
 odFwvG7eu7rac81uDyecr30CWQ==
X-Google-Smtp-Source: AGHT+IHSj3fyWcR8PeI71mFrFGfZpz1gtYlT37IzGcQAYuwipaKr7ifaf9acDpnsMoegGnuUM/krqm4/4tHZyu+YBdY=
X-Received: by 2002:a05:6820:f02e:b0:659:9a49:8ff0 with SMTP id
 006d021491bc7-65f54ef5252mr794898eaf.29.1767778710402; Wed, 07 Jan 2026
 01:38:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
 <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
 <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
 <aV0Qx5BOso5co3tm@bogus>
In-Reply-To: <aV0Qx5BOso5co3tm@bogus>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 Jan 2026 10:38:19 +0100
X-Gm-Features: AQt7F2rcNsjXN7djR70fxjzIrnv1VtdzPp10juTq1vFrm5vuVSwDuqGbqR3kJLk
Message-ID: <CAHUa44FhRO0AO3nDXSoZ7O_9T3EFB47D34zRooCTd6fhXFzxXw@mail.gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-mips@vger.kernel.org, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
 Ard Biesheuvel <ardb@kernel.org>, linux-rtc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-integrity@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/17] tee: Use bus callbacks instead
	of driver callbacks
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAyOjQw4oCvUE0gU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9s
bGFAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAxMDoxNjowOUFN
ICswMTAwLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IE9uIFRodSwgRGVj
IDE4LCAyMDI1IGF0IDU6MjnigK9QTSBKZW5zIFdpa2xhbmRlcgo+ID4gPGplbnMud2lrbGFuZGVy
QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIERlYyAxOCwgMjAyNSBhdCAy
OjUz4oCvUE0gQWxleGFuZHJlIEJlbGxvbmkKPiA+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDE4LzEyLzIwMjUgMDg6MjE6MjcrMDEw
MCwgSmVucyBXaWtsYW5kZXIgd3JvdGU6Cj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBPbiBNb24sIERlYyAxNSwgMjAyNSBhdCAzOjE34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPiA+
ID4gPiA+IDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IHRoZSBvYmplY3RpdmUg
b2YgdGhpcyBzZXJpZXMgaXMgdG8gbWFrZSB0ZWUgZHJpdmVyIHN0b3AgdXNpbmcgY2FsbGJhY2tz
Cj4gPiA+ID4gPiA+IGluIHN0cnVjdCBkZXZpY2VfZHJpdmVyLiBUaGVzZSB3ZXJlIHN1cGVyc2Vk
ZWQgYnkgYnVzIG1ldGhvZHMgaW4gMjAwNgo+ID4gPiA+ID4gPiAoY29tbWl0IDU5NGM4MjgxZjkw
NSAoIltQQVRDSF0gQWRkIGJ1c190eXBlIHByb2JlLCByZW1vdmUsIHNodXRkb3duCj4gPiA+ID4g
PiA+IG1ldGhvZHMuIikpIGJ1dCBub2JvZHkgY2FyZWQgdG8gY29udmVydCBhbGwgc3Vic3lzdGVt
cyBhY2NvcmRpbmdseS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGVyZSB0aGUgdGVlIGRyaXZl
cnMgYXJlIGNvbnZlcnRlZC4gVGhlIGZpcnN0IGNvbW1pdCBpcyBzb21ld2hhdAo+ID4gPiA+ID4g
PiB1bnJlbGF0ZWQsIGJ1dCBzaW1wbGlmaWVzIHRoZSBjb252ZXJzaW9uIChhbmQgdGhlIGRyaXZl
cnMpLiBJdAo+ID4gPiA+ID4gPiBpbnRyb2R1Y2VzIGRyaXZlciByZWdpc3RyYXRpb24gaGVscGVy
cyB0aGF0IGNhcmUgYWJvdXQgc2V0dGluZyB0aGUgYnVzCj4gPiA+ID4gPiA+IGFuZCBvd25lci4g
KFRoZSBsYXR0ZXIgaXMgbWlzc2luZyBpbiBhbGwgZHJpdmVycywgc28gYnkgdXNpbmcgdGhlc2UK
PiA+ID4gPiA+ID4gaGVscGVycyB0aGUgZHJpdmVycyBiZWNvbWUgbW9yZSBjb3JyZWN0LikKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gdjEgb2YgdGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxlIGF0Cj4g
PiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzY1NDcyMTI1Lmdp
dC51LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENo
YW5nZXMgc2luY2UgdjE6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAtIHJlYmFzZSB0byB2Ni4x
OS1yYzEgKG5vIGNvbmZsaWN0cykKPiA+ID4gPiA+ID4gIC0gYWRkIHRhZ3MgcmVjZWl2ZWQgc28g
ZmFyCj4gPiA+ID4gPiA+ICAtIGZpeCB3aGl0ZXNwYWNlIGlzc3VlcyBwb2ludGVkIG91dCBieSBT
dW1pdCBHYXJnCj4gPiA+ID4gPiA+ICAtIGZpeCBzaHV0ZG93biBjYWxsYmFjayB0byBzaHV0ZG93
biBhbmQgbm90IHJlbW92ZQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBcyBhbHJlYWR5IG5vdGVk
IGluIHYxJ3MgY292ZXIgbGV0dGVyLCB0aGlzIHNlcmllcyBzaG91bGQgZ28gaW4gZHVyaW5nIGEK
PiA+ID4gPiA+ID4gc2luZ2xlIG1lcmdlIHdpbmRvdyBhcyB0aGVyZSBhcmUgcnVudGltZSB3YXJu
aW5ncyB3aGVuIHRoZSBzZXJpZXMgaXMKPiA+ID4gPiA+ID4gb25seSBhcHBsaWVkIHBhcnRpYWxs
eS4gU3VtaXQgR2FyZyBzdWdnZXN0ZWQgdG8gYXBwbHkgdGhlIHdob2xlIHNlcmllcwo+ID4gPiA+
ID4gPiB2aWEgSmVucyBXaWtsYW5kZXIncyB0cmVlLgo+ID4gPiA+ID4gPiBJZiB0aGlzIGlzIGRv
bmUgdGhlIGRlcGVuZGVuY2llcyBpbiB0aGlzIHNlcmllcyBhcmUgaG9ub3JlZCwgaW4gY2FzZSB0
aGUKPiA+ID4gPiA+ID4gcGxhbiBjaGFuZ2VzOiBQYXRjaGVzICM0IC0gIzE3IGRlcGVuZCBvbiB0
aGUgZmlyc3QgdHdvLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBOb3RlIHRoaXMgc2VyaWVzIGlz
IG9ubHkgYnVpbGQgdGVzdGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBVd2UgS2xlaW5lLUvD
tm5pZyAoMTcpOgo+ID4gPiA+ID4gPiAgIHRlZTogQWRkIHNvbWUgaGVscGVycyB0byByZWR1Y2Ug
Ym9pbGVycGxhdGUgZm9yIHRlZSBjbGllbnQgZHJpdmVycwo+ID4gPiA+ID4gPiAgIHRlZTogQWRk
IHByb2JlLCByZW1vdmUgYW5kIHNodXRkb3duIGJ1cyBjYWxsYmFja3MgdG8gdGVlX2NsaWVudF9k
cml2ZXIKPiA+ID4gPiA+ID4gICB0ZWU6IEFkYXB0IGRvY3VtZW50YXRpb24gdG8gY292ZXIgcmVj
ZW50IGFkZGl0aW9ucwo+ID4gPiA+ID4gPiAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIG1v
ZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4gPiA+ID4gPiA+ICAgaHdybmc6IG9wdGVlIC0gTWFr
ZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPiA+ICAgcnRjOiBvcHRlZTogTWlncmF0
ZSB0byB1c2UgdGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3RyYXRpb24gZnVuY3Rpb24KPiA+ID4g
PiA+ID4gICBydGM6IG9wdGVlOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+ID4gPiA+
ID4gICBlZmk6IHN0bW06IE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4g
PiA+ID4gPiA+ICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+ID4g
PiA+ID4gICBmaXJtd2FyZTogYXJtX3NjbWk6IG9wdGVlOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVl
X2NsaWVudF9kcml2ZXIoKQo+ID4gPiA+ID4gPiAgIGZpcm13YXJlOiBhcm1fc2NtaTogTWFrZSB1
c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPiA+ICAgZmlybXdhcmU6IHRlZV9ibnh0OiBN
YWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9kcml2ZXIoKQo+ID4gPiA+ID4gPiAgIGZpcm13
YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPiA+ICAg
S0VZUzogdHJ1c3RlZDogTWlncmF0ZSB0byB1c2UgdGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3Ry
YXRpb24KPiA+ID4gPiA+ID4gICAgIGZ1bmN0aW9uCj4gPiA+ID4gPiA+ICAgS0VZUzogdHJ1c3Rl
ZDogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPiA+ICAgdHBtL3RwbV9mdHBt
X3RlZTogTWFrZSB1c2Ugb2YgdGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3RyYXRpb24KPiA+ID4g
PiA+ID4gICB0cG0vdHBtX2Z0cG1fdGVlOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS90ZWUucnN0ICAg
ICAgICAgICAgIHwgMTggKy0tLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvY2hhci9od19yYW5kb20v
b3B0ZWUtcm5nLmMgICAgICAgICAgIHwgMjYgKystLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2No
YXIvdHBtL3RwbV9mdHBtX3RlZS5jICAgICAgICAgICAgICB8IDMxICsrKysrLS0tCj4gPiA+ID4g
PiA+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3RyYW5zcG9ydHMvb3B0ZWUuYyB8IDMyICsr
Ky0tLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL2Jyb2FkY29tL3RlZV9ibnh0X2Z3
LmMgICAgICB8IDMwICsrLS0tLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvZWZpL3N0
bW0vdGVlX3N0bW1fZWZpLmMgICAgIHwgMjUgKystLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL3J0
Yy9ydGMtb3B0ZWUuYyAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrLS0tLS0KPiA+ID4gPiA+
ID4gIGRyaXZlcnMvdGVlL3RlZV9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgODQgKysr
KysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gIGluY2x1ZGUvbGludXgvdGVlX2Rydi5oICAg
ICAgICAgICAgICAgICAgICAgIHwgMTIgKysrCj4gPiA+ID4gPiA+ICBzZWN1cml0eS9rZXlzL3Ry
dXN0ZWQta2V5cy90cnVzdGVkX3RlZS5jICAgICB8IDE3ICsrLS0KPiA+ID4gPiA+ID4gIDEwIGZp
bGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAxMzggZGVsZXRpb25zKC0pCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhk
MGQwNDAyN2NiMWU4Cj4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+IDIuNDcuMwo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIG5pY2UgY2xlYW51cCwgVXdl
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkndmUgYXBwbGllZCBwYXRjaCAxLTMgdG8gdGhlIGJyYW5j
aCB0ZWVfYnVzX2NhbGxiYWNrX2Zvcl82LjIwIGluIG15Cj4gPiA+ID4gPiB0cmVlIGF0IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2plbnN3aS9saW51eC10
ZWUuZ2l0Lwo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBicmFuY2ggaXMgYmFzZWQgb24gdjYuMTkt
cmMxLCBhbmQgSSdsbCB0cnkgdG8ga2VlcCBpdCBzdGFibGUgZm9yCj4gPiA+ID4gPiBvdGhlcnMg
dG8gZGVwZW5kIG9uLCBpZiBuZWVkZWQuIExldCdzIHNlZSBpZiB3ZSBjYW4gYWdyZWUgb24gdGFr
aW5nCj4gPiA+ID4gPiB0aGUgcmVtYWluaW5nIHBhdGNoZXMgdmlhIHRoYXQgYnJhbmNoLgo+ID4g
PiA+Cj4gPiA+ID4gNiBhbmQgNyBjYW4gZ28gdGhyb3VnaCB5b3VyIGJyYW5jaC4KPiA+ID4KPiA+
ID4gR29vZCwgSSd2ZSBhZGRlZCB0aGVtIHRvIG15IGJyYW5jaCBub3cuCj4gPgo+ID4gVGhpcyBl
bnRpcmUgcGF0Y2ggc2V0IHNob3VsZCBnbyBpbiBkdXJpbmcgYSBzaW5nbGUgbWVyZ2Ugd2luZG93
LiBJCj4gPiB3aWxsIG5vdCBzZW5kIGFueSBwdWxsIHJlcXVlc3QgdW50aWwgSSdtIHN1cmUgYWxs
IHBhdGNoZXMgd2lsbCBiZQo+ID4gbWVyZ2VkLgo+ID4KPiA+IFNvIGZhciAoaWYgSSdtIG5vdCBt
aXN0YWtlbiksIG9ubHkgdGhlIHBhdGNoZXMgSSd2ZSBhbHJlYWR5IGFkZGVkIHRvCj4gPiBuZXh0
IGhhdmUgYXBwZWFyZWQgbmV4dC4gSSBjYW4gdGFrZSB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcywg
dG9vLCBidXQKPiA+IEkgbmVlZCBPSyBmb3IgdGhlIGZvbGxvd2luZzoKPiA+Cj4KPiBbLi4uXQo+
Cj4gPgo+ID4gU3VkZWVwLCB5b3Ugc2VlbSBoYXBweSB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2hl
cwo+ID4gLSBmaXJtd2FyZTogYXJtX3NjbWk6IG9wdGVlOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVl
X2NsaWVudF9kcml2ZXIoKQo+ID4gLSBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRl
ZSBidXMgbWV0aG9kcwo+ID4gT0sgaWYgSSB0YWtlIHRoZW0gdmlhIG15IHRyZWUsIG9yIHdvdWxk
IHlvdSByYXRoZXIgdGFrZSB0aGVtIHlvdXJzZWxmPwo+ID4KPgo+IEkgYW0gaGFwcHkgaWYgeW91
IHdhbnQgdG8gdGFrZSBhbGwgb2YgdGhlbSBpbiBvbmUgZ28uIEkgdGhpbmsgSSBoYXZlCj4gYWxy
ZWFkeSBhY2tlZCBpdC4gUGxlYXNlIHNob3V0IGlmIHlvdSBuZWVkIGFueXRoaW5nIGVsc2UgZnJv
bSBtZSwgaGFwcHkgdG8KPiBoZWxwIGluIGFueXdheSB0byBtYWtlIGl0IGVhc2llciB0byBoYW5k
bGUgdGhpcyBjaGFuZ2Ugc2V0LgoKVGhhbmtzLCBJJ3ZlIGFwcGxpZWQgYWxsIHRoZSBwYXRjaGVz
IGluIHRoZSBzZXJpZXMgbm93LCBzaW5jZSBpdApvdGhlcndpc2UgY2F1c2VzIHdhcm5pbmdzIGR1
cmluZyBib290LgoKL0plbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
