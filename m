Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40641DD0D
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 17:13:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A93BC5A4CD;
	Thu, 30 Sep 2021 15:13:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85AB9C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 15:13:11 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9F46F81FEC;
 Thu, 30 Sep 2021 17:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633014791;
 bh=4n+78j9+c4MNjpI8CIXjUqArDX7g1K5iL35BABt5u6M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c9iM/svv66/9gVlCeN6ciTz7ljQ3i6Yqc422DnME00grr3LTtOT3UWOir40oLGfVf
 x8lWoESgZuxUQvFZOiv3sdMRuYSI/BvjQLKTj/IALhVyry7VDBp2DPCXQD9KpLMeVC
 6cUSRGk6xApgc3LZUMn/Z0QZU64n5Mgfk1X4xTBKVYPmWIZojRHfi9Q98FdOKG2Jg4
 PG1h975ZRLb6TJHnSpWWvon2tgyHP6yhbwwJWFuJlYz26Q8/O4Wtda12reVvTC3Q72
 FFegOB9RA1vLrs04zlyegsqAk8x6YcGNeqdQ/T97mL0N+z2BOqU4S/d2/yuBWH6xgr
 iDRoiSdMtSmyA==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20210927114553.21843-1-olivier.moysan@foss.st.com>
 <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
 <e8d40be8-045c-096a-f079-d9f6364254e9@foss.st.com>
 <cfbb8475-ad1e-9075-cd82-92a8b315efc9@denx.de>
 <9b278eb2-7ca9-0e4b-ecb1-5949ce3c5c10@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <88867104-97f5-1c5f-506a-cfcac0962e55@denx.de>
Date: Thu, 30 Sep 2021 17:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9b278eb2-7ca9-0e4b-ecb1-5949ce3c5c10@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2B
 pin muxing on stm32mp15
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

T24gOS8zMC8yMSA1OjA1IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IE9uIDkvMzAvMjEg
MTI6MjYgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA5LzMwLzIxIDEwOjQ3IEFNLCBBbGV4
YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4gSGkgTWFyZWsKPj4+Cj4+PiBPbiA5LzI5LzIxIDE6MTgg
UE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+IE9uIDkvMjcvMjEgMTo0NSBQTSwgT2xpdmllciBN
b3lzYW4gd3JvdGU6Cj4+Pj4+IEZpeCBTQUkyQiBwaW4gbXV4aW5nIGZvciBBVjk2IGJvYXJkIG9u
IFNUTTMyTVAxNS4KPj4+Pj4gVGhlIGxhYmVsICJzYWkyYS00IiBpcyBkZWZpbmVkIHR3aWNlLiBD
aGFuZ2UgcmVkdW5kYW50IGxhYmVsIHRvIAo+Pj4+PiAic2FpMmItNCIuCj4+Pj4+Cj4+Pj4+IEZp
eGVzOiBkY2YxODVjYTgxNzUgKCJBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4
IGZvciAKPj4+Pj4gU0FJMiBwaW5zIG9uIHN0bTMybXAxNSIpCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPj4+Pj4g
LS0tCj4+Pj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kgfCAy
ICstCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBp
bmN0cmwuZHRzaSAKPj4+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5k
dHNpCj4+Pj4+IGluZGV4IDViNjBlY2JkNzE4Zi4uYjljYzllMGRkNGZjIDEwMDY0NAo+Pj4+PiAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpCj4+Pj4+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4+Pj4gQEAgLTEyMzUs
NyArMTIzNSw3IEBACj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+PiDCoMKgwqDCoMKg
IH07Cj4+Pj4+IC3CoMKgwqAgc2FpMmJfcGluc19jOiBzYWkyYS00IHsKPj4+Pj4gK8KgwqDCoCBz
YWkyYl9waW5zX2M6IHNhaTJiLTQgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGluczEgewo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdG
JywgMTEsIEFGMTApPjsgLyogU0FJMl9TRF9CICovCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJpYXMtZGlzYWJsZTsKPj4+Pgo+Pj4+IFRoaXMgbXAxIHBpbm11eGluZyBpcyBhIHRv
dGFsIG1lc3MsIHNpZ2guCj4+Pgo+Pj4gV2hhdCBpcyB0aGUgaXNzdWUgaGVyZSA/Cj4+Cj4+IFRo
ZSBzYW1lLW9sZCBkaXNjdXNzaW9uIGFib3V0IHdoZXJlIHRvIHBsYWNlIHRoZSBwaW5tdXggbm9k
ZXMsIHdoZXRoZXIgCj4+IHdlIHNob3VsZCBoYXZlIHRoZXNlIGNsdXN0ZXJzIG9mIHByZS1kZWZp
bmVkIG9wdGlvbnMgaW4gCj4+IC4uLnBpbmN0cmwuZHRzaSwgb3Igd2hldGhlciB3ZSBzaG91bGQg
ZG8gbW9yZSBueHAtbGlrZSBwZXItYm9hcmQgCj4+IGNvbmZpZ3VyYXRpb24uCj4gCj4gb2sgaXQn
cyBhIGJpdCBtb3JlIHByZWNpc2UuIEhvbmVzdGx5IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhl
IGN1cnJlbnQgCj4gdG9wb2xvZ3kgaXMgYW4gaXNzdWUgaGVyZS4gTWF5YmUgcGluY3RybCBTQUkg
bm9kZXMgbmFtZXMgYXJlIG5vdCB3ZWxsIAo+IGNob3NlbiBvciBhcmUgbm90IGVub3VnaCBleHBs
aWNpdC4gQ29uY2VybmluZyBvdXIgdG9wb2xvZ3kgYW5kIHRoZSBOWFAgCj4gb25lcyBib3RoIGV4
aXN0cyBhbmQgYm90aCBoYXZlIGFkdmFudGFnZXMgYW5kIGRyYXdiYWNrcy4gRm9yIFNUIGJvYXJk
cyAKPiAoREsvRVYpIHdlIHdhbnQgdG8ga2VlcCBhbGwgY29uZmlncyBpbiB0aGUgc2FtZSBwbGFj
ZS4KPiAKPiBBcyBJIHByZWZlciB0byBub3QgcmUgb3BlbiB0aGlzIHRvcGljIGFnYWluIGFuZCBh
Z2FpbiwgZmVlbCBmcmVlIHRvIGFkZCAKPiB5b3VyIHBpbiBjb25maWcgaW4geW91ciBkdHMgYm9h
cmQgZmlsZSwgSSdsbCBhY2NlcHQgaXQuCgpZZXMsIGxldCdzIG5vdCByZW9wZW4gaXQuIEknbSBz
b3JyeSBpZiBteSBncnVtYmxpbmcgY2FtZSBhY3Jvc3MgYXMgdG9vIApzdHJvbmcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
