Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2229615ADB1
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 17:51:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9BCDC36B0B;
	Wed, 12 Feb 2020 16:51:22 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90E34C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 16:51:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g1so3096933wmh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=jcwPPW7Ev1718UkfNVS1QPUEtrgq4T5wb5lfvsIk75g=;
 b=pI/Uj+NgpJWyw/bZYwtPk+y/p3f+bjnqhsf8M+jreGoDwlvfSIp0kKgJ/NXDiB6E89
 Bu9Xt2W8awx7LY82+2OPhr5WoA6TZ7m1QAofSx6SSBeKEES0V3LOdiJWuon4eSRA8ADW
 teK/s6epYxohcYgvuHxiVdLZffI/QEUeA7dGy9191u8cCLVFHNOpSmcRj+kTazI4NAe/
 //1Q/7Xved6L7E2FLtgkbvg7BX+x1xil6Mo4LJY3SZWEvHX+wN/kdQtdXgCEpHMKjqul
 nTxLeGpGB4fxtrRa/ZxNDNeHreeN+1U2KzTXNocgLX1hRKRcNATOiTZ+Aw9PB7cKaa+u
 HI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jcwPPW7Ev1718UkfNVS1QPUEtrgq4T5wb5lfvsIk75g=;
 b=n9TLWNHQvTWehhn9hpIaTIe8o383XNmjjaCXM/2rQwb04hremrqgAqXb1uPzd7d0ur
 xET0+FRjI1VQePdJc6D3xkAimL38ItNm210IjqvZBimzlNGFQ6lCVNhmLF6vqH60TMZk
 tEModE9khQ9nat0svawd5xvCS1P5sAuFm4n2ssH01TEypm8FjZz4bZ+BV2wbqVL9i6c5
 GYpNthoVopfzw7U4p5sHF08ivNawoo4IzZhPiHAfFQatSXbnKntY4g34LqnKEl/FYKeg
 YhKb3d0ETYwCkK2di3QOE4yFNn8bJj6BphyfMry+AEAaXdCG+J2MOxdHgHlq6/+byb4h
 WM8A==
X-Gm-Message-State: APjAAAXm0OXCCJQcewURHgK+Tn4EWccMF7aWqC6NQl54I5CPmsKwuRmn
 v2NPFIc8EjZHysne4TPAehfgAQ==
X-Google-Smtp-Source: APXvYqy/kKObZd2NSS6kusayeRjgm+RKUhmrp/l8q6AIlEspwd/NpCOmscu5Kd/J+WQB2skteKA6PQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr14147384wmb.95.1581526280567;
 Wed, 12 Feb 2020 08:51:20 -0800 (PST)
Received: from linaro.org (14.red-88-14-208.dynamicip.rima-tde.net.
 [88.14.208.14])
 by smtp.gmail.com with ESMTPSA id a184sm1365854wmf.29.2020.02.12.08.51.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Feb 2020 08:51:19 -0800 (PST)
Date: Wed, 12 Feb 2020 17:51:16 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200212165116.GA2949@linaro.org>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128120702.26166-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux@armlinux.org.uk, p.paillet@st.com, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: Document STM32
 low power clkevent bindings
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

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDE6MDc6MDFQTSArMDEwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gQWRkIGEgc3Vibm9kZSB0byBTVE0gbG93IHBvd2VyIHRpbWVyIGJpbmRpbmdz
IHRvIHN1cHBvcnQgY2xrZXZlbnQgZHJpdmVyCgpjbGtldmVudCBpcyBMaW51eCBzcGVjaWZpYy4K
Cj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGlt
ZXIueWFtbCAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi1scHRpbWVyLnlhbWwKPiBpbmRleCAxYTRjYzVm
M2ZiMzMuLjUzNWUwYjQwY2RmOSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55YW1sCj4gQEAgLTgx
LDYgKzgxLDE2IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgcmVxdWlyZWQ6Cj4gICAgICAg
IC0gY29tcGF0aWJsZQo+ICAKPiArICBjbGtldmVudDoKPiArICAgIHR5cGU6IG9iamVjdAo+ICsK
PiArICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgICAgY29uc3Q6
IHN0LHN0bTMyLWNsa2V2ZW50LWxwCj4gKwo+ICsgICAgcmVxdWlyZWQ6Cj4gKyAgICAgIC0gY29t
cGF0aWJsZQo+ICsKPiAgcmVxdWlyZWQ6Cj4gICAgLSAiI2FkZHJlc3MtY2VsbHMiCj4gICAgLSAi
I3NpemUtY2VsbHMiCj4gQEAgLTExNSw2ICsxMjUsMTAgQEAgZXhhbXBsZXM6Cj4gICAgICAgIGNv
dW50ZXIgewo+ICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItbHB0aW1lci1jb3VudGVy
IjsKPiAgICAgICAgfTsKPiArCj4gKyAgICAgIGNsa2V2ZW50IHsKPiArICAgICAgICBjb21wYXRp
YmxlID0gInN0LHN0bTMyLWNsa2V2ZW50LWxwIjsKPiArICAgICAgfTsKPiAgICAgIH07Cj4gIAo+
ICAuLi4KPiAtLSAKPiAyLjE1LjAKPiAKCi0tIAoKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBM
aW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8
CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
