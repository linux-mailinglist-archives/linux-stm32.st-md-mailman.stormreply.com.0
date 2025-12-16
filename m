Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD4CC1BA6
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 10:20:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD34C87EDC;
	Tue, 16 Dec 2025 09:20:34 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB440C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 09:20:33 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64470c64c1bso6141532d50.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765876832; x=1766481632;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdbkGAZvcEXm5SWEKUVClkLJFjPHLzhKuSzzyVtMACI=;
 b=dbTX4j5+fUiXECthYkcXRq646cHDYlNEiL4Q7aKIS9Ma6MiUrbJES+QQ8KRWixJfe8
 g0+czERFmRF7tCm4ePLVzsLlMOzlxMwU246j/i30Hi10iy8rnG3pPGuk190Qu8B7I7Tk
 Olk558KYggil0Y2XUaXSK8FezHh5b0sayRl+SFFwK9Bm27vvxQ98B798KnsPeFQ4U00j
 wMSqGY51sQNEvGmGjarRKvNEFduBXCc/HEBc4ObB6SEt2XC8mjenjGiLJ7ETXvCy6Iiw
 YFU3zMNYhIWRM/OtBQM4R4TlTyaFa1Ut9EP3fWe+NmTM1Zn8vMpQ23IXK+cUR7+FPKKh
 Adkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765876832; x=1766481632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vdbkGAZvcEXm5SWEKUVClkLJFjPHLzhKuSzzyVtMACI=;
 b=ovYL/UhdREye/WNcMaqGOjnjoOcj1vSAwqOy2x6nJQQS6pNtUo1XzcVq6m2RHVSCMG
 N4eKfJ9hyxIMowqJNTIO1+3c5AGwwViKyNjrMBQb5vk5y0Oo2ZlrOtoRk8MZNPPageAK
 y5pJ4MgCgRftkMN0DKd9COqJIuI1xBU8CGpDPTfTqD5sPVzmsj60XFH1naPamMRGgDyj
 PhDsSm0JgGt9u2yJwgAa0+x6Bs1USF4UOqW5Z64BEy3PBDLNJ0vaAv7S2hTJn/iKfUVi
 qMsB2phMnou/pl73gpndwe1fWz5v/8lirancFBom5JHQuDY6pumhV1Ik/Z6tZOd/P+yA
 +GeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPQUp4PM8NG70TlFi13PoeCANlqXyzjqdWB5yXxnAaXgq3vl2RPJUKhh/yel7ttm89//qncv3oo1RLWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx74K33UVxQe88ajkp2K7VQyQnqjQ3NeEpge/tDUcX4USM7aye+
 6VEEMhxnurWn9LfCbEQy5GEASoxxHq2+zkAzkfOdgB/C6r+YNYSeQQ+FilR2UWCVkr4XVpLb05x
 lqAazj0fbcM3okoOKovc6IUQ/h4YHMz4tr1qkaL4fsw==
X-Gm-Gg: AY/fxX4upQ7cuVS+uPHcbEgoptC1XnPOoen21XmqlwIgo8dusN9sM7t8535ozqq2dpg
 /UUOMlPGjhzSXjc7nl0VKuH/pwSHwAWxeYu90/2uOWd89pizXAaZRDyM9p04MwkEagxmda3kQJR
 NzPUaQj1k+4EI/cLaseFSKmtPTK/1L7sDpZBtxlMLsvTIi4A/2HSVDHlmd/0ne/DhiX0Ans+zUW
 9mHeA7cpwJpiZ2L7LmFZW2ctsAWuNbS8wgqwWrluRY/n4zWzJrDqrkEiMlOYWWViodGsnAl9rn/
 ZDB1RkkVfRFxjUYbiqKfXYRq1tFrN2jMXa0bewDTCQnZpG2ryZN7JEkkVbOnyiLzoMI7ke+Ml5G
 BhKoj5r4NM/MMPbGPBnUc5K1Kbg8i0aLWR4sgWk35Sn00GyFQYx6hdjNM3GMMWRq8rTEvOT35xR
 BTnvSHEB4Aa7+N8ZEdmH8TxsI7QCiDKs2+CXgXjIrInLmC3+ggfIQ5E+ZlhCIbDcynzFE3SMIbH
 c8CKr6TM6D+LxyDVsSZvyYafeq/favgwMeyDtNY/uhwmE6PGXMmfPLurQ7kWg33yilUVFFvtko4
 XkaFtkHKTvPMQ7pybqe5uJV3NFkGSym8
X-Google-Smtp-Source: AGHT+IEctBGbOPb8tWUDebvS3L7V3SseQeGkk4xalk8WHK1PQ+/ej2AUM8IRRWIxM80NV5FFMSeI1zTaZrQqMMcHcdA=
X-Received: by 2002:a05:690e:d0b:b0:644:60d9:8660 with SMTP id
 956f58d0204a3-6447a5a7193mr11828178d50.44.1765876815167; Tue, 16 Dec 2025
 01:20:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 16 Dec 2025 11:19:39 +0200
X-Gm-Features: AQt7F2rnkMoQPLRnnlXil8zyHYfAadd5PzbCSjslnX3-94C0khuY7zIbQk2gds8
Message-ID: <CAC_iWj+TevKq7TzPQ4_eEhu0rJJ03PV=ASf7SwTszp-mJY6Vzw@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, Ard Biesheuvel <ardb@kernel.org>,
 op-tee@lists.trustedfirmware.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 09/17] efi: stmm: Make use of tee bus
	methods
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

T24gTW9uLCAxNSBEZWMgMjAyNSBhdCAxNjoxNywgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gVGhlIHRlZSBidXMgZ290IGRlZGljYXRl
ZCBjYWxsYmFja3MgZm9yIHByb2JlIGFuZCByZW1vdmUuCj4gTWFrZSB1c2Ugb2YgdGhlc2UuIFRo
aXMgZml4ZXMgYSBydW50aW1lIHdhcm5pbmcgYWJvdXQgdGhlIGRyaXZlciBuZWVkaW5nCj4gdG8g
YmUgY29udmVydGVkIHRvIHRoZSBidXMgbWV0aG9kcy4KPgo+IFJldmlld2VkLWJ5OiBTdW1pdCBH
YXJnIDxzdW1pdC5nYXJnQG9zcy5xdWFsY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCgpSZXZpZXdl
ZC1ieTogSWxpYXMgQXBhbG9kaW1hcyA8aWxpYXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPgoKPiAg
ZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyB8IDExICsrKysrLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyBiL2Ry
aXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMKPiBpbmRleCA1OTAzODExODU4
YjYuLjdiMDRkZDY0OTYyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1t
L3RlZV9zdG1tX2VmaS5jCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3Rt
bV9lZmkuYwo+IEBAIC01MjAsOCArNTIwLDkgQEAgc3RhdGljIHZvaWQgdGVlX3N0bW1fcmVzdG9y
ZV9lZml2YXJzX2dlbmVyaWNfb3BzKHZvaWQpCj4gICAgICAgICBlZml2YXJzX2dlbmVyaWNfb3Bz
X3JlZ2lzdGVyKCk7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IHRlZV9zdG1tX2VmaV9wcm9iZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gK3N0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3Byb2JlKHN0cnVjdCB0
ZWVfY2xpZW50X2RldmljZSAqdGVlX2RldikKPiAgewo+ICsgICAgICAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnRlZV9kZXYtPmRldjsKPiAgICAgICAgIHN0cnVjdCB0ZWVfaW9jdGxfb3Blbl9zZXNz
aW9uX2FyZyBzZXNzX2FyZzsKPiAgICAgICAgIGVmaV9zdGF0dXNfdCByZXQ7Cj4gICAgICAgICBp
bnQgcmM7Cj4gQEAgLTU3MSwyMSArNTcyLDE5IEBAIHN0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3By
b2JlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtc3Rh
dGljIGludCB0ZWVfc3RtbV9lZmlfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKPiArc3RhdGlj
IHZvaWQgdGVlX3N0bW1fZWZpX3JlbW92ZShzdHJ1Y3QgdGVlX2NsaWVudF9kZXZpY2UgKmRldikK
PiAgewo+ICAgICAgICAgdGVlX3N0bW1fcmVzdG9yZV9lZml2YXJzX2dlbmVyaWNfb3BzKCk7Cj4g
LQo+IC0gICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKHRlZSwg
dGVlX3N0bW1fZWZpX2lkX3RhYmxlKTsKPgo+ICBzdGF0aWMgc3RydWN0IHRlZV9jbGllbnRfZHJp
dmVyIHRlZV9zdG1tX2VmaV9kcml2ZXIgPSB7Cj4gICAgICAgICAuaWRfdGFibGUgICAgICAgPSB0
ZWVfc3RtbV9lZmlfaWRfdGFibGUsCj4gKyAgICAgICAucHJvYmUgICAgICAgICAgPSB0ZWVfc3Rt
bV9lZmlfcHJvYmUsCj4gKyAgICAgICAucmVtb3ZlICAgICAgICAgPSB0ZWVfc3RtbV9lZmlfcmVt
b3ZlLAo+ICAgICAgICAgLmRyaXZlciAgICAgICAgID0gewo+ICAgICAgICAgICAgICAgICAubmFt
ZSAgICAgICAgICAgPSAidGVlLXN0bW0tZWZpIiwKPiAtICAgICAgICAgICAgICAgLnByb2JlICAg
ICAgICAgID0gdGVlX3N0bW1fZWZpX3Byb2JlLAo+IC0gICAgICAgICAgICAgICAucmVtb3ZlICAg
ICAgICAgPSB0ZWVfc3RtbV9lZmlfcmVtb3ZlLAo+ICAgICAgICAgfSwKPiAgfTsKPgo+IC0tCj4g
Mi40Ny4zCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
