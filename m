Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570C917B73
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 10:55:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B294CC71287;
	Wed, 26 Jun 2024 08:55:22 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9972C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 08:55:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so5286513e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719392114; x=1719996914;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UuJKZ5dvfnd3VwIG1aD3aPBKZXM0rYW+LOmM/rqRb7g=;
 b=AVu1BjsOQIxQNQKYA3xwK2cjD9q/pJay+bCk1npAw7X4txVDKRWM2hZtdZTKv5gTuY
 6i+yxfWGMroYfJHFGfpoqLAkHginIBnW13HszzVVk7kV5f+H7Abt/FrOZ3YYKfvngakZ
 ATEQhUxr6ZKYX5m8TuAgiJ/23yE3Ll+bUIAOUGxd7S6XB5Tbg4Gy3JpN/YzATcc1/BPt
 9C1cridACFv/vTyLgeos/P0oeqBVEEYEU0AGiWPLBzbkP16yW161qWh9OT6D3/zu7osZ
 df2zifRA2BoveUgnTJkv3/jmZ76YU6mU54QX1cGAWKYzzL7Z/CsTG2zcGiuuiHkcCZ2U
 nwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719392114; x=1719996914;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UuJKZ5dvfnd3VwIG1aD3aPBKZXM0rYW+LOmM/rqRb7g=;
 b=Jv05h7g3ZRnlIMiTW82MxWX8cRy2NP7Jfs91+zD2gSCyd1k//cNbh9dob53m5Jxjhl
 xbxrjjOP/gsJZMU6Io7F1l9sWm/WfSzKPf0iqILZdKuWm7xii9kRMvqLJrdYXph6E7S9
 v6e5a6FaMW8cBp+uYYR4wXo0fYi2A1cNeIRvZikbBxE1hRu+WiHcQhIyvYm3BiLdCVxJ
 lkweL1YePVdCNfgszoXoOvb0iD4am9Mf6n0tEaRT/7VC+a/bAd4ZmFlq330QbQRDymq+
 5ulp+yRUFF6Kl+B/UX3Z/BaYKnvltjCoiDBI1NBKv/NWe2GXmhVlAxt81cNS0KItz8C3
 UJEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt9wyJEcaAJIJZQiJeksajz3WFmR0C6Cpg6KBAORQFF2wf1pv8WQBB7b4tn99cL4T1YoQDmSq0W4oeiTtUxbo5IE8H284jnU/VTr9Bbizq2etKWBDdiRBP
X-Gm-Message-State: AOJu0Yxn0BsOrb1fsT05txBIm1B1bbRRBhSz08l6++TWmtQGnPMc43jy
 DfulE2exa8tiMlXoWwt8V9I0BBuOc3B3YDIZMeg/CvTl3F3QinRs
X-Google-Smtp-Source: AGHT+IFuNqURBw9MrG0Gl9cJcVUawr+D9J6cKvNgIaK256nGX0K2iZmbGttOuH5LhAzrPbtCRpZWxA==
X-Received: by 2002:a05:6512:138e:b0:52c:e08c:a0dc with SMTP id
 2adb3069b0e04-52ce185f753mr7582925e87.51.1719392113740; 
 Wed, 26 Jun 2024 01:55:13 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba?
 (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de.
 [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8468613sm17302035e9.39.2024.06.26.01.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 01:55:13 -0700 (PDT)
Message-ID: <c2d746c73f7450dd10c0a0b229b3672e44fe583a.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 fabrice.gasnier@foss.st.com,  Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 26 Jun 2024 10:59:05 +0200
In-Reply-To: <20240625150717.1038212-9-olivier.moysan@foss.st.com>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
 <20240625150717.1038212-9-olivier.moysan@foss.st.com>
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nuno Sa <nuno.sa@analog.com>
Subject: Re: [Linux-stm32] [PATCH v2 8/8] iio: adc: stm32-dfsdm: add scaling
 support to dfsdm
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

SGkgT2xpdmllciwKCk9uZSB0aGluZyB0aGF0IEkganVzdCBub3RpY2VkLi4uCgpPbiBUdWUsIDIw
MjQtMDYtMjUgYXQgMTc6MDcgKzAyMDAsIE9saXZpZXIgTW95c2FuIHdyb3RlOgo+IEFkZCBzY2Fs
aW5nIHN1cHBvcnQgdG8gU1RNMzIgREZTRE0uCj4gCj4gV2hlbiB1c2VkIGluIGFuIGFuYWxvZyBj
b250ZXh0LCBhIERGU0RNIGZpbHRlciB0eXBpY2FsbHkgY29udmVydHMgdGhlIGRhdGEKPiBmcm9t
IGEgc2lnbWEgZGVsdGEgbW9kdWxhdG9yLiBUaGUgSUlPIGRldmljZSBhc3NvY2lhdGVkIHRvIHRo
ZSBERlNETQo+IGZpbHRlciBwcm92aWRlcyB0aGVzZSBkYXRhIGFzIHJhdyBkYXRhLgo+IFRoZSBJ
SU8gZGV2aWNlIGNhbiBwcm92aWRlIHNjYWxpbmcgaW5mb3JtYXRpb24gKHZvbHRhZ2UgYW5kIG9m
ZnNldCkgdG8KPiBhbGxvdyBjb252ZXJzaW9uIG9mIHJhdyBkYXRhIGludG8gcGh5c2ljYWwgdmFs
dWVzLgo+IAo+IFdpdGggdGhlIG5ldyBiaW5kaW5nIGJhc2VkIG9uIElJTyBiYWNrZW5kIGZyYW1l
d29yaywgdGhlIHNpZ21hIGRlbHRhCj4gbW9kdWxhdG9ycyBhcmUgZGVmaW5lZCBhcyBiYWNrZW5k
cyBwcm92aWRpbmcgc2NhbGluZyBpbmZvcm1hdGlvbi4KPiAKPiBUaGUgc2NhbGluZyBpcyBub3Qg
c3VwcG9ydGVkIHdpdGggbGVnYWN5IGJpbmRpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xpdmll
ciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+IEFja2VkLWJ5OiBOdW5vIFNh
IDxudW5vLnNhQGFuYWxvZy5jb20+Cj4gLS0tCj4gCgouLi4KCj4gKwo+ICsJY2FzZSBJSU9fQ0hB
Tl9JTkZPX1NDQUxFOgo+ICsJCS8qCj4gKwkJICogU2NhbGUgaXMgZXhwcmVzc2VkIGluIG1WLgo+
ICsJCSAqIFdoZW4gZmFzdCBtb2RlIGlzIGRpc2FibGVkLCBhY3R1YWwgcmVzb2x1dGlvbiBtYXkg
YmUgbG93ZXIKPiArCQkgKiB0aGFuIDJebiwgd2hlcmUgbiA9IHJlYWxiaXRzIC0gMS4KPiArCQkg
KiBUaGlzIGxlYWRzIHRvIHVuZGVyZXN0aW1hdGluZyB0aGUgaW5wdXQgdm9sdGFnZS4KPiArCQkg
KiBUbyBjb21wZW5zYXRlIHRoaXMgZGV2aWF0aW9uLCB0aGUgdm9sdGFnZSByZWZlcmVuY2UgY2Fu
IGJlCj4gKwkJICogY29ycmVjdGVkIHdpdGggYSBmYWN0b3IgPSByZWFsYml0cyByZXNvbHV0aW9u
IC8gYWN0dWFsIG1heAo+ICsJCSAqLwo+ICsJCWlmIChhZGMtPmJhY2tlbmRbaWR4XSkgewo+ICsJ
CQlpaW9fYmFja2VuZF9yZWFkX3JhdyhhZGMtPmJhY2tlbmRbaWR4XSwgY2hhbiwgdmFsLAo+IHZh
bDIsIG1hc2spOwoKRXZlIGlmIGl0IGRvZXMgbm90IG1hdHRlciBmb3IgeW91ciB1c2VjYXNlLCB5
b3Ugc2hvdWxkIHN0aWxsIGRvIGVycm9yIGhhbmRsaW5nCmFzIGlpb19iYWNrZW5kX3JlYWRfcmF3
KCkgY2FuIHJldHVybiBhbiBlcnJvci4KCj4gKwkJCSp2YWwgPSBkaXZfdTY0KCh1NjQpKnZhbCAq
ICh1NjQpQklUKERGU0RNX0RBVEFfUkVTIC0KPiAxKSwgbWF4KTsKPiArCQkJKnZhbDIgPSBjaGFu
LT5zY2FuX3R5cGUucmVhbGJpdHM7Cj4gKwkJCWlmIChjaGFuLT5kaWZmZXJlbnRpYWwpCj4gKwkJ
CQkqdmFsICo9IDI7Cj4gKwkJfQo+ICsJCXJldHVybiBJSU9fVkFMX0ZSQUNUSU9OQUxfTE9HMjsK
PiArCj4gKwljYXNlIElJT19DSEFOX0lORk9fT0ZGU0VUOgo+ICsJCS8qCj4gKwkJICogREZTRE0g
b3V0cHV0IGRhdGEgYXJlIGluIHRoZSByYW5nZSBbLTJebiwgMl5uXSwKPiArCQkgKiB3aXRoIG4g
PSByZWFsYml0cyAtIDEuCj4gKwkJICogLSBEaWZmZXJlbnRpYWwgbW9kdWxhdG9yOgo+ICsJCSAq
IE9mZnNldCBjb3JyZXNwb25kIHRvIFNEIG1vZHVsYXRvciBvZmZzZXQuCj4gKwkJICogLSBTaW5n
bGUgZW5kZWQgbW9kdWxhdG9yOgo+ICsJCSAqIElucHV0IGlzIGluIFswViwgVnJlZl0gcmFuZ2Us
Cj4gKwkJICogd2hlcmUgMFYgY29ycmVzcG9uZHMgdG8gLTJebiwgYW5kIFZyZWYgdG8gMl5uLgo+
ICsJCSAqIEFkZCAyXm4gdG8gb2Zmc2V0LiAoaS5lLiBtaWRkbGUgb2YgaW5wdXQgcmFuZ2UpCj4g
KwkJICogb2Zmc2V0ID0gb2Zmc2V0KHNkKSAqIHZyZWYgLyByZXMoc2QpICogbWF4IC8gdnJlZi4K
PiArCQkgKi8KPiArCQlpZiAoYWRjLT5iYWNrZW5kW2lkeF0pIHsKPiArCQkJaWlvX2JhY2tlbmRf
cmVhZF9yYXcoYWRjLT5iYWNrZW5kW2lkeF0sIGNoYW4sIHZhbCwKPiB2YWwyLCBtYXNrKTsKClNh
bWUuLi4KCi0gTnVubyBTw6EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
