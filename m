Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662ECF2AAB
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 10:16:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEDF2C35E3C;
	Mon,  5 Jan 2026 09:16:23 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3218C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 09:16:22 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-65b6b69baf8so2608248eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767604581; x=1768209381;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
 b=apwQiHFMv3ie33VLi1f+iC6EHnSzw6iMUfxqy1rn0/CnIMpYTpz0NaF5qJob0h3RYu
 fgt+DAlTfA2tJV5zNcsPW3e8SKHspx5bqLE7MNeHPus9XnyS2E1RVvMJuQNtteMJ/H1O
 UF5Z5SoS/Oi9NE42GMXISYie9ymXkrot37H4f4e3PkXhsdya0jzRu/pPwU4niUZPZa73
 q6Qpc6uoWyWwQga+2EGT6PnbZ58KiMmRI/SRAlQDEW7e48k2o1GlId6INC/CglBZMT4y
 acRo7Hr/lExOwjQt1NjjTjZJ25o4PRqHx7yNciGziYE6UUWaVJOZUa/LA1LcZplSuROO
 e99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767604581; x=1768209381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xS4Pieemzy4r1o+XZyR7jxfKf1/JCiqumXmtg6ZAf0Y=;
 b=CL3kjjrw6fZG1wdkxYHOdfONz3PBkaCY8W0s+vpON0HAltcIrdzm5Hlv1caKowsixZ
 DdcdgIthDzgC3oYzw75a998C1IBYwjKtFK2zfzdefyvkJl5pw/wQKis5kZmuq9rBKtYk
 dPl8AbE98u8Wxc2SU9WUAj732tlH9mte8BMiMu3sKGb9PULd4VXlyc55UaBZpNr7p4+b
 YxKAU+JhWmPM6YJKJkcBpQ7sdDdQqZOq864P/c0DwrM/9Km4sGerADDGjIpjLHj7TRsA
 LzQlL/zLFrOxhCWiZWfaffYUr24S1Ws3wkpF2DAO5maxvGz1tB4z4qcofxQbQv7YmPLg
 OMyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/r9LkBCitiGz2N/3AnxLJt9TO+4dif3+y0Le/T/kv2zkBIYSnqIGs9/ULnMms6LDrY/0dkbcXBNI+5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBidENmulAqLILuRScsGxIsMZhyBmZ0LLLJs6fXS0mPYC7v44W
 KCm9Tf4tHk/44c9SWCHdvQr9+3zca58hjNxtW7YL8LUJsEP05klqZ824a5TGby719O2ELPIMRRv
 fEq2TEjykjGIEae6AoOjUwsyv1nrt0IekVOkFI8o6Zg==
X-Gm-Gg: AY/fxX7VmxFhDWaWoYbxTy+wQuVV53VU+ii8fN4eRkSvBkIeB8XZxE3wUBNduwgQm05
 4l2O6625zQ5s2RWW/oz4P7+WNPqvMekpu5ZH/NRM1m3lToztQIb2Lw8q5N+rSNAMtXa9/GKG2pD
 KcglW9OLTguLpeYxiWYW6OWuvBNSbjylRcdTrtr0p4U0YAHhKfygmJBDF+pM9d8RCcYutO92dUO
 A0pgm6iv4rUVm2NukGgiRnlQM2+KvlQdPm9ml+rG1R5Gxxg9uZoK6ehzSo5H2spX+onyhG4jZIJ
 Z9U7Me/v5tUqJoten/d/lMsd7Q==
X-Google-Smtp-Source: AGHT+IHdtu3uK1YvLPvRXmBmsYletnr+Fy6yEnWw7FcQJMBZUAFsUyE2L/0PG3GpU/2KGeBY95bkFD0S8glmAzrpFaU=
X-Received: by 2002:a05:6820:2289:b0:65c:f9c1:cba0 with SMTP id
 006d021491bc7-65d0ea16a88mr23376881eaf.37.1767604581140; Mon, 05 Jan 2026
 01:16:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
 <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
In-Reply-To: <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 10:16:09 +0100
X-Gm-Features: AQt7F2q8lTcIoa5xBnvz2Mkjx2axWX5OMGPJpQNfFM5WoFI2KGlEdVoT6sJvPQg
Message-ID: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
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
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
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

SGksCgpPbiBUaHUsIERlYyAxOCwgMjAyNSBhdCA1OjI54oCvUE0gSmVucyBXaWtsYW5kZXIKPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMTgsIDIwMjUg
YXQgMjo1M+KAr1BNIEFsZXhhbmRyZSBCZWxsb25pCj4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAxOC8xMi8yMDI1IDA4OjIxOjI3KzAxMDAsIEplbnMg
V2lrbGFuZGVyIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gTW9uLCBEZWMgMTUsIDIw
MjUgYXQgMzoxN+KAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA+IDx1LmtsZWluZS1rb2VuaWdA
YmF5bGlicmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhlbGxvLAo+ID4gPiA+Cj4gPiA+
ID4gdGhlIG9iamVjdGl2ZSBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRlZSBkcml2ZXIgc3Rv
cCB1c2luZyBjYWxsYmFja3MKPiA+ID4gPiBpbiBzdHJ1Y3QgZGV2aWNlX2RyaXZlci4gVGhlc2Ug
d2VyZSBzdXBlcnNlZGVkIGJ5IGJ1cyBtZXRob2RzIGluIDIwMDYKPiA+ID4gPiAoY29tbWl0IDU5
NGM4MjgxZjkwNSAoIltQQVRDSF0gQWRkIGJ1c190eXBlIHByb2JlLCByZW1vdmUsIHNodXRkb3du
Cj4gPiA+ID4gbWV0aG9kcy4iKSkgYnV0IG5vYm9keSBjYXJlZCB0byBjb252ZXJ0IGFsbCBzdWJz
eXN0ZW1zIGFjY29yZGluZ2x5Lgo+ID4gPiA+Cj4gPiA+ID4gSGVyZSB0aGUgdGVlIGRyaXZlcnMg
YXJlIGNvbnZlcnRlZC4gVGhlIGZpcnN0IGNvbW1pdCBpcyBzb21ld2hhdAo+ID4gPiA+IHVucmVs
YXRlZCwgYnV0IHNpbXBsaWZpZXMgdGhlIGNvbnZlcnNpb24gKGFuZCB0aGUgZHJpdmVycykuIEl0
Cj4gPiA+ID4gaW50cm9kdWNlcyBkcml2ZXIgcmVnaXN0cmF0aW9uIGhlbHBlcnMgdGhhdCBjYXJl
IGFib3V0IHNldHRpbmcgdGhlIGJ1cwo+ID4gPiA+IGFuZCBvd25lci4gKFRoZSBsYXR0ZXIgaXMg
bWlzc2luZyBpbiBhbGwgZHJpdmVycywgc28gYnkgdXNpbmcgdGhlc2UKPiA+ID4gPiBoZWxwZXJz
IHRoZSBkcml2ZXJzIGJlY29tZSBtb3JlIGNvcnJlY3QuKQo+ID4gPiA+Cj4gPiA+ID4gdjEgb2Yg
dGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxlIGF0Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NvdmVyLjE3NjU0NzIxMjUuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20K
PiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiA+ID4KPiA+ID4gPiAgLSByZWJh
c2UgdG8gdjYuMTktcmMxIChubyBjb25mbGljdHMpCj4gPiA+ID4gIC0gYWRkIHRhZ3MgcmVjZWl2
ZWQgc28gZmFyCj4gPiA+ID4gIC0gZml4IHdoaXRlc3BhY2UgaXNzdWVzIHBvaW50ZWQgb3V0IGJ5
IFN1bWl0IEdhcmcKPiA+ID4gPiAgLSBmaXggc2h1dGRvd24gY2FsbGJhY2sgdG8gc2h1dGRvd24g
YW5kIG5vdCByZW1vdmUKPiA+ID4gPgo+ID4gPiA+IEFzIGFscmVhZHkgbm90ZWQgaW4gdjEncyBj
b3ZlciBsZXR0ZXIsIHRoaXMgc2VyaWVzIHNob3VsZCBnbyBpbiBkdXJpbmcgYQo+ID4gPiA+IHNp
bmdsZSBtZXJnZSB3aW5kb3cgYXMgdGhlcmUgYXJlIHJ1bnRpbWUgd2FybmluZ3Mgd2hlbiB0aGUg
c2VyaWVzIGlzCj4gPiA+ID4gb25seSBhcHBsaWVkIHBhcnRpYWxseS4gU3VtaXQgR2FyZyBzdWdn
ZXN0ZWQgdG8gYXBwbHkgdGhlIHdob2xlIHNlcmllcwo+ID4gPiA+IHZpYSBKZW5zIFdpa2xhbmRl
cidzIHRyZWUuCj4gPiA+ID4gSWYgdGhpcyBpcyBkb25lIHRoZSBkZXBlbmRlbmNpZXMgaW4gdGhp
cyBzZXJpZXMgYXJlIGhvbm9yZWQsIGluIGNhc2UgdGhlCj4gPiA+ID4gcGxhbiBjaGFuZ2VzOiBQ
YXRjaGVzICM0IC0gIzE3IGRlcGVuZCBvbiB0aGUgZmlyc3QgdHdvLgo+ID4gPiA+Cj4gPiA+ID4g
Tm90ZSB0aGlzIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRlc3RlZC4KPiA+ID4gPgo+ID4gPiA+IFV3
ZSBLbGVpbmUtS8O2bmlnICgxNyk6Cj4gPiA+ID4gICB0ZWU6IEFkZCBzb21lIGhlbHBlcnMgdG8g
cmVkdWNlIGJvaWxlcnBsYXRlIGZvciB0ZWUgY2xpZW50IGRyaXZlcnMKPiA+ID4gPiAgIHRlZTog
QWRkIHByb2JlLCByZW1vdmUgYW5kIHNodXRkb3duIGJ1cyBjYWxsYmFja3MgdG8gdGVlX2NsaWVu
dF9kcml2ZXIKPiA+ID4gPiAgIHRlZTogQWRhcHQgZG9jdW1lbnRhdGlvbiB0byBjb3ZlciByZWNl
bnQgYWRkaXRpb25zCj4gPiA+ID4gICBod3JuZzogb3B0ZWUgLSBNYWtlIHVzZSBvZiBtb2R1bGVf
dGVlX2NsaWVudF9kcml2ZXIoKQo+ID4gPiA+ICAgaHdybmc6IG9wdGVlIC0gTWFrZSB1c2Ugb2Yg
dGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gICBydGM6IG9wdGVlOiBNaWdyYXRlIHRvIHVzZSB0ZWUg
c3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlvbiBmdW5jdGlvbgo+ID4gPiA+ICAgcnRjOiBvcHRl
ZTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gICBlZmk6IHN0bW06IE1ha2Ug
dXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4gPiA+ID4gICBlZmk6IHN0bW06IE1h
a2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiA+ICAgZmlybXdhcmU6IGFybV9zY21pOiBv
cHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKPiA+ID4gPiAgIGZp
cm13YXJlOiBhcm1fc2NtaTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gICBm
aXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigp
Cj4gPiA+ID4gICBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwo+ID4gPiA+ICAgS0VZUzogdHJ1c3RlZDogTWlncmF0ZSB0byB1c2UgdGVlIHNwZWNpZmljIGRy
aXZlciByZWdpc3RyYXRpb24KPiA+ID4gPiAgICAgZnVuY3Rpb24KPiA+ID4gPiAgIEtFWVM6IHRy
dXN0ZWQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiA+ICAgdHBtL3RwbV9mdHBt
X3RlZTogTWFrZSB1c2Ugb2YgdGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3RyYXRpb24KPiA+ID4g
PiAgIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiA+
Cj4gPiA+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS90ZWUucnN0ICAgICAgICAgICAgIHwg
MTggKy0tLS0KPiA+ID4gPiAgZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9vcHRlZS1ybmcuYyAgICAg
ICAgICAgfCAyNiArKy0tLS0KPiA+ID4gPiAgZHJpdmVycy9jaGFyL3RwbS90cG1fZnRwbV90ZWUu
YyAgICAgICAgICAgICAgfCAzMSArKysrKy0tLQo+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL2Fy
bV9zY21pL3RyYW5zcG9ydHMvb3B0ZWUuYyB8IDMyICsrKy0tLS0tCj4gPiA+ID4gIGRyaXZlcnMv
ZmlybXdhcmUvYnJvYWRjb20vdGVlX2JueHRfZncuYyAgICAgIHwgMzAgKystLS0tLQo+ID4gPiA+
ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2VmaS5jICAgICB8IDI1ICsrLS0t
LQo+ID4gPiA+ICBkcml2ZXJzL3J0Yy9ydGMtb3B0ZWUuYyAgICAgICAgICAgICAgICAgICAgICB8
IDI3ICsrLS0tLS0KPiA+ID4gPiAgZHJpdmVycy90ZWUvdGVlX2NvcmUuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCA4NCArKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4
L3RlZV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKwo+ID4gPiA+ICBzZWN1cml0
eS9rZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX3RlZS5jICAgICB8IDE3ICsrLS0KPiA+ID4gPiAg
MTAgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDEzOCBkZWxldGlvbnMoLSkKPiA+
ID4gPgo+ID4gPiA+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhkMGQw
NDAyN2NiMWU4Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQ3LjMKPiA+ID4gPgo+ID4gPgo+ID4gPiBU
aGFuayB5b3UgZm9yIHRoZSBuaWNlIGNsZWFudXAsIFV3ZS4KPiA+ID4KPiA+ID4gSSd2ZSBhcHBs
aWVkIHBhdGNoIDEtMyB0byB0aGUgYnJhbmNoIHRlZV9idXNfY2FsbGJhY2tfZm9yXzYuMjAgaW4g
bXkKPiA+ID4gdHJlZSBhdCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9qZW5zd2kvbGludXgtdGVlLmdpdC8KPiA+ID4KPiA+ID4gVGhlIGJyYW5jaCBpcyBi
YXNlZCBvbiB2Ni4xOS1yYzEsIGFuZCBJJ2xsIHRyeSB0byBrZWVwIGl0IHN0YWJsZSBmb3IKPiA+
ID4gb3RoZXJzIHRvIGRlcGVuZCBvbiwgaWYgbmVlZGVkLiBMZXQncyBzZWUgaWYgd2UgY2FuIGFn
cmVlIG9uIHRha2luZwo+ID4gPiB0aGUgcmVtYWluaW5nIHBhdGNoZXMgdmlhIHRoYXQgYnJhbmNo
Lgo+ID4KPiA+IDYgYW5kIDcgY2FuIGdvIHRocm91Z2ggeW91ciBicmFuY2guCj4KPiBHb29kLCBJ
J3ZlIGFkZGVkIHRoZW0gdG8gbXkgYnJhbmNoIG5vdy4KClRoaXMgZW50aXJlIHBhdGNoIHNldCBz
aG91bGQgZ28gaW4gZHVyaW5nIGEgc2luZ2xlIG1lcmdlIHdpbmRvdy4gSQp3aWxsIG5vdCBzZW5k
IGFueSBwdWxsIHJlcXVlc3QgdW50aWwgSSdtIHN1cmUgYWxsIHBhdGNoZXMgd2lsbCBiZQptZXJn
ZWQuCgpTbyBmYXIgKGlmIEknbSBub3QgbWlzdGFrZW4pLCBvbmx5IHRoZSBwYXRjaGVzIEkndmUg
YWxyZWFkeSBhZGRlZCB0bwpuZXh0IGhhdmUgYXBwZWFyZWQgbmV4dC4gSSBjYW4gdGFrZSB0aGUg
cmVzdCBvZiB0aGUgcGF0Y2hlcywgdG9vLCBidXQKSSBuZWVkIE9LIGZvciB0aGUgZm9sbG93aW5n
OgoKSmFya2tvLCB5b3Ugc2VlbSBoYXBweSB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcwotIEtF
WVM6IHRydXN0ZWQ6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0
aW9uIGZ1bmN0aW9uCi0gS0VZUzogdHJ1c3RlZDogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2Rz
Ci0gdHBtL3RwbV9mdHBtX3RlZTogTWFrZSB1c2Ugb2YgdGVlIHNwZWNpZmljIGRyaXZlciByZWdp
c3RyYXRpb24KLSB0cG0vdHBtX2Z0cG1fdGVlOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMK
T0sgaWYgSSB0YWtlIHRoZW0gdmlhIG15IHRyZWUsIG9yIHdvdWxkIHlvdSByYXRoZXIgdGFrZSB0
aGVtIHlvdXJzZWxmPwoKSGVyYmVydCwgeW91IHNlZW0gaGFwcHkgd2l0aCB0aGUgZm9sbG93aW5n
IHBhdGNoZXMKLSBod3JuZzogb3B0ZWUgLSBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9k
cml2ZXIoKQotIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwpPSyBp
ZiBJIHRha2UgdGhlbSB2aWEgbXkgdHJlZSwgb3Igd291bGQgeW91IHJhdGhlciB0YWtlIHRoZW0g
eW91cnNlbGY/CgpTdWRlZXAsIHlvdSBzZWVtIGhhcHB5IHdpdGggdGhlIGZvbGxvd2luZyBwYXRj
aGVzCi0gZmlybXdhcmU6IGFybV9zY21pOiBvcHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9j
bGllbnRfZHJpdmVyKCkKLSBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRlZSBidXMg
bWV0aG9kcwpPSyBpZiBJIHRha2UgdGhlbSB2aWEgbXkgdHJlZSwgb3Igd291bGQgeW91IHJhdGhl
ciB0YWtlIHRoZW0geW91cnNlbGY/CgpNaWNoYWVsLCBQYXZhbiwgYXJlIHlvdSBPSyB3aXRoIHRo
ZSBmb2xsb3dpbmcgcGF0Y2hlcwotIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgbW9k
dWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKLSBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9m
IHRlZSBidXMgbWV0aG9kcwpPSyBpZiBJIHRha2UgdGhlbSB2aWEgbXkgdHJlZSwgb3Igd291bGQg
eW91IHJhdGhlciB0YWtlIHRoZW0geW91cnNlbGY/CgpUaGFua3MsCkplbnMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
