Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F593A68CDB
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 13:30:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E56C78F60;
	Wed, 19 Mar 2025 12:30:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AA4DC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 12:30:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so5506558f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742387419; x=1742992219;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FR7LOBfgMjA2RsqEaQnFiGMYbwNkGFoaG0P7aHkHt7Y=;
 b=XKBZWBkZEad/yPKuahGa0X2kRyMcOZKWD0LrBhNZDNA29YZ6gq4hVWOaoEB2STt4e9
 WY4xXL3rZTLF0O3X2Ed7hWqk/32EUf1yu7pn6IOG2HrfdK+L04RaBcKyv3I47nTMVR+a
 r119D2a0KnjI32TfIEC8rA4LFAJzAFWvuKR7cV9t9jpK+NCSsXAUFu8sTSAsW/ZTUC1Y
 AfCtcp83Ey0N2zoFIeggVLlvjJ3qfRJ6SUf6Lq9Q8uHeA/yNjHHTCn9DMa+o0p840lrr
 OZLbJ1egwbGHMyCHvs+tvxsBmJ20uJ1AAa/J2cOQe27l8a+eiDOE82JwWFGJXxNRvtoN
 2ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742387419; x=1742992219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FR7LOBfgMjA2RsqEaQnFiGMYbwNkGFoaG0P7aHkHt7Y=;
 b=oHhWXqHvgjqddIO28EOdROM/TIa+eiL7G0pzECPNoVrKzAFaYySgzek9T8qiSZQy1q
 owtSVmDfj3SvDCYzyigcA3diZRaosu/X0MLf78il0CZvFr0dklcFrbDNo4vF8PbmFiCu
 lULLOBBkPfgbWV9qIMXhwa0GW5WRpEKBksk90zKflaApaQKQe1wWHayMlqXdB/lPdhQ8
 5coMYvIM91vfB1Tg3jh+WDhx9l6OpeJ4aKOQQioOTKkZvr1Ik6jSL1+QMPpZSgZzNkj1
 Flcrbh6+YDkZ640vWwGo5n5t0i/OJdy4+Z0iEt0vMwM3D1gOKgmbPd5HYVpdaDctdAXH
 kyYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZeYiczLXI+OP4DMdjTS5IncCvPlTXkEG5R5/WKngDJ4ozQFENrLl4SKHAkmtD3N43t6xjWheCHi4uw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwTLyQBSDxgDOgfGtIX4IA/jXJU4SPsAFXrRnMwqXDbANBwLcSW
 tnJhocAWu5IsKkJSjdyoDNcTS3FQ2dQUIoYYUgq2eNzHbiuq58pRHDpWwRVXdFU=
X-Gm-Gg: ASbGncs9HvV9xjZl3Xxabk3uFZwcHAedSERms6Zasytl28GzU33+81cAg8BFU2aKarR
 nqTVItR92lI7ME36D+Z4F/nhFOM50hTa6pQPmPHlxL1FB3TkHjW3/sGVhhRRHlFGU9hESg1ypWb
 0Ci9BSrQPix6jfvEQZ7AmB3NnZOrt9I5Yr2e2ViyBAidzmqMdYxQvxtsLBj3hUSyJcohJyrguuW
 15jCbyZolRESMi9QQOI4ab4k88uElZGRe3K+GKtEDMdod7UhUkITs85JhSi46gARyXrG7JdWwXg
 wQS3GmFLt+7fzeehwhfmVW+sAkY2rHXt2l3L6taPCQJwboROUbapxA==
X-Google-Smtp-Source: AGHT+IElD83yXdXLURLXF/axbPrNrrCeSAlJQC+eF2bcCRNhZkvyLSVVQgbNardWtBxjxy/EPmxOCw==
X-Received: by 2002:a05:6000:1847:b0:391:456b:6ac8 with SMTP id
 ffacd0b85a97d-399739ca1camr1959945f8f.24.1742387419344; 
 Wed, 19 Mar 2025 05:30:19 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-397f2837e61sm15560737f8f.97.2025.03.19.05.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:30:19 -0700 (PDT)
Message-ID: <2700171e-dbaa-4218-9b46-5d181f5afee7@linaro.org>
Date: Wed, 19 Mar 2025 12:30:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
 <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/8] coresight: Convert tag clear
 function to take a struct cs_access
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

CgpPbiAxOS8wMy8yMDI1IDEyOjAwIHBtLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDE4
LzAzLzIwMjUgMTY6MjEsIEphbWVzIENsYXJrIHdyb3RlOgo+PiBUaGUgc2VsZiBob3N0ZWQgY2xh
aW0gdGFnIHdpbGwgYmUgcmVzZXQgb24gZGV2aWNlIHByb2JlIGluIGEgbGF0ZXIKPj4gY29tbWl0
LiBXZSdsbCB3YW50IHRvIGRvIHRoaXMgYmVmb3JlIGNvcmVzaWdodF9yZWdpc3RlcigpIGlzIGNh
bGxlZCBzbwo+PiB3b24ndCBoYXZlIGEgY29yZXNpZ2h0X2RldmljZSBhbmQgaGF2ZSB0byB1c2Ug
Y3NfYWNjZXNzIGluc3RlYWQuCj4+Cj4+IEFsc28gbWFrZSB0aGVtIHB1YmxpYyBhbmQgY3JlYXRl
IGxvY2tlZCBhbmQgdW5sb2NrZWQgdmVyc2lvbnMgZm9yCj4+IGxhdGVyIHVzZS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+Cj4gCj4gbWlu
b3Igbml0Ogo+IAo+IFRoZSByZXN0cnVjdHVyaW5nIGxvb2tzIGEgYml0IGNvbmZ1c2luZy4gQ291
bGQgd2Ugc3RhcnQgd2l0aCA6Cj4gCj4gY29yZXNpZ2h0X3tzZXQsY2xlYXJ9X3NlbGZfY2xhaW1f
dGFnX3VubG9ja2VkIGluIFBhdGNoIDEuIFJhdGhlcgo+IHRoYW4gcmVuYW1lIHdoYXQgd2UgcmVu
YW1lZCBpbiBwYXRjaCAxIGFnYWluIGhlcmUuCj4gCj4gCgpJIGNvbnNpZGVyZWQgY29sbGFwc2lu
ZyB0aGVzZSB0d28gYWN0dWFsbHksIHdvdWxkIHlvdSBiZSBvayB3aXRoIHRoYXQ/Cgo+PiAtLS0K
Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMgfCAxNyAr
KysrKysrKysrKysrLS0tLQo+PiDCoCBpbmNsdWRlL2xpbnV4L2NvcmVzaWdodC5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jIGIvZHJpdmVycy8g
Cj4+IGh3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYwo+PiBpbmRleCAzZjFjOTk2
ZDY2OGEuLjlmZjYwMWUyNDE1YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1jb3JlLmMKPj4gQEAgLTE1MSwxMiArMTUxLDIxIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCAKPj4gY29yZXNpZ2h0X3NldF9zZWxmX2NsYWltX3RhZyhzdHJ1Y3QgY29yZXNpZ2h0
X2RldmljZSAqY3NkZXYpCj4+IMKgwqDCoMKgwqAgaXNiKCk7Cj4+IMKgIH0KPj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCBjb3Jlc2lnaHRfY2xlYXJfc2VsZl9jbGFpbV90YWcoc3RydWN0IAo+PiBjb3Jl
c2lnaHRfZGV2aWNlICpjc2RldikKPj4gK3ZvaWQgY29yZXNpZ2h0X2NsZWFyX3NlbGZfY2xhaW1f
dGFnKHN0cnVjdCBjc2Rldl9hY2Nlc3MgKmNzYSkKPj4gwqAgewo+PiAtwqDCoMKgIGNzZGV2X2Fj
Y2Vzc19yZWxheGVkX3dyaXRlMzIoJmNzZGV2LT5hY2Nlc3MsIAo+PiBDT1JFU0lHSFRfQ0xBSU1f
U0VMRl9IT1NURUQsCj4+ICvCoMKgwqAgQ1NfVU5MT0NLKGNzYS0+YmFzZSk7Cj4gCj4gVGhpcyBs
b29rcyB0byBiZSBoYXJkIGNvZGluZyBNTUlPIGJhc2VkIGFjY2VzcyA/IFNob3VsZCB3ZSBhYnN0
cmFjdCBpdCAKPiBiYXNlZCBvbiB0aGUgY3NkZXZfYWNjZXNzXyoqID8KPiAKPiAKPiBTdXp1a2kK
PiAKPiAKCkkgZGlkIHNvbWV0aGluZyBzaW1pbGFyIGVhcmxpZXIgYnV0IGl0IGVuZGVkIHVwIGJl
aW5nIGh1Z2UgdG8gZG8gaXQgCnByb3Blcmx5IGFuZCBJIHdhc24ndCBzdXJlIG9mIHRoZSBiZW5l
Zml0cyBzbyBJIGRlbGV0ZWQgaXQuIEJ5IAoncHJvcGVybHknIEkgbWVhbiBjaGFuZ2UgYWxsIG9m
IHRoZSBDU19VTkxPQ0soKSBjYWxscyB0byBiZSBhYnN0cmFjdGVkIAphbmQgZGVsZXRlIGV0bTRf
Y3NfdW5sb2NrKCkgYmVjYXVzZSBDU19VTkxPQ0soKSB3b3VsZCBoYW5kbGUgYm90aC4gSXQgCmVu
ZHMgYWRkaW5nIGluIGFuIGlmIGFuZCBpbmRpcmVjdGlvbiBmb3IgZXZlcnkgbG9jay91bmxvY2sg
Zm9yIGRldmljZXMgCnRoYXQgYXJlIG5ldmVyIHN5c3JlZyBhY2Nlc3MgYW55d2F5LgoKQmVjYXVz
ZSB0aGVyZSdzIGFscmVhZHkgdGhpczoKCnN0YXRpYyB2b2lkIGV0bTRfY3NfdW5sb2NrKHN0cnVj
dCBldG12NF9kcnZkYXRhICpkcnZkYXRhLAoJCQkgICBzdHJ1Y3QgY3NkZXZfYWNjZXNzICpjc2Ep
CnsKCWlmIChjc2EtPmlvX21lbSkKCQlDU19VTkxPQ0soY3NhLT5iYXNlKTsKCkJ1dCB5ZWFoIEkg
Y2FuIGFkZCB0aGUgaWYgaW50byBjb3Jlc2lnaHRfY2xlYXJfc2VsZl9jbGFpbV90YWcoKSwgCmFs
dGhvdWdoIGl0IHRlY2huaWNhbGx5IGRvZXNuJ3QgZG8gYW55dGhpbmcgbm93IGJlY2F1c2UgaXQn
cyBuZXZlciAKY2FsbGVkIGJ5IGFueSBkZXZpY2VzIHRoYXQgYXJlbid0IE1NSU8uIEFuZCB0aGVu
IGl0IG1ha2VzIApldG00X2NzX3VubG9jaygpIHN0YW5kIG91dCBhIGJpdCBiZWNhdXNlIGl0cyBu
b3QgYSBjb3JlIGZ1bmN0aW9uIHdoZW4gaXQgCmNvdWxkIGJlLiBCdXQgdGhhdCdzIHByb2JhYmx5
IGZpbmUuCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
