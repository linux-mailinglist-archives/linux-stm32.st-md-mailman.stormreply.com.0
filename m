Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399BA70286
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 14:47:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5931C78F7F;
	Tue, 25 Mar 2025 13:47:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4CFC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 13:47:18 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so45083185e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 06:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742910437; x=1743515237;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cC4k3GVKDrLc3pAzgTSQGdLDrYb8A4mFb3Dpb1J5fKk=;
 b=btQNh2xqWD334in9YAaV11e4///AVfWWpG0CJQmndJhds15BpVo7Bpnkixzz2pMxAe
 dt8qq2eWdipdjFe1e4OzEeOqKvtwe4rfphLTIYSDJC9E4ojfxQRLLnBD6hxoRKBKcBlg
 NgyQjTS/VSbRIwCRjaLDU4W6FYtvUtv7bbW7LCOM4JUYZtutm2Frs/XbIToJwOZGJ7x0
 D3kZt86AWDH47FTQFXakHlx4DjzsZ73qnkxZJJKHMCCBVOUpf6h/tz65w+ZO1asjeNwr
 PA41sUknkxfTCtORRJqxlnuWG8wfy6Pr2o0ho1rK+BUdGuNFmwL/tuKZNyeiJQYtHr2p
 8IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742910437; x=1743515237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cC4k3GVKDrLc3pAzgTSQGdLDrYb8A4mFb3Dpb1J5fKk=;
 b=dAESMYRMvf73y8V0nYScAHgbw5nbWvTkDeM8Dn5L0zPOveAtjVdg36mFbgPkRkIX+q
 TJqOFYfWJCfbnAL3fPZD9H+2GS25trz+33J2VzIU7tmgDsJj2aWrDcBUun7GEvNvwg0F
 NKZyWgGK0cWkxOKmVHw7KK/iZjL/jFVZo6P+2lbcKWMQyKoyIdBvcWYAMg72nGRCfgH+
 vj9jr6TvciNo9UqRdaJHFX0fIwGZbdf0PMvf0YOIwpXWCsiZAAxvzJRlAMOnTHB2sDcN
 C3zL4I8UUOz4R/qIbTZxsqIz2j/zEzFavi8dWdV1uP09mZmnguQREJwYfnJ4XA7uTp9l
 sbxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPcDwagY4H24eBOjb1VxOuTz4133nMRsy6KdTVFqEikPXtFODyHwWqjUvaJYUngf9DLRd4KsWBVOOW8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxp1twiPsqP+x1wzEiqOluMrxdOB4TdC+Kw5B2o8TP93bnD9tad
 6sqMYj9+rja0iYeqmJH9kHkMAyCF2jFgTAAkuyZyWtVwPLzNUALgJ55QDrzgM7A=
X-Gm-Gg: ASbGnctspicso57dYtvKIDbFwPVmjdNX9u5kvqa3pJ+pmpmSgWwtvk7582OOd8zaywI
 h0FSRoSkVxzWMbPOlr3yJ3o6QCI7CU8JK0GUKmgwvQAr/B0Tc8hRfS0OjbytWq9e+rDNm3pa+Dg
 SD3n9k/7srJTYWv5pWPUmkUCqbuC7gvJ7bZt8mXQ/ZfuPvAxGlDBZy4brocgHUXstwj855LdQCy
 V1VOE4yItXcIedsPXyKFGmKTm2PPQMYNTLIPQ/daux6Y1E91hWY09o3xNxOiZa1gk1FwYTViJoz
 vSymS4WzKq4JTjuALl4pSrIdqfT5+UBAPcn3wZgu/40kk8H9FQeOZ+Kbpt/BVqaj
X-Google-Smtp-Source: AGHT+IFpqtRld4kYWIl0Bq8BHWcBrNQo6w9zy4bwED+7n/WR5x5JXePT8jlXXf2j5+6Ao1DnzGIn6g==
X-Received: by 2002:a05:600c:32a7:b0:43d:9f2:6274 with SMTP id
 5b1f17b1804b1-43d51026f53mr116589055e9.14.1742910437457; 
 Tue, 25 Mar 2025 06:47:17 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.90.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fdbd348sm151629785e9.39.2025.03.25.06.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 06:47:17 -0700 (PDT)
Message-ID: <21217526-892d-4d27-9a09-b8853885493a@linaro.org>
Date: Tue, 25 Mar 2025 13:47:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
 <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/7] coresight: Only check bottom two
	claim bits
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

CgpPbiAyMS8wMy8yMDI1IDEyOjEwIHBtLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDIw
LzAzLzIwMjUgMTQ6MzQsIEphbWVzIENsYXJrIHdyb3RlOgo+PiBUaGUgdXNlIG9mIHRoZSB3aG9s
ZSByZWdpc3RlciBhbmQgPT0gY291bGQgYnJlYWsgdGhlIGNsYWltIG1lY2hhbmlzbSBpZgo+PiBh
bnkgb2YgdGhlIG90aGVyIGJpdHMgYXJlIHVzZWQgaW4gdGhlIGZ1dHVyZS4gVGhlIHJlZmVyZW5j
ZWQgZG9jICJQU0NJIC0KPj4gQVJNIERFTiAwMDIyRCIgYWxzbyBzYXlzIHRvIG9ubHkgcmVhZCBh
bmQgY2xlYXIgdGhlIGJvdHRvbSB0d28gYml0cy4KPj4KPj4gVXNlIEZJRUxEX0dFVCgpIHRvIGV4
dHJhY3Qgb25seSB0aGUgcmVsZXZhbnQgcGFydC4KPj4KPj4gUmV2aWV3ZWQtYnk6IExlbyBZYW4g
PGxlby55YW5AYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgQ2xhcmsgPGphbWVzLmNs
YXJrQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWNvcmUuYyB8IDMgKystCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdo
dC9jb3Jlc2lnaHQtcHJpdi5oIHwgMSArCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2lu
Zy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYyBiL2RyaXZlcnMvIAo+PiBod3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMKPj4gaW5kZXggODQ3MWFlZmVhYzc2Li4yNmQxNDlhNGM1
NzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
Y29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29y
ZS5jCj4+IEBAIC0xMzEsNyArMTMxLDggQEAgY29yZXNpZ2h0X2ZpbmRfb3V0X2Nvbm5lY3Rpb24o
c3RydWN0IAo+PiBjb3Jlc2lnaHRfZGV2aWNlICpjc2RldiwKPj4gwqAgc3RhdGljIGlubGluZSB1
MzIgY29yZXNpZ2h0X3JlYWRfY2xhaW1fdGFncyhzdHJ1Y3QgY29yZXNpZ2h0X2RldmljZSAKPj4g
KmNzZGV2KQo+PiDCoCB7Cj4+IC3CoMKgwqAgcmV0dXJuIGNzZGV2X2FjY2Vzc19yZWxheGVkX3Jl
YWQzMigmY3NkZXYtPmFjY2VzcywgCj4+IENPUkVTSUdIVF9DTEFJTUNMUik7Cj4+ICvCoMKgwqAg
cmV0dXJuIEZJRUxEX0dFVChDT1JFU0lHSFRfQ0xBSU1fTUFTSywKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjc2Rldl9hY2Nlc3NfcmVsYXhlZF9yZWFkMzIoJmNzZGV2LT5hY2Nlc3MsIAo+
PiBDT1JFU0lHSFRfQ0xBSU1DTFIpKTsKPj4gwqAgfQo+PiDCoCBzdGF0aWMgaW5saW5lIGJvb2wg
Y29yZXNpZ2h0X2lzX2NsYWltZWRfc2VsZl9ob3N0ZWQoc3RydWN0IAo+PiBjb3Jlc2lnaHRfZGV2
aWNlICpjc2RldikKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9j
b3Jlc2lnaHQtcHJpdi5oIGIvZHJpdmVycy8gCj4+IGh3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXByaXYuaAo+PiBpbmRleCA4MjY0NGFmZjhkMmIuLjM4YmI0ZThiNTBlZiAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wcml2LmgKPj4gKysr
IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wcml2LmgKPj4gQEAgLTM1
LDYgKzM1LDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBjb3Jlc2lnaHRfZGV2
X3R5cGVbXTsKPj4gwqDCoCAqIENvcmVzaWdodCBkZXZpY2UgQ0xBSU0gcHJvdG9jb2wuCj4+IMKg
wqAgKiBTZWUgUFNDSSAtIEFSTSBERU4gMDAyMkQsIFNlY3Rpb246IDYuOC4xIERlYnVnIGFuZCBU
cmFjZSBzYXZlIGFuZCAKPj4gcmVzdG9yZS4KPj4gwqDCoCAqLwo+PiArI2RlZmluZSBDT1JFU0lH
SFRfQ0xBSU1fTUFTS8KgwqDCoMKgwqDCoMKgIEdFTk1BU0soMSwgMCkKPj4gwqAgI2RlZmluZSBD
T1JFU0lHSFRfQ0xBSU1fU0VMRl9IT1NURUTCoMKgwqAgQklUKDEpCj4gCj4gSSBhbSBjaGVja2lu
ZyB3aXRoIHRoZSBBcm0gQ29yZVNpZ2h0IGFyY2hpdGVjdHMgb24gdGhpcy4gVGhpcyBpcwo+IHBy
b2JsZW1hdGljLCBpZiBhbm90aGVyIGFnZW50IGlzIGFzc2lnbmVkLCBzYXkgQklUKDIpIGFuZCB3
ZSB3b3VsZG4ndAo+IGZvcndhcmQgY29tcGF0aWJsZS4KPiAKPiBTdXp1a2kKPiAKPiAKCkZvciB0
aGUgYmVuZWZpdCBvZiB0aGUgbGlzdCwgSSB0aGluayB0aGUgY29uY2x1c2lvbiBpcyB0aGF0IGlu
IG9yZGVyIHRvIApiZSBmb3J3YXJkcyBjb21wYXRpYmxlIHdpdGggYWRkaW5nIG5ldyBiaXRzLCB0
aGUgc3BlYyB3b3VsZCBhbHJlYWR5IGhhdmUgCnRvIGhhdmUgYmVlbiByZWxlYXNlZCBpbmRpY2F0
aW5nIHRoYXQgdGhlIGV4dHJhIGJpdHMgbWF5IGJlIHVzZWQuIEFzIGl0IApzcGVjaWZpY2FsbHkg
b25seSBtZW50aW9ucyB0aGUgdHdvIGJpdHMsIGFueSBvdGhlciBpbXBsZW1lbnRhdGlvbiAKZm9s
bG93aW5nIGl0IHdvdWxkIGFsc28gaGl0IHRoZSBzYW1lIHByb2JsZW0uCgpTZWVtcyBsaWtlIGFu
eSBmdXJ0aGVyIHVwZGF0ZXMgd291bGQgaGF2ZSB0byBiZSBlaXRoZXIgYmUgYnJlYWtpbmcgb3Ig
CmRvbmUgaW4gc29tZSBvdGhlciB3YXkuCgpKYW1lcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
