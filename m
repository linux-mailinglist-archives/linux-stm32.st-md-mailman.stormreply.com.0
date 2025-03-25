Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B906A6FA89
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 13:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065D4C78F68;
	Tue, 25 Mar 2025 12:00:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AAE6C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 12:00:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so4348933f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742904002; x=1743508802;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TuK45YEur4aLi12yY4E91d6DOq3lKYtTL3iTuyXH1Ic=;
 b=EZBs5aJy6FhshHHUjx7WDH4wBnbBnlTmsgq3T4w4m9klqC0ALDGpebU53WYXng8sI2
 QMZK7NvQ+bqxceloCyROHj8pkVPmkOxV8saYF8xCDaABl7pkSq/gcf0G4bZHzq8UwKAt
 jhQADgKg9+ml7giXd7nXeGxgThMSxQkzO61oMdAVIDFNaQqYhPXuPpdDjiCX2GbrBlqa
 G0kSfKHiI/opkFOr02PfqTBrZDJhe+hihqJ7c7pRrLnFbLtgfHkXAOxeAbN0+3SHOvUc
 ffIpRvHJTsgEI27l34MZtE0ODt/cu+xZ/YLcZMiMFTfdlOrUpMXOdxLk/ryR3UZfj6RC
 DRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742904002; x=1743508802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TuK45YEur4aLi12yY4E91d6DOq3lKYtTL3iTuyXH1Ic=;
 b=Ve2gluLGdbRyvFTKw07Ri21u3htE25sQ5FS5QLiDl4bp2TBQQ6kdqLszxHboGiVMEK
 n2cF9WI3PgUZSveBwXHekwTgIMxok6VfYkyKgZYPO0HLzj8ty0oAztsOG5bsL8OOlXXh
 bltMOkwV4k2UTo2EtT2OLbY3mRxjWB+2ejj9inoZkxYxMGeABvE7DkoT8Ut4Ue9SdlgB
 DZWA0K6BgzlRhlqae1WuzAo9IUVi9w7FV0JPItGcaT9grhqcyYksiJM9pe3brJIhgtXp
 TZwlw/upHA/VNfPsr8v4+vsi/U2XRm+pgIo24SwXrxywtU6peiMQrgSIcMghPqpl32dy
 jLdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5/cAzhZpSqOhwBXDU8ec/hE3qoLJ+ASLulTjtWPJvjMHRM3n2aLItVz32c9nJ81EZkGk5f9Bc07bREg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx274GsmvK80riBvgC5BIdBAUB/JYmlwm4/NPCLeAX4psjUHm4u
 SFw9YCpzqY1YCJJl+aI/AiAAndhpvblH5d/ZyV8qXBiEk5E7G3mXT4LgGBfjrtA=
X-Gm-Gg: ASbGncvx/nDzfGCYVjJYPQp158fWire45kUTsdmcAKGa4dqTQx3Yp97TzGoMEvBwvtX
 yFs7/984TWbFMJfdioWFi75mCOr+G5NxNuYIMWXyUkVmolpU4tQwG9G+h6mAdDpdlZ7SJiBvo3R
 BU+iq4zystymQn+11ZcAb63gZ9keNmHXUjNVND4a9N9svsTvxeQN9bQucCUxrMPMevb6VkWQJQm
 d7ho2WABlIxQtQ4tymEZJL2wyvR7j7+KmSS0qrhDWQ6tC0AbN0P1XXlomixNbf51mIP3t+o+RrO
 LsrhnWDJ6ntkSyj0ScM9qyIqe9XlJuB9tRxjiILKBlGmp290AX+SoA==
X-Google-Smtp-Source: AGHT+IETxWtVPyIY7fJYRcwqnqDBdA3ddGHgl67zvBSSoa79y7HsEg5c/va5aTKA+O2h9SpvZDcVOQ==
X-Received: by 2002:a5d:64e7:0:b0:391:3f4f:a172 with SMTP id
 ffacd0b85a97d-3997f940e3fmr12824268f8f.49.1742904001825; 
 Tue, 25 Mar 2025 05:00:01 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.90.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac92sm199600525e9.26.2025.03.25.05.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 05:00:01 -0700 (PDT)
Message-ID: <47e8486c-7d7a-46cf-a4e1-9420a3be4357@linaro.org>
Date: Tue, 25 Mar 2025 12:00:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
 <3bbf8aee-7b84-405a-8a3f-648c74196c2c@arm.com>
 <2d3fb704-172c-4632-9e95-02bbfb8c0f90@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <2d3fb704-172c-4632-9e95-02bbfb8c0f90@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/7] coresight: Convert tag clear
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

CgpPbiAyMS8wMy8yMDI1IDEyOjQyIHBtLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDIx
LzAzLzIwMjUgMTE6MDIsIFN1enVraSBLIFBvdWxvc2Ugd3JvdGU6Cj4+IE9uIDIwLzAzLzIwMjUg
MTQ6MzQsIEphbWVzIENsYXJrIHdyb3RlOgo+Pj4gVGhlIHNlbGYgaG9zdGVkIGNsYWltIHRhZyB3
aWxsIGJlIHJlc2V0IG9uIGRldmljZSBwcm9iZSBpbiBhIGxhdGVyCj4+PiBjb21taXQuIFdlJ2xs
IHdhbnQgdG8gZG8gdGhpcyBiZWZvcmUgY29yZXNpZ2h0X3JlZ2lzdGVyKCkgaXMgY2FsbGVkIHNv
Cj4+PiB3b24ndCBoYXZlIGEgY29yZXNpZ2h0X2RldmljZSBhbmQgaGF2ZSB0byB1c2UgY3NfYWNj
ZXNzIGluc3RlYWQuCj4+Pgo+Pj4gQWxzbyBtYWtlIHRoZW0gcHVibGljIGFuZCBjcmVhdGUgbG9j
a2VkIGFuZCB1bmxvY2tlZCB2ZXJzaW9ucyBmb3IKPj4+IGxhdGVyIHVzZS4KPj4+Cj4+PiBUaGVz
ZSBsb29rIGZ1bmN0aW9ucyBsb29rIGxpa2UgdGhleSBzZXQgdGhlIHdob2xlIHRhZ3MgcmVnaXN0
ZXIgYXMgb25lCj4+PiB2YWx1ZSwgYnV0IHRoZXkgb25seSBzZXQgYW5kIGNsZWFyIHRoZSBzZWxm
IGhvc3RlZCBiaXQgdXNpbmcgYSBTRVQvQ0xSCj4+PiBiaXRzIG1lY2hhbmlzbSBzbyBhbHNvIHJl
bmFtZSB0aGUgZnVuY3Rpb25zIHRvIHJlZmxlY3QgdGhpcyBiZXR0ZXIuCj4+Pgo+Pj4gUmV2aWV3
ZWQtYnk6IExlbyBZYW4gPGxlby55YW5AYXJtLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYyB8IDI3ICsrKysrKysrKysrKysrKysr
IAo+Pj4gKyArLS0tLS0tLS0KPj4+IMKgIGluY2x1ZGUvbGludXgvY29yZXNpZ2h0LmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0KPj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMgYi9kcml2
ZXJzLyAKPj4+IGh3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYwo+Pj4gaW5kZXgg
ZmI0M2VmNmEzYjFmLi44NDcxYWVmZWFjNzYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMKPj4+IEBAIC0xNDQsMTkgKzE0NCwzMCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgCj4+PiBjb3Jlc2lnaHRfaXNfY2xhaW1lZF9hbnkoc3RydWN0IGNv
cmVzaWdodF9kZXZpY2UgKmNzZGV2KQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gY29yZXNpZ2h0X3Jl
YWRfY2xhaW1fdGFncyhjc2RldikgIT0gMDsKPj4+IMKgIH0KPj4+IC1zdGF0aWMgaW5saW5lIHZv
aWQgY29yZXNpZ2h0X3NldF9jbGFpbV90YWdzKHN0cnVjdCBjb3Jlc2lnaHRfZGV2aWNlIAo+Pj4g
KmNzZGV2KQo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjb3Jlc2lnaHRfc2V0X3NlbGZfY2xhaW1f
dGFnKHN0cnVjdCAKPj4+IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2KQo+Pgo+PiBuaXQ6IEZvciBj
b25zaXN0ZW5jeSwgdGhpcyBzaG91bGQgYmUgcmVuYW1lZCB0byBfdW5sb2NrZWQgPwo+Pgo+IAo+
IG1pbm9yIG5pdCBvbiB0aGUgc3ViamVjdDsKPiAKPiBzL2NzX2FjY2Vzcy9jc2Rldl9hY2Nlc3Mv
Cj4gCj4gU3V6dWtpCj4gCj4gCj4+Cj4gCj4gUmVzdCBsb29rcyBmaW5lIHRvIG1lCgpGaXhlZCB0
aG9zZSB0d28gaW4gdjQsIHRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
