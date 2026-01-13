Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457AD19933
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 15:45:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA61CC8F283;
	Tue, 13 Jan 2026 14:45:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B48BEC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 14:45:53 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-3f551ad50d1so2852539fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 06:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768315552; x=1768920352;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
 b=rLFvc0IwrzUEw/kwKAT8mR9LuJBvhLkVaRL3cQf6fZfnj+oGs/uyZySBbrUbnBPu20
 wtYInTJGt2DnLSs5+vy2Vd9skOE+i2MR4JUm321ZZDIwUO0CZp0d8AoDYBH7QfHbm8AL
 GPpdlZgiBgb98kOuyxbFUI0wJErmH7tKX4yHx4vczTZyMRxaQB2c/3YcrA+lxSRPu1vx
 hsl3S+KMCkZaB5grQotZ4QHJDotrizzBm9utkZFVBUrB8DghlCVpZ3qMC3YbSTIwdsTG
 SmJPjOHJjwU3qV3itP/JhCwaqzpbzB6OTIhrrkPQMJQ8xeLC2NLJ4/qNIuUSTUHGEmDI
 Guvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768315552; x=1768920352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
 b=E2L62nsWTe8T//ob43Fuzr5MllXXaFKWaGapQ5WkvXVoDr2PQUTuhumU2wDCiQMSLf
 0iz/T5zFQzMhMjV7vf6Wvc1qAOQJ5wBbOG3AcG+H20ISOrDcfys2csCyrztWYEpFO0Wh
 JCNE43zJ3IrG4q+IVG7vuqcbWElFJTgK8qh3lrCMQNekVWIYrsJ3dB+CNa/4dYh71nUM
 U3mq6pWxh1zqZ9sHeHe4EE2L8W/YyGUsYFQlCborY9pPWw5sxUeRjtmmK5Gg9L95uDnh
 6WAlOoFVZR/j3YXlhIzV3Goqd8QJy5AFgJ0BestbnxS0KGDxv9knJkVnWulrwiZISya6
 vF2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaV5jXIHcFU2kwcDRAYW2foEk5B6fSiv0cEaKrc5iixfH9dp72iw48y7vzbureFAv5t3RzCzUdSqb27Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9ysFn/ujhOCEjHD86akCyaOA/p+ez8vhFOa6l3MrMRYnXZgR9
 gc+WiBlAj5LprjTus4oZVrMm1unTddN8gFgWw/+2YIgVvHmWWmfM/P2RvD4Tkw44Qj7fc1+48iO
 ZdDOAm7Cl0AYCUMupS4HPKD+MlTzJOlTLCyCrJijmpw==
X-Gm-Gg: AY/fxX4FFiZOkWNs+/l0MFrlzd5O3nhgRXje5NBpEouAM1Fsvh7fxhfa9IDJ1xoDBy3
 xzzo2gFNZ1+I1YfaXsRoucTcmO1+2G6SUBno5exRAX4kYLa1dd+nIGq12OKnxar+E/yWY5Wclh8
 0fTNqebEr9rA1dmJdVrE31Bncm0injhq/9FcrlGZ4mb0joZsZMO6MbceVExq3RzMrRdrMGbpNZa
 TKmPt26o9AxffaaRAth4yyf1jXl/cWu+bzkZi6L50MJTmXF+/vYiH4bHlNkeK4LUvkhz1m/4Ygg
 AoEhm4LuVRNeyOEjvqWhrLOK7Q==
X-Google-Smtp-Source: AGHT+IGMsKCWhXxncysaNn43dYmEYyDwcJaO6TjEgdKAgRTiQWieHjD3rHZkyoBEsAcvj9cD16CSqGEscd62IkICycg=
X-Received: by 2002:a05:6870:55c7:b0:34b:cc55:9e85 with SMTP id
 586e51a60fabf-3ffc0954865mr9095150fac.13.1768315552149; Tue, 13 Jan 2026
 06:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 13 Jan 2026 15:45:40 +0100
X-Gm-Features: AZwV_QiARd5ZYYBrSjJNdNCpX-7fBluIYLJTcntaG_DMT6Vl6m6kjiymZLCqUpY
Message-ID: <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 05/11] drivers: bus: add the stm32 debug
	bus driver
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

SGksCgpPbiBGcmksIEphbiA5LCAyMDI2IGF0IDExOjU34oCvQU0gR2F0aWVuIENoZXZhbGxpZXIK
PGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgc3RtMzIg
ZGVidWcgYnVzIGRyaXZlciB0aGF0IGlzIHJlc3BvbnNpYmxlIG9mIGNoZWNraW5nIHRoZQo+IGRl
YnVnIHN1YnN5c3RlbSBhY2Nlc3NpYmlsaXR5IGJlZm9yZSBwcm9iaW5nIHRoZSByZWxhdGVkIHBl
cmlwaGVyYWwKPiBkcml2ZXJzLgo+Cj4gVGhpcyBkcml2ZXIgaXMgT1AtVEVFIGRlcGVuZGVudCBh
bmQgcmVsaWVzIG9uIHRoZSBTVE0zMiBkZWJ1ZyBhY2Nlc3MKPiBQVEEuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4g
LS0tCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvYnVz
L0tjb25maWcgICAgICAgICB8ICAxMCArKwo+ICBkcml2ZXJzL2J1cy9NYWtlZmlsZSAgICAgICAg
fCAgIDEgKwo+ICBkcml2ZXJzL2J1cy9zdG0zMl9kYmdfYnVzLmMgfCAyODUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyOTcg
aW5zZXJ0aW9ucygrKQo+Cgpbc25pcF0KCj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHRlZV9j
bGllbnRfZGV2aWNlX2lkIG9wdGVlX2RiZ19idXNfaWRfdGFibGVbXSA9IHsKPiArICAgICAgIHtV
VUlEX0lOSVQoMHhkZDA1YmM4YiwgMHg5ZjNiLCAweDQ5ZjAsCj4gKyAgICAgICAgICAgICAgICAg
IDB4YjYsIDB4NDksIDB4MDEsIDB4YWEsIDB4MTAsIDB4YzEsIDB4YzIsIDB4MTApfSwKPiArICAg
ICAgIHt9Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHRlZV9jbGllbnRfZHJpdmVyIHN0bTMy
X29wdGVlX2RiZ19idXNfZHJpdmVyID0gewo+ICsgICAgICAgLmlkX3RhYmxlID0gb3B0ZWVfZGJn
X2J1c19pZF90YWJsZSwKPiArICAgICAgIC5kcml2ZXIgPSB7Cj4gKyAgICAgICAgICAgICAgIC5u
YW1lID0gIm9wdGVlX2RiZ19idXMiLAo+ICsgICAgICAgICAgICAgICAuYnVzID0gJnRlZV9idXNf
dHlwZSwKPiArICAgICAgICAgICAgICAgLnByb2JlID0gc3RtMzJfZGJnX2J1c19wcm9iZSwKPiAr
ICAgICAgICAgICAgICAgLnJlbW92ZSA9IHN0bTMyX2RiZ19idXNfcmVtb3ZlLAo+ICsgICAgICAg
fSwKPiArfTsKCkp1c3QgYSBoZWFkcyB1cC4gV2l0aApodHRwczovL2xvcmUua2VybmVsLm9yZy9v
cC10ZWUvY292ZXIuMTc2NTc5MTQ2My5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8K
d2UncmUgc3dpdGNoaW5nIHRvIHVzZSBidXMgbWV0aG9kcyBpbnN0ZWFkIG9mIGRldmljZV9kcml2
ZXIgY2FsbGJhY2tzLgpUaGF0IHBsYW4gaXMgdG8gbWVyZ2UgdGhhdCBwYXRjaCBzZXQgaW4gdGhl
IG5leHQgbWVyZ2Ugd2luZG93LgoKQ2hlZXJzLApKZW5zCgo+ICsKPiArc3RhdGljIGludCBfX2lu
aXQgb3B0ZWVfZGJnX2J1c19tb2RfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBpbnQgcmV0Owo+
ICsKPiArICAgICAgIHJldCA9IGRyaXZlcl9yZWdpc3Rlcigmc3RtMzJfb3B0ZWVfZGJnX2J1c19k
cml2ZXIuZHJpdmVyKTsKPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4gKwo+ICsgICAgICAgcmV0ID0gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZzdG0z
Ml9kYmdfYnVzX2RyaXZlcik7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBk
cml2ZXJfdW5yZWdpc3Rlcigmc3RtMzJfb3B0ZWVfZGJnX2J1c19kcml2ZXIuZHJpdmVyKTsKPiAr
Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBfX2V4aXQgb3B0
ZWVfZGJnX2J1c19tb2RfZXhpdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBwbGF0Zm9ybV9kcml2ZXJf
dW5yZWdpc3Rlcigmc3RtMzJfZGJnX2J1c19kcml2ZXIpOwo+ICsgICAgICAgZHJpdmVyX3VucmVn
aXN0ZXIoJnN0bTMyX29wdGVlX2RiZ19idXNfZHJpdmVyLmRyaXZlcik7Cj4gK30KPiArCj4gK21v
ZHVsZV9pbml0KG9wdGVlX2RiZ19idXNfbW9kX2luaXQpOwo+ICttb2R1bGVfZXhpdChvcHRlZV9k
YmdfYnVzX21vZF9leGl0KTsKPiArCj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiArTU9EVUxF
X0FVVEhPUigiR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29t
PiIpOwo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk9QLVRFRSBiYXNlZCBTVE0zMiBkZWJ1ZyBhY2Nl
c3MgYnVzIGRyaXZlciIpOwo+Cj4gLS0KPiAyLjQzLjAKPgo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
