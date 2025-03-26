Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9BA71375
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 10:19:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74CB0C78F73;
	Wed, 26 Mar 2025 09:19:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D95EC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 09:19:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso45933605e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742980780; x=1743585580;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+QKKeBqHLdSDLp7AN8k5GvLjUGTP8nfJ4AzxgzYhyEo=;
 b=pZKpnlL/kLJzPyIi7AQTH3UQIfrpkFKxQSPsF/MEYcVBDCjFtazP1cEte2YB/6EC86
 QQNXOFES0ie6NhWjDa92RlOQGci1Qlb+yBBINuZ/jYgENz6W4hbL+geb9AV1XAn5+6p4
 pAxZeIWb79dCpTljhfo4EN3ct6LMPpJeNnvocSdV6pnxzezWA158K/D5Wsoq2+oLKPdW
 TEVC5itK5zZugdXa+Hs1BKMCGWe/gn/G/6peEvbiWoINOXtcvsCL5wX7M+jdp3UrvHEt
 dWHpWePK8o2Jjxa8M39lOgvp2iBydcW+ElslNaJpoDj9rYpVlov8lfxh8SzaXe6/ZGCn
 we6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742980780; x=1743585580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QKKeBqHLdSDLp7AN8k5GvLjUGTP8nfJ4AzxgzYhyEo=;
 b=b/knBjCk/hIRmIz1N9YRbm9qAD8dslgfzA+rLhxTqLljVHV5ReEyXTQ21VT8OMLMWJ
 vpZzcnnWkrzBnZHY8sjPuJsouvsAunz3wtvMQ/zIIwmCEgOAJSES1KK9ykwQQibCOZXh
 Hcrx0rxs9sa7Ms60OZkOmZYQqJYSj8KvgKDVE9dC7OT/5EmFW9QW7Mx+SfPDKN91PIDW
 dsWYucMEtwK42S1EgK7gmr+hIvcNVcZIX0RiYRM6sAmzpMRTTA4EaUfSRh1Ad6XDqBra
 eF0f1anHYNbjsoxC2pDAyq3miArmysOSYuJwGW2+Kv13yZk7LrzLMy0kA04HHnth6pxH
 LwgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYj2I2BuFKnPgoltmgGCmnuWh5cyMicNddVhyRd6kieV8IyDfFQY4dCGDI2Tw7jS1tw+wmlat4zl4PrQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynVRhJqcSRwBYqCcH2QffzTMaG/Y2MGjApO59MLxrCFfhMEklC
 sr7YquxW61gJLZQyYARKb7tofcZZjQ29iM1xZR4ZDPUiUoz+AYvk69hP7B9jzG0=
X-Gm-Gg: ASbGncvnZ5GmeL/nl6/xP6Mv+/sLWur5kPDl8fmLQcSh/AIOL5rRwQV5WgBbd53t6Ju
 Toz//R2hwsfIM0u+ucxsav1N8/3phc+SRMGV/+9Do/p/IoU0pUyICwshdTCU+I/raKqaLAN1PNq
 RSloiiAhlmRcJYN1vspeMP1UGvGFj5wt4l8dgrIDZ0lH+2PkM21GLdPTVSzxGmxtJtnowh/GPvY
 UxtdrV6nomcDA0EYG7n5d0Gaf77MhuDVtsDdEHn+Tsus6z8VUdWRfsXHF8NGpv0spzb7pUemens
 HGh4pIVoa+cJEe1yDO5FI6xFrlVQ4rDSASNKqYo+Jbl4Sb2SA/Fd4pDu/QkctD+8uH5X9pCg9aV
 7I2OSiMzQ
X-Google-Smtp-Source: AGHT+IEUd9qei1H5Bs/jDi0MWXCcBq07B1C4ENdBfz4ea7omlBIKstcZNE7pR3Dh914VfRyiP9gQ0w==
X-Received: by 2002:a05:6000:2c2:b0:391:2df9:772d with SMTP id
 ffacd0b85a97d-3997f90f731mr19613529f8f.13.1742980779647; 
 Wed, 26 Mar 2025 02:19:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d74b48b90sm28757745e9.14.2025.03.26.02.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:19:39 -0700 (PDT)
Message-ID: <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
Date: Wed, 26 Mar 2025 10:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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

T24gMjYvMDMvMjAyNSAwODo0NCwgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPiBPbiAzLzI1
LzIwMjUgMzo1NCBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIDI1LzAzLzIwMjUgMTQ6
MjEsIEdoZW5uYWRpIFByb2NvcGNpdWMgd3JvdGU6Cj4+PiBPbiAzLzI1LzIwMjUgMjo1MSBQTSwg
RGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+PiBbIC4uLiBdCj4+Pj4+Pj4+Pj4gK3N0YXRpYyBpbnQg
X19pbml0IG54cF9zdG1fdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+Pj4+
Pj4+ICpwZGV2KQo+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2Rl
ICpucCA9IGRldi0+b2Zfbm9kZTsKPj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBzdG1faW5zdGFu
Y2VzICpzdG1faW5zdGFuY2VzOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgY29uc3QgY2hhciAqbmFtZSA9
IG9mX25vZGVfZnVsbF9uYW1lKG5wKTsKPj4+Pj4+Pj4+PiArwqDCoMKgIHZvaWQgX19pb21lbSAq
YmFzZTsKPj4+Pj4+Pj4+PiArwqDCoMKgIGludCBpcnEsIHJldDsKPj4+Pj4+Pj4+PiArwqDCoMKg
IHN0cnVjdCBjbGsgKmNsazsKPj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdG1faW5z
dGFuY2VzID0KPj4+Pj4+Pj4+PiAodHlwZW9mKHN0bV9pbnN0YW5jZXMpKW9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCFzdG1faW5zdGFuY2VzKSB7
Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiTm8gU1RNIGluc3RhbmNl
cyBhc3NvY2lhdGVkIHdpdGggYSBjcHUiKTsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+
ICvCoMKgwqAgYmFzZSA9IGRldm1fb2ZfaW9tYXAoZGV2LCBucCwgMCwgTlVMTCk7Cj4+Pj4+Pj4+
Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKGJhc2UpKSB7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGlvbWFwICVwT0ZuXG4iLCBucCk7Cj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGJhc2UpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAg
fQo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArwqDCoMKgIGlycSA9IGlycV9vZl9wYXJzZV9hbmRf
bWFwKG5wLCAwKTsKPj4+Pj4+Pj4+PiArwqDCoMKgIGlmIChpcnEgPD0gMCkgewo+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBwYXJzZSBhbmQgbWFwIElS
UTogJWRcbiIsIGlycSk7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+Pj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+ICDCoMKgwqDCoEZyb20g
Y29tbWl0IGRlc2NyaXB0aW9uOgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGUgZmlyc3QgcHJvYmVk
IFNUTSBpcyB1c2VkIGFzIGEgY2xvY2tzb3VyY2UsIHRoZSBzZWNvbmQgd2lsbCBiZQo+Pj4+Pj4+
Pj4+IHRoZQo+Pj4+Pj4+Pj4+IGJyb2FkY2FzdCB0aW1lciBhbmQgdGhlIHJlc3QgYXJlIHVzZWQg
YXMgYSBjbG9ja2V2ZW50IHdpdGggdGhlCj4+Pj4+Pj4+Pj4gYWZmaW5pdHkgc2V0IHRvIGEgQ1BV
Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoeSBpcyB0aGUgaW50ZXJydXB0IG1hbmRhdG9yeSB3aGVu
IHRoZSBub2RlIGlzIHByb2JlZCBhcyBhCj4+Pj4+Pj4+PiBjbG9ja3NvdXJjZT8KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gSXQgcmVsaWVzIG9uIHRoZSBEVCBkZXNjcmlwdGlvbiBhbmQgaXQgZG9lcyBub3Qg
aHVydCB0byBoYXZlIGEKPj4+Pj4+Pj4gY29uc2lzdGVudCBjb2RlIHBhdGggZm9yIGNsb2NrZXZl
bnQgLyBjbG9ja3NvdXJjZSBldmVuIGlmIHRoZQo+Pj4+Pj4+PiBpbnRlcnJ1cHQKPj4+Pj4+Pj4g
aXMgbm90IHJlcXVlc3RlZCBmb3IgdGhlIGNsb2Nrc291cmNlIGxhdGVyLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gSWYgc28sIGluIG15IG9waW5pb24sIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8g
dXNlIHRoZSBzYW1lIFNUTQo+Pj4+Pj4+IGluc3RhbmNlCj4+Pj4+Pj4gZm9yIGJvdGggdGhlIGNs
b2Nrc291cmNlIGFuZCBicm9hZGNhc3QgY2xvY2tldmVudCwgYXMgYm90aCBmdW5jdGlvbnMKPj4+
Pj4+PiBjYW4KPj4+Pj4+PiBiZSBhY2NvbW1vZGF0ZWQgd2l0aGluIGEgc2luZ2xlIFNUTSBpbnN0
YW5jZSwgd2hpY2ggd2lsbCBoZWxwIHJlZHVjZQo+Pj4+Pj4+IHRoZQo+Pj4+Pj4+IG51bWJlciBv
ZiBTVE0gaW5zdGFuY2VzIHVzZWQuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIGJyb2FkY2FzdCB0aW1lciBp
cyBzdG9wcGVkIHdoZW4gaXQgaXMgdW51c2VkIHdoaWNoIGlzIHRoZSBjYXNlIGZvcgo+Pj4+Pj4g
dGhlIHMzMiBiZWNhdXNlIHRoZXJlIGFyZSBubyBpZGxlIHN0YXRlIHBvd2VyaW5nIGRvd24gdGhl
IGxvY2FsCj4+Pj4+PiB0aW1lcnMuCj4+Pj4+PiBUaGV5IGhhdmUgdG8gaGF2ZSBiZSBzZXBhcmF0
ZWQuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGlzIHdvdWxkbid0IGJlIHRoZSBjYXNlIGlmIHRoZSBT
VE0gaXMga2VwdCBydW5uaW5nL2NvdW50aW5nIGR1cmluZwo+Pj4+PiB0aGUKPj4+Pj4gY2xvY2sg
ZXZlbnQgc2V0dXAsIHdpdGggb25seSB0aGUgY2xvY2sgZXZlbnQgaW50ZXJydXB0IGJlaW5nIGRp
c2FibGVkCj4+Pj4+IChDQ1IuQ0VOKS4KPj4+Pgo+Pj4+IEFyZSB5b3UgYXNraW5nIHRvIHVzZSB0
d28gZGlmZmVyZW50IGNoYW5uZWxzIGZvciB0aGUgc2FtZSBTVE0gaW5zdGFuY2UsCj4+Pj4gb25l
IGZvciB0aGUgY2xvY2tzb3VyY2UgYW5kIG9uZSBmb3IgdGhlIGNsb2NrZXZlbnQgPwo+Pj4+Cj4+
Pgo+Pj4gSSBzdWdnZXN0ZWQgdXNpbmcgdGhlIENOVCByZWdpc3RlciB0byBvYnRhaW4gdGhlIGNv
dW50IGZvciB0aGUgY2xvY2sKPj4+IHNvdXJjZSwgd2hpbGUgdXNpbmcgb25lIG9mIHRoZSBTVE0g
Y2hhbm5lbHMgZm9yIHRoZSBjbG9jayBldmVudC4KPj4KPj4gQWgsIG9rLgo+Pgo+PiBJIHRoaW5r
IGl0IGlzIHByZWZlcmFibGUgdG8ga2VlcCB0aGVtIHNlcGFyYXRlZCB0byBrZWVwIHRoZSBjb2Rl
Cj4+IG1vZHVsYXIuIEdpdmVuIHRoZSBudW1iZXIgb2YgU1RNIG9uIHRoZSBwbGF0Zm9ybSwgaXQg
ZG9lcyBub3QgaHVydAo+Pgo+IAo+IFRoZSBTMzJHMiBhbmQgUzMyRzMgYXJlIFNvQ3MgZmVhdHVy
aW5nIGEgZGl2ZXJzZSBzZXQgb2YgY29yZXMuIExpbnV4IGlzCj4gZXhwZWN0ZWQgdG8gcnVuIG9u
IENvcnRleC1BNTMgY29yZXMsIHdoaWxlIG90aGVyIHNvZnR3YXJlIHN0YWNrcyB3aWxsCj4gb3Bl
cmF0ZSBvbiBDb3J0ZXgtTSBjb3Jlcy4gVGhlIG51bWJlciBvZiBTVE0gaW5zdGFuY2VzIGhhcyBi
ZWVuIHNpemVkIHRvCj4gaW5jbHVkZSBhdCBtb3N0IG9uZSBpbnN0YW5jZSBwZXIgY29yZS4gQWxs
b2NhdGluZyBzaXggaW5zdGFuY2VzICgxIGNsb2NrCj4gc291cmNlLCAxIGJyb2FkY2FzdCBjbG9j
ayBldmVudCwgYW5kIDQgY2xvY2sgZXZlbnRzIGZvciBhbGwgQTUzIGNvcmVzKQo+IHRvIExpbnV4
IG9uIHRoZSBTMzJHMiBsZWF2ZXMgdGhlIE03IHNvZnR3YXJlIHN0YWNrcyB3aXRob3V0IGFkZXF1
YXRlIFNUTQo+IGNvdmVyYWdlLgoKR2l2ZW4gdGhpcyBkZXNjcmlwdGlvbiBJJ20gd29uZGVyaW5n
IHdoeSBvbmUgU1RNIGhhcyB0byBiZSB1c2VkIGFzIGEgCmNsb2Nrc291cmNlIGlmIHRoZSBTVE1f
MDcgaXMgYWxyZWFkeSBhIFRTIG9uZS4gQW5kIGFsc28sIHdlIGNhbiBnZXQgcmlkIApvZiB0aGUg
YnJvYWRjYXN0IHRpbWVyIGFzIHRoZXJlIGlzIG5vIGlkbGUgc3RhdGUgZm9yY2luZyBhIHN3aXRj
aCB0byBhbiAKYWx3YXlzLW9uIHRpbWVyLgoKSUlVQywgb24gdGhlIFMzMmcyIHRoZXJlIGFyZSA0
IHggQ29ydGV4LUE1MyBhbmQgMyB4IENvcnRleC1NMywgdGhhdCAKbWVhbnMgd2UgbmVlZCA3IHRp
bWVycy4KClRoZSBzeXN0ZW0gaGFzIDcgdGltZXJzICsgYSBzcGVjaWFsIG9uZSBmb3IgdGltZXN0
YW1wLgoKU28gaWYgSSBmb2xsb3cgdGhlIHJlYXNvbmluZywgdGhlIGJyb2FkY2FzdCB0aW1lciBz
aG91bGQgbm90IGJlIHVzZWQgCm90aGVyd2lzZSBvbmUgY29ydGV4LU0zIHdpbGwgZW5kIHVwIHdp
dGhvdXQgYSB0aW1lci4KClRoYXQgbGVhZHMgdXMgdG8gb25lIGNsb2Nrc291cmNlIGZvciB0aGUg
Zmlyc3QgcGVyIENQVSB0aW1lciBpbml0aWFsaXplZCAKb3IgYWx0ZXJuYXRpdmVseSBvbmUgU1RN
IGluc3RhbmNlID09IDEgY2xvY2tzb3VyY2UgYW5kIDEgY2xvY2tldmVudCAKd2hpY2ggbWFrZXMg
dGhpbmdzIHNpbXBsZXIKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxo
dHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90
d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
L2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
