Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D766B52EC6
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 12:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99182C349C1;
	Thu, 11 Sep 2025 10:40:30 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D495C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 10:40:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-336cee72f40so5143601fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757587228; x=1758192028;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xhofByKOJZBUxzzCwJz7ILtLFgJS+emxFXnUeLfugk=;
 b=lgKqsvArWrThn04Y5DJNcWxF2I6//rITZYoLQanjt7DnKBJZ4I41Msrn1uwQtbY+tL
 /qZFsLEMPFdeItWCWfmpFuwQSmoeoM/ju7pPUB6BoPPSdxinEduH4KWSA3fxQvp3Gome
 jVU9rwmhThHrPb7Pwa6z0LO4bN13IWPj4DgNIYNTUtuUoeGs/Us669HtDnt4V4RFy1m2
 1xQ5nFJ1t3yAcNN/usxNA6+VmhHJLcFedJJgBb0rCSNH5DDWm0Bt2UZ5gbpwUYg/7ZO0
 axXilkYlxsWgYpZwLiNhvioaKNmM7F2j/lfaNgIKKepqeHojm7QILQD9QlnA4LAwQJR0
 qN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757587228; x=1758192028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xhofByKOJZBUxzzCwJz7ILtLFgJS+emxFXnUeLfugk=;
 b=YhkUdMWS4M4d1khMfcsNLduEqp9KPEJEKh4S7mKJCoF2/qwYeTNAcSu38g9QkPXFqb
 SKdnY1Z++8hxe8neDRxbL0IzHMMQK0Ui57KtnNByYWRLULcPAZCd50j4u99sAZnfKh1P
 cIUkq63cqr7NneigsRaf8hQZUBknsmxyCvo4xOc4fNcEEqn24p7eFv2FIQTm5W0w4MwV
 okWU3WnLi0omP2aZtKieaOOqsn05y2cNx8bXlzA9djpnHHsufBeBiAY8CQHML/FHp9UL
 y8ip1UHB2VuGn9eVgEAINOGNY2+JKTODnckppGzH1m3qyD7sXjrZX8cENZ4WiDLl/Xze
 vL5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsrn8y+Mq4mvQHv3YGTGir23oMilPCX10ZjmVe1NQfgg0r2ml3zT6IMzA3L+anrxwu4afjQwoy/vOOyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyr6gJI2oK9Vwgel04RWAq26nO3klVarygI2C8Xro9VQ6MGAQdD
 lOlEffLhnw3H8zVm/LbVm0vDqgvOO+No6Gs2akQ3jATyGvT24488r9bj8Unauv7TdBFfh6Mx5km
 hfszYT9+bCNMTigQwnG9h4p269DRd6zyaZCBqaluAHQ==
X-Gm-Gg: ASbGncuGNnxxOfzFrpe9FnkgxxYZhoFq4JcLcUvOCrxcQsgbcz2OYd9Re15qLaAqU+S
 7X5viYcwbBPc8j+OJu0tPWpu6/2Nhbj6H3NmaUssIlRJ5hGYmSSjH/F9lV+otd6uweduVkhwNgN
 Cfc3Ibo5+jxbvzsWTrk5SyItxHY/WCv0VxLh238WGz91w+Hqbi+JdXFlzq3DMAeyqxrS+G+ZDMN
 O0RYWS3gdoCVSdvxkBKJIW06FrL3b4Xd+523+U=
X-Google-Smtp-Source: AGHT+IGPBV7ZUshYcZ++bfkHR8WoSLgks047FDwY5y0u82+iY8L6qmzhXMDwyO2eqt5HUBKGwgQk4xCTnYrT4A3qljM=
X-Received: by 2002:a2e:be1d:0:b0:338:166:6b87 with SMTP id
 38308e7fff4ca-33b5edc397bmr47551441fa.35.1757587228237; Thu, 11 Sep 2025
 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250904130516.72266-1-brgl@bgdev.pl>
 <20250911103147.GI9224@google.com>
In-Reply-To: <20250911103147.GI9224@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 12:40:16 +0200
X-Gm-Features: Ac12FXzJUv-DtTTwMxm9Tw3SjH4bJmVAMD-5PcnaHNxBA2feO9XIwHgckN9WRfU
Message-ID: <CAMRc=MfcSkwr+EL2E2wshuNvTLpWXsftLwX6uA_Y5Wmok-ojyQ@mail.gmail.com>
To: Lee Jones <lee@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [GIT PULL] Immutable branch between the MFD and
	GPIO trees for v6.18-rc1
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

T24gVGh1LCBTZXAgMTEsIDIwMjUgYXQgMTI6MzHigK9QTSBMZWUgSm9uZXMgPGxlZUBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMDQgU2VwIDIwMjUsIEJhcnRvc3ogR29sYXN6ZXdza2kg
d3JvdGU6Cj4KPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4KPiA+Cj4gPiBMZWUsCj4gPgo+ID4gUGxlYXNlIHB1bGwgdGhlIGZvbGxv
d2luZyBNRkQgY2hhbmdlcyB0aGF0IGRlcGVuZCBvbiBjb21taXRzIEkgYWxyZWFkeQo+ID4gaGF2
ZSBpbiB0aGUgR1BJTyB0cmVlIGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCj4gPgo+ID4gVGhh
bmtzLAo+ID4gQmFydG9zego+ID4KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgOGY1YWUzMGQ2OWQ3NTQzZWVlMGQ3MDA4M2RhZjRkZThmZTE1ZDU4NToKPiA+Cj4gPiAgIExp
bnV4IDYuMTctcmMxICgyMDI1LTA4LTEwIDE5OjQxOjE2ICswMzAwKQo+ID4KPiA+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4KPiA+ICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2JyZ2wvbGludXguZ2l0IHRhZ3MvZ3Bpby9t
ZmQtc3RtcGUtZm9yLXY2LjE4LXJjMQo+ID4KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byBkZjZhNDQwMDM5NTNmYjIzYWQ2N2Y4MmQyOTllNDM5ZTdmZjcxNTBhOgo+ID4KPiA+ICAg
bWZkOiBzdG1wZTogQWxsb3cgYnVpbGRpbmcgYXMgbW9kdWxlICgyMDI1LTA5LTA0IDE1OjAwOjUz
ICswMjAwKQo+ID4KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IEltbXV0YWJsZSBicmFuY2ggYmV0d2VlbiB0aGUg
TUZEIGFuZCBHUElPIHRyZWVzIGZvciB2Ni4xOC1yYzEKPiA+Cj4gPiBBbGxvdyBidWlsZGluZyB0
aGUgTUZEIFNUTVBFIGRyaXZlciBhcyBtb2R1bGUuCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gQWxleGFu
ZGVyIFN0ZWluICgxKToKPiA+ICAgICAgIG1mZDogc3RtcGU6IEFsbG93IGJ1aWxkaW5nIGFzIG1v
ZHVsZQo+ID4KPiA+ICBkcml2ZXJzL21mZC9LY29uZmlnIHwgMTAgKysrKystLS0tLQo+ID4gIGRy
aXZlcnMvbWZkL3N0bXBlLmMgfCAgNiArKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBQdWxsZWQsIHRoYW5rcy4KPgoKTm93LCBv
biBhIHNlY29uZCBnbGFuY2U6IHRoaXMgd29uJ3QgZml4IHRoZSBsaW51eC1uZXh0IHNpdHVhdGlv
bgp0aG91Z2gsIHJpZ2h0PyBZb3Ugd291bGQgbmVlZCB0aGUgZ3BpbyBwYXRjaCBhcyB3ZWxsIGlu
IHlvdXIgdHJlZQp3aGljaCBpcyB0aGUgcHJlcmVxdWlzaXRlIGJ1dCBJIGNhbiBubyBsb25nZXIg
cHV0IGl0IGluIGFuIGltbXV0YWJsZQpicmFuY2ggYXMgaXQgd2FzIGxpdGVyYWxseSB0aGUgZmly
c3QgcGF0Y2ggSSBhcHBsaWVkIGZvciB0aGlzIGN5Y2xlCmFuZCBJJ3ZlIG1lcmdlZCBzZXZlcmFs
IG90aGVyIGJyYW5jaGVzIGludG8gbXkgdHJlZSBzaW5jZSB0aGVuLiBJCnRoaW5rIHRoaXMgUFIg
ZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2Ugb24gbXkgcGFydC4gOigKClVubGVzcyB0aGVyZSdzIGEg
Y29uZmxpY3QgeW91IHNob3VsZCBwcm9iYWJseSBqdXN0IGlnbm9yZSBpdC4KCkJhcnRvc3oKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
