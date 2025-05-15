Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7FAB83BE
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 12:26:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34993C7A845;
	Thu, 15 May 2025 10:26:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0821DC7A844
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 10:26:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so6077545e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747304816; x=1747909616;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gk0+gInQFLq5TPyTiE4dxKzocRffo/w6/nhsIkH+AfE=;
 b=UHtI3ZIewYm34fMZFTT0dOh1ulZi2W6vEwlbO7jYR7O3UhHx5RmUKZe9hDuAlqQXuH
 oKYEyLtBsBavZjbxXl52/QLWQ3citzrSqCsF7yCcqtkDF8RqI4cxHhB8iTHeEOA4177S
 8GO+Whv4i7pT4ktVI3qSRi2NroL9L1v3O8iM2j/veO7f9dx31vx9zBEXz4nCUVNuMhun
 wGoDcVgCPsHbZ/mD2O5rbbW0IKHrCtU4jQ4dxHqy2MW+efOPqo3WZ/wgXvQ/HD5VRkte
 yrYMtFwCWvv0R0uGlz7QIoYWjK6obZmtoyGO898km58h6T/+Lhg4EKXYCZfiBzAtYsx8
 4DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747304816; x=1747909616;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gk0+gInQFLq5TPyTiE4dxKzocRffo/w6/nhsIkH+AfE=;
 b=wxxQ9uqQxV9+yYOmjYqGYwvfe9HThnbD0kGtNfIzYrOlOs19L2wRujLzWalQFF5Y0h
 MNax2Rdr0ENzGPR03j5OYoqSyckIM5uR4jwUEVV/LhDSDkbb+JTGiu/wrDubG48x2HYo
 rQ/0CI11yjP2eIvQS8FUBzjAUnWtkO+ipKFwlpOZ8BqQqweAZFxz0oZ0UBtP5jDJeP7A
 ys7PGE42t7siElE7Efz1c+zFqeJEkPwD93MDa+MWC73xInf6Kvi06at/bEwwOeFxh499
 c0aZ0wced64v/esCRyUh7XccXFvCtF2K1Hm+KKuuIxGTQmWyj/sZNQH84uDkbBU/30xx
 yTaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUisiDVaxkMpvgsOPSrixhOAatxLzvbgsO5UG4eFTqLWIwGUiVxIWZ1CaXMVGFwLb5aC/LasXHaI9jxsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBpemywSbqXFvv6o2GCAWyq8WG6ufrHRSZ5oZ++FHrY+isWumz
 3rWNOnvoIUJN4jW9bzi7+ydBJMM/0YcNfz/tsJx3cccmlWGFtgac
X-Gm-Gg: ASbGncs4lEm+BMF5Yd1F5D53lxXTadSqS4HitE6JQcPJhCzWCDCd4FLB3h2PYVxfK5z
 yDx/kWa2GpchJV3DUVtRcD9mWhDeQYdkNJz1CMEVGZuI2RFWkS8DPMlp4VFOGw/EW9z8bffXvX7
 5peGb2HZ1RQNtOWEkRQ8z39Tpk+lEfnSaAU8KoO4m1Bhl50zB+FXlvQIFNaxwmqaIO3R0m4Ex3M
 u2MVkn7anIFYoT21mCOhCDxycOT7St8Tj6rP7/CHjjRJpk1zaQGYMkvYya8aWUpYw2EGYKU9Wop
 pNYCe5zXQiHug3YoOT4N2Z/Wa6bA9D/Grs/hmt84ynSQjvrV5+YZ1CkUcRTY
X-Google-Smtp-Source: AGHT+IFVgomBW1IBuXpOUR8LYcnGSxhFAoIygDxxwvgbwklcoUaA6rWn38wHMH/dhn9JUS9lxDBang==
X-Received: by 2002:a05:600c:154a:b0:440:54ef:dfdc with SMTP id
 5b1f17b1804b1-442f96e671dmr15113075e9.8.1747304815938; 
 Thu, 15 May 2025 03:26:55 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39ef400sm60703995e9.33.2025.05.15.03.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:26:55 -0700 (PDT)
Message-ID: <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>, jic23@kernel.org, dlechner@baylibre.com, 
 nuno.sa@analog.com, andy@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tglx@linutronix.de, 	robh@kernel.org, jirislaby@kernel.org,
 fabrice.gasnier@foss.st.com
Date: Thu, 15 May 2025 11:26:56 +0100
In-Reply-To: <20250515083101.3811350-1-nichen@iscas.ac.cn>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Fix race in
 installing chained IRQ handler
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

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE2OjMxICswODAwLCBDaGVuIE5pIHdyb3RlOgo+IEZpeCBh
IHJhY2Ugd2hlcmUgYSBwZW5kaW5nIGludGVycnVwdCBjb3VsZCBiZSByZWNlaXZlZCBhbmQgdGhl
IGhhbmRsZXIKPiBjYWxsZWQgYmVmb3JlIHRoZSBoYW5kbGVyJ3MgZGF0YSBoYXMgYmVlbiBzZXR1
cCwgYnkgY29udmVydGluZyB0bwo+IGlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKCku
Cj4gCj4gRml4ZXM6IGQ1OGM2N2QxZDg1MSAoImlpbzogYWRjOiBzdG0zMi1hZGM6IGFkZCBzdXBw
b3J0IGZvciBTVE0zMk1QMSIpCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBOaSA8bmljaGVuQGlzY2Fz
LmFjLmNuPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cgo+IENoYW5nZWxvZzoKPiAKPiB2MSAtPiB2MjoKPiAKPiAxLiBBZGQgRml4ZXMgdGFnLgo+IC0t
LQo+IMKgZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMgfCA3ICsrKy0tLS0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jIGIvZHJpdmVycy9paW8vYWRj
L3N0bTMyLWFkYy0KPiBjb3JlLmMKPiBpbmRleCBiZDM0NTg5NjViZmYuLjIxYzA0YTk4YjNiNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYwo+ICsrKyBiL2Ry
aXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gQEAgLTQzMCwxMCArNDMwLDkgQEAgc3Rh
dGljIGludCBzdG0zMl9hZGNfaXJxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiAqcGRl
diwKPiDCoAkJcmV0dXJuIC1FTk9NRU07Cj4gwqAJfQo+IMKgCj4gLQlmb3IgKGkgPSAwOyBpIDwg
cHJpdi0+Y2ZnLT5udW1faXJxczsgaSsrKSB7Cj4gLQkJaXJxX3NldF9jaGFpbmVkX2hhbmRsZXIo
cHJpdi0+aXJxW2ldLCBzdG0zMl9hZGNfaXJxX2hhbmRsZXIpOwo+IC0JCWlycV9zZXRfaGFuZGxl
cl9kYXRhKHByaXYtPmlycVtpXSwgcHJpdik7Cj4gLQl9Cj4gKwlmb3IgKGkgPSAwOyBpIDwgcHJp
di0+Y2ZnLT5udW1faXJxczsgaSsrKQo+ICsJCWlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9k
YXRhKHByaXYtPmlycVtpXSwKPiArCQkJCQkJIHN0bTMyX2FkY19pcnFfaGFuZGxlciwKPiBwcml2
KTsKPiDCoAo+IMKgCXJldHVybiAwOwo+IMKgfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
