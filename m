Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB199B01121
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 04:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77F74C32E8F;
	Fri, 11 Jul 2025 02:14:38 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBA7EC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 02:14:36 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bdZtX72Whz2Cdk8;
 Fri, 11 Jul 2025 10:10:28 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id 90F0A140278;
 Fri, 11 Jul 2025 10:14:33 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Jul
 2025 10:14:32 +0800
Message-ID: <3654a091-053a-4330-a019-a681d06166be@huawei.com>
Date: Fri, 11 Jul 2025 10:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <aGaCTOJ30KNPOBIC@zx2c4.com>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <aGaCTOJ30KNPOBIC@zx2c4.com>
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100007.china.huawei.com (7.202.181.92)
Cc: linux-arm-kernel@lists.infradead.org, Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 GONG Ruiqi <gongruiqi1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lu Jialin <lujialin4@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ignat Korchagin <ignat@cloudflare.com>, David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH RFC 0/4] Reintroduce the sm2 algorithm
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

SGksCgpPbiA3LzMvMjAyNSA5OjE0IFBNLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gSGks
Cj4gCj4gT24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgMDk6Mzk6MzBQTSArMDgwMCwgR3UgQm93ZW4g
d3JvdGU6Cj4+IFRvIHJlaW50cm9kdWNlIHRoZSBzbTIgYWxnb3JpdGhtLCB0aGUgcGF0Y2ggc2V0
IGRpZCB0aGUgZm9sbG93aW5nOgo+PiAgIC0gUmVpbnRyb2R1Y2UgdGhlIG1waSBsaWJyYXJ5IGJh
c2VkIG9uIGxpYmdjcnlwdC4KPj4gICAtIFJlaW50cm9kdWNlIGVjIGltcGxlbWVudGF0aW9uIHRv
IE1QSSBsaWJyYXJ5Lgo+PiAgIC0gUmV3b3JrIHNtMiBhbGdvcml0aG0uCj4+ICAgLSBTdXBwb3J0
IHZlcmlmaWNhdGlvbiBvZiBYLjUwOSBjZXJ0aWZpY2F0ZXMuCj4+Cj4+IEd1IEJvd2VuICg0KToK
Pj4gICAgUmV2ZXJ0ICJSZXZlcnQgImxpYi9tcGk6IEV4dGVuZCB0aGUgTVBJIGxpYnJhcnkiIgo+
PiAgICBSZXZlcnQgIlJldmVydCAibGliL21waTogSW50cm9kdWNlIGVjIGltcGxlbWVudGF0aW9u
IHRvIE1QSSBsaWJyYXJ5IiIKPj4gICAgY3J5cHRvL3NtMjogUmV3b3JrIHNtMiBhbGcgd2l0aCBz
aWdfYWxnIGJhY2tlbmQKPj4gICAgY3J5cHRvL3NtMjogc3VwcG9ydCBTTTItd2l0aC1TTTMgdmVy
aWZpY2F0aW9uIG9mIFguNTA5IGNlcnRpZmljYXRlcwo+IAo+IEkgYW0gbGVzcyB0aGFuIGVudGh1
c2lhc3RpYyBhYm91dCB0aGlzLiBGaXJzdGx5LCBJJ20ga2luZCBvZiBiaWFzZWQKPiBhZ2FpbnN0
IHRoZSB3aG9sZSAibmF0aW9uYWwgZmxhZyBhbGdvcml0aG1zIiB0aGluZy4gQnV0IEkgZG9uJ3Qg
a25vdyBob3cKPiBtdWNoIHdlaWdodCB0aGF0IGFyZ3VtZW50IHdpbGwgaGF2ZSBoZXJlLiBNb3Jl
IGltcG9ydGFudGx5LCBob3dldmVyLAo+IGltcGxlbWVudGluZyB0aGlzIGF0b3AgTVBJIHNvdW5k
cyB2ZXJ5IGJhZC4gVGhlIG1vcmUgTVBJIHdlIGNhbiBnZXQgcmlkCj4gb2YsIHRoZSBiZXR0ZXIu
Cj4gCj4gSXMgTVBJIGNvbnN0YW50IHRpbWU/IFVzdWFsbHkgdGhlIGdvb2Qgd2F5IHRvIGltcGxl
bWVudCBFQyBhbGdvcml0aG1zCj4gbGlrZSB0aGlzIGlzIHRvIHZlcnkgY2FyZWZ1bGx5IHdvcmsg
b3V0IGNvbnN0YW50IHRpbWUgKGFuZCBmYXN0ISkgZmllbGQKPiBhcml0aG1ldGljIHJvdXRpbmVz
LCB2ZXJpZnkgdGhlaXIgY29ycmVjdG5lc3MsIGFuZCB0aGVuIGltcGxlbWVudCB5b3VyCj4gRUND
IGF0b3AgdGhhdC4gQXQgdGhpcyBwb2ludCwgdGhlcmUncyAqbG90cyogb2Ygd29yayBvdXQgdGhl
cmUgb24gZG9pbmcKPiBmYXN0IHZlcmlmaWVkIEVDQyBhbmQgYSBidW5jaCBvZiBkaWZmZXJlbnQg
ZnJhbWV3b3JrcyBmb3IgcHJvZHVjaW5nIGdvb2QKPiBpbXBsZW1lbnRhdGlvbnMuIFRoZXJlIGFy
ZSBhbHNvIG90aGVyIGltcGxlbWVudGF0aW9ucyBvdXQgdGhlcmUgeW91Cj4gY291bGQgbG9vayBh
dCB0aGF0IHBlb3BsZSBoYXZlIHByZXN1bWFibHkgc3R1ZGllZCBhIGxvdC4gVGhpcyBpcyBvbGQK
PiBuZXdzLiAoSW4gMyBtaW51dGVzIG9mIHNjcm9sbGluZyBhcm91bmQsIEkgbm90aWNlZCB0aGF0
Cj4gY291bnRfbGVhZGluZ196ZXJvcygpIG9uIGEgdmFsdWUgaXMgdXNlZCBhcyBhIGxvb3AgaW5k
ZXgsIGZvciBleGFtcGxlLgo+IE1heWJlIGZpbmUsIG1heWJlIG5vdCwgSSBkdW5ubzsgdGhpcyBz
dHVmZiByZXF1aXJlcyBhbmFseXNpcy4pCgpBY3R1YWxseSwgSSB3YXNuJ3QgdmVyeSBmYW1pbGlh
ciB3aXRoIE1QSSBpbiB0aGUgcGFzdC4gUHJldmlvdXNseSwgdGhlIAppbXBsZW1lbnRhdGlvbiBv
ZiBzbTIgd2FzIGRvbmUgdGhyb3VnaCBNUEksIHNvIEkgdXNlZCBpdCBhcyB3ZWxsLiAKUGVyaGFw
cyBJIGNvdWxkIHRyeSB1c2luZyB0aGUgZWNjIGFsZ29yaXRobSBpbiB0aGUga2VybmVsLgoKPiBP
biB0aGUgb3RoZXIgaGFuZCwgbWF5YmUgeW91IGRvbid0IGNhcmUgYmVjYXVzZSB5b3Ugb25seSBp
bXBsZW1lbnQKPiB2ZXJpZmljYXRpb24sIG5vdCBzaWduaW5nLCBzbyBhbGwgaW5mbyBpcyBwdWJs
aWM/IElmIHNvLCB0aGUgZmFjdCB0aGF0Cj4geW91IGRvbid0IGNhcmUgYWJvdXQgQ1Qgc2hvdWxk
IHByb2JhYmx5IGJlIG1hZGUgcHJldHR5IHZpc2libGUuIEJ1dAo+IGVpdGhlciB3YXksIHlvdSBz
aG91bGQgc3RpbGwgYmUgY29uY2VybmVkIHdpdGggaGF2aW5nIGFuIGFjdHVhbGx5IGdvb2QgJgo+
IGNvcnJlY3QgaW1wbGVtZW50YXRpb24gb2Ygd2hpY2ggeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQg
dGhlIGNvcnJlY3RuZXNzLgo+IAo+IFNlY29uZGx5LCB0aGUgTVBJIHN0dWZmIHlvdSdyZSBwcm9w
b3NpbmcgaGVyZSBhZGRzIGEgMjU1MTkgYW5kIDQ0OAo+IGltcGxlbWVudGF0aW9uLCBhbmQgc3Vw
cG9ydCBmb3Igd2VpZXJzdHJhdXNzLCBtb250Z29tZXJ5LCBhbmQgZWR3YXJkcywKPiBhbmQuLi4g
c3VyZWx5IHlvdSBkb24ndCBuZWVkIGFsbCBvZiB0aGlzIGZvciBTTS0yLiBXaHkgYWRkIGFsbCB0
aGlzCj4gdW51c2VkIGNvZGU/IFByZXN1bWFibHkgYmVjYXVzZSB5b3UgZG9uJ3QgcmVhbGx5IHVu
ZGVyc3RhbmQgb3IgIm93biIgYWxsCj4gb2YgdGhlIGNvZGUgdGhhdCB5b3UncmUgcHJvcG9zaW5n
IHRvIGFkZC4gQW5kIHRoYXQgZ2l2ZXMgbWUgYSBsb3Qgb2YKPiBoZXNpdGF0aW9uLCBiZWNhdXNl
IHNvbWVib2R5IGlzIGdvaW5nIHRvIGhhdmUgdG8gbWFpbnRhaW4gdGhpcywgYW5kIGlmCj4gdGhl
IHBlcnNvbiBzZW5kaW5nIHBhdGNoZXMgd2l0aCBpdCBpc24ndCBmdWxseSBvbiB0b3Agb2YgaXQs
IHdlJ3JlIG5vdAo+IG9mZiB0byBhIGdvb2Qgc3RhcnQuCj4gCj4gTGFzdGx5LCBqdXN0IHRvIG5p
cCBpbiB0aGUgYnVkIHRoZSBhcmd1bWVudCwgImJ1dCB3ZWllcnN0cmF1c3MgaXMgYWxsCj4gdGhl
IHNhbWUsIHNvIHdoeSBub3QganVzdCBoYXZlIG9uZSBsaWJyYXJ5IHRvIGRvIGFsbCBwb3NzaWJs
ZQo+IHdlaWVyc3RyYXVzcyBjdXJ2ZXM/IiAtLSB0aGUgZmFjdCB0aGF0IHRoaXMgc2VyaWVzIHJl
aW50cm9kdWNlcyB0aGUKPiByZW1vdmVkICJnZW5lcmljIEVDIGxpYnJhcnkiIGluZGljYXRlcyB0
aGVyZSdzIGFjdHVhbGx5IG5vdCBhbm90aGVyIHVzZXIKPiBvZiBpdCwgZXZlbiBiZWZvcmUgd2Ug
Z2V0IGludG8gcXVlc3Rpb25zIG9mIHdoZXRoZXIgaXQncyBhIGdvb2QgaWRlYS4KClRoYW5rIHlv
dSBmb3IgeW91ciBhZHZpY2UsIGl0IGhhcyBiZWVuIHZlcnkgYmVuZWZpY2lhbCBmb3IgbWUgYXMg
SSBqdXN0IApzdGFydGVkIHBhcnRpY2lwYXRpbmcgaW4gdGhlIGNvbW11bml0eS4gSSB3aWxsIHRy
eSB0byBpbXBsZW1lbnQgdGhlIApmdW5jdGlvbmFsaXR5IHdpdGggbW9yZSByb2J1c3QgY29kZSBh
bmQgb25seSBzdWJtaXQgcGFydHMgdGhhdCBJIGZ1bGx5IAp1bmRlcnN0YW5kLgoKQmVzdCBSZWdh
cmRz77yMCkd1YmVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
