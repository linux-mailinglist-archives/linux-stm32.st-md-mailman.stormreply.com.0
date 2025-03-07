Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0AFA56B5D
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 16:12:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB930C78F96;
	Fri,  7 Mar 2025 15:12:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01421C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 15:12:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so1259591f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Mar 2025 07:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741360338; x=1741965138;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3KPjXWWPyK0oX1t83TQ9M25n1uZNpHn3HsSYBqjRW2A=;
 b=p6zXOq1njE94Pk32udA3feqrzOA4ONxrstE14A+0XUHsBlIeIQ7Hk8muZblgwc1lAC
 dB4IcZy1QzxTxQgf8C1bZnSMzyZ8hFTqJSTdceDl5f9Rq4cCMgYIPf4mz+6UXokq8wJJ
 JMAgE6HHtRzCLlL/70d9w9gOYrmxC0KWf0i+IfbdlrqwVXwLQqgclf7xgwzh3Ufhs9mW
 WT1rKaeJSH+mHpZmVz4IXmRaDqezsVaAQ0EN8OOIgkZq55SDfwAPWnobjnphVRX+2qQ1
 CbQWwpPx2zn02neKBJSHhsGCtxfxtXP8crnlDo8gXJjQoM06l6ePeL8DJg0TdCOflmL2
 wlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741360338; x=1741965138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3KPjXWWPyK0oX1t83TQ9M25n1uZNpHn3HsSYBqjRW2A=;
 b=X1LA5dxhEbj56Z3DqckULGFRKL2yCLRqyIHCYOc4m72VHtzydnjvfkuBUdTDAIgE8q
 aZ9xK//wdvegCQsSkg9WTwmCmw91RycWszwWRVzjuPDDbw/IvV+wWduRLRo1Z6J/AgQf
 IGVNqDO9T0kh5TWDfXe/hVMZqeM5BtN5fgfp3MCkk3HR2XwEOhMvYBA7ngrJZih1sxNv
 Bn3r19JlQszWUmGva+8F+HhbkvmnnCgTK0i3eE9qbazXC9fQ1I1hbiR5D60enR3ZJnjg
 0rWAl9PWHU/qDsX+FOwca2Yrnmfsx6KMjT41fOAq4Z8QWFlmXGqphYD68jwj15eBs1yi
 HCJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQcADSWyhpKZ6lC9sNLX0eVvT7wwxLixUxWSjzzOsX8ym+ntkUmaJF1a9rbIQMXNloFQx2g0DaoY6IA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyH/fue4JkK0YyxBEFclSR5vY+W+OiGkxyaVDczv8mSwfjcHcZ4
 wkjAHN9FC4Shsnc6Lz5ojTrWKvCno9jtjA0RbpLLgu44QHgJSbi5oyGDMWZ9P5I=
X-Gm-Gg: ASbGncsJAZS31XpvWdAgUvve/60rk5RT0IPzgdbrhiBsfOgSIXUMUudARdyioBiitst
 A3Fd3TJ9+n9ubOihaiXxPpqLtsciBcKeWu8MM3hE2sHQo5RAtQcakTX0ZPn365x4gViGAr7Or8E
 Y5R3q7zg8P2muo2OdHSMqAGYT1HWLNtyrYFkS3xCaIc4qkBPyZQlHV9dPonVBy7MvWnZBSbdcnw
 fReH+nmnqWh0Rj7x322iISSYmkbFvUWapTGLJxLGyoFgQO0+4XSzpuS4L3yI6C7I1eS4hpNo3RA
 lj8iuki+sAQMQTlFi9sM0gho5UExEeK0JAxGgY+Blb2bcju3O0AMZiCVmGUPwpuOTTHvlXQYsIA
 foUdupR3V
X-Google-Smtp-Source: AGHT+IF/RAT3IwHfPoJTNREYxSSMrMjlEJSFksJXdPdttaAQyHvw/bJK7g/nq3YVVLUv/LTreYAVjw==
X-Received: by 2002:a5d:59ae:0:b0:391:22e2:ccd2 with SMTP id
 ffacd0b85a97d-391296c2485mr5482638f8f.3.1741360338305; 
 Fri, 07 Mar 2025 07:12:18 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3912c104acesm5662531f8f.98.2025.03.07.07.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 07:12:17 -0800 (PST)
Message-ID: <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
Date: Fri, 7 Mar 2025 16:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, lee@kernel.org,
 ukleinek@kernel.org, alexandre.torgue@foss.st.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jic23@kernel.org, tglx@linutronix.de
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] clocksource: stm32-lptimer: add
 support for stm32mp25
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

T24gMDUvMDMvMjAyNSAxMDo0OSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IE9uIHN0bTMybXAy
NSwgRElFUiAoZm9ybWVyIElFUikgbXVzdCBvbmx5IGJlIG1vZGlmaWVkIHdoZW4gdGhlIGxwdGlt
ZXIKPiBpcyBlbmFibGVkLiBPbiBlYXJsaWVyIFNvQ3MsIGl0IG11c3QgYmUgb25seSBiZSBtb2Rp
ZmllZCB3aGVuIGl0IGlzCj4gZGlzYWJsZWQuIFJlYWQgdGhlIExQVElNX1ZFUlIgcmVnaXN0ZXIg
dG8gcHJvcGVybHkgbWFuYWdlIHRoZSBlbmFibGUKPiBzdGF0ZSwgYmVmb3JlIGFjY2Vzc2luZyBJ
RVIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2Uu
Z2FzbmllckBmb3NzLnN0LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIFYyOgo+IC0gcmVseSBvbiBm
YWxsYmFjayBjb21wYXRpYmxlIGFzIG5vIHNwZWNpZmljIC5kYXRhIGlzIGFzc29jaWF0ZWQgdG8g
dGhlCj4gICAgZHJpdmVyLiBVc2UgdmVyc2lvbiBkYXRhIGZyb20gTUZEIGNvcmUuCj4gLSBBZGRl
ZCBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVyIGFjY2VzcyB1cGRhdGUgaW4gKG1pc3NlZCBpbiBW
MSkKPiAtLS0KPiAgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1zdG0zMi1scC5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5j
Cj4gaW5kZXggYTRjOTUxNjFjYjIyLi45NmQ5NzVhZGY3YTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1zdG0zMi1scC5jCj4gQEAgLTI1LDYgKzI1LDcgQEAgc3RydWN0IHN0bTMyX2xwX3By
aXZhdGUgewo+ICAgCXN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgY2xrZXZ0Owo+ICAgCXVuc2ln
bmVkIGxvbmcgcGVyaW9kOwo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiArCWJvb2wgaWVyX3dy
X2VuYWJsZWQ7CS8qIEVuYWJsZXMgTFBUSU1FUiBiZWZvcmUgd3JpdGluZyBpbnRvIElFUiByZWdp
c3RlciAqLwo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIHN0cnVjdCBzdG0zMl9scF9wcml2YXRlKgo+
IEBAIC0zNyw4ICszOCwxNSBAQCBzdGF0aWMgaW50IHN0bTMyX2Nsa2V2ZW50X2xwX3NodXRkb3du
KHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgKmNsa2V2dCkKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3Rt
MzJfbHBfcHJpdmF0ZSAqcHJpdiA9IHRvX3ByaXYoY2xrZXZ0KTsKPiAgIAo+IC0JcmVnbWFwX3dy
aXRlKHByaXYtPnJlZywgU1RNMzJfTFBUSU1fQ1IsIDApOwo+ICsJLyogRGlzYWJsZSBMUFRJTUVS
IGVpdGhlciBiZWZvcmUgb3IgYWZ0ZXIgd3JpdGluZyBJRVIgcmVnaXN0ZXIgKGVsc2UsIGtlZXAg
aXQgZW5hYmxlZCkgKi8KPiArCWlmICghcHJpdi0+aWVyX3dyX2VuYWJsZWQpCj4gKwkJcmVnbWFw
X3dyaXRlKHByaXYtPnJlZywgU1RNMzJfTFBUSU1fQ1IsIDApOwo+ICsKPiAgIAlyZWdtYXBfd3Jp
dGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJTV9JRVIsIDApOwo+ICsKCldoeSBub3QgZW5jYXBzdWxh
dGUgdGhlIGZ1bmN0aW9uID8KCglyZWdtYXBfd3JpdGVfaWVyKHN0cnVjdCBzdG0zMl9scF9wcml2
YXRlICpwcml2LCBpbnQgdmFsdWUpCgl7CgoJCS8qIEEgY29tbWVudCAuLi4gKi8KCQlpZiAoIXBy
aXYtPmllcl93cl9lbmFibGVkKQoJCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJ
TV9DUiwgMCk7CgoJCXJlZ21hcF93cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElNX0lFUiwgdmFs
dWUpOwoKCQlpZiAoIXByaXYtPmllcl93cl9lbmFibGVkKQoJCQlyZWdtYXBfd3JpdGUocHJpdi0+
cmVnLCBTVE0zMl9MUFRJTV9DUiwgU1RNMzJfTFBUSU1fRU5BQkxFKTsKCX0KCgo+ICsJaWYgKHBy
aXYtPmllcl93cl9lbmFibGVkKQo+ICsJCXJlZ21hcF93cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQ
VElNX0NSLCAwKTsKPiArCgo+ICAgCS8qIGNsZWFyIHBlbmRpbmcgZmxhZ3MgKi8KPiAgIAlyZWdt
YXBfd3JpdGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJTV9JQ1IsIFNUTTMyX0xQVElNX0FSUk1DRik7
Cj4gICAKPiBAQCAtNTEsMTIgKzU5LDIxIEBAIHN0YXRpYyBpbnQgc3RtMzJfY2xrZXZlbnRfbHBf
c2V0X3RpbWVyKHVuc2lnbmVkIGxvbmcgZXZ0LAo+ICAgewo+ICAgCXN0cnVjdCBzdG0zMl9scF9w
cml2YXRlICpwcml2ID0gdG9fcHJpdihjbGtldnQpOwo+ICAgCj4gLQkvKiBkaXNhYmxlIExQVElN
RVIgdG8gYmUgYWJsZSB0byB3cml0ZSBpbnRvIElFUiByZWdpc3RlciovCj4gLQlyZWdtYXBfd3Jp
dGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJTV9DUiwgMCk7Cj4gKwlpZiAoIXByaXYtPmllcl93cl9l
bmFibGVkKSB7Cj4gKwkJLyogRGlzYWJsZSBMUFRJTUVSIHRvIGJlIGFibGUgdG8gd3JpdGUgaW50
byBJRVIgcmVnaXN0ZXIgKi8KPiArCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBTVE0zMl9MUFRJ
TV9DUiwgMCk7Cj4gKwl9IGVsc2Ugewo+ICsJCS8qIEVuYWJsZSBMUFRJTUVSIHRvIGJlIGFibGUg
dG8gd3JpdGUgaW50byBJRVIgcmVnaXN0ZXIgKi8KPiArCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVn
LCBTVE0zMl9MUFRJTV9DUiwgU1RNMzJfTFBUSU1fRU5BQkxFKTsKPiArCX0KPiArCj4gICAJLyog
ZW5hYmxlIEFSUiBpbnRlcnJ1cHQgKi8KPiAgIAlyZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBTVE0z
Ml9MUFRJTV9JRVIsIFNUTTMyX0xQVElNX0FSUk1JRSk7Cj4gKwo+ICAgCS8qIGVuYWJsZSBMUFRJ
TUVSIHRvIGJlIGFibGUgdG8gd3JpdGUgaW50byBBUlIgcmVnaXN0ZXIgKi8KPiAtCXJlZ21hcF93
cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElNX0NSLCBTVE0zMl9MUFRJTV9FTkFCTEUpOwo+ICsJ
aWYgKCFwcml2LT5pZXJfd3JfZW5hYmxlZCkKPiArCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnLCBT
VE0zMl9MUFRJTV9DUiwgU1RNMzJfTFBUSU1fRU5BQkxFKTsKPiArCj4gICAJLyogc2V0IG5leHQg
ZXZlbnQgY291bnRlciAqLwo+ICAgCXJlZ21hcF93cml0ZShwcml2LT5yZWcsIFNUTTMyX0xQVElN
X0FSUiwgZXZ0KTsKPiAgIAo+IEBAIC0xNTEsNiArMTY4LDcgQEAgc3RhdGljIGludCBzdG0zMl9j
bGtldmVudF9scF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCQlyZXR1
cm4gLUVOT01FTTsKPiAgIAo+ICAgCXByaXYtPnJlZyA9IGRkYXRhLT5yZWdtYXA7Cj4gKwlwcml2
LT5pZXJfd3JfZW5hYmxlZCA9IGRkYXRhLT52ZXJzaW9uID09IFNUTTMyX0xQVElNX1ZFUlJfMjM7
Cj4gICAJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRkYXRhLT5jbGspOwo+ICAgCWlmIChyZXQp
Cj4gICAJCXJldHVybiAtRUlOVkFMOwoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGlu
YXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8
aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
