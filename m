Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06FCE54DB
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Dec 2025 18:37:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49B47C57A52;
	Sun, 28 Dec 2025 17:37:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 708CBC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Dec 2025 17:37:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-42e2ba54a6fso3642790f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Dec 2025 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766943444; x=1767548244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVpE42Nm/eglv4AuJiF24kJ0VOC6iIK2FSatfzsCK7c=;
 b=gVfzzIXk91wUv4L3xxg+Eq253x/wWOXacti+SvroMLGNaIbN2Hm96cuIuvPMJpHfhc
 3kKhNUc0GuDtKZwkqBYKKPynvMIeBxtfP+rHQzCb6QdMovHdJyFn7wyxzSaZOd57Wkb2
 JjeZPMF3gDI6iO/oS5OoOTLhkt7a0aB1Pk7Y3qoIcKQhIPhqmF1QxQD7QxGZt2QLM9c+
 tjZ8H7u31QjFiojInwzWe6Amp8LZqsGNykVHEMEv3RJ3MLY4rHvhmBnPS6ASiwwKDdf7
 z+xmJ1ZEQN3Mb/Sh+/lHxp1cl02rK4GE/KyjQEvlujbPfDM5S/v7Jnp+73r6MidA1k86
 KyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766943444; x=1767548244;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVpE42Nm/eglv4AuJiF24kJ0VOC6iIK2FSatfzsCK7c=;
 b=UbqtdzZppPyyj6gW4OBexJUahK9RhecvPJE/CvV6WcbK7KWxQO+kkXmIXcmdn7xWUD
 g3nkBVhhKnxsI/NUsVHddYH7qediYfnYWIqYUY39zYsKLVGRQAvc8qpeSpADe228USRd
 0QBWUjnytFbGT4EA75hl6Z5YtHXapexPuPDLFbH4qFwzKtch7Eqzv4Z/+yr36LZ67e5t
 yH//qTDUaLfZInU/BOR2PnIdZUFXCWGrsteHZWHHJ7iFLlwebRq47JVXRDoJjSKy63TN
 AwcYPyFAV8NqSNBmX3X0LCj0wdA702PfBOwaIHppw72TApA3Fh6gDZS+NrYFVzaluZto
 1mRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuV5RQAeTdGqN5POB13Wyd0fHo4gr6jaWIG5Qwbnz4cC3A5qYSoNzJIhVdebl2USLSF/8lulpErTk4wQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDEl/O3wxeVbnFiBtyrxCa/kjLTz0Fliv53rrJ/GntaIx4JSgJ
 /wIVErjhfwooeMPSGk/+ScNctLpo80BFDHOjP1rEgrTCd4593CxTvbvG5B6jtAlRcLI=
X-Gm-Gg: AY/fxX4lCftLUHTVYPRmgzih8t8a/lG4tm4Z1ZHQqgZ9RQ8Mbhm04ypS9ZYgzpmUJnG
 3K/Azx048/AvSRRcVl6eSxZ7q2OGvf2FWYCwme+h4PbHdoJ+DX0rAFcGcyCMIzc+rMKd5IFkT5W
 5Visfox2fgXUVDDNk1F/kWN4+wA5ciAz20pZPcKa/bypEqPEZ81DdG6zJNJJcotmhoS/0x9tMuI
 CDzkbWpfjNd1grxEVB6UbfLlDCD8LhcLwUUf/HAW4VfW0kpvSfDwRKqiD1hkgqYGVTgAC1JmnOv
 XSaMOyqq5VUDTPusV4B8eyNv1opgmWWSNjny/A45ieyQdDW0Xo/IRLZYghnqv+nScKHABA3vofJ
 Yt72hKwl3sjM+BKBG1EMivmWnXXdU5zlOiZ4wilDHuA98lYnm16aE4ZrbpJsyLAdgQHVP+aE3SN
 MAsHHvq/q6NlKgq/K3z1cK3r+do2RMFyKyAab6O5O+SmwpTaAXoG+/nes6MQhwNLQcswwXa1AFR
 uW2
X-Google-Smtp-Source: AGHT+IHE0OkFcwTNOw8wEuwIrfhr0vrnj+ENYFnmwQiktK0vMMBBeGZzt5Tqu1ud08sB+J6NZr+fHw==
X-Received: by 2002:a05:6000:2c0e:b0:42b:3afa:5e1d with SMTP id
 ffacd0b85a97d-4324e4c9d89mr38116918f8f.20.1766943443689; 
 Sun, 28 Dec 2025 09:37:23 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621?
 ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm56716550f8f.22.2025.12.28.09.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Dec 2025 09:37:23 -0800 (PST)
Message-ID: <ba28863a-a5fe-498f-92a0-d71c356e7189@linaro.org>
Date: Sun, 28 Dec 2025 18:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: William Breathitt Gray <wbg@kernel.org>
References: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
 <20251228065241.21144-1-wbg@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251228065241.21144-1-wbg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, s32@nxp.com,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] counter: Add STM based counter
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CkhpIFdpbGxpYW0sCgpPbiAxMi8yOC8yNSAwNzo1MiwgV2lsbGlhbSBCcmVhdGhpdHQgR3JheSB3
cm90ZToKPiBPbiBXZWQsIERlYyAxNywgMjAyNSBhdCAwODo0OTo1N0FNICswMTAwLCBEYW5pZWwg
TGV6Y2FubyB3cm90ZToKPj4gVGhlIE5YUCBTMzJHMiBhdXRvbW90aXZlIHBsYXRmb3JtIGludGVn
cmF0ZXMgZm91ciBDb3J0ZXgtQTUzIGNvcmVzIGFuZAo+PiB0aHJlZSBDb3J0ZXgtTTcgY29yZXMs
IGFsb25nIHdpdGggYSBsYXJnZSBudW1iZXIgb2YgdGltZXJzIGFuZAo+PiBjb3VudGVycy4gVGhl
c2UgaGFyZHdhcmUgYmxvY2tzIGNhbiBiZSB1c2VkIGFzIGNsb2Nrc291cmNlcyBvcgo+PiBjbG9j
a2V2ZW50cywgb3IgYXMgdGltZXN0YW1wIGNvdW50ZXJzIHNoYXJlZCBhY3Jvc3MgdGhlIHZhcmlv
dXMKPj4gc3Vic3lzdGVtcyBydW5uaW5nIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVsLCBzdWNo
IGFzIGZpcm13YXJlCj4+IGNvbXBvbmVudHMuIFRoZWlyIGFjdHVhbCB1c2FnZSBkZXBlbmRzIG9u
IHRoZSBvdmVyYWxsIHBsYXRmb3JtCj4+IHNvZnR3YXJlIGRlc2lnbi4KPj4KPj4gSW4gYSBMaW51
eC1iYXNlZCBzeXN0ZW0sIHRoZSBrZXJuZWwgY29udHJvbHMgdGhlIGNvdW50ZXIsIHdoaWNoIGlz
IGEKPj4gcmVhZC1vbmx5IHNoYXJlZCByZXNvdXJjZSBmb3IgdGhlIG90aGVyIHN1YnN5c3RlbXMu
IE9uZSBvZiBpdHMgcHJpbWFyeQo+PiBwdXJwb3NlcyBpcyB0byBhY3QgYXMgYSBjb21tb24gdGlt
ZXN0YW1wIHNvdXJjZSBmb3IgbWVzc2FnZXMgb3IKPj4gdHJhY2VzLCBhbGxvd2luZyBjb3JyZWxh
dGlvbiBvZiBldmVudHMgb2NjdXJyaW5nIGluIGRpZmZlcmVudAo+PiBvcGVyYXRpbmcgc3lzdGVt
IGNvbnRleHRzLgo+Pgo+PiBUaGVzZSBjaGFuZ2VzIGludHJvZHVjZSBhIGJhc2ljIGNvdW50ZXIg
ZHJpdmVyIHRoYXQgY2FuIHN0YXJ0LCBzdG9wLAo+PiBhbmQgcmVzZXQgdGhlIGNvdW50ZXIuIEl0
IGFsc28gaGFuZGxlcyBvdmVyZmxvdyBhY2NvdW50aW5nIGFuZAo+PiBjb25maWd1cmVzIHRoZSBw
cmVzY2FsZXIgdmFsdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5p
ZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IAo+IEhpIERhbmllbCwKPiAKPiBJdCBzb3VuZHMgbGlr
ZSB5b3UncmUgdHJ5aW5nIHRvIGltcGxlbWVudCBhIGNsb2NrIGZvciB0aW1lc3RhbXBpbmcuCgpX
ZWxsIG5vLCBpdCBpcyBhIGNvdW50ZXIgd2hpY2ggaXMgdXNlZCBmb3IgdGltZXN0YW1waW5nLiBJ
dCBpcyBhbiAKYXV0b21vdGl2ZSBkZXNpZ24uCgo+IEFsdGhvdWdoIHRoZSBHZW5lcmljIENvdW50
ZXIgaW50ZXJmYWNlIGlzIGZsZXhpYmxlIGVub3VnaCB0byBzaG9laG9ybiBhCj4gYSBjbG9jayBp
bnRvIGl0cyByZXByZXNlbnRhdGlvbiwgSSBkb24ndCBiZWxpZXZlIGl0J3MgdGhlIHJpZ2h0Cj4g
YWJzdHJhY3Rpb24gZm9yIHRoaXMgcGFydGljdWxhciBkZXZpY2UuCiA+Cj4gUGVyaGFwcyByZWlt
cGxlbWVudGluZyB0aGlzCj4gZHJpdmVyIHVuZGVyIHRoZSBMaW51eCBjb21tb24gY2xvY2sgZnJh
bWV3b3JrIHdvdWxkIGJlIGEgYmV0dGVyIGFwcHJvYWNoCj4gdG8gYWNoaWV2ZSB3aGF0IHlvdSB3
YW50LgoKVGhlIGNvbW1vbiBjbG9jayBmcmFtZXdvcmsgPyBTb3JyeSBJIG1heSBoYXZlIG1pc3Vu
ZGVyc3Rvb2QgdGhlIENDRiBidXQgCmhvdyBhIGNvdW50ZXIgZXhwb3J0ZWQgYW5kIGNvbnRyb2xs
ZWQgYnkgdGhlIHVzZXJzcGFjZSBjYW4gYmUgbWFuYWdlZCBieSAKdGhlIENDRi4gQ2FuIHlvdSBl
bGFib3JhdGUgPwoKPiBSZWdhcmRsZXNzLCBpZiB5b3UgZG8gcHVyc3VlIGEgQ291bnRlciBkcml2
ZXIgeW91J2xsIG5lZWQgdG8gZm9sbG93IHRoZQo+IEdlbmVyaWMgQ291bnRlciBwYXJhZGlnbVte
MV0gYW5kIGRlZmluZSBhdCBsZWFzdCB0aHJlZSBjb3JlIGNvbXBvbmVudHM6Cj4gYSBTaWduYWws
IGEgU3luYXBzZSwgYW5kIGEgQ291bnQuIFJlc2V0dGluZyB0aGUgQ291bnQgaXMgdHlwaWNhbGx5
Cj4gaW1wbGVtZW50ZWQgYnkgZGVmaW5pbmcgYSBzdHJ1Y3QgY291bnRlcl9vcHMgY291bnRlcl93
cml0ZSgpCj4gY2FsbGJhY2tbXjJdLCB3aGlsZSBvdmVyZmxvd3MgYXJlIHR5cGljYWxseSBpbXBs
ZW1lbnRlZCBieSBwdXNoaW5nCj4gQ09VTlRFUl9FVkVOVF9PVkVSRkxPVyBDb3VudGVyIGV2ZW50
c1teM10gdGhhdCBjYW4gYmUgd2F0Y2hlZCBieQo+IHVzZXJzcGFjZS4KClllcywgSSB0aGluayB0
aGUgR2VuZXJpYyBjb3VudGVyIG1ha2VzIHNlbnNlIGhlcmUgZm9yIHRoZSBnb2FsIHRvIGJlIAph
Y2hpZXZlZC4gVGhhbmtzIGZvciB0aGUgcG9pbnRlcnMsIEknbGwgc2VlIGhvdyB0aGUgY291bnRl
ciBmaXRzIHdpdGggCnRoZSBwYXJhZGlnbS4KCiAgIC0tIERhbmllbAoKCj4gV2lsbGlhbSBCcmVh
dGhpdHQgR3JheQo+IAo+IFteMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9n
ZW5lcmljLWNvdW50ZXIuaHRtbCNwYXJhZGlnbQo+IFteMl0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5v
cmcvZHJpdmVyLWFwaS9nZW5lcmljLWNvdW50ZXIuaHRtbCNjLmNvdW50ZXJfb3BzCj4gW14zXSBo
dHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL2dlbmVyaWMtY291bnRlci5odG1sI2Nv
dW50ZXItZXZlbnRzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0
cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdp
dHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9s
aW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
