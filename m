Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097FA111CF
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 21:20:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E373C78032;
	Tue, 14 Jan 2025 20:20:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65F6CC7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 20:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6516D5C59A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 20:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CCEC4CEEB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736886035;
 bh=I9Ekx6aq/CtvmHlK2JuDkCREj16AUwVV0szqwfvn2B8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JD22uIFW+fdCoYLcYeIsO2Txr02Nmv6PaD3vP9xJM7UUTueYcu0+ONzHQG06vXduq
 lkoMo+Ps9CQCr69LMbVC2r9TQ2pbJeuo+AKkJiGA41O1f7iirwWhLVUxRW/AUz8kuH
 jZpbpAJaemRr7wa9BNXuP5WR85oNMonECKjO4soOFO0HIZB1U6fpR0kVfbKf6g947P
 Y0CUnLeoKueHwxpK6IgZ0MpvJ1xE8c/iapkJ0dgX+jM1tRAv2LScMM/ZaftTdnfnDI
 dd1+xdcog1URclurHKunuZhxCOkXFYMDTm+uoXHKvSb/xOSY6nu/t6ezK5/fcoCUEJ
 DvZGIPiGaAZsg==
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3eb98b3b63dso1525013b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 12:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3MuUZ4JOChCUlG+a6Osi2SkogINw3DyuStE0PC223Rz8GvAhcCI5Is1IXlw3INk495kNbpIlw0MFLww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYN80OjmoeOGEI7zVKxDxNQHAmMSvmza4OddmAcZDSGpSQhfyt
 FQ/dFOUuOJ3F1Ql7OEYT5l5YrnE5KPeL/ULZlSb2go4oW18ULKZXe93ayA2aXqBPFNB5A4y4DnF
 2K4yrLgIMhKcbrMLuNUKv93bdt/o=
X-Google-Smtp-Source: AGHT+IHBdFDv09GmJQAPh9/RI61yRA+OUJBTYVfB4ZAfwslXJG+AQnvyEewTo5F7++0A17YOZNGuMRHAq8Q+xsm4lZ0=
X-Received: by 2002:a05:6808:198d:b0:3eb:615a:ece5 with SMTP id
 5614622812f47-3ef2ec54eedmr15212295b6e.15.1736886034615; Tue, 14 Jan 2025
 12:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
 <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Jan 2025 21:20:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
X-Gm-Features: AbW1kvZ2IsMpRpq9v9cu6FjARLwcHzjMVAJFZcTXGy5umUj9Q22VPlrSsSvyjVE
Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/12] PM: sleep: wakeirq: Introduce
 device-managed variant of dev_pm_set_wake_irq
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

T24gRnJpLCBKYW4gMywgMjAyNSBhdCA5OjQy4oCvQU0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKPgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Cj4gQWRkIGRldmljZS1tYW5hZ2VkIHZhcmlhbnQgb2YgZGV2X3BtX3NldF93YWtlX2lycSB3
aGljaCBhdXRvbWF0aWNhbGx5Cj4gY2xlYXIgdGhlIHdha2UgaXJxIG9uIGRldmljZSBkZXN0cnVj
dGlvbiB0byBzaW1wbGlmeSBlcnJvciBoYW5kbGluZwo+IGFuZCByZXNvdXJjZSBtYW5hZ2VtZW50
IGluIGRyaXZlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oICAgfCAgNiArKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEuYyBiL2RyaXZlcnMvYmFzZS9wb3dlci93YWtlaXJx
LmMKPiBpbmRleCA1YTVhOWU5NzhlODVmM2ZjOWQ4OWNiN2Q0MzUyN2RjMWRkNDJhOWIxLi44YWEy
OGMwOGIyODkxZjNhZjQ5MDE3NTM2MmNjMWE3NTkwNjliZDUwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYmFzZS9wb3dlci93YWtlaXJxLmMKPiArKysgYi9kcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZWly
cS5jCj4gQEAgLTEwMyw2ICsxMDMsMzIgQEAgdm9pZCBkZXZfcG1fY2xlYXJfd2FrZV9pcnEoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGRldl9wbV9jbGVhcl93
YWtlX2lycSk7Cj4KPiArc3RhdGljIHZvaWQgZGV2bV9wbV9jbGVhcl93YWtlX2lycSh2b2lkICpk
ZXYpCj4gK3sKPiArICAgICAgIGRldl9wbV9jbGVhcl93YWtlX2lycShkZXYpOwo+ICt9Cj4gKwo+
ICsvKioKPiArICogZGV2bV9wbV9zZXRfd2FrZV9pcnEgLSBkZXZpY2UtbWFuYWdlZCB2YXJpYW50
IG9mIGRldl9wbV9zZXRfd2FrZV9pcnEKPiArICogQGRldjogRGV2aWNlIGVudHJ5Cj4gKyAqIEBp
cnE6IERldmljZSBJTyBpbnRlcnJ1cHQKPiArICoKPiArICoKPiArICogQXR0YWNoIGEgZGV2aWNl
IElPIGludGVycnVwdCBhcyBhIHdha2UgSVJRLCBzYW1lIHdpdGggZGV2X3BtX3NldF93YWtlX2ly
cSwKPiArICogYnV0IHRoZSBkZXZpY2Ugd2lsbCBiZSBhdXRvIGNsZWFyIHdha2UgY2FwYWJpbGl0
eSBvbiBkcml2ZXIgZGV0YWNoLgo+ICsgKi8KPiAraW50IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0
cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSkKPiArewo+ICsgICAgICAgaW50IHJldDsKPiArCj4g
KyAgICAgICByZXQgPSBkZXZfcG1fc2V0X3dha2VfaXJxKGRldiwgaXJxKTsKPiArICAgICAgIGlm
IChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJu
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1fcG1fY2xlYXJfd2FrZV9pcnEsIGRl
dik7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9wbV9zZXRfd2FrZV9pcnEpOwo+ICsK
PiAgLyoqCj4gICAqIGhhbmRsZV90aHJlYWRlZF93YWtlX2lycSAtIEhhbmRsZXIgZm9yIGRlZGlj
YXRlZCB3YWtlLXVwIGludGVycnVwdHMKPiAgICogQGlycTogRGV2aWNlIHNwZWNpZmljIGRlZGlj
YXRlZCB3YWtlLXVwIGludGVycnVwdAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BtX3dh
a2VpcnEuaCBiL2luY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oCj4gaW5kZXggZDk2NDJjNmNmODUy
MTFhZjYwM2NlMzllMjgwYTViNGRlNjYxN2VlNS4uMjViNjNlZDUxYjc2NWMyYzY5MTlmMjU5NjY4
YTEyNjc1MzMwODM1ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oCj4gQEAgLTEwLDYgKzEwLDcgQEAgZXh0
ZXJuIGludCBkZXZfcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7
Cj4gIGV4dGVybiBpbnQgZGV2X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEoc3RydWN0IGRldmlj
ZSAqZGV2LCBpbnQgaXJxKTsKPiAgZXh0ZXJuIGludCBkZXZfcG1fc2V0X2RlZGljYXRlZF93YWtl
X2lycV9yZXZlcnNlKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7Cj4gIGV4dGVybiB2b2lk
IGRldl9wbV9jbGVhcl93YWtlX2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICtleHRlcm4gaW50
IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7Cj4KPiAg
I2Vsc2UgIC8qICFDT05GSUdfUE0gKi8KPgo+IEBAIC0zMiw1ICszMywxMCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZGV2X3BtX2NsZWFyX3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+
ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9wbV9zZXRfd2FrZV9pcnEoc3RydWN0IGRl
dmljZSAqZGV2LCBpbnQgaXJxKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAg
I2VuZGlmIC8qIENPTkZJR19QTSAqLwo+ICAjZW5kaWYgLyogX0xJTlVYX1BNX1dBS0VJUlFfSCAq
Lwo+Cj4gLS0KCkkgY2FuIGFwcGx5IHRoaXMgcGF0Y2ggZm9yIDYuMTQsIGJ1dCB0aGUgcmVzdCBv
ZiB0aGUgc2VyaWVzIHdpbGwgbmVlZAp0byBiZSBwaWNrZWQgdXAgYnkgdGhlIHJlc3BlY3RpdmUg
ZHJpdmVyIG1haW50YWluZXJzLgoKSSBob3BlIHRoaXMgd29ya3MgZm9yIHlvdT8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
