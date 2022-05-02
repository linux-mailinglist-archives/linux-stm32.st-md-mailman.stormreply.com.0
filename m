Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52458516EA3
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 13:14:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6AE2C628AB;
	Mon,  2 May 2022 11:14:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D06C628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 11:14:01 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 772BA83D07;
 Mon,  2 May 2022 13:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651490041;
 bh=GYeUZKMtocbMmxb4L7AIL1pIKQna8kVZpFNC+YLY+e4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m/4RKntesSV7zzPBjofMnDfi3iQJbggoKREF7VeiBeDO9QIhomoWCSY1nApegAHer
 pgUBUE00mPByxE8ZXhslInwPd4KtoasjqWHSNYOl3YGCGN8b2mKbo351NinKUNmOar
 POXESDTBRwhdBbE3gx2qR6j/hrWNVEDq/z29pbOiOvuIy8G24moufAqnPK+GHc/2AY
 IFcYFnbW9Z6/DKewFm8+yq74BMD4Y0xjccUCxdLWhj9zNdit1fr/w6A0Bw1cLVfIBn
 FrTvcbDL3ep9SUkNPA8iyq1u1s1mNhh0PQVVoStG4agccgrB7Alepy7AJBRaL8rah/
 qLTV6nWIVzvlA==
Message-ID: <18f886d9-924b-e32b-e298-90e998b30662@denx.de>
Date: Mon, 2 May 2022 13:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Erwan LE RAY <erwan.leray@foss.st.com>, linux-serial@vger.kernel.org
References: <20220430162845.244655-1-marex@denx.de>
 <20220430162845.244655-2-marex@denx.de>
 <702dcede-ff97-b074-20bf-7c695f988d40@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <702dcede-ff97-b074-20bf-7c695f988d40@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] serial: stm32: Use TC interrupt to
 deassert GPIO RTS in RS485 mode
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

T24gNS8yLzIyIDEwOjQ0LCBFcndhbiBMRSBSQVkgd3JvdGU6Cj4gSGkgTWFyZWssCgpIaSwKCj4g
T24gNC8zMC8yMiAxODoyOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IEluIGNhc2UgdGhlIFJTNDg1
IG1vZGUgaXMgZW11bGF0ZWQgdXNpbmcgR1BJTyBSVFMsIHVzZSB0aGUgVEMgaW50ZXJydXB0Cj4+
IHRvIGRlYXNzZXJ0IHRoZSBHUElPIFJUUywgb3RoZXJ3aXNlIHRoZSBHUElPIFJUUyBzdGF5cyBh
c3NlcnRlZCBhZnRlciBhCj4+IHRyYW5zbWlzc2lvbiBlbmRlZCBhbmQgdGhlIFJTNDg1IGNhbm5v
dCB3b3JrLgo+Pgo+IENvdWxkIHlvdSBwbGVhc2UgYWRkIGEgY292ZXIgbGV0dGVyIHRvIGV4cGxh
aW4gdGhlIHJhdGlvbmFsIG9mIHRoZSBmaXJzdCAKPiBwYXRjaCA/IEkgdW5kZXJzdG9vZCB0aGUg
Z29hbCBvZiB0aGUgZmlyc3QgYnkgcmVhZGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgCj4gb2YgdGhp
cyBzZWNvbmQgcGF0Y2guCgpUaGUgcmF0aW9uYWxlIGlzIHRyaXZpYWwgLS0gbWFrZSBzdXJlIHdl
IGRvbid0IGhhdmUgZml2ZSBjb3BpZXMgb2YgdGhlIApzYW1lIGJsb2NrIG9mIGNvZGUgaW4gdGhl
IGRyaXZlci4KCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQu
YyAKPj4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwo+PiBpbmRleCAyMjRmMzU5
YzYwNTFlLi43NjQ0MTViOGU4ZjAzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYwo+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwo+
PiBAQCAtNDE3LDYgKzQxNywxNCBAQCBzdGF0aWMgdm9pZCAKPj4gc3RtMzJfdXNhcnRfdHhfaW50
ZXJydXB0X2VuYWJsZShzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RtMzJfdXNhcnRfc2V0X2JpdHMocG9ydCwgb2ZzLT5jcjEsIFVTQVJUX0NSMV9UWEVJRSk7
Cj4+IMKgIH0KPj4gK3N0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3RjX2ludGVycnVwdF9lbmFibGUo
c3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtMzJfcG9y
dCAqc3RtMzJfcG9ydCA9IHRvX3N0bTMyX3BvcnQocG9ydCk7Cj4+ICvCoMKgwqAgY29uc3Qgc3Ry
dWN0IHN0bTMyX3VzYXJ0X29mZnNldHMgKm9mcyA9ICZzdG0zMl9wb3J0LT5pbmZvLT5vZnM7Cj4+
ICsKPj4gK8KgwqDCoCBzdG0zMl91c2FydF9zZXRfYml0cyhwb3J0LCBvZnMtPmNyMSwgVVNBUlRf
Q1IxX1RDSUUpOwo+PiArfQo+PiArCj4gSSBkb24ndCBzZWUgdGhlIGFkZGVkIHZhbHVlIG9mIHRo
aXMgaGVscGVyIChvbmx5IDEgaW5zdHJ1Y3Rpb24gdXNlZCAxIAo+IHRpbWUpLCBhbmQgb3RoZXIg
SW50ZXJydXB0IEVuYWJsZWQgYml0cyBhcmUgYWxyZWFkeSBzZXQvdW5zZXQgaW4gb3RoZXJzIAo+
IGZ1bmN0aW9ucyBvZiB0aGlzIGRyaXZlci4KPiBUbyBrZWVwIGFuIGhvbW9nZW5lb3VzIGNvZGUg
aW4gdGhlIGRyaXZlciwgY291bGQgeW91IHBsZWFzZSByZW1vdmUgdGhpcyAKPiBoZWxwZXIgYW5k
IHNldCBUQ0lFIGRpcmVjdGx5IHdoZW4geW91IG5lZWQgaXQgPwoKU2hvdWxkIEkgYWxzbyByZW1v
dmUgc3RtMzJfdXNhcnRfdHhfaW50ZXJydXB0X2VuYWJsZSgpIC8gCnN0bTMyX3VzYXJ0X3R4X2lu
dGVycnVwdF9kaXNhYmxlKCkgLCB3aGljaCBkb2VzIHRoZSBzYW1lIHRoaW5nIGZvciBvdGhlciAK
Yml0cyBpbiB0aGUgaW50ZXJydXB0IHJlZ2lzdGVyID8KClRoYXQgc291bmRzIHRvIG1lIGxpa2Ug
bWFraW5nIHRoZSBjb2RlIGhhcmRlciB0byByZWFkLCBub3QgZWFzaWVyLgoKWy4uLl0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
