Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E6CCA9DF
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 08:21:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9214C5663A;
	Thu, 18 Dec 2025 07:21:43 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3482AC01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 07:21:42 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-7c75fc222c3so130146a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 23:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766042501; x=1766647301;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
 b=QK4+eUf+2VV6dUIcIpdvmCloom2hPZ4O8HrlSSixO1sx7opQKwaanUAzdVTVVaSId+
 Jvtk77Uf5+Q/kJ3+UBUxkqg2oItrNQqVbSddBRxNWs9EO/6Puwc4dL6z43ePedYdch8C
 3TLGpC9ij9eW3MQnTchArsbEYiTVvCRK5qjepVCQSfLjBhz0WtnPUcqyag2/xIar/vul
 ml3te1WSEV8qSDvDZ5ydoNWGujBoJhY+iDEQXTVH0T/pNTzRRvnMky+1hXwu14Os9rzY
 eiw1z80g8i/NMAtQhy5oFb0q9/dpWiG8jRRmVz5PQb9GbCdFVGwbG2dRPNOoZWjzQEHR
 Q4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766042501; x=1766647301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
 b=XrT22UkDNbB9AnJhGnIehDkYPvB5llC7lp/C4eb8el+MiEytGQTIq+vaguVFw29KGY
 mNa9q0KRpKAP+TioTTJis4pdDYxFnO3cUFQ4qMzZRQaDcF5ZJDFZrgYtea74pPbtfU6z
 oM+D4uzaYwPfK+zN3C5V0aI/y3M4DhHZdCk4oXLJTqlKLXC5I3uZtSsQlOXZzr3zDxoQ
 nrUVrP5DojxoO/X4ZEQGvM0X5TP+8ohe/Z3opWhjWqh+w1ZeBM/g9WJh4Hs5sO4aW5ts
 KXZxt8Eviv9LQwE/i2+GUIJ2cthiYvdYV8sFCU/ilfZBxOyTnOJ6pX22MXd9+pQeneW3
 6GAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtpjqEqGfZ0mEkaarnlavRZkBNCBGPSjmVGA7Yl+825TJkI9YIsQbusNMFKqQ2CdvMbxrTaIe2EPFKRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx56r0YtmaUu9B9YVX8pQJGJ1HOP6XnGmDw6QdJm80FmkwRrIEZ
 Q7j/GnW1n5iI3ixjU40t/toyuyqncfIJEi3aIVeQnSurLQ+VvXzVRgV1drXtKfzkwee4sX2sShF
 QXwWl2Zz4chbmmHK3pk6sfjqa4ljZJk4V11eGVRDNug==
X-Gm-Gg: AY/fxX5JKO0lHMpxivd/VXf0qeaRimGiPyqhfLnFSH5hfNXeKMgCtfyd9X54DUBRi2Z
 X3jUKmo8zqm1xnDJNZyPNxczB4dj9lBMFhroBAkn1M4HXUF3GgLmV8JLBybO198j2S3hkg1DRmh
 cie/TBxWLYF0GqJXGCJkZGtUtPJz4/VjW7e/QXZSukST+iCpKjus63I3tamupyzSKvdhE98EoKD
 AHhby81+4kvvkybdXnwQZA+2AGnf8zu34dQVaXNryhBXIpH0G2MRud3185ognta80Pzc5ubxd5/
 +mIhqT8LPQL5J6bciKILZxiR8Q==
X-Google-Smtp-Source: AGHT+IHdzsrnh67Z+uk7sg0iAMocZMySikku48EGz5g7L5MG+hq7iSRlseyY2l5vM8LHePwozU/hD6rMNUuAq73AgFc=
X-Received: by 2002:a05:6820:828:b0:65c:f41b:7119 with SMTP id
 006d021491bc7-65cf41b750emr1784992eaf.5.1766042500598; Wed, 17 Dec 2025
 23:21:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 18 Dec 2025 08:21:27 +0100
X-Gm-Features: AQt7F2r_j21Nqcv1IzhOT6jk9UPtvnwA1D3etXiTv5WveGJRYXXMC9qqoGF_Yc4
Message-ID: <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
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
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
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

SGksCgpPbiBNb24sIERlYyAxNSwgMjAyNSBhdCAzOjE34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcK
PHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiB0aGUg
b2JqZWN0aXZlIG9mIHRoaXMgc2VyaWVzIGlzIHRvIG1ha2UgdGVlIGRyaXZlciBzdG9wIHVzaW5n
IGNhbGxiYWNrcwo+IGluIHN0cnVjdCBkZXZpY2VfZHJpdmVyLiBUaGVzZSB3ZXJlIHN1cGVyc2Vk
ZWQgYnkgYnVzIG1ldGhvZHMgaW4gMjAwNgo+IChjb21taXQgNTk0YzgyODFmOTA1ICgiW1BBVENI
XSBBZGQgYnVzX3R5cGUgcHJvYmUsIHJlbW92ZSwgc2h1dGRvd24KPiBtZXRob2RzLiIpKSBidXQg
bm9ib2R5IGNhcmVkIHRvIGNvbnZlcnQgYWxsIHN1YnN5c3RlbXMgYWNjb3JkaW5nbHkuCj4KPiBI
ZXJlIHRoZSB0ZWUgZHJpdmVycyBhcmUgY29udmVydGVkLiBUaGUgZmlyc3QgY29tbWl0IGlzIHNv
bWV3aGF0Cj4gdW5yZWxhdGVkLCBidXQgc2ltcGxpZmllcyB0aGUgY29udmVyc2lvbiAoYW5kIHRo
ZSBkcml2ZXJzKS4gSXQKPiBpbnRyb2R1Y2VzIGRyaXZlciByZWdpc3RyYXRpb24gaGVscGVycyB0
aGF0IGNhcmUgYWJvdXQgc2V0dGluZyB0aGUgYnVzCj4gYW5kIG93bmVyLiAoVGhlIGxhdHRlciBp
cyBtaXNzaW5nIGluIGFsbCBkcml2ZXJzLCBzbyBieSB1c2luZyB0aGVzZQo+IGhlbHBlcnMgdGhl
IGRyaXZlcnMgYmVjb21lIG1vcmUgY29ycmVjdC4pCj4KPiB2MSBvZiB0aGlzIHNlcmllcyBpcyBh
dmFpbGFibGUgYXQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc2NTQ3MjEy
NS5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbQo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToK
Pgo+ICAtIHJlYmFzZSB0byB2Ni4xOS1yYzEgKG5vIGNvbmZsaWN0cykKPiAgLSBhZGQgdGFncyBy
ZWNlaXZlZCBzbyBmYXIKPiAgLSBmaXggd2hpdGVzcGFjZSBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkg
U3VtaXQgR2FyZwo+ICAtIGZpeCBzaHV0ZG93biBjYWxsYmFjayB0byBzaHV0ZG93biBhbmQgbm90
IHJlbW92ZQo+Cj4gQXMgYWxyZWFkeSBub3RlZCBpbiB2MSdzIGNvdmVyIGxldHRlciwgdGhpcyBz
ZXJpZXMgc2hvdWxkIGdvIGluIGR1cmluZyBhCj4gc2luZ2xlIG1lcmdlIHdpbmRvdyBhcyB0aGVy
ZSBhcmUgcnVudGltZSB3YXJuaW5ncyB3aGVuIHRoZSBzZXJpZXMgaXMKPiBvbmx5IGFwcGxpZWQg
cGFydGlhbGx5LiBTdW1pdCBHYXJnIHN1Z2dlc3RlZCB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVz
Cj4gdmlhIEplbnMgV2lrbGFuZGVyJ3MgdHJlZS4KPiBJZiB0aGlzIGlzIGRvbmUgdGhlIGRlcGVu
ZGVuY2llcyBpbiB0aGlzIHNlcmllcyBhcmUgaG9ub3JlZCwgaW4gY2FzZSB0aGUKPiBwbGFuIGNo
YW5nZXM6IFBhdGNoZXMgIzQgLSAjMTcgZGVwZW5kIG9uIHRoZSBmaXJzdCB0d28uCj4KPiBOb3Rl
IHRoaXMgc2VyaWVzIGlzIG9ubHkgYnVpbGQgdGVzdGVkLgo+Cj4gVXdlIEtsZWluZS1Lw7ZuaWcg
KDE3KToKPiAgIHRlZTogQWRkIHNvbWUgaGVscGVycyB0byByZWR1Y2UgYm9pbGVycGxhdGUgZm9y
IHRlZSBjbGllbnQgZHJpdmVycwo+ICAgdGVlOiBBZGQgcHJvYmUsIHJlbW92ZSBhbmQgc2h1dGRv
d24gYnVzIGNhbGxiYWNrcyB0byB0ZWVfY2xpZW50X2RyaXZlcgo+ICAgdGVlOiBBZGFwdCBkb2N1
bWVudGF0aW9uIHRvIGNvdmVyIHJlY2VudCBhZGRpdGlvbnMKPiAgIGh3cm5nOiBvcHRlZSAtIE1h
a2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4gICBod3JuZzogb3B0ZWUgLSBN
YWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiAgIHJ0Yzogb3B0ZWU6IE1pZ3JhdGUgdG8gdXNl
IHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4gICBydGM6IG9wdGVl
OiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiAgIGVmaTogc3RtbTogTWFrZSB1c2Ugb2Yg
bW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKPiAgIGVmaTogc3RtbTogTWFrZSB1c2Ugb2YgdGVl
IGJ1cyBtZXRob2RzCj4gICBmaXJtd2FyZTogYXJtX3NjbWk6IG9wdGVlOiBNYWtlIHVzZSBvZiBt
b2R1bGVfdGVlX2NsaWVudF9kcml2ZXIoKQo+ICAgZmlybXdhcmU6IGFybV9zY21pOiBNYWtlIHVz
ZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2Yg
bW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKPiAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1
c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gICBLRVlTOiB0cnVzdGVkOiBNaWdyYXRlIHRvIHVzZSB0
ZWUgc3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlvbgo+ICAgICBmdW5jdGlvbgo+ICAgS0VZUzog
dHJ1c3RlZDogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gICB0cG0vdHBtX2Z0cG1fdGVl
OiBNYWtlIHVzZSBvZiB0ZWUgc3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlvbgo+ICAgdHBtL3Rw
bV9mdHBtX3RlZTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4KPiAgRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL3RlZS5yc3QgICAgICAgICAgICAgfCAxOCArLS0tLQo+ICBkcml2ZXJzL2No
YXIvaHdfcmFuZG9tL29wdGVlLXJuZy5jICAgICAgICAgICB8IDI2ICsrLS0tLQo+ICBkcml2ZXJz
L2NoYXIvdHBtL3RwbV9mdHBtX3RlZS5jICAgICAgICAgICAgICB8IDMxICsrKysrLS0tCj4gIGRy
aXZlcnMvZmlybXdhcmUvYXJtX3NjbWkvdHJhbnNwb3J0cy9vcHRlZS5jIHwgMzIgKysrLS0tLS0K
PiAgZHJpdmVycy9maXJtd2FyZS9icm9hZGNvbS90ZWVfYm54dF9mdy5jICAgICAgfCAzMCArKy0t
LS0tCj4gIGRyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMgICAgIHwgMjUg
KystLS0tCj4gIGRyaXZlcnMvcnRjL3J0Yy1vcHRlZS5jICAgICAgICAgICAgICAgICAgICAgIHwg
MjcgKystLS0tLQo+ICBkcml2ZXJzL3RlZS90ZWVfY29yZS5jICAgICAgICAgICAgICAgICAgICAg
ICB8IDg0ICsrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvdGVlX2Rydi5oICAg
ICAgICAgICAgICAgICAgICAgIHwgMTIgKysrCj4gIHNlY3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlz
L3RydXN0ZWRfdGVlLmMgICAgIHwgMTcgKystLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAxNjQgaW5z
ZXJ0aW9ucygrKSwgMTM4IGRlbGV0aW9ucygtKQo+Cj4gYmFzZS1jb21taXQ6IDhmMGI0Y2NlNDQ4
MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3Y2IxZTgKPiAtLQo+IDIuNDcuMwo+CgpUaGFuayB5b3Ug
Zm9yIHRoZSBuaWNlIGNsZWFudXAsIFV3ZS4KCkkndmUgYXBwbGllZCBwYXRjaCAxLTMgdG8gdGhl
IGJyYW5jaCB0ZWVfYnVzX2NhbGxiYWNrX2Zvcl82LjIwIGluIG15CnRyZWUgYXQgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamVuc3dpL2xpbnV4LXRlZS5n
aXQvCgpUaGUgYnJhbmNoIGlzIGJhc2VkIG9uIHY2LjE5LXJjMSwgYW5kIEknbGwgdHJ5IHRvIGtl
ZXAgaXQgc3RhYmxlIGZvcgpvdGhlcnMgdG8gZGVwZW5kIG9uLCBpZiBuZWVkZWQuIExldCdzIHNl
ZSBpZiB3ZSBjYW4gYWdyZWUgb24gdGFraW5nCnRoZSByZW1haW5pbmcgcGF0Y2hlcyB2aWEgdGhh
dCBicmFuY2guCgpDaGVlcnMsCkplbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
