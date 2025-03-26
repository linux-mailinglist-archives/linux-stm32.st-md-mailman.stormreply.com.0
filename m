Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B1A714DE
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 11:31:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 017CEC78F73;
	Wed, 26 Mar 2025 10:31:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE6ACC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 10:31:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso50195745e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742985080; x=1743589880;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bB8LvUt/gLOBzJVAWx0XW5i+JKbkehvPw1Hnii/hCeY=;
 b=obSfe343eLyFLAwQ/4/pPhOEHn5f4gL18dGvjLDZF/SGXxHycC8tSXmrFENvHK1jWV
 d3kT+rXP05NV3SO4QeoEhZYbu169dNIUH9+/1/fUXlFCSso7HURFOkJCZQwNzmOWw0oj
 9DrUpAvlGOt8RUUuhuCKPnyF7lgwVnzFE/uXg58jrII1586hYtukUs9A1EIZanWOPbHz
 ngWJ9s10nqtXrldxRGD8dd3/vrQQCZ6KAFF3gSIEjV9z45FD1gkzzZL1LDAu1phDFPmE
 Jge8jXZFzcqoR808HP+CBsjoHt8w/NickMn6J1a2Sr0CRfX/FY/eUI4grxYc5cZPN77L
 f14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742985080; x=1743589880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bB8LvUt/gLOBzJVAWx0XW5i+JKbkehvPw1Hnii/hCeY=;
 b=ej8esYChMWqdp+I3e65avmkPiRc4RMfz4LFNxpRqrPh7aLlsbCFr+opqWWNNcP8w84
 EWi+6d1MAdpceZIbM9AVFu24EJXPsNqRzq1HqS3jVmRDmPY4B2XqNXEILAF8bgSD0ObK
 Y/3zCP1SLy4H0hev3u2LpLYFBws38vcY2gsYs6qcn4T+cgvlE7dBEsEVlL9lnSB/v0VM
 5dr6YGGo7cFxnyikWCLJhLR3/3jKzWhloXnmjxT8apfYBwaA7ox/R0hYLptwehYDpnpB
 5eLvKIbsvz/Kn2E2+8pk3b7gwYAmt5B63y5DwYaS5FCI7cubCJ21I2PEtwCE4KULp/79
 MSZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU5P155mVNFyPjMcEoI72ozNiNOziZDRLvsJfH2yhuyjyocDmC4vxHoYyTJMRdpt7N/nq+QDTOdOy7zQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqYq4BFVNxyweb5X86ByARLTS2hOKdwWD+rBLUAj2fgut8XfxS
 7DBbw5k0YdtlKyXwsjOkIZpo4Sfy3pOD5/ZR69S82N4Rcok8xXeFI6FlMEhugB0=
X-Gm-Gg: ASbGncskmwxz72XlLMPiAshVV8p0+cQiNQPKl7NRDD7VLuFhC4E9RncXl4QcZfTWaFH
 SNk11CnXC0K9tdgbGcE+4c6y5kH9i7GQDQahC63p8suN3obpw/rJQkiYXq2sMokaEzc/BGxgE3U
 opLfKiAYhfYE76zGVt7p76ax+H6Yniw3lku5xh0ESBCWPKbFGFhGUKlsWGuShLoB+7LClZe3LVu
 DzSGB8ghAIPYJ5iSHzAw5nCn+lVMQul7/NJMGKDphd8w2slUTY3k9KVJ6PbCyRLcRrMUppudm8H
 p2vuVakpRnSF7VmsljZjBCV0cO1aybHs0F1dJy5gPC4cOI2ajq0admeTcojbJllKPrRl41pBISx
 0Tw/ZR8m1Ef2VdBytrL4=
X-Google-Smtp-Source: AGHT+IFq7//HttPkhTtZsH26VLcgAbxZlTkYoXH35OF69Wj6ocNrllY3UQlBtg1F0RbqvI+UjYJiWg==
X-Received: by 2002:a05:600c:500f:b0:43c:f6c6:578c with SMTP id
 5b1f17b1804b1-43d509f809bmr217231095e9.15.1742985079945; 
 Wed, 26 Mar 2025 03:31:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3997f995778sm16523955f8f.11.2025.03.26.03.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:31:19 -0700 (PDT)
Message-ID: <16d02edf-181e-42a1-8b0f-cdef61109fbf@linaro.org>
Date: Wed, 26 Mar 2025 11:31:18 +0100
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
 <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
 <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
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

T24gMjYvMDMvMjAyNSAxMDo1NywgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPiBPbiAzLzI2
LzIwMjUgMTE6MTkgQU0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiAyNi8wMy8yMDI1IDA4
OjQ0LCBHaGVubmFkaSBQcm9jb3BjaXVjIHdyb3RlOgo+Pj4gT24gMy8yNS8yMDI1IDM6NTQgUE0s
IERhbmllbCBMZXpjYW5vIHdyb3RlOgo+Pj4+IE9uIDI1LzAzLzIwMjUgMTQ6MjEsIEdoZW5uYWRp
IFByb2NvcGNpdWMgd3JvdGU6Cj4+Pj4+IE9uIDMvMjUvMjAyNSAyOjUxIFBNLCBEYW5pZWwgTGV6
Y2FubyB3cm90ZToKPj4+Pj4gWyAuLi4gXQo+Pj4+Pj4+Pj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0
IG54cF9zdG1fdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+Pj4+Pj4+Pj4g
KnBkZXYpCj4+Pj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtX2lu
c3RhbmNlcyAqc3RtX2luc3RhbmNlczsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY29uc3QgY2hhciAq
bmFtZSA9IG9mX25vZGVfZnVsbF9uYW1lKG5wKTsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgdm9pZCBf
X2lvbWVtICpiYXNlOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBpbnQgaXJxLCByZXQ7Cj4+Pj4+Pj4+
Pj4+PiArwqDCoMKgIHN0cnVjdCBjbGsgKmNsazsKPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+
ICvCoMKgwqAgc3RtX2luc3RhbmNlcyA9Cj4+Pj4+Pj4+Pj4+PiAodHlwZW9mKHN0bV9pbnN0YW5j
ZXMpKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBp
ZiAoIXN0bV9pbnN0YW5jZXMpIHsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KGRldiwgIk5vIFNUTSBpbnN0YW5jZXMgYXNzb2NpYXRlZCB3aXRoIGEgY3B1Iik7Cj4+Pj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKg
IH0KPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgYmFzZSA9IGRldm1fb2ZfaW9t
YXAoZGV2LCBucCwgMCwgTlVMTCk7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIoYmFz
ZSkpIHsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBpb21hcCAlcE9GblxuIiwgbnApOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBQVFJfRVJSKGJhc2UpOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4+PiArCj4+
Pj4+Pj4+Pj4+PiArwqDCoMKgIGlycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKG5wLCAwKTsKPj4+
Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKGlycSA8PSAwKSB7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcGFyc2UgYW5kIG1hcCBJUlE6ICVkXG4iLCBp
cnEpOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgRnJvbSBj
b21taXQgZGVzY3JpcHRpb246Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBUaGUgZmlyc3QgcHJv
YmVkIFNUTSBpcyB1c2VkIGFzIGEgY2xvY2tzb3VyY2UsIHRoZSBzZWNvbmQKPj4+Pj4+Pj4+Pj4+
IHdpbGwgYmUKPj4+Pj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+Pj4+Pj4gYnJvYWRjYXN0IHRpbWVyIGFu
ZCB0aGUgcmVzdCBhcmUgdXNlZCBhcyBhIGNsb2NrZXZlbnQgd2l0aCB0aGUKPj4+Pj4+Pj4+Pj4+
IGFmZmluaXR5IHNldCB0byBhIENQVS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2h5IGlzIHRo
ZSBpbnRlcnJ1cHQgbWFuZGF0b3J5IHdoZW4gdGhlIG5vZGUgaXMgcHJvYmVkIGFzIGEKPj4+Pj4+
Pj4+Pj4gY2xvY2tzb3VyY2U/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJdCByZWxpZXMgb24gdGhl
IERUIGRlc2NyaXB0aW9uIGFuZCBpdCBkb2VzIG5vdCBodXJ0IHRvIGhhdmUgYQo+Pj4+Pj4+Pj4+
IGNvbnNpc3RlbnQgY29kZSBwYXRoIGZvciBjbG9ja2V2ZW50IC8gY2xvY2tzb3VyY2UgZXZlbiBp
ZiB0aGUKPj4+Pj4+Pj4+PiBpbnRlcnJ1cHQKPj4+Pj4+Pj4+PiBpcyBub3QgcmVxdWVzdGVkIGZv
ciB0aGUgY2xvY2tzb3VyY2UgbGF0ZXIuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJ
ZiBzbywgaW4gbXkgb3BpbmlvbiwgaXQgd291bGQgbWFrZSBzZW5zZSB0byB1c2UgdGhlIHNhbWUg
U1RNCj4+Pj4+Pj4+PiBpbnN0YW5jZQo+Pj4+Pj4+Pj4gZm9yIGJvdGggdGhlIGNsb2Nrc291cmNl
IGFuZCBicm9hZGNhc3QgY2xvY2tldmVudCwgYXMgYm90aAo+Pj4+Pj4+Pj4gZnVuY3Rpb25zCj4+
Pj4+Pj4+PiBjYW4KPj4+Pj4+Pj4+IGJlIGFjY29tbW9kYXRlZCB3aXRoaW4gYSBzaW5nbGUgU1RN
IGluc3RhbmNlLCB3aGljaCB3aWxsIGhlbHAKPj4+Pj4+Pj4+IHJlZHVjZQo+Pj4+Pj4+Pj4gdGhl
Cj4+Pj4+Pj4+PiBudW1iZXIgb2YgU1RNIGluc3RhbmNlcyB1c2VkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBUaGUgYnJvYWRjYXN0IHRpbWVyIGlzIHN0b3BwZWQgd2hlbiBpdCBpcyB1bnVzZWQgd2hpY2gg
aXMgdGhlCj4+Pj4+Pj4+IGNhc2UgZm9yCj4+Pj4+Pj4+IHRoZSBzMzIgYmVjYXVzZSB0aGVyZSBh
cmUgbm8gaWRsZSBzdGF0ZSBwb3dlcmluZyBkb3duIHRoZSBsb2NhbAo+Pj4+Pj4+PiB0aW1lcnMu
Cj4+Pj4+Pj4+IFRoZXkgaGF2ZSB0byBoYXZlIGJlIHNlcGFyYXRlZC4KPj4+Pj4+Pj4KPj4+Pj4+
Pgo+Pj4+Pj4+IFRoaXMgd291bGRuJ3QgYmUgdGhlIGNhc2UgaWYgdGhlIFNUTSBpcyBrZXB0IHJ1
bm5pbmcvY291bnRpbmcgZHVyaW5nCj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4gY2xvY2sgZXZlbnQgc2V0
dXAsIHdpdGggb25seSB0aGUgY2xvY2sgZXZlbnQgaW50ZXJydXB0IGJlaW5nIGRpc2FibGVkCj4+
Pj4+Pj4gKENDUi5DRU4pLgo+Pj4+Pj4KPj4+Pj4+IEFyZSB5b3UgYXNraW5nIHRvIHVzZSB0d28g
ZGlmZmVyZW50IGNoYW5uZWxzIGZvciB0aGUgc2FtZSBTVE0KPj4+Pj4+IGluc3RhbmNlLAo+Pj4+
Pj4gb25lIGZvciB0aGUgY2xvY2tzb3VyY2UgYW5kIG9uZSBmb3IgdGhlIGNsb2NrZXZlbnQgPwo+
Pj4+Pj4KPj4+Pj4KPj4+Pj4gSSBzdWdnZXN0ZWQgdXNpbmcgdGhlIENOVCByZWdpc3RlciB0byBv
YnRhaW4gdGhlIGNvdW50IGZvciB0aGUgY2xvY2sKPj4+Pj4gc291cmNlLCB3aGlsZSB1c2luZyBv
bmUgb2YgdGhlIFNUTSBjaGFubmVscyBmb3IgdGhlIGNsb2NrIGV2ZW50Lgo+Pj4+Cj4+Pj4gQWgs
IG9rLgo+Pj4+Cj4+Pj4gSSB0aGluayBpdCBpcyBwcmVmZXJhYmxlIHRvIGtlZXAgdGhlbSBzZXBh
cmF0ZWQgdG8ga2VlcCB0aGUgY29kZQo+Pj4+IG1vZHVsYXIuIEdpdmVuIHRoZSBudW1iZXIgb2Yg
U1RNIG9uIHRoZSBwbGF0Zm9ybSwgaXQgZG9lcyBub3QgaHVydAo+Pj4+Cj4+Pgo+Pj4gVGhlIFMz
MkcyIGFuZCBTMzJHMyBhcmUgU29DcyBmZWF0dXJpbmcgYSBkaXZlcnNlIHNldCBvZiBjb3Jlcy4g
TGludXggaXMKPj4+IGV4cGVjdGVkIHRvIHJ1biBvbiBDb3J0ZXgtQTUzIGNvcmVzLCB3aGlsZSBv
dGhlciBzb2Z0d2FyZSBzdGFja3Mgd2lsbAo+Pj4gb3BlcmF0ZSBvbiBDb3J0ZXgtTSBjb3Jlcy4g
VGhlIG51bWJlciBvZiBTVE0gaW5zdGFuY2VzIGhhcyBiZWVuIHNpemVkIHRvCj4+PiBpbmNsdWRl
IGF0IG1vc3Qgb25lIGluc3RhbmNlIHBlciBjb3JlLiBBbGxvY2F0aW5nIHNpeCBpbnN0YW5jZXMg
KDEgY2xvY2sKPj4+IHNvdXJjZSwgMSBicm9hZGNhc3QgY2xvY2sgZXZlbnQsIGFuZCA0IGNsb2Nr
IGV2ZW50cyBmb3IgYWxsIEE1MyBjb3JlcykKPj4+IHRvIExpbnV4IG9uIHRoZSBTMzJHMiBsZWF2
ZXMgdGhlIE03IHNvZnR3YXJlIHN0YWNrcyB3aXRob3V0IGFkZXF1YXRlIFNUTQo+Pj4gY292ZXJh
Z2UuCj4+Cj4+IEdpdmVuIHRoaXMgZGVzY3JpcHRpb24gSSdtIHdvbmRlcmluZyB3aHkgb25lIFNU
TSBoYXMgdG8gYmUgdXNlZCBhcyBhCj4+IGNsb2Nrc291cmNlIGlmIHRoZSBTVE1fMDcgaXMgYWxy
ZWFkeSBhIFRTIG9uZS4gQW5kIGFsc28sIHdlIGNhbiBnZXQgcmlkCj4+IG9mIHRoZSBicm9hZGNh
c3QgdGltZXIgYXMgdGhlcmUgaXMgbm8gaWRsZSBzdGF0ZSBmb3JjaW5nIGEgc3dpdGNoIHRvIGFu
Cj4+IGFsd2F5cy1vbiB0aW1lci4KPiAKPiBJbmRlZWQsIFNUTV8wNyBjYW4gYmUgdXNlZCBhcyBh
IHN5c3RlbSBjbG9jayBzb3VyY2UsIGJ1dCBMaW51eCBzaG91bGQKPiBub3QgYXNzdW1lIG93bmVy
c2hpcCBvZiBpdC4KPiAKPj4KPj4gSUlVQywgb24gdGhlIFMzMmcyIHRoZXJlIGFyZSA0IHggQ29y
dGV4LUE1MyBhbmQgMyB4IENvcnRleC1NMywgdGhhdAo+PiBtZWFucyB3ZSBuZWVkIDcgdGltZXJz
Lgo+Pgo+PiBUaGUgc3lzdGVtIGhhcyA3IHRpbWVycyArIGEgc3BlY2lhbCBvbmUgZm9yIHRpbWVz
dGFtcC4KPj4KPj4gU28gaWYgSSBmb2xsb3cgdGhlIHJlYXNvbmluZywgdGhlIGJyb2FkY2FzdCB0
aW1lciBzaG91bGQgbm90IGJlIHVzZWQKPj4gb3RoZXJ3aXNlIG9uZSBjb3J0ZXgtTTMgd2lsbCBl
bmQgdXAgd2l0aG91dCBhIHRpbWVyLgo+Pgo+IAo+IE9uIHRoZSBTMzJHMiwgdGhlcmUgYXJlIGVp
Z2h0IFNUTSB0aW1lcnMgYW5kIFNUTV9UUy4gVGhlcmVmb3JlLCB0aGVyZQo+IHNob3VsZCBiZSBl
bm91Z2ggaW5zdGFuY2VzIHRvIGFjY29tbW9kYXRlIDR4QTUzIGFuZCAzeE03IGNvcmVzLgo+IAo+
PiBUaGF0IGxlYWRzIHVzIHRvIG9uZSBjbG9ja3NvdXJjZSBmb3IgdGhlIGZpcnN0IHBlciBDUFUg
dGltZXIgaW5pdGlhbGl6ZWQKPj4gb3IgYWx0ZXJuYXRpdmVseSBvbmUgU1RNIGluc3RhbmNlID09
IDEgY2xvY2tzb3VyY2UgYW5kIDEgY2xvY2tldmVudAo+PiB3aGljaCBtYWtlcyB0aGluZ3Mgc2lt
cGxlcgo+Pgo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rvb2QgdGhlIGVudGlyZSBkZXNjcmlwdGlv
bi4gQXMgSSBzZWUgaXQsIHR3byBTVE0KPiBpbnN0YW5jZXMgc2hvdWxkIGJlIHVzZWQgdG8gYWNj
b21tb2RhdGUgb25lIGNsb2NrIHNvdXJjZSwgYSBicm9hZGNhc3QKPiBjbG9jayBldmVudCwgYW5k
IGZvdXIgY2xvY2sgZXZlbnRz4oCUb25lIHBlciBjb3JlLgoKV2hhdCBJIG1lYW50IGlzIHRvIGRv
IHNvbWV0aGluZyBzaW1wbGVyOgoKLS0tLS0tLS0tLS0tLS0tLS0KCmNhdCAvcHJvYy9pbnRlcnJ1
cHRzCgogIDE2OiAgICAgICA3ODkxICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAg
IEdJQ3YzICA1NiBMZXZlbCAKc3RtQDQwMTFjMDAwCiAgMTc6ICAgICAgICAgIDAgICAgICAgNTMy
NiAgICAgICAgICAwICAgICAgICAgIDAgICAgR0lDdjMgIDU3IExldmVsIApzdG1ANDAxMjAwMDAK
ICAxODogICAgICAgICAgMyAgICAgICAgICAwICAgICAgMTY2NjggICAgICAgICAgMCAgICBHSUN2
MyAgNTggTGV2ZWwgCnN0bUA0MDEyNDAwMAogIDE5OiAgICAgICAgICAwICAgICAgICAgIDAgICAg
ICAgICAgMCAgICAgICA1MTUyICAgIEdJQ3YzICA1OSBMZXZlbCAKc3RtQDQwMTI4MDAwCgotLS0t
LS0tLS0tLS0tLS0tLS0KCmNhdCAvc3lzL2RldmljZXMvc3lzdGVtL2Nsb2NrZXZlbnRzL2Nsb2Nr
ZXZlbnQqL2N1cnJlbnRfZGV2aWNlCgpzdG1ANDAxMWMwMDAKc3RtQDQwMTIwMDAwCnN0bUA0MDEy
NDAwMApzdG1ANDAxMjgwMDAKCi0tLS0tLS0tLS0tLS0tLS0tLQoKY2F0IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY2xvY2tzb3VyY2UvY2xvY2tzb3VyY2UwL2F2YWlsYWJsZV9jbG9ja3NvdXJjZQoKc3Rt
QDQwMTFjMDAwIHN0bUA0MDEyMDAwMCBzdG1ANDAxMjQwMDAgc3RtQDQwMTI4MDAwIGFyY2hfc3lz
X2NvdW50ZXIKCgoKT24gdGhlIFMzMkcyOiA0IFNUTSBpbnN0YW5jZXMgdXNlZCBmb3Igb25lIGNs
b2Nrc291cmNlIGFuZCBvbmUgY2xvY2tldmVudAoKT24gdGhlIFMzMkczOiA4IFNUTSBpbnN0YW5j
ZXMgdXNlZCBmb3Igb25lIGNsb2Nrc291cmNlIGFuZCBvbmUgY2xvY2tldmVudAoKClNwZWNpZmlj
IGJyb2FkY2FzdCB0aW1lciBpcyBub3QgbmVlZGVkIGFzIHRoZSBzMzJnIHN5c3RlbS4KCgpUaGUg
cmVzdWx0aW5nIHRpbWVyIGRyaXZlciBjb2RlIGlzIG11Y2ggc2ltcGxlci4KCgo+IEUuZy4KPiBT
VE1fMAo+IAktIGNsb2Nrc291cmNlIChiYXNlZCBvbiBDTlQpCj4gCS0gYnJvYWRjYXN0IGNsb2Nr
IGV2ZW50IChjaGFubmVsIDApCj4gCj4gU1RNXzEKPiAJLSBDb3J0ZXgtQTUzIDAgKGNoYW5uZWwg
MCkKPiAJLSBDb3J0ZXgtQTUzIDEgKGNoYW5uZWwgMSkKPiAJLSBDb3J0ZXgtQTUzIDIgKGNoYW5u
ZWwgMikKPiAJLSBDb3J0ZXgtQTUzIDMgKGNoYW5uZWwgMykKPiAKCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
