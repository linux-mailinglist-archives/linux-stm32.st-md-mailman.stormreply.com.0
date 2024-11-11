Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB169C47D2
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 22:15:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54F8C78F6C;
	Mon, 11 Nov 2024 21:15:08 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15FCBC78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 21:15:02 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5ebc52deca0so2492955eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731359701; x=1731964501;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=;
 b=SsGHy6j9cb5WdPGywiy89Ln2Lg/J8XdhReojsTcoWHMRY0c0KEmomYjIoHUXOsbSl6
 Dj2xhFsBoipeLA3sBo02P3782jWf/VdpBxSrxAO/c5mx76vGLqJjGWOwjWbUTWJYPkRC
 rwoPlQGgvf6WXMiwRJNR0M+w/rEmBgxKW21TRky7EuiYK/0YRktKiNFIF/ogmTPsspZ/
 DKJg0W8kAqcTyXvny9ASxJMlusjSFjT441rtKqZyHcceRYGobBrgAjRQ+cIZ89hz3INM
 dQ+vzpwQq6cC1ao7IrYFSWvmjRP5bVsO1FLCdYETOwDxbE9E5EzmBL+g9RfCVv8+tRQ8
 BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731359701; x=1731964501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=;
 b=sBeneFATZfw045hmV54gVmgJpck5LtNtW0RSrx6XN6K1PJ5Q/etTqmztBwtBTLehKh
 mVBuDJJJeRjxm8TB4HzlHTNl0PnKfF/lKG5vt7BOmpBdgM0KD3M0ay/zy7akS5PoeOyS
 S8CuHBP9CrwFCPYZG28bYZPiV7IqE53CxliT18pPIMSBfVEdIR5nfJyZ7uBC328M+uiq
 H/jsJisP1b4jZbb82gGD0NM9GnDYgxle3Rz/Gj5LArcf7XDZYuWcsrwbDDSA8QYES+KZ
 Sx6qbgkd4DE6oa2XdHq5N5CjiDRhIsK+pxkws+TOiZwvORZz4C9Cs9ZcuUHqGVKPiMAw
 Wjxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkZ6/Helo509tV6DFvU23Z9z+ydfMOagO03JI4zWc6PuGc/xYNZEr/bAoqH/C3MxX4DN/PgGlnVQNdcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmSSI/Gh6YwX9s4HJ2nY+7tD4sDKKeenCXFFOsqdfW/85M3uT7
 l6HJ/X+Q3nFWvs9+ZLurljOBxB7KbLpenfFNhpLGI0tvRZOuX8bAagUhlywvHpA=
X-Google-Smtp-Source: AGHT+IGnDhH00NIUNGxRkfa8oULGq+weqFX/R55G+H4lngweXnOIQ7C2jE6iYgJfdqCvn2ECiusFDA==
X-Received: by 2002:a05:6820:1f08:b0:5eb:d1ac:21c4 with SMTP id
 006d021491bc7-5ee57d2887amr9655428eaf.8.1731359700898; 
 Mon, 11 Nov 2024 13:15:00 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ee494fb095sm2064551eaf.6.2024.11.11.13.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 13:14:59 -0800 (PST)
Message-ID: <b2f6db15-51a8-498d-ab5b-52f0f6a2e098@baylibre.com>
Date: Mon, 11 Nov 2024 15:14:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
 <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
 <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] iio: trigger: stm32-timer-trigger: Add
 check for clk_enable()
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

T24gMTEvMTEvMjQgMjozNiBQTSwgSmlhc2hlbmcgSmlhbmcgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MTEsIDIwMjQgYXQgMjo0NeKAr1BNIERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJheWxpYnJlLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIDExLzExLzI0IDE6MTkgUE0sIEppYXNoZW5nIEppYW5nIHdyb3Rl
Ogo+Pj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIGNsa19lbmFibGUoKSBpbiBv
cmRlciB0byBjYXRjaCB0aGUKPj4+IHBvdGVudGlhbCBleGNlcHRpb24uCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29sQGdtYWlsLmNvbT4KPj4+
IC0tLQo+Pj4gQ2hhbmdlbG9nOgo+Pj4KPj4+IHYyIC0+IHYzOgo+Pj4KPj4+IDEuIFNpbXBsaWZ5
IGNvZGUgd2l0aCBjbGVhbnVwIGhlbHBlcnMuCj4+Pgo+Pj4gdjEgLT4gdjI6Cj4+Pgo+Pj4gMS4g
UmVtb3ZlIHVuc3VpdGFibGUgZGV2X2Vycl9wcm9iZSgpLgo+Pj4gLS0tCj4+Cj4+IC4uLgo+Pgo+
Pj4gQEAgLTQ5MiwyMSArNDk1LDI1IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRlcl93cml0ZV9y
YXcoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4+Pgo+Pj4gICAgICAgY2FzZSBJSU9fQ0hBTl9JTkZPX0VOQUJMRToKPj4+IC0gICAg
ICAgICAgICAgbXV0ZXhfbG9jaygmcHJpdi0+bG9jayk7Cj4+PiAtICAgICAgICAgICAgIGlmICh2
YWwpIHsKPj4+IC0gICAgICAgICAgICAgICAgICAgICBpZiAoIXByaXYtPmVuYWJsZWQpIHsKPj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmVuYWJsZWQgPSB0cnVlOwo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX2VuYWJsZShwcml2LT5jbGspOwo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIH0KPj4+IC0gICAgICAgICAgICAgICAgICAgICByZWdtYXBf
c2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7Cj4+PiAtICAgICAg
ICAgICAgIH0gZWxzZSB7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX2NsZWFyX2Jp
dHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7Cj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgaWYgKHByaXYtPmVuYWJsZWQpIHsKPj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHByaXYtPmVuYWJsZWQgPSBmYWxzZTsKPj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNsa19kaXNhYmxlKHByaXYtPmNsayk7Cj4+PiArCj4+PiArICAgICAgICAgICAgIHNj
b3BlZF9ndWFyZChtdXRleCwgJnByaXYtPmxvY2spIHsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAodmFsKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXByaXYt
PmVuYWJsZWQpIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
di0+ZW5hYmxlZCA9IHRydWU7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IGNsa19lbmFibGUocHJpdi0+Y2xrKTsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX3NldF9i
aXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdt
YXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwcml2LT5lbmFibGVkKSB7Cj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmVuYWJsZWQgPSBmYWxzZTsK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX2Rpc2FibGUocHJp
di0+Y2xrKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4+PiAgICAgICAgICAgICAgIH0KPj4+IC0gICAgICAgICAgICAgbXV0
ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsKPj4+ICsKPj4+ICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4+PiAgICAgICB9Cj4+Cj4+Cj4+IEFub3RoZXIgd2F5IHRvIGRvIHRoaXMgdGhhdCBhdm9pZHMg
Y2hhbmdpbmcgdGhlIGluZGVudAo+PiBzbyBtdWNoIGlzIHBsYWNpbmcgYnJhY2VzIGFyb3VuZCB0
aGUgY2FzZSBib2R5IGxpa2UgdGhpcy4KPj4gVGhpcyBhbHNvIGF2b2lkcyB0aGUgY29tcGlsZSBl
cnJvciBmcm9tIHVzaW5nIGd1YXJkIGFmdGVyCj4+IGNhc2UgZGlyZWN0bHkuCj4+Cj4+Cj4+ICAg
ICAgICAgY2FzZSBJSU9fQ0hBTl9JTkZPX0VOQUJMRTogewo+PiAgICAgICAgICAgICAgICAgZ3Vh
cmQobXV0ZXgpKCZwcml2LT5sb2NrKTsKPj4KPj4gICAgICAgICAgICAgICAgIGlmICh2YWwpIHsK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFwcml2LT5lbmFibGVkKSB7Cj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+ZW5hYmxlZCA9IHRydWU7Cj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gY2xrX2VuYWJsZShwcml2LT5jbGspOwo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF9zZXRfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKPj4gICAgICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF9jbGVhcl9iaXRzKHByaXYt
PnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocHJpdi0+ZW5hYmxlZCkgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHByaXYtPmVuYWJsZWQgPSBmYWxzZTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjbGtfZGlzYWJsZShwcml2LT5jbGspOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+
ICAgICAgICAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gICAg
ICAgICB9Cj4+Cj4gCj4gTG9va3MgZ3JlYXQuCj4gQnV0IHRoZXJlIGlzIG5vIGluZGVudGF0aW9u
IGJldHdlZW4gInN3aXRjaCIgYW5kICJjYXNlIi4KPiBBcyBhIHJlc3VsdCwgdGhlIGNsb3Npbmcg
YnJhY2VzIG9mICJzd2l0Y2giIGFuZCAiY2FzZSIgd2lsbAo+IGJlIHBsYWNlZCBpbiB0aGUgc2Ft
ZSBjb2x1bW4uCj4gCj4gTGlrZSB0aGlzOgo+IAo+IHN3aXRjaChtYXNrKSB7Cj4gY2FzZSBJSU9f
Q0hBTl9JTkZPX0VOQUJMRTogewo+IAo+IH0KPiB9Cj4gCj4gLUppYXNoZW5nCgoKVXN1YWxseSwg
dGhlcmUgaXMgYSBkZWZhdWx0OiBjYXNlIGFzIHdlbGwsIHNvIHdlIGNvdWxkIG1vdmUgdGhlCmZp
bmFsIHJldHVybiBhbmQgbWFrZSBpdCBsb29rIGxpa2UgdGhpczoKCglzd2l0Y2ggKG1hc2spIHsK
CWNhc2UgSUlPX0NIQU5fSU5GT19SQVc6CgkJcmV0dXJuIHJlZ21hcF93cml0ZShwcml2LT5yZWdt
YXAsIFRJTV9DTlQsIHZhbCk7CgoJY2FzZSBJSU9fQ0hBTl9JTkZPX1NDQUxFOgoJCS8qIGZpeGVk
IHNjYWxlICovCgkJcmV0dXJuIC1FSU5WQUw7CgoJY2FzZSBJSU9fQ0hBTl9JTkZPX0VOQUJMRTog
ewoJCWd1YXJkKG11dGV4KSgmcHJpdi0+bG9jayk7CgkJaWYgKHZhbCkgewoJCQlpZiAoIXByaXYt
PmVuYWJsZWQpIHsKCQkJCXByaXYtPmVuYWJsZWQgPSB0cnVlOwoJCQkJY2xrX2VuYWJsZShwcml2
LT5jbGspOwoJCQl9CgkJCXJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJ
TV9DUjFfQ0VOKTsKCQl9IGVsc2UgewoJCQlyZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAs
IFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKCQkJaWYgKHByaXYtPmVuYWJsZWQpIHsKCQkJCXByaXYt
PmVuYWJsZWQgPSBmYWxzZTsKCQkJCWNsa19kaXNhYmxlKHByaXYtPmNsayk7CgkJCX0KCQl9CgkJ
cmV0dXJuIDA7Cgl9CgkJZGVmYXVsdDoKCQkJcmV0dXJuIC1FSU5WQUw7Cgl9CgoKQW5kIGl0IGlz
IHVudXN1YWwsIGJ1dCBJIGZvdW5kIGt2bV9hcm1fcG11X3YzX2dldF9hdHRyKCkgdGhhdAphbHNv
IGhhcyB0aGlzIGRvdWJsZSBpbmxpbmUgYnJhY2UgYXQgdGhlIGVuZCBvZiBhIHN3aXRjaCBzdGF0
ZW1lbnQuCgoJfQoJfQoKU28gZXZlbiBpZiBpdCBkb2Vzbid0IGxvb2sgc28gbmljZSwgaXQgZG9l
cyBzZWVtIHRvIGJlIHRoZQoiY29ycmVjdCIgc3R5bGUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
