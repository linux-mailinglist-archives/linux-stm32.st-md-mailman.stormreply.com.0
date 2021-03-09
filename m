Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC41332E0B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 19:17:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D868C57196;
	Tue,  9 Mar 2021 18:17:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C44A6C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 18:17:27 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j2so17573434wrx.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=E2H0Vyvaz315tDwhjzi69+8Sz+mC0Vpp4i0UyuyRi2U=;
 b=OOOCffOshjfg7+dvyZj59QRnaxsN4ELj/3FpNu0L7www0KXU24C602V8W53cP3q1h8
 YOznA5A8YJ8+PXMvIpLiR0tJxCB97xVjEzjjv96krTWoURtbCi6+gBxLZ99MryYRRuxV
 EEh/mgkmc8+3ZkCXHwreG6QtWdFM9lfX9r77/7wIpUeIcvJ4nMmyVbi357w5DHLolyx6
 qQDzymqVvyUG9mQwZmHIsC/28Bsiw+kQnk5xrXAyBiyuneWdnaXH8F59l9IaYUFL4kIJ
 YwRSUtuiuUrVinGSOd+bTncAFloBSmj51TdwGFVWY0ZAhxyfKyLNBGsDjxf79PuQDflr
 hxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E2H0Vyvaz315tDwhjzi69+8Sz+mC0Vpp4i0UyuyRi2U=;
 b=V8wS169Vb4tLybkdSsqVxWr4y6bMMKBkZS3Uuvoqu4o08z8WSiRFyS8GdSIfTIt5ip
 gfg1WEDs4/tXx/NHCOxO/ONpDGi1ZLeXjGYOlX4S7WczXISHRs9BVVnUqpvQjY+gq/na
 T/4GYEb+/QGFjj1W53HAPeL7E3n22XhNMLUZQPe+tFqXY+t2tt7eBhJ/V1IHCOMT0VLc
 5fAVcFN1iJfQZX6wGkZ7a+WRfZY7HljtN0+/48fiCViLfiKFfCPJap0e9ZYSgvqYMoc6
 mwdc0WEDJJX4KamYQmRDH9MrphiFfV1hnlxFdgWFRk1mJC1vwqRfJOshCvVgJPI+TLKl
 zPFA==
X-Gm-Message-State: AOAM530aQAnOBjDeMHCPcCshTR5CZPCwLfw31tpKXiVZrkJ2+C7V+3rT
 yvCJoUIXYVEdNde3YEOyOod4lw==
X-Google-Smtp-Source: ABdhPJxFquNSN6BBhA1UcWqdovNTR3F+6NiI5iWL1dYGNi1OySoTQxoOH3OPGovMK29FhpkUKWg1vQ==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr29146414wry.184.1615313847207; 
 Tue, 09 Mar 2021 10:17:27 -0800 (PST)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id j14sm23269096wrw.69.2021.03.09.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:17:26 -0800 (PST)
Date: Tue, 9 Mar 2021 18:17:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-ID: <20210309181725.GX4931@dell>
References: <20210304230709.3217-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304230709.3217-1-rikard.falkeborn@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmpe: Revert "Constify static
	struct resource"
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

T24gRnJpLCAwNSBNYXIgMjAyMSwgUmlrYXJkIEZhbGtlYm9ybiB3cm90ZToKCj4gSW4gc3RtcGVf
ZGV2aWNlc19pbml0KCksIHRoZSBzdGFydCBhbmQgZW5kIGZpZWxkIG9mIHRoZXNlIHN0cnVjdHMg
YXJlCj4gbW9kaWZpZWQsIHNvIHRoZXkgY2FuIG5vdCBiZSBjb25zdC4gQWRkIGEgY29tbWVudCB0
byB0aG9zZSBzdHJ1Y3RzIHRoYXQKPiBsYWNrZWQgaXQgdG8gcmVkdWNlIHRoZSByaXNrIHRoYXQg
dGhpcyBoYXBwZW5zIGFnYWluLgo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgOGQ3YjNhNmRhYzRl
YWUyMmM1OGIwODUzNjk2Y2JkMjU2OTY2NzQxYi4KPiAKPiBGaXhlczogOGQ3YjNhNmRhYzRlICgi
bWZkOiBzdG1wZTogQ29uc3RpZnkgc3RhdGljIHN0cnVjdCByZXNvdXJjZSIpCj4gUmVwb3J0ZWQt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJpa2FyZCBGYWxrZWJvcm4gPHJpa2FyZC5mYWxrZWJvcm5AZ21haWwu
Y29tPgo+IC0tLQo+IENoYW5nZXMKPiBWMS1WMjogQWRkIGNvbW1lbnRzIHRvIHRoZSBzdHJ1Y3Rz
IHRoYXQgdGhleSBhcmUgZHluYW1pY2FsbHkgbW9kaWZpZWQKPiAgICAgICAgUmV3cml0ZSBjb21t
aXQgbWVzc2FnZS4KPiAKPiBWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDMw
MjIzNDcxMC43NDQ1NS0xLXJpa2FyZC5mYWxrZWJvcm5AZ21haWwuY29tLwo+IAo+ICBkcml2ZXJz
L21mZC9zdG1wZS5jIHwgMTQgKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2Vz
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
