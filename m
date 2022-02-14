Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A74B5213
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 14:46:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F44C5F1F9;
	Mon, 14 Feb 2022 13:46:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B30D6C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 13:46:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i14so26894188wrc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=w7Y2pezxBsweg1F5I/VGY695nV4P7xVufo9MH/6yH4w=;
 b=xbBzSuDMBF4QcBOgUYmHXwtJ8dWcuIuUf140cvSkvLow8cj8kYcFB4do4WkalZa3XS
 8d9s0BtXVhj3b8h6vy6UlCEgZBLcU1/Qom1uZyeHgFKh9kfdDacWzy1LL/pmKExd690W
 DETyv+xXrlYN2SNwheJSZM/VepnFWEYOloLT6xeK9Bw98s5hum78ZHjN6uh7GYctQI4a
 U3Rm5lvrfoTlw9jO4MeePvBBmUeo5GQsY0C27x0TzmhYHiUaaPw7f6MeL1bwOouJldMM
 0QAC00Gg6se2kiBkKRFwpZ2P/QYpJ+5/64PI6ibT4QIq94fnmN4bLjEZbJrcmwrx3sek
 tXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w7Y2pezxBsweg1F5I/VGY695nV4P7xVufo9MH/6yH4w=;
 b=69nvodJvo6hmgl4xAdXrTQndhDdF2fjfN22LywPzRFfFi7rF4t9cwCUFuXj2DpCwLx
 wbZPd7+6KMzq4B1vb546W7kRiV7O9sOzocsUHo09+PRuxUT9i60Vls6PhLJf0+qqTg32
 /OzwmgChAvsF2uxAXVp+4dlQNKcxRwdCNbzXXo3v8bwpY2Wo+SdW8ejngZzXMQ/HuuLK
 FT6oGdXtB+2TYDNWVaptsiwCU978ZnWaPBlKIY5ia2aFe1W+STyVQzvpJsMGLWa9Zvcz
 t/emJwt73pXguV5g3opaP3cRmzNHr8uKgn35TQ1FV7WIymriF9wKswanwmOTj5paaQCF
 AThg==
X-Gm-Message-State: AOAM533FeQ3HYWKfjrYqbuTmfHsWDcGqYEvXT27HWfPAAtTpxR4wJtOR
 +y7Y9i4bztuBc/Q/q9Sf3FK2GA==
X-Google-Smtp-Source: ABdhPJzXEeknb6ILWxHf2R1dA6zSDZITWc+9hhismzIz4RJI7wlJaYVzhoqbDzYnJ6jvnEucUApvXw==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr11466614wrs.275.1644846400191; 
 Mon, 14 Feb 2022 05:46:40 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id b15sm25416656wri.96.2022.02.14.05.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:46:39 -0800 (PST)
Date: Mon, 14 Feb 2022 13:46:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YgpdPTDurgsvR9mk@google.com>
References: <20220207081709.27288-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207081709.27288-1-u.kleine-koenig@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Improve error message
 triggered by regulator fault in .remove()
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

T24gTW9uLCAwNyBGZWIgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFJldHVybmlu
ZyBhIG5vbi16ZXJvIHZhbHVlIGluIGFuIGkyYyByZW1vdmUgY2FsbGJhY2sgcmVzdWx0cyBpbiB0
aGUgaTJjCj4gY29yZSBlbWl0dGluZyBhIHZlcnkgZ2VuZXJpYyBlcnJvciBtZXNzYWdlICgicmVt
b3ZlIGZhaWxlZCAoLUVTT01FVEhJTkcpLAo+IHdpbGwgYmUgaWdub3JlZCIpIGFuZCBhcyB0aGUg
bWVzc2FnZSBpbmRpY2F0ZXMgbm90IGZ1cnRoZXIgZXJyb3IgaGFuZGxpbmcKPiBpcyBkb25lLgo+
IAo+IEluc3RlYWQgZW1pdCBhIG1vcmUgc3BlY2lmaWMgZXJyb3IgbWVzc2FnZSBhbmQgdGhlbiBy
ZXR1cm4gemVybyBpbgo+IC5yZW1vdmUoKS4KPiAKPiBUaGUgbG9uZy10ZXJtIGdvYWwgaXMgdG8g
bWFrZSB0aGUgaTJjIHJlbW92ZSBwcm90b3R5cGUgcmV0dXJuIHZvaWQsIG1ha2luZwo+IGFsbCBp
bXBsZW1lbnRhdGlvbnMgcmV0dXJuIDAgaXMgcHJlcGFyYXRvcnkgd29yayBmb3IgdGhpcyBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZnguYyB8IDE2ICsrKysr
KysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3N0bWZ4LmMgYi9kcml2ZXJzL21m
ZC9zdG1meC5jCj4gaW5kZXggZTA5NWEzOTMwMTQyLi4xNjYzMWM2NzVmMmYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tZmQvc3RtZnguYwo+ICsrKyBiL2RyaXZlcnMvbWZkL3N0bWZ4LmMKPiBAQCAt
MzkyLDE3ICszOTIsMjEgQEAgc3RhdGljIGludCBzdG1meF9jaGlwX2luaXQoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgc3Rt
ZnhfY2hpcF9leGl0KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gK3N0YXRpYyB2b2lkIHN0
bWZ4X2NoaXBfZXhpdChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICB7Cj4gIAlzdHJ1Y3Qg
c3RtZnggKnN0bWZ4ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7Cj4gIAo+ICAJcmVnbWFw
X3dyaXRlKHN0bWZ4LT5tYXAsIFNUTUZYX1JFR19JUlFfU1JDX0VOLCAwKTsKPiAgCXJlZ21hcF93
cml0ZShzdG1meC0+bWFwLCBTVE1GWF9SRUdfU1lTX0NUUkwsIDApOwo+ICAKPiAtCWlmIChzdG1m
eC0+dmRkKQo+IC0JCXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShzdG1meC0+dmRkKTsKPiArCWlm
IChzdG1meC0+dmRkKSB7Cj4gKwkJaW50IHJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKHN0bWZ4LT52
ZGQpOwo+ICAKPiAtCXJldHVybiAwOwo+ICsJCWlmIChyZXQpCgpOaXQ6IFByZW1pc2Ugb2YgdGhl
IHBhdGNoIGlzIGZpbmUsIGJ1dCBwbGVhc2UgY2FuIHlvdSB1c2UgdGhlIHN0YW5kYXJkCmZ1bmN0
aW9uIGNhbGwsIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgZm9ybWF0IHBsZWFzZS4gIFNvbWV0aGlu
ZyBhYm91dAp0aGlzIGlzIHRyaWdnZXJpbmcgbXkgT0NEISA6KQoKICAgICAJaW50IHJldDsKCgly
ZXQgPSByZWd1bGF0b3JfZGlzYWJsZShzdG1meC0+dmRkKTsKCWlmIChyZXQpCgkJZG9fdGhpbmco
KTsKCj4gKwkJCWRldl9lcnIoJmNsaWVudC0+ZGV2LAo+ICsJCQkJIkZhaWxlZCB0byBkaXNhYmxl
IHZkZCByZWd1bGF0b3I6ICVwZVxuIiwKPiArCQkJCUVSUl9QVFIocmV0KSk7Cj4gKwl9Cj4gIH0K
PiAgCj4gIHN0YXRpYyBpbnQgc3RtZnhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwK
PiBAQCAtNDY2LDcgKzQ3MCw5IEBAIHN0YXRpYyBpbnQgc3RtZnhfcmVtb3ZlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpCj4gIHsKPiAgCXN0bWZ4X2lycV9leGl0KGNsaWVudCk7Cj4gIAo+IC0J
cmV0dXJuIHN0bWZ4X2NoaXBfZXhpdChjbGllbnQpOwo+ICsJc3RtZnhfY2hpcF9leGl0KGNsaWVu
dCk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gICNpZmRlZiBDT05GSUdfUE1fU0xFRVAK
PiAKPiBiYXNlLWNvbW1pdDogZGNiODVmODVmYTZmMTQyYWFlMWZlODZmMzk5ZDQ1MDNkNDlmMmI2
MAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBE
ZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
