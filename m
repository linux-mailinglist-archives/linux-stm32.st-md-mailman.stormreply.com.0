Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3418ADEE3F
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 15:45:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A8C7C36B31;
	Wed, 18 Jun 2025 13:45:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEE61C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 13:45:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-553b544e7b4so5922078e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750254351; x=1750859151;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
 b=Nj5YhrgE5dLIRkT3K+UrXnvOwaRw2y+np3eBK3fhKmEgmsfT95RfNzlhIGvuo+zXJ4
 cnaf0wtIjLLklXPFZR1+xs7/MTelCyvgyFPUvf+RovxpTe4Yb7sT6/DEVOmLFzAjgrrI
 0CZvID3Fl+xjxpIEpk2vQfgHJNb4gHMzXIlyybvhPvQVSPoFxih89SGZWLjhHLcfsYr1
 8lGqnVlsYwkmMPT+rRI6F0zAX2bWzz2tGQ9HuS3Rkkk1IS7Y5IqUA1a9CBQpmwX1jcCR
 tMODLThx29OabZb5SppNLdsgS+JMhmffH2N05rtVew00yHMPrleyAkRBIUgRWQfgCmNT
 Zn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254351; x=1750859151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
 b=jXjnPEXLlSwTCsnAvCsc1PfxwNZ4cW3GgHW4l4SWJXpYnw3rb1vGoqbCVta7dl1C0M
 yF8nnfgsWmcn0VUuYUfJ8wcdyzJ1Ys/n6ptQ1nB0R8dbuTTgoAkqLhOz5N95QeCVW0xo
 KvyJqHlomOP1WHq50ctlujL9nVSqFixgaEVg6KtOBasuwaAyDKR34gbXKrHKMRaMWIgb
 Y5QJsIldDwMiykAjfPUjhV/3/jlsENd02jF2GfjqHgYDv90ZjajiNqi0AIdCgDpRRqug
 GeddPVdBljDp3+7ldIGmvU0r6LbmZLT/fypUvijVHV3qN8afmC8AbbLhYXjBH8bxZgZ9
 tcRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUenElzUpWtwdPi+XwXRrNAtQ/oo1J3vA8dIfKYQyvsp0kvcsIEVqdt2+YU6Kxh8SDK7akxJUdhDCgpnQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzx2x6Xpzz82Ty6YHGYNNMJ74K/bHr4lQM8rzO920sQMM5Gqcv0
 3M8hqSNOdUo7YEstqwrjxGmD5gzFJzE3A8jrmRDCIxOK2GYMfstjHDXjQZpGMR+rhYqy+9l1vRU
 WJJH45bRfUwR0tTOoIBr9XbTk8m0IP6Z2D5Fu7r93mA==
X-Gm-Gg: ASbGncu+pONL9c/5FrImhFmD3LaicmSFPDxKdqgskQw1aJotCmhRkClFuHbX4W8pthK
 ZwF13TSNrgF57euTgXfSOAGNqM7dcyG++SKFzs0XjbPwBf99p+sowoseEc4CMBLil3+9znT6lwN
 bA/YoRtF5ckTirigaaNzHPU7XS6FvHrgRrwz3W6vpzh2E=
X-Google-Smtp-Source: AGHT+IHUziRG/lS1am2zFPjRrmYzIzsrLZlEENKDKAFZ3rfCXoeUyGuA1Pal15qAwexM+uRj2zqwrZ6IAzL5/+4dp/E=
X-Received: by 2002:a05:6512:3c9c:b0:553:2f61:58eb with SMTP id
 2adb3069b0e04-553b6f3f11fmr3977179e87.49.1750254350731; Wed, 18 Jun 2025
 06:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
In-Reply-To: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 15:45:39 +0200
X-Gm-Features: AX0GCFswiuSIv0ost8RQF2yKzjiS_gJyepvrD4dGuyTD_K-1OJ1mJ0Mc6pZHztk
Message-ID: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/9] Introduce HDP support for STM32MP
	platforms
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMjozMuKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBJIGhhdmUgYSByZXdvcmsgb2YgZ3Bpby1tbWlvIGluIHBy
b2dyZXNzIHRoYXQgcmVtb3ZlcyB0aGUgYmdwaW8KPiBzcGVjaWZpYyBmaWVsZHMgZnJvbSBzdHJ1
Y3QgZ3Bpb19jaGlwLiBUaGlzIGluY2x1ZGVzIG1vdmluZyB0aGUgZmxhZ3MKPiBpbnRvIGEgc2Vw
YXJhdGUgZ3Bpby9nZW5lcmljLmggaGVhZGVyLiBJIHJlYWxseSBuZWVkIHRvIGVpdGhlciBhcHBs
eQo+IGl0IG15c2VsZiBvciBnZXQgYW4gaW1tdXRhYmxlIHRhZyBmcm9tIHlvdSB3aXRoIHRoaXMg
Y2hhbmdlLgoKT0sgdHJ5IHRoaXMsIGlmIHlvdSBwdWxsIGluIHRoaXMgdG8geW91ciB0cmVlIGFu
ZCB3b3JrIHdpdGggcmVmYWN0b3JpbmdzCm9uIHRvcCwgZXZlcnl0aGluZyBzaG91bGQgd29yayBv
dXQgZmluZSBpbiB0aGUgZW5kOgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAx
OTI3MmIzN2FhNGY4M2NhNTJiZGY5YzE2ZDVkODFiZGQxMzU0NDk0OgoKICBMaW51eCA2LjE2LXJj
MSAoMjAyNS0wNi0wOCAxMzo0NDo0MyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbGludXN3L2xpbnV4LXBpbmN0cmwuZ2l0CnRhZ3MvaWItZ3Bpby1tbWlvLW5vLWlucHV0
LXRhZwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRmYjhjNWQzNmExY2ZkOTdjZDcx
NWViNDI1NjcwOGJjMDk3MjRmM2Q6CgogIGdwaW86IG1taW86IGFkZCBCR1BJT0ZfTk9fSU5QVVQg
ZmxhZyBmb3IgR1BPIGdwaW9jaGlwICgyMDI1LTA2LTE4CjE1OjQwOjI5ICswMjAwKQoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpTaW1wbGUgY2hhbmdlIGZvciBuby1pbnB1dCBNTUlPIEdQSU8KCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQ2zDqW1lbnQg
TGUgR29mZmljICgxKToKICAgICAgZ3BpbzogbW1pbzogYWRkIEJHUElPRl9OT19JTlBVVCBmbGFn
IGZvciBHUE8gZ3Bpb2NoaXAKCiBkcml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMgICAgfCAxMSArKysr
KysrKysrLQogaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oIHwgIDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
