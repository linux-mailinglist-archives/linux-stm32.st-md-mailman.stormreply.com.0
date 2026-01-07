Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D734ACFCE36
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:36:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D74EC8F281;
	Wed,  7 Jan 2026 09:36:29 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AE1AC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:36:28 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-3ed15120e55so1301128fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767778587; x=1768383387;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAJ5e65k3z1Bl84v4hSYV5jHbNZ5QqotFXMyK4sLylU=;
 b=VtUdL5UM2Hx+4vYd7GOGSCkvqIBvjjrfW76TSA5PsplixAgOGSfYsVh5DgJzzzI1q2
 4YkTUJgO2GxttfIITHQEHNhpdUpFRiJCDig0ijnCYGlpw8r7njV6U8pd/nq865XyqLyG
 ir7Q3LbtnH+ApGWUQumZ0vLpy7/3dbr4+MW4Yd0FKDPqlQCSWfDb2x2AGWJ9UAsdzzFl
 1s+sxnVdHoKFD6lpQ0tw9wPHX3VJHJX4Bwxshug8bAh6HyR+ZAGbxnOzmWY3UF+sV58a
 Hv3Lp5sHNhiOPDjtlu8gq43T/jz3nR0H/OUFxLQN9M8TLjcLfBuhYhhyp448TDj/W1J5
 oaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767778587; x=1768383387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GAJ5e65k3z1Bl84v4hSYV5jHbNZ5QqotFXMyK4sLylU=;
 b=uVA2koMucXCtdDDkK0sWt16VXq5w5HNE0p0gdOkSbmtDjpBM5A4+0cy8hUnTY8Icew
 dPBgqCXZGvCGY0Sjqm8NrOgG5NP/B724WQhuoWNGjPxeZtp8JckGFSykasCnA07/I6FZ
 1+1xyJN7IhRVE7k4Cu1+mZxnMHDUK4qw5zj3qCvAW0SVaS1nwLctW1KMJg26QwTq0Ji+
 iteDV8yey7HBUAjZDQsXP5sN/Qg7h9ZlDuWzgboLNNt/yh+VoUm4naiQpbXgbSRrQV0d
 g58YnBmq489H1TxWPGkyFfFVp65gO0P+de2JWmNUqY452fw8/KDX4vEI1poumf7jxSn0
 8+gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ5BF/2QL8/1tx3sAyc0p2Jt82X+kwjtOz2ohjFKi9RK15MNzvovxpWK6UJfLV1sSMTUZJyMFq2Gtbaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxblyyMKFeaNorx7wJm2MnFoDKVXFaBEzkqLPy73aGFPL5P1t5y
 OpJ+tswCz/TURVSh37nBdvATqNXmUVHpjokclOiQPappeDS8CFkcYaNtr9eGNV0ZIzbkAhxBxMM
 aUADfXrsHHJn6ql2Y2IhV/5mm4lfGYyWXLsaKxrQCKA==
X-Gm-Gg: AY/fxX5fUzlY3R8I5VZWZJ4w7X6Qz8aRHAx34CgpCal3K3DT/C8IH36Kyadh8Yxd2ym
 fhWZ67ATjNuakKlOwOOeOxdVzmdN3Z/3XwC/InACbvUQRTXfaa29Anw28n2l3FAnW/PE0KvaHLu
 sj9xXD+I0BMwfAg8vDrIJxB32pKprx8QKzgQZNgD02UXeTPwaZNs1yy5F3TQI/zbApqWQ6RybdO
 OQmRw0IEYSdYzlQpixRAR4Pv14LBY/umIBwYs7RTY0OlD7avpXh84hkacdn0qyGuVXctEr8MmO2
 kO2d3kjIXQIBz6H4Dp06PDqBdw==
X-Google-Smtp-Source: AGHT+IH8mMrbtH032ZDWJFlkRThntfnwmPEqUqd2JDeL8NGsufG7LDpL42U7yHJF4QJdKPnzDUAc6fHTBjr7gAIIOLU=
X-Received: by 2002:a4a:ba13:0:b0:659:9a49:8f89 with SMTP id
 006d021491bc7-65f55085418mr579167eaf.78.1767778586821; Wed, 07 Jan 2026
 01:36:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <d14a9c41-9df7-438f-bb58-097644d5d93f@nvidia.com>
In-Reply-To: <d14a9c41-9df7-438f-bb58-097644d5d93f@nvidia.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 Jan 2026 10:36:15 +0100
X-Gm-Features: AQt7F2pWAOmWwJm8vdt2KOCYOYr18EvzYgjBZjv21zyTW_ttRjt9UA8BFElgUTo
Message-ID: <CAHUa44Hhyz_zF5JtCz00YqbgoPTLK2iS7NBT8UwOLpAz=3VZAA@mail.gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-mips@vger.kernel.org, David Howells <dhowells@redhat.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
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

SGkgSm9uLAoKT24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMDo0MOKAr0FNIEpvbiBIdW50ZXIgPGpv
bmF0aGFuaEBudmlkaWEuY29tPiB3cm90ZToKPgo+IEhpIFV3ZSwKPgo+IE9uIDE1LzEyLzIwMjUg
MTQ6MTYsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4gdGhlIG9i
amVjdGl2ZSBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRlZSBkcml2ZXIgc3RvcCB1c2luZyBj
YWxsYmFja3MKPiA+IGluIHN0cnVjdCBkZXZpY2VfZHJpdmVyLiBUaGVzZSB3ZXJlIHN1cGVyc2Vk
ZWQgYnkgYnVzIG1ldGhvZHMgaW4gMjAwNgo+ID4gKGNvbW1pdCA1OTRjODI4MWY5MDUgKCJbUEFU
Q0hdIEFkZCBidXNfdHlwZSBwcm9iZSwgcmVtb3ZlLCBzaHV0ZG93bgo+ID4gbWV0aG9kcy4iKSkg
YnV0IG5vYm9keSBjYXJlZCB0byBjb252ZXJ0IGFsbCBzdWJzeXN0ZW1zIGFjY29yZGluZ2x5Lgo+
ID4KPiA+IEhlcmUgdGhlIHRlZSBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQuIFRoZSBmaXJzdCBjb21t
aXQgaXMgc29tZXdoYXQKPiA+IHVucmVsYXRlZCwgYnV0IHNpbXBsaWZpZXMgdGhlIGNvbnZlcnNp
b24gKGFuZCB0aGUgZHJpdmVycykuIEl0Cj4gPiBpbnRyb2R1Y2VzIGRyaXZlciByZWdpc3RyYXRp
b24gaGVscGVycyB0aGF0IGNhcmUgYWJvdXQgc2V0dGluZyB0aGUgYnVzCj4gPiBhbmQgb3duZXIu
IChUaGUgbGF0dGVyIGlzIG1pc3NpbmcgaW4gYWxsIGRyaXZlcnMsIHNvIGJ5IHVzaW5nIHRoZXNl
Cj4gPiBoZWxwZXJzIHRoZSBkcml2ZXJzIGJlY29tZSBtb3JlIGNvcnJlY3QuKQo+ID4KPiA+IHYx
IG9mIHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBhdAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NvdmVyLjE3NjU0NzIxMjUuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20K
PiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4KPiA+ICAgLSByZWJhc2UgdG8gdjYuMTktcmMx
IChubyBjb25mbGljdHMpCj4gPiAgIC0gYWRkIHRhZ3MgcmVjZWl2ZWQgc28gZmFyCj4gPiAgIC0g
Zml4IHdoaXRlc3BhY2UgaXNzdWVzIHBvaW50ZWQgb3V0IGJ5IFN1bWl0IEdhcmcKPiA+ICAgLSBm
aXggc2h1dGRvd24gY2FsbGJhY2sgdG8gc2h1dGRvd24gYW5kIG5vdCByZW1vdmUKPiA+Cj4gPiBB
cyBhbHJlYWR5IG5vdGVkIGluIHYxJ3MgY292ZXIgbGV0dGVyLCB0aGlzIHNlcmllcyBzaG91bGQg
Z28gaW4gZHVyaW5nIGEKPiA+IHNpbmdsZSBtZXJnZSB3aW5kb3cgYXMgdGhlcmUgYXJlIHJ1bnRp
bWUgd2FybmluZ3Mgd2hlbiB0aGUgc2VyaWVzIGlzCj4gPiBvbmx5IGFwcGxpZWQgcGFydGlhbGx5
LiBTdW1pdCBHYXJnIHN1Z2dlc3RlZCB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVzCj4gPiB2aWEg
SmVucyBXaWtsYW5kZXIncyB0cmVlLgo+ID4gSWYgdGhpcyBpcyBkb25lIHRoZSBkZXBlbmRlbmNp
ZXMgaW4gdGhpcyBzZXJpZXMgYXJlIGhvbm9yZWQsIGluIGNhc2UgdGhlCj4gPiBwbGFuIGNoYW5n
ZXM6IFBhdGNoZXMgIzQgLSAjMTcgZGVwZW5kIG9uIHRoZSBmaXJzdCB0d28uCj4gPgo+ID4gTm90
ZSB0aGlzIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRlc3RlZC4KPiA+Cj4gPiBVd2UgS2xlaW5lLUvD
tm5pZyAoMTcpOgo+ID4gICAgdGVlOiBBZGQgc29tZSBoZWxwZXJzIHRvIHJlZHVjZSBib2lsZXJw
bGF0ZSBmb3IgdGVlIGNsaWVudCBkcml2ZXJzCj4gPiAgICB0ZWU6IEFkZCBwcm9iZSwgcmVtb3Zl
IGFuZCBzaHV0ZG93biBidXMgY2FsbGJhY2tzIHRvIHRlZV9jbGllbnRfZHJpdmVyCj4gPiAgICB0
ZWU6IEFkYXB0IGRvY3VtZW50YXRpb24gdG8gY292ZXIgcmVjZW50IGFkZGl0aW9ucwo+ID4gICAg
aHdybmc6IG9wdGVlIC0gTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKPiA+
ICAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gICAgcnRj
OiBvcHRlZTogTWlncmF0ZSB0byB1c2UgdGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3RyYXRpb24g
ZnVuY3Rpb24KPiA+ICAgIHJ0Yzogb3B0ZWU6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+
ID4gICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9kcml2ZXIoKQo+
ID4gICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+ICAgIGZpcm13
YXJlOiBhcm1fc2NtaTogb3B0ZWU6IE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZl
cigpCj4gPiAgICBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwo+ID4gICAgZmlybXdhcmU6IHRlZV9ibnh0OiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVu
dF9kcml2ZXIoKQo+ID4gICAgZmlybXdhcmU6IHRlZV9ibnh0OiBNYWtlIHVzZSBvZiB0ZWUgYnVz
IG1ldGhvZHMKPiA+ICAgIEtFWVM6IHRydXN0ZWQ6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZp
YyBkcml2ZXIgcmVnaXN0cmF0aW9uCj4gPiAgICAgIGZ1bmN0aW9uCj4gPiAgICBLRVlTOiB0cnVz
dGVkOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+ICAgIHRwbS90cG1fZnRwbV90ZWU6
IE1ha2UgdXNlIG9mIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uCj4gPiAgICB0cG0v
dHBtX2Z0cG1fdGVlOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPgo+Cj4gT24gdGhlIG5l
eHQtMjAyNjAxMDUgSSBhbSBzZWVpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5ncyAuLi4KPgo+ICAg
V0FSTklORyBLRVJOIERyaXZlciAnb3B0ZWUtcm5nJyBuZWVkcyB1cGRhdGluZyAtIHBsZWFzZSB1
c2UgYnVzX3R5cGUgbWV0aG9kcwo+ICAgV0FSTklORyBLRVJOIERyaXZlciAnc2NtaS1vcHRlZScg
bmVlZHMgdXBkYXRpbmcgLSBwbGVhc2UgdXNlIGJ1c190eXBlIG1ldGhvZHMKPiAgIFdBUk5JTkcg
S0VSTiBEcml2ZXIgJ3RlZV9ibnh0X2Z3JyBuZWVkcyB1cGRhdGluZyAtIHBsZWFzZSB1c2UgYnVz
X3R5cGUgbWV0aG9kcwo+Cj4gSSBiaXNlY3RlZCB0aGUgZmlyc3Qgd2FybmluZyBhbmQgdGhpcyBw
b2ludCB0byB0aGUgZm9sbG93aW5nCj4gY29tbWl0IC4uLgo+Cj4gIyBmaXJzdCBiYWQgY29tbWl0
OiBbYTcwN2VkYTMzMGI5MzJiY2Y2OThiZTk0NjBlNTRlMmYzODllMjRiN10gdGVlOiBBZGQgc29t
ZSBoZWxwZXJzIHRvIHJlZHVjZSBib2lsZXJwbGF0ZSBmb3IgdGVlIGNsaWVudCBkcml2ZXJzCj4K
PiBJIGhhdmUgbm90IGJpc2VjdGVkIHRoZSBvdGhlcnMsIGJ1dCBndWVzcyB0aGV5IGFyZSByZWxh
dGVkCj4gdG8gdGhpcyBzZXJpZXMuIERvIHlvdSBvYnNlcnZlIHRoZSBzYW1lPwoKWWVzLCBJIHNl
ZSB0aGUgc2FtZS4KCkknbSBzb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHNvbWVvbmUgbWln
aHQgYmlzZWN0IHRoaXMgd2hlbiBJIHRvb2sKb25seSBhIGZldyBvZiB0aGUgcGF0Y2hlcyBpbnRv
IG5leHQuIEkndmUgYXBwbGllZCBhbGwgdGhlIHBhdGNoZXMgaW4KdGhpcyBzZXJpZXMgbm93LgoK
VGhhbmtzLApKZW5zCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
