Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB0A37E56
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 10:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5BCFC78F86;
	Mon, 17 Feb 2025 09:23:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 625F6C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 09:23:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so587326f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 01:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739784204; x=1740389004;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
 b=iaX8w/eEx0Tu7NKTpaWgtSTuWgNMuIamqwG49kWqitpIs3ndPgq6im0oKJNKcGmsox
 x++us1SIxo6MHXLHXSDokr4F8460l3pdKjjXUCze+6wJSn+LBwowdzRzgZSEQ9eAw6ER
 SzjCWFdnF2pmUjiVuCZM7l8QdsdPb6sCZYKOzAWAoPd/Q8EwGSdYBJ1jgvsvCyQMGesH
 FONAjGhTEBlBijSOb1R35zUXXeycsrM0QiEdNcgYcR1vNHkCqpBEYPIxlMc7gsFxVYQL
 GGo6CUaIxqvgeW4wKA79YNbttN2UGOUMIMsFzBfH1P0vZxe324zBIJZiPJr0k0BQEMn/
 IkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739784204; x=1740389004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yFdEGk76Z8IF8jmdF4E6VELhXn1U7cH2XbnMNEOUO1Q=;
 b=PgHkSkgq7qI0vKyvRSXO6jrdgjS8+Duxmq1iihUzShOSkthskGdkpfC4Uho0dUKqIr
 OzU+ZD37mZP/ohYDUMX39XF69Jf8tRqmDgtXBmiEuiw0DKqanBduyEP5nxHuziS3KDFK
 tNXHAvFD+uQ7nozmTeQ7jqxaKhxfjj/+2xbOkjX4i3rTHLt0O86nKC0znp/VCEulQaN3
 sR00Fzc05aNRB9nDkiEZEO0bZ6ABUOG9XQlsVyr4a5MT6Qo5xgBDrgYlpw9PPVuNTdSk
 1mOXaDIzSkkDh6ogNQ90HMc51F40P8l0aIxhKSLo+3t3YytamIq8N+723kAwZgdW5sXZ
 H6zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY8wGdMIygHPn8YiRYvDyV1iZM+O9CwX9cDlx7oJBVuJ1fmTYhTZQT3GLZ6Se57ipH5IJpjfcmpTNK1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH/Yqt86k4yHFYPrEzitqKVZH2wQ/El4BVO8ByCXDxnmLhlpK8
 DCsD+dYscfgrML0LwI6+VXuLZXtV6oUD81UoM0pDTVhFkgSwRSms9LO/tl+CWrQ=
X-Gm-Gg: ASbGncs09BsA1PzdO2/0j8RfFZ0PvP8rBFiUxmWZNlvuU1kW7SxrotWRtTiEhOC4SZj
 F+0QEodK2gX3Xg2/IJl5CiHSwuJfEJXZSG5evJL7QQWYZZS3GvgqzLqFwoqL+eSbz/WpmC1U0uQ
 wVIP4q8Jcy/OVjw9VCJPZfzoiTLPzRqt4kDRgq2tS9h4T2D/WVr46Ukaak0lKEJ/hiWQN9XMNou
 BFY5Jt02T0EGTj1qvwlqU3Q6+f4LFfGblpb7PI2WbbRLibkLwIRLNt92mRRXKljN5K9aS7ZSR3V
 wzWmbVPwfWjl0VFHf4L4k7ITgA==
X-Google-Smtp-Source: AGHT+IHIAU1bziAKxZvRP07ZCo+6IKM9hGRF5YvWCGZkvCvo55+fOBkWCNJRs18IttuXSjIV+ShShQ==
X-Received: by 2002:a05:6000:1865:b0:38f:4d20:4a0a with SMTP id
 ffacd0b85a97d-38f4d204b59mr531618f8f.28.1739784203790; 
 Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8273sm11466058f8f.89.2025.02.17.01.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:23:23 -0800 (PST)
Message-ID: <8ee69b17-e7ac-4f73-abbe-93f4e29fe51d@linaro.org>
Date: Mon, 17 Feb 2025 09:23:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
 <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
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

CgpPbiAxNy8wMi8yMDI1IDE6MTQgYW0sIEppZSBHYW4gd3JvdGU6Cj4gCj4gCj4gT24gMi8xNC8y
MDI1IDc6MDkgUE0sIEphbWVzIENsYXJrIHdyb3RlOgo+Pgo+Pgo+PiBPbiAxNC8wMi8yMDI1IDE6
MzQgYW0sIEppZSBHYW4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIvMTQvMjAyNSAxMjowMCBBTSwg
SmFtZXMgQ2xhcmsgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDA3LzAyLzIwMjUgNjo0MiBhbSwg
SmllIEdhbiB3cm90ZToKPj4+Pj4gQWRkICdzdHJ1Y3QgY29yZXNpZ2h0X3BhdGgnIHRvIHN0b3Jl
IHRoZSBkYXRhIHRoYXQgaXMgbmVlZGVkIGJ5Cj4+Pj4+IGNvcmVzaWdodF9lbmFibGVfcGF0aC9j
b3Jlc2lnaHRfZGlzYWJsZV9wYXRoLiBUaGUgc3RydWN0dXJlIHdpbGwgYmUKPj4+Pj4gdHJhbnNt
aXR0ZWQgdG8gYW55IHJlcXVpcmVkIGRldmljZXMgdG8gZW5hYmxlIHJlbGF0ZWQgCj4+Pj4+IGZ1
bmNhdGlvbmFsaXRpZXMuCj4+Pj4+Cj4+Pj4+IFRoZSB0cmFjZV9pZCB3aWxsIGJlIGFsbG9jYXRl
ZCBhZnRlciB0aGUgcGF0aCBpcyBidWlsdC4gQ29uc2VxdWVudGx5LAo+Pj4+PiBUaGUgRVRNM3gg
YW5kIEVUTTR4IGRldmljZXMgd2lsbCBkaXJlY3RseSByZWFkIHRoZSB0cmFjZV9pZCBmcm9tIHBh
dGgKPj4+Pj4gd2hpY2ggcmVzdWx0IGluIGV0bV9yZWFkX2FsbG9jX3RyYWNlX2lkIGFuZCBldG00
X3JlYWRfYWxsb2NfdHJhY2VfaWQKPj4+Pj4gYmVpbmcgZGVsZXRlZC4KPj4+Pj4KPj4+Pj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9yZz4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+Cj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+Pj4+PiAt
LS0KPj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmPC
oCB8IDEwNiArKysrKysrKysrKysgCj4+Pj4+ICstLS0tLQo+Pj4+PiDCoCBkcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWR1bW15LmMgfMKgwqAgNSArLQo+Pj4+PiDCoCAuLi4v
aHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuY8KgIHzCoCAzMCArKystLQo+
Pj4+PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuaMKgIHzC
oMKgIDIgKy0KPj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1l
dG0uaMKgwqAgfMKgwqAgMSAtCj4+Pj4+IMKgIC4uLi9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTN4
LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQgKystLS0tLS0tCj4+Pj4+IMKgIC4uLi9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQg
KystLS0tLS0tCj4+Pj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
ZXRtNHguaCB8wqDCoCAxIC0KPj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1wcml2LmjCoCB8wqAgMTIgKy0KPj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1zdG0uY8KgwqAgfMKgwqAgMyArLQo+Pj4+PiDCoCBkcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXN5c2ZzLmMgfMKgIDE3ICsrLQo+Pj4+PiDCoCBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwZG0uY8KgIHzCoMKgIDMgKy0K
Pj4+Pj4gwqAgaW5jbHVkZS9saW51eC9jb3Jlc2lnaHQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICstCj4+Pj4+IMKgIDEzIGZpbGVzIGNoYW5nZWQsIDE0
MyBpbnNlcnRpb25zKCspLCAxNTcgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4gWy4uLl0KPj4+Pj4g
QEAgLTM1Miw3ICszNTIsNyBAQCBzdGF0aWMgdm9pZCAqZXRtX3NldHVwX2F1eChzdHJ1Y3QgcGVy
Zl9ldmVudCAKPj4+Pj4gKmV2ZW50LCB2b2lkICoqcGFnZXMsCj4+Pj4+IMKgwqDCoMKgwqDCoCAq
IENQVXMsIHdlIGNhbiBoYW5kbGUgaXQgYW5kIGZhaWwgdGhlIHNlc3Npb24uCj4+Pj4+IMKgwqDC
oMKgwqDCoCAqLwo+Pj4+PiDCoMKgwqDCoMKgIGZvcl9lYWNoX2NwdShjcHUsIG1hc2spIHsKPj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgKnBhdGg7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggKnBhdGg7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgY29yZXNpZ2h0X2RldmljZSAqY3NkZXY7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBjc2RldiA9IHBlcl9jcHUoY3NkZXZfc3JjLCBjcHUpOwo+Pj4+PiBAQCAtNDA1LDE1ICs0
MDUsMTUgQEAgc3RhdGljIHZvaWQgKmV0bV9zZXR1cF9hdXgoc3RydWN0IHBlcmZfZXZlbnQgCj4+
Pj4+ICpldmVudCwgdm9pZCAqKnBhZ2VzLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gLQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZW5zdXJlIHdlIGNhbiBhbGxvY2F0ZSBhIHRyYWNlIElE
IGZvciB0aGlzIENQVSAqLwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdHJhY2VfaWQgPSBjb3Jlc2ln
aHRfdHJhY2VfaWRfZ2V0X2NwdV9pZF9tYXAoY3B1LCAmc2luay0gCj4+Pj4+ID5wZXJmX3Npbmtf
aWRfbWFwKTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICghSVNfVkFMSURfQ1NfVFJBQ0VfSUQo
dHJhY2VfaWQpKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB0cmFjZV9pZCA9IGNvcmVzaWdodF9w
YXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCAKPj4+Pj4gQ1NfTU9ERV9QRVJGKTsKPj4+Pj4gKwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogQ2FuIGJlIDAgYW5kIHZhbGlkLCBFVEUgZG9lc24ndCBu
ZWVkIGFuIElEICovCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAodHJhY2VfaWQgPCAwKSB7Cj4+
Pj4KPj4+PiBOb3Qgc3VyZSB3aHkgSSB3cm90ZSBpdCBsaWtlIHRoaXMsIGJ1dCBJIHRoaW5rIHdl
IHNob3VsZCBsZWF2ZSBpdCBhcyAKPj4+PiBpdCB3YXMgd2l0aCAhSVNfVkFMSURfQ1NfVFJBQ0Vf
SUQoKS4gRXZlbiB3aXRoIEVURSBpdCBjYWxscyB0aGUgCj4+Pj4gdHJhY2UgSUQgYWxsb2NhdG9y
LCBzbyBub3RoaW5nIGhhcyBjaGFuZ2VkIGhlcmUuCj4+Pj4KPj4+IFN1cmUsIFdpbGwgcmVzdG9y
ZS4gRm9yIEVURSBvciBFVE0sIHdlIGRvbnQgbmVlZCB0cmF2ZXJzZSB0aGUgcGF0aCwgCj4+PiBq
dXN0IGRpcmVjdGx5IGFsbG9jYXRlIHRoZSB0cmFjZSBpZCBiYXNlZCBvbiBjcHUgaWQuCj4+Pgo+
Pj4gSmllCj4+Pgo+Pj4KPj4KPj4gU29ycnkgSSBtZWFudCB0byBvbmx5IGtlZXAgdGhlICFJU19W
QUxJRF9DU19UUkFDRV9JRCgpIGJpdC4gV2Ugc3RpbGwgCj4+IG5lZWQgdG8gY2FsbCB0aGUgbmV3
IGNvcmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZCgpIG90aGVyd2lzZSBpdCAKPj4gZG9lc24n
dCBnZXQgYXNzaWduZWQgdG8gdGhlIHBhdGguIEkgc2F3IHRoYXQgZ290IHJlbW92ZWQgaW4gdjEx
Lgo+Pgo+Pgo+IFNvcnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGluZywgSSB3YXMgZm9jdXNlZCBv
biAibm90aGluZyBoYXMgY2hhbmdlZCAKPiBoZXJlIiwgbG9sLgo+IAo+IEkgZ290IHlvdXIgcG9p
bnQgaGVyZS4KPiBTbyB0aGUgdXBkYXRlZCBjb2RlcyBzaG91bGQgYmU6Cj4gLi4uCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBlbnN1cmUgd2UgY2FuIGFsbG9jYXRlIGEgdHJh
Y2UgSUQgZm9yIHRoaXMgQ1BVICovCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
cmFjZV9pZCA9IGNvcmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCAKPiBDU19NT0RF
X1BFUkYpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19WQUxJRF9D
U19UUkFDRV9JRCh0cmFjZV9pZCkpIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvcmVzaWdodF9yZWxlYXNl
X3BhdGgocGF0aCk7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gLi4u
Cj4gCj4gCj4gVGhhbmtzLAo+IEppZQoKWWVzIHRoYXQgbG9va3MgZ29vZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
