Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604250DDD5
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 12:26:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F7E0C5F1F2;
	Mon, 25 Apr 2022 10:26:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16AC3C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 10:25:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6C5E1810FC;
 Mon, 25 Apr 2022 12:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650882357;
 bh=gXw9wbk3lFJ9g4L4B5F3yY9pXLjcZ/owkMTe5ZZCa0o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dgMcUi0GQt8nE0WH0AGCxbOzQ2uuSYSHeELx4TvjT+IWv+1SU9KXo9B/pdVY0lH/J
 1+oi3EOMyMQhPRjB35uJRr2ir3prdwPQY3RKpr4lhNNlnQ7OZdpCUvucwWAFJSGvKy
 aDz1l0nTTYM873Qck3SFEruHonUDYnwHioshjwVVL5cAgw+3G7vFXItRGK+fT8zx4F
 5qklaoVmnu0qg5WcSJ2a1vqCxZofuxxcHkXRoCic37VlLg5/HIbdFKe+dxikxfmiLa
 kQUBY70C8jE7IcQxuPe3Jfv+D+AQUWGxLq7pZjWlwJrVoc2xwCMt4ZxVKBpCOnwxJP
 bawPT+pWtWsUw==
Message-ID: <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
Date: Mon, 25 Apr 2022 12:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Etienne CARRIERE <etienne.carriere@st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, "soc@kernel.org" <soc@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-7-alexandre.torgue@foss.st.com>
 <174bea56-3e99-e01c-4133-f1350d34448d@denx.de>
 <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP15
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

T24gNC8yNS8yMiAxMjoxOSwgRXRpZW5uZSBDQVJSSUVSRSB3cm90ZToKPiBIZWxsbyBNYXJlaywK
CkhpLAoKPj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Cj4+PiBPbiA0LzIy
LzIyIDE3OjA5LCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+Pj4gRW5hYmxlIG9wdGVlIGFuZCBT
Q01JIGNsb2Nrcy9yZXNldCBwcm90b2NvbHMgc3VwcG9ydC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kKPj4+IGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpCj4+PiBpbmRleCA3ZmRjMzI0YjNjZjkuLjFi
MmZkMzQyNmE4MSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEu
ZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpCj4+PiBAQCAt
MTE1LDYgKzExNSwzMyBAQAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+Pj4gIMKgwqDCoMKgwqDCoMKgIH07Cj4+PiAgICAgCj4+PiArwqDC
oMKgwqAgZmlybXdhcmUgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHRlZTogb3B0
ZWUgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJsaW5hcm8sb3B0ZWUtdHoiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWV0aG9kID0gInNtYyI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+Pgo+PiBEb2Vzbid0IHRoaXMgVEVFIG5vZGUgZ2V0IGF1dG9tYXRp
Y2FsbHkgZ2VuZXJhdGVkIGFuZCBwYXRjaGVkIGludG8gRFQgYnkKPj4gdGhlIFRFRSA/IEkgdGhp
bmsgT3BUZWUtT1MgZG9lcyB0aGF0Lgo+IAo+IE9QLVRFRSBPUyBkb2VzIHRoYXQgaWYgaXQgZ2V0
cyBwYXNzZWQgdGhlIERUIGZyb20gZWFybHkgYm9vdCBzdGFnZSB3aGljaCBpcyBub3QgYWx3YXlz
IHRoZSBjYXNlLgoKU2hvdWxkbid0IHRoYXQgYmUgc29tZXRoaW5nIHRvIGZpeCA/CgpJIHRoaW5r
IFItQ2FyMyBkb2VzIHRoYXQgYWxyZWFkeS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
