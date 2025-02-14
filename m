Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49981A35C25
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 12:09:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3A24C78F8C;
	Fri, 14 Feb 2025 11:09:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5F1C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 11:09:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso1896629f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 03:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531358; x=1740136158;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V7+4mem2ft+RVvvLEGTsxFIwY8eDWNZdbE4U/VEn5OU=;
 b=lMQsFk66mcUKr5nIR9ycM1x056AnAKFuXqLgUwi64kprgeEy0Ljo61RrSkwCyqGO8Q
 RYy9mRzoKtZ6EVKvADg/7JiBmamOotsF1dKtCGcUOGNm++wkXjB/SBSE5w0gldQeejKz
 2ugjIIwowY4HKpLTuV2mQEwmTA4lTJqu2kTX/GeHf3a80cVeApsSM7bHITKVx4SWrKOk
 4CfnXn2qJynfs61Ks9oU2McZC1zyzKfWBNfsfUJqlE17mQ3ejOd5/ZgKgkRU8Y4XaT/P
 FA9FNx4pOaG2cUHrhXmrDEUafHnvev2BNKnJXM7he4HFLXh19eoanlndxveoWwAW12/O
 Oanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531358; x=1740136158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V7+4mem2ft+RVvvLEGTsxFIwY8eDWNZdbE4U/VEn5OU=;
 b=t/0HGCihewNoR19DvsaWz1YQNN43wWjEhoA7jd3zqCmVNOFAlpUPgKNx4F4jvCTdlQ
 Sqls8fEH2lpsxSQiTcGUHQgRC7auYh+HAmngIfpD6KjIyxeFcwbrxtRqNvJ/0Th4zLyU
 EOgW6ADic7TpNyDm4lsIZRZFdFf4ic93KGbbbql1qK4x7q4R6Dqb15bKqnXT/GZWM5Id
 2CTvfHWFX9SPpQWyvjh9gKeFCWFZtuc2oDy+TnGyd1E4b2ra7lkSAkPZUv/GonkElSvf
 V5TpOUedkoN3ptMZCVDDD7iq0GumVmJ1Op7YEwnkk9uxKqMSKFZ9dz6AkdvBxVAO7qea
 GEwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDTEtxCyW1I8wGjdvpD8hsXKUBdjC5Esxk2dOrD+UIHfj4ckgKUIVY20ruh2j7d8pKOvfWzV/RVvhk4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYXABxn7cT7xIRmQTvfy/7Zy5jpxSbbj4oKHLAtrbnrENQnKoW
 wKaGRPNUPcSqW8b6xydYYOMzQsTMgZMjFpZQDtB7nG1+UcKCDW0EGf0bpXTSKFU=
X-Gm-Gg: ASbGncvMJJkEwHu3RV+7uYkcm0Izx9fUuzzExh8CsfAJr6FfDTW5oFhCv8IpJGDP4GK
 T4Z+8DG/q2K3cQ/4U2YNA9A9+b2z2e3gQ+z8rAgtLrXn1h+muL0Ng7VwPfPJLC4EgJb3zjYb6qf
 rU7eEnYW+RrKQVXw1NHZd9Cwtlm5Xw1eAOOXX9RQOBhvMOD7sCjqal+9Sak2rnPPEepypkw3Y8M
 oYg5XQCHGP9ZGCFKDKyVYq7Or06X4xdw+IfkTgMZ2PJpL7KXZpsUZMb3EoATkrg0MlkLl9YBt2W
 iviR9HIvhV+sEI4ArKyPd+V4Ng==
X-Google-Smtp-Source: AGHT+IHSYzmRWK6x5dqInVV0CJ5pE2+xfHMxdXlGP6JgPhn1Wonrdhujy16nNDJTyIehflsH4kOBJw==
X-Received: by 2002:a05:6000:71c:b0:38f:2b64:5327 with SMTP id
 ffacd0b85a97d-38f2b6457ccmr2854936f8f.24.1739531358487; 
 Fri, 14 Feb 2025 03:09:18 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913eb6sm4373298f8f.51.2025.02.14.03.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 03:09:18 -0800 (PST)
Message-ID: <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Date: Fri, 14 Feb 2025 11:09:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v10 4/7] Coresight: Introduce a new struct
	coresight_path
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

CgpPbiAxNC8wMi8yMDI1IDE6MzQgYW0sIEppZSBHYW4gd3JvdGU6Cj4gCj4gCj4gT24gMi8xNC8y
MDI1IDEyOjAwIEFNLCBKYW1lcyBDbGFyayB3cm90ZToKPj4KPj4KPj4gT24gMDcvMDIvMjAyNSA2
OjQyIGFtLCBKaWUgR2FuIHdyb3RlOgo+Pj4gQWRkICdzdHJ1Y3QgY29yZXNpZ2h0X3BhdGgnIHRv
IHN0b3JlIHRoZSBkYXRhIHRoYXQgaXMgbmVlZGVkIGJ5Cj4+PiBjb3Jlc2lnaHRfZW5hYmxlX3Bh
dGgvY29yZXNpZ2h0X2Rpc2FibGVfcGF0aC4gVGhlIHN0cnVjdHVyZSB3aWxsIGJlCj4+PiB0cmFu
c21pdHRlZCB0byBhbnkgcmVxdWlyZWQgZGV2aWNlcyB0byBlbmFibGUgcmVsYXRlZCBmdW5jYXRp
b25hbGl0aWVzLgo+Pj4KPj4+IFRoZSB0cmFjZV9pZCB3aWxsIGJlIGFsbG9jYXRlZCBhZnRlciB0
aGUgcGF0aCBpcyBidWlsdC4gQ29uc2VxdWVudGx5LAo+Pj4gVGhlIEVUTTN4IGFuZCBFVE00eCBk
ZXZpY2VzIHdpbGwgZGlyZWN0bHkgcmVhZCB0aGUgdHJhY2VfaWQgZnJvbSBwYXRoCj4+PiB3aGlj
aCByZXN1bHQgaW4gZXRtX3JlYWRfYWxsb2NfdHJhY2VfaWQgYW5kIGV0bTRfcmVhZF9hbGxvY190
cmFjZV9pZAo+Pj4gYmVpbmcgZGVsZXRlZC4KPj4+Cj4+PiBDby1kZXZlbG9wZWQtYnk6IEphbWVz
IENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
Q2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWUgR2Fu
IDxxdWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmPCoCB8IDEwNiArKysrKysrKysrKysrLS0tLS0K
Pj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZHVtbXkuYyB8wqDC
oCA1ICstCj4+PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYu
Y8KgIHzCoCAzMCArKystLQo+Pj4gwqAgLi4uL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWV0bS1wZXJmLmjCoCB8wqDCoCAyICstCj4+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2ln
aHQvY29yZXNpZ2h0LWV0bS5owqDCoCB8wqDCoCAxIC0KPj4+IMKgIC4uLi9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LWV0bTN4LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQgKystLS0tLS0tCj4+
PiDCoCAuLi4vY29yZXNpZ2h0L2NvcmVzaWdodC1ldG00eC1jb3JlLmPCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDU0ICsrLS0tLS0tLQo+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1ldG00eC5oIHzCoMKgIDEgLQo+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1wcml2LmjCoCB8wqAgMTIgKy0KPj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtc3RtLmPCoMKgIHzCoMKgIDMgKy0KPj4+IMKgIGRyaXZlcnMv
aHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtc3lzZnMuYyB8wqAgMTcgKystCj4+PiDCoCBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwZG0uY8KgIHzCoMKgIDMgKy0K
Pj4+IMKgIGluY2x1ZGUvbGludXgvY29yZXNpZ2h0LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArLQo+Pj4gwqAgMTMgZmlsZXMgY2hhbmdlZCwgMTQzIGlu
c2VydGlvbnMoKyksIDE1NyBkZWxldGlvbnMoLSkKPj4+Cj4+IFsuLi5dCj4+PiBAQCAtMzUyLDcg
KzM1Miw3IEBAIHN0YXRpYyB2b2lkICpldG1fc2V0dXBfYXV4KHN0cnVjdCBwZXJmX2V2ZW50IAo+
Pj4gKmV2ZW50LCB2b2lkICoqcGFnZXMsCj4+PiDCoMKgwqDCoMKgwqAgKiBDUFVzLCB3ZSBjYW4g
aGFuZGxlIGl0IGFuZCBmYWlsIHRoZSBzZXNzaW9uLgo+Pj4gwqDCoMKgwqDCoMKgICovCj4+PiDC
oMKgwqDCoMKgIGZvcl9lYWNoX2NwdShjcHUsIG1hc2spIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgbGlzdF9oZWFkICpwYXRoOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBjb3Jlc2ln
aHRfcGF0aCAqcGF0aDsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY29yZXNpZ2h0X2Rl
dmljZSAqY3NkZXY7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NkZXYgPSBwZXJfY3B1KGNzZGV2
X3NyYywgY3B1KTsKPj4+IEBAIC00MDUsMTUgKzQwNSwxNSBAQCBzdGF0aWMgdm9pZCAqZXRtX3Nl
dHVwX2F1eChzdHJ1Y3QgcGVyZl9ldmVudCAKPj4+ICpldmVudCwgdm9pZCAqKnBhZ2VzLAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBtYXNrKTsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4+IC0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBlbnN1cmUgd2UgY2FuIGFs
bG9jYXRlIGEgdHJhY2UgSUQgZm9yIHRoaXMgQ1BVICovCj4+PiAtwqDCoMKgwqDCoMKgwqAgdHJh
Y2VfaWQgPSBjb3Jlc2lnaHRfdHJhY2VfaWRfZ2V0X2NwdV9pZF9tYXAoY3B1LCAmc2luay0gCj4+
PiA+cGVyZl9zaW5rX2lkX21hcCk7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19WQUxJRF9D
U19UUkFDRV9JRCh0cmFjZV9pZCkpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCB0cmFjZV9pZCA9IGNv
cmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCBDU19NT0RFX1BFUkYpOwo+Pj4gKwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIENhbiBiZSAwIGFuZCB2YWxpZCwgRVRFIGRvZXNuJ3QgbmVl
ZCBhbiBJRCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICh0cmFjZV9pZCA8IDApIHsKPj4KPj4g
Tm90IHN1cmUgd2h5IEkgd3JvdGUgaXQgbGlrZSB0aGlzLCBidXQgSSB0aGluayB3ZSBzaG91bGQg
bGVhdmUgaXQgYXMgCj4+IGl0IHdhcyB3aXRoICFJU19WQUxJRF9DU19UUkFDRV9JRCgpLiBFdmVu
IHdpdGggRVRFIGl0IGNhbGxzIHRoZSB0cmFjZSAKPj4gSUQgYWxsb2NhdG9yLCBzbyBub3RoaW5n
IGhhcyBjaGFuZ2VkIGhlcmUuCj4+Cj4gU3VyZSwgV2lsbCByZXN0b3JlLiBGb3IgRVRFIG9yIEVU
TSwgd2UgZG9udCBuZWVkIHRyYXZlcnNlIHRoZSBwYXRoLCBqdXN0IAo+IGRpcmVjdGx5IGFsbG9j
YXRlIHRoZSB0cmFjZSBpZCBiYXNlZCBvbiBjcHUgaWQuCj4gCj4gSmllCj4gCj4gCgpTb3JyeSBJ
IG1lYW50IHRvIG9ubHkga2VlcCB0aGUgIUlTX1ZBTElEX0NTX1RSQUNFX0lEKCkgYml0LiBXZSBz
dGlsbCAKbmVlZCB0byBjYWxsIHRoZSBuZXcgY29yZXNpZ2h0X3BhdGhfYXNzaWduX3RyYWNlX2lk
KCkgb3RoZXJ3aXNlIGl0IApkb2Vzbid0IGdldCBhc3NpZ25lZCB0byB0aGUgcGF0aC4gSSBzYXcg
dGhhdCBnb3QgcmVtb3ZlZCBpbiB2MTEuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
