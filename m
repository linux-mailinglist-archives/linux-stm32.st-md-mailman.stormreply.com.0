Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6ECCCC25
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 17:29:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 116BFC58D7A;
	Thu, 18 Dec 2025 16:29:27 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419E5C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 16:29:25 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-65cfb4beabcso434289eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 08:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766075364; x=1766680164;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMSbry1+P/RNP4K+kKiw/SAaU8hSKKePZ7aYLlJ/2Ro=;
 b=nS/MZVX3ispy99phx4GJ++mnhIpSg+8UVEmYTZBDm5uAHJGNTdpFOncdXp/np7FDfh
 J/cRMZ3bSMSQn9bCyv9wjAORd39FoRTMlt5itX6WdpK8Z+6E0eaabmL7nPR1DMhgsOyE
 DbdN50uXXFEhdDlmpzKpQzl+l7zs9JirrQqCr9LvOybPbUbEt4YJAn8ePwQtz/9Z2Upa
 7zlh7bwOymNtFk+hfTd6aRhSvFWb3l+C/yrVWa9BrJ3/DpMs03YhPItn2z7436892X4g
 qHrn2L+fG/shpJxb+EsjxY2ilyl8P0iMB4Q5Z1Luf8tywysPLPv6DWmjRG6GN67NGB7m
 vghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766075364; x=1766680164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zMSbry1+P/RNP4K+kKiw/SAaU8hSKKePZ7aYLlJ/2Ro=;
 b=i61MdiMdkBSUyFq2JXLUznrjyLiZkqT7HCfW8psEqtUMIlUM2xhmQ1sVlspnEJS32a
 S/bVRT/pRHgxrw29T3388nW/h/WLdQYgweegwDP6WhKPgmrefLX06e99R7Osw9pCsAez
 FIujXAYLVlEra0yOELz2W94WBc8Yj3LRZlFu3Hznr5PI/VEFjglUw4+QRmHue8wgBaAc
 nQhuHEJEdfok6DFZ+EyM4ldRf3AShhzjhtTnJT5+8jq0AFksONDspX0mgT0ZYH/FsdoE
 horQaltj+nA3WEaTXMvTEwdhiejZ8WQrcRHYsm1kGDkLWyTC7Y9yBC0sbw+0ETgdPqtO
 Q3Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX00nBtdKNoSWeOcDbAL1fO9o39EtIFkF7LukTgxEzdD9ad2EdeMP+PGofuIACXm1emBrh0AYfJdnwCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx267yOj9JSKCsQxKTPq1R5DkqaIWc7bKyNLNbUZaCu6/rGMODr
 RttFLaDqvU6Ma0ffMR+egtLsLpnSoWte9UI7iLov9Y77vPS/Q6eF72D3e+2DcLVTh/zbo5GeiUb
 DAK7jOifRwx6+JXtV+kfv911o9FTcB0XdZxMOyZ452w==
X-Gm-Gg: AY/fxX6rh3pHt/i7SfAkZi22waaaKJCNFx9x+ai/kPfUtLsFQ2sOEdM+BjvSMp2ODiv
 yiM0JOCfd5WMAWOl/Yri3EQ/tSIfjzm6CwQ3GjS4cvZxRAm4nA1XPD51bSlVkU1VZcur1LeGnAk
 tNo4z/7Pr61UG7xbkpuPJSEjrMcgUxb21g7h0y5YkgHD2T1USxRt5sWoT4gi1lIXIjBQ5MRAJXd
 6oCo/B0Ic8f93h/X+yGXzTB8j3Gs+dhLsqj7dkktjfPPyrUMt7L5v/tdWXH3+dBnlboh47DjYTZ
 eozgMNYNHhXb4JGsCo8Qx5p0fw==
X-Google-Smtp-Source: AGHT+IG4Ae8pfu7GZWy4M+xMepW+pZBXhOq0aMMfvpQMcwHosUK2iqdP0ZilC2IC9nPL0ue49M44wROrYBjFkfFnq4M=
X-Received: by 2002:a05:6820:6389:b0:657:4e49:83b7 with SMTP id
 006d021491bc7-65d0e9fe36fmr11432eaf.1.1766075363719; Thu, 18 Dec 2025
 08:29:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
In-Reply-To: <20251218135332f323fa91@mail.local>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 18 Dec 2025 17:29:11 +0100
X-Gm-Features: AQt7F2pA2I_HJOEbadmjsOrYtjrxD8lxVlzGBd-sNqyaYCgybyYAHq_YVDlH-Pg
Message-ID: <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMjo1M+KAr1BNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAxOC8xMi8yMDI1IDA4OjIx
OjI3KzAxMDAsIEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gTW9uLCBE
ZWMgMTUsIDIwMjUgYXQgMzoxN+KAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4gPgo+ID4g
PiB0aGUgb2JqZWN0aXZlIG9mIHRoaXMgc2VyaWVzIGlzIHRvIG1ha2UgdGVlIGRyaXZlciBzdG9w
IHVzaW5nIGNhbGxiYWNrcwo+ID4gPiBpbiBzdHJ1Y3QgZGV2aWNlX2RyaXZlci4gVGhlc2Ugd2Vy
ZSBzdXBlcnNlZGVkIGJ5IGJ1cyBtZXRob2RzIGluIDIwMDYKPiA+ID4gKGNvbW1pdCA1OTRjODI4
MWY5MDUgKCJbUEFUQ0hdIEFkZCBidXNfdHlwZSBwcm9iZSwgcmVtb3ZlLCBzaHV0ZG93bgo+ID4g
PiBtZXRob2RzLiIpKSBidXQgbm9ib2R5IGNhcmVkIHRvIGNvbnZlcnQgYWxsIHN1YnN5c3RlbXMg
YWNjb3JkaW5nbHkuCj4gPiA+Cj4gPiA+IEhlcmUgdGhlIHRlZSBkcml2ZXJzIGFyZSBjb252ZXJ0
ZWQuIFRoZSBmaXJzdCBjb21taXQgaXMgc29tZXdoYXQKPiA+ID4gdW5yZWxhdGVkLCBidXQgc2lt
cGxpZmllcyB0aGUgY29udmVyc2lvbiAoYW5kIHRoZSBkcml2ZXJzKS4gSXQKPiA+ID4gaW50cm9k
dWNlcyBkcml2ZXIgcmVnaXN0cmF0aW9uIGhlbHBlcnMgdGhhdCBjYXJlIGFib3V0IHNldHRpbmcg
dGhlIGJ1cwo+ID4gPiBhbmQgb3duZXIuIChUaGUgbGF0dGVyIGlzIG1pc3NpbmcgaW4gYWxsIGRy
aXZlcnMsIHNvIGJ5IHVzaW5nIHRoZXNlCj4gPiA+IGhlbHBlcnMgdGhlIGRyaXZlcnMgYmVjb21l
IG1vcmUgY29ycmVjdC4pCj4gPiA+Cj4gPiA+IHYxIG9mIHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJs
ZSBhdAo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc2NTQ3MjEyNS5n
aXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbQo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ID4gPgo+ID4gPiAgLSByZWJhc2UgdG8gdjYuMTktcmMxIChubyBjb25mbGljdHMpCj4g
PiA+ICAtIGFkZCB0YWdzIHJlY2VpdmVkIHNvIGZhcgo+ID4gPiAgLSBmaXggd2hpdGVzcGFjZSBp
c3N1ZXMgcG9pbnRlZCBvdXQgYnkgU3VtaXQgR2FyZwo+ID4gPiAgLSBmaXggc2h1dGRvd24gY2Fs
bGJhY2sgdG8gc2h1dGRvd24gYW5kIG5vdCByZW1vdmUKPiA+ID4KPiA+ID4gQXMgYWxyZWFkeSBu
b3RlZCBpbiB2MSdzIGNvdmVyIGxldHRlciwgdGhpcyBzZXJpZXMgc2hvdWxkIGdvIGluIGR1cmlu
ZyBhCj4gPiA+IHNpbmdsZSBtZXJnZSB3aW5kb3cgYXMgdGhlcmUgYXJlIHJ1bnRpbWUgd2Fybmlu
Z3Mgd2hlbiB0aGUgc2VyaWVzIGlzCj4gPiA+IG9ubHkgYXBwbGllZCBwYXJ0aWFsbHkuIFN1bWl0
IEdhcmcgc3VnZ2VzdGVkIHRvIGFwcGx5IHRoZSB3aG9sZSBzZXJpZXMKPiA+ID4gdmlhIEplbnMg
V2lrbGFuZGVyJ3MgdHJlZS4KPiA+ID4gSWYgdGhpcyBpcyBkb25lIHRoZSBkZXBlbmRlbmNpZXMg
aW4gdGhpcyBzZXJpZXMgYXJlIGhvbm9yZWQsIGluIGNhc2UgdGhlCj4gPiA+IHBsYW4gY2hhbmdl
czogUGF0Y2hlcyAjNCAtICMxNyBkZXBlbmQgb24gdGhlIGZpcnN0IHR3by4KPiA+ID4KPiA+ID4g
Tm90ZSB0aGlzIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRlc3RlZC4KPiA+ID4KPiA+ID4gVXdlIEts
ZWluZS1Lw7ZuaWcgKDE3KToKPiA+ID4gICB0ZWU6IEFkZCBzb21lIGhlbHBlcnMgdG8gcmVkdWNl
IGJvaWxlcnBsYXRlIGZvciB0ZWUgY2xpZW50IGRyaXZlcnMKPiA+ID4gICB0ZWU6IEFkZCBwcm9i
ZSwgcmVtb3ZlIGFuZCBzaHV0ZG93biBidXMgY2FsbGJhY2tzIHRvIHRlZV9jbGllbnRfZHJpdmVy
Cj4gPiA+ICAgdGVlOiBBZGFwdCBkb2N1bWVudGF0aW9uIHRvIGNvdmVyIHJlY2VudCBhZGRpdGlv
bnMKPiA+ID4gICBod3JuZzogb3B0ZWUgLSBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9k
cml2ZXIoKQo+ID4gPiAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwo+ID4gPiAgIHJ0Yzogb3B0ZWU6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2ZXIg
cmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4gPiA+ICAgcnRjOiBvcHRlZTogTWFrZSB1c2Ugb2YgdGVl
IGJ1cyBtZXRob2RzCj4gPiA+ICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2Ns
aWVudF9kcml2ZXIoKQo+ID4gPiAgIGVmaTogc3RtbTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRo
b2RzCj4gPiA+ICAgZmlybXdhcmU6IGFybV9zY21pOiBvcHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxl
X3RlZV9jbGllbnRfZHJpdmVyKCkKPiA+ID4gICBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNl
IG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ug
b2YgbW9kdWxlX3RlZV9jbGllbnRfZHJpdmVyKCkKPiA+ID4gICBmaXJtd2FyZTogdGVlX2JueHQ6
IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiAgIEtFWVM6IHRydXN0ZWQ6IE1pZ3Jh
dGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uCj4gPiA+ICAgICBmdW5j
dGlvbgo+ID4gPiAgIEtFWVM6IHRydXN0ZWQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+
ID4gPiAgIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNlIG9mIHRlZSBzcGVjaWZpYyBkcml2ZXIg
cmVnaXN0cmF0aW9uCj4gPiA+ICAgdHBtL3RwbV9mdHBtX3RlZTogTWFrZSB1c2Ugb2YgdGVlIGJ1
cyBtZXRob2RzCj4gPiA+Cj4gPiA+ICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdGVlLnJzdCAg
ICAgICAgICAgICB8IDE4ICstLS0tCj4gPiA+ICBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL29wdGVl
LXJuZy5jICAgICAgICAgICB8IDI2ICsrLS0tLQo+ID4gPiAgZHJpdmVycy9jaGFyL3RwbS90cG1f
ZnRwbV90ZWUuYyAgICAgICAgICAgICAgfCAzMSArKysrKy0tLQo+ID4gPiAgZHJpdmVycy9maXJt
d2FyZS9hcm1fc2NtaS90cmFuc3BvcnRzL29wdGVlLmMgfCAzMiArKystLS0tLQo+ID4gPiAgZHJp
dmVycy9maXJtd2FyZS9icm9hZGNvbS90ZWVfYm54dF9mdy5jICAgICAgfCAzMCArKy0tLS0tCj4g
PiA+ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2VmaS5jICAgICB8IDI1ICsr
LS0tLQo+ID4gPiAgZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMgICAgICAgICAgICAgICAgICAgICAg
fCAyNyArKy0tLS0tCj4gPiA+ICBkcml2ZXJzL3RlZS90ZWVfY29yZS5jICAgICAgICAgICAgICAg
ICAgICAgICB8IDg0ICsrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2xpbnV4L3Rl
ZV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKwo+ID4gPiAgc2VjdXJpdHkva2V5
cy90cnVzdGVkLWtleXMvdHJ1c3RlZF90ZWUuYyAgICAgfCAxNyArKy0tCj4gPiA+ICAxMCBmaWxl
cyBjaGFuZ2VkLCAxNjQgaW5zZXJ0aW9ucygrKSwgMTM4IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4g
PiBiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBkMDQwMjdjYjFlOAo+
ID4gPiAtLQo+ID4gPiAyLjQ3LjMKPiA+ID4KPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSBuaWNl
IGNsZWFudXAsIFV3ZS4KPiA+Cj4gPiBJJ3ZlIGFwcGxpZWQgcGF0Y2ggMS0zIHRvIHRoZSBicmFu
Y2ggdGVlX2J1c19jYWxsYmFja19mb3JfNi4yMCBpbiBteQo+ID4gdHJlZSBhdCBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qZW5zd2kvbGludXgtdGVlLmdp
dC8KPiA+Cj4gPiBUaGUgYnJhbmNoIGlzIGJhc2VkIG9uIHY2LjE5LXJjMSwgYW5kIEknbGwgdHJ5
IHRvIGtlZXAgaXQgc3RhYmxlIGZvcgo+ID4gb3RoZXJzIHRvIGRlcGVuZCBvbiwgaWYgbmVlZGVk
LiBMZXQncyBzZWUgaWYgd2UgY2FuIGFncmVlIG9uIHRha2luZwo+ID4gdGhlIHJlbWFpbmluZyBw
YXRjaGVzIHZpYSB0aGF0IGJyYW5jaC4KPgo+IDYgYW5kIDcgY2FuIGdvIHRocm91Z2ggeW91ciBi
cmFuY2guCgpHb29kLCBJJ3ZlIGFkZGVkIHRoZW0gdG8gbXkgYnJhbmNoIG5vdy4KClRoYW5rcywK
SmVucwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
