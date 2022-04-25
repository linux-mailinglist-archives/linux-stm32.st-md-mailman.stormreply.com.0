Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E950EB6A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 00:07:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 787B6C60462;
	Mon, 25 Apr 2022 22:07:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D29DC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 22:07:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6C6E6806B7;
 Tue, 26 Apr 2022 00:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650924434;
 bh=3xdUpz0rxOpaFXzw5F0nSyIQaIXNBm7+paVzz99k0qk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=QH0u//pMrhzlghzFLFFQUSLoTUPjS9kwA5AOm14Y6mj84GUj+/pSvTa6HAUNWMH3i
 E6OyUUUl0+Jx7TdyYh9IKkBf9OUbzYQhewlQ9zikp5CZqQq+JivK4CkZfk4F/THr9b
 jgLdExXdNzLJvAQM4tGKstaAklhCJdUtZHn2IAkyAjo4qvnM0rFYVCyqkwk0V6qw21
 dQc6ITPuRK/dWI+cT2jIVWVQNXV8UY6DpNxKartwFKkJnxVLopj/Zl1OvlKcQfhKId
 hc2pW/tTqN7EmA2FL8zIdUS/2s3+2hsEk6W/HtsQSgumfP2drMM/INNDvp6UiMgNkS
 aqMqT/0qvR4Hw==
Message-ID: <580a2c04-67ca-17f3-54ec-5b07ca46c254@denx.de>
Date: Tue, 26 Apr 2022 00:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
 <c48500cd-50be-1d70-2f2c-02c2dcede1eb@denx.de>
 <442677d2-7e9f-14f0-4b5a-1f98a8f40c8a@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <442677d2-7e9f-14f0-4b5a-1f98a8f40c8a@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: improve bank clocks
	management
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

T24gNC8yNS8yMiAxMToyNywgRmFiaWVuIERFU1NFTk5FIHdyb3RlOgo+IEhpIE1hcmVrCj4gCj4g
Cj4gT24gMjIvMDQvMjAyMiAxODoyNiwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMjIvMjIg
MTY6MzYsIEZhYmllbiBEZXNzZW5uZSB3cm90ZToKPj4+IEluc3RlYWQgb2YgZW5hYmxpbmcvZGlz
YWJsaW5nIHRoZSBjbG9jayBhdCBlYWNoIElPIGNvbmZpZ3VyYXRpb24gdXBkYXRlLAo+Pj4ganVz
dCBrZWVwIHRoZSBjbG9jayBlbmFibGVkIGZyb20gdGhlIHByb2JlLgo+Pj4gVGhpcyBtYWtlcyB0
aGluZ3Mgc2ltcGxlciBhbmQgbW9yZSBlZmZpY2llbnQgKGUuZy4gdGhlIHRpbWUgcmVxdWlyZWQg
dG8KPj4+IHRvZ2dsZSBhbiBvdXRwdXQgSU8gaXMgZHJhc3RpY2FsbHkgZGVjcmVhc2VkKSB3aXRo
b3V0IHNpZ25pZmljYW50bHkKPj4+IGluY3JlYXNpbmcgdGhlIHBvd2VyIGNvbnN1bXB0aW9uLgo+
Pgo+PiBbLi4uXQo+Pgo+Pj4gwqAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICpzdG0zMl9wY3Ry
bF9nZXRfaXJxX2RvbWFpbihzdHJ1Y3QgCj4+PiBkZXZpY2Vfbm9kZSAqbnApCj4+PiBAQCAtMTU3
NSw2ICsxNTM3LDEwIEBAIGludCBzdG0zMl9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgCj4+PiAqcGRldikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHN0bTMy
X2dwaW9saWJfcmVnaXN0ZXJfYmFuayhwY3RsLCBjaGlsZCk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG9mX25vZGVfcHV0KGNoaWxkKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHBjdGwtPm5iYW5rczsgaSsrKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwY3Rs
LT5iYW5rc1tpXS5jbGspOwo+Pj4gKwo+Pgo+PiBUaGVyZSBhcmUgY2xrX2J1bGtfKigpIGZ1bmN0
aW9ucywgbWF5YmUgeW91IGNhbiB1c2UgdGhvc2UgdG8gZ2V0IHJpZCAKPj4gb2YgdGhlc2UgbG9v
cHMgPwo+IAo+IFRoaXMgc291bmRzIGdvb2RzLCBidXQgY2hlY2tpbmcgbW9yZSBpbiBkZXRhaWxz
IEkgc2VlIHRoYXQgbW92aW5nIHRvIHRoZSAKPiAnYnVsaycgaW1wbGVtZW50YXRpb24gd291bGQg
cmVxdWlyZSB0byBtb3ZlIHRoZSBjbGsgaW5mb3JtYXRpb24gZnJvbSB0aGUgCj4gInN0cnVjdCBz
dG0zMl9ncGlvX2JhbmsgKmJhbmtzIiBtZW1iZXIgdG8gaXRzIHBhcmVudCAic3RydWN0IAo+IHN0
bTMyX3BpbmN0cmwiLgo+IAo+IFRoaXMgd291bGQgbWFrZSB0aGUgY2xrIGRldmljZSBpbmZvcm1h
dGlvbiBzdG9yZWQgaW4gYSBkaWZmZXJlbnQgCj4gc3RydWN0dXJlIGZyb20gdGhlIG90aGVyIGRl
dmljZS1yZWxhdGVkIGluZm9ybWF0aW9uIChiYXNlIGFkZHJlc3MsIHJlc2V0IAo+IGNvbnRyb2ws
IC4uLikuIEl0J3MgYmV0dGVyIHRvIGtlZXAgYWxsIHRob3NlIGluZm9ybWF0aW9uIHRvZ2V0aGVy
IGluIHRoZSAKPiBzYW1lIHN0cnVjdC4KPiAKPiBBcyBhbm90aGVyIGRyYXdiYWNrIHdlIHdvdWxk
IGxvb3NlIGFjY2VzcyB0byAnY2xrJyBmcm9tIGFueSBmdW5jdGlvbiAKPiB0aGF0IGhhdmUgJ2Jh
bmsnIChvciAnc3RydWN0IGdwaW9fY2hpcCAqY2hpcCcpIGFzIGlucHV0IHBhcmFtZXRlciAoZS5n
LiAKPiBzdG0zMl9ncGlvX2dldCgpIGNhbGxlZCBmcm9tIGdwaW9saWIpLgo+IAo+IFNvIEkgcmVh
bGx5IHByZWZlciB0byBrZWVwIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLgoKQWxsIHJpZ2h0
LCBJIGFncmVlLgoKPj4gVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
