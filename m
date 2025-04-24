Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F14A9ACAE
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 14:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9F64C7802F;
	Thu, 24 Apr 2025 12:00:39 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01B46C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 12:00:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zjvfw6YZDz4f3lW6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 20:00:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 6F67D1A07BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 20:00:34 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP4 (Coremail) with SMTP id gCh0CgCnVlveJwpoXVW4KQ--.17342S2;
 Thu, 24 Apr 2025 20:00:32 +0800 (CST)
Message-ID: <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
Date: Thu, 24 Apr 2025 20:00:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
X-CM-TRANSID: gCh0CgCnVlveJwpoXVW4KQ--.17342S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4DtFy5WF18uFW8Wr4xXrb_yoW5CF4fpF
 WFgF95KF4kGr18Za1vv3W0qrWav34fKry5JrWrtr1rZryDK3Z7JryjgF4Y9FWfCrn7Gw1j
 vF42qayfur93ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
 14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
 XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
 4xRDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
 member size in func model
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

T24gNC8yNC8yMDI1IDM6MjQgQU0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiBIaSBBbmRyaWks
Cj4gCj4gT24gV2VkIEFwciAyMywgMjAyNSBhdCA3OjE1IFBNIENFU1QsIEFuZHJpaSBOYWtyeWlr
byB3cm90ZToKPj4gT24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMTI6MTTigK9BTSBBbGV4aXMgTG90
aG9yw6kKPj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPj4+Cj4+PiBIaSBB
bmRyaWksCj4+Pgo+Pj4gT24gV2VkIEFwciAxNiwgMjAyNSBhdCAxMToyNCBQTSBDRVNULCBBbmRy
aWkgTmFrcnlpa28gd3JvdGU6Cj4+Pj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTozMuKAr1BN
IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+Pj4+IDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPj4+IEluZGVlZCBJIGluaXRpYWxseSBj
aGVja2VkIHdoZXRoZXIgSSBjb3VsZCByZXR1cm4gZGlyZWN0bHkgc29tZSBhbGlnbm1lbnQKPj4+
IGluZm8gZnJvbSBidGYsIGJ1dCBpdCB0aGVuIGludm9sdmVzIHRoZSBhbGlnbm1lbnQgY29tcHV0
YXRpb24gaW4gdGhlIGJ0Zgo+Pj4gbW9kdWxlLiBTaW5jZSB0aGVyZSBjb3VsZCBiZSBtaW5vciBk
aWZmZXJlbmNlcyBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMgYWJvdXQKPj4+IGFsaWdubWVudCByZXF1
aXJlbWVudHMsIEkgdGhvdWdoIGl0IHdvdWxkIGJlIGJldHRlciB0byBpbiBmYWN0IGtlZXAgYWxp
Z25tZW50Cj4+PiBjb21wdXRhdGlvbiBvdXQgb2YgdGhlIGJ0ZiBtb2R1bGUuIEZvciBleGFtcGxl
LCBJIHNlZSB0aGF0IDEyOCBiaXRzIHZhbHVlcwo+Pj4gYXJlIGFsaWduZWQgb24gMTYgYnl0ZXMg
b24gQVJNNjQsIHdoaWxlIGJlaW5nIGFsaWduZWQgb24gOCBieXRlcyBvbiBTMzkwLgo+Pj4KPj4+
IEFuZCBzaW5jZSBmb3IgQVJNNjQsIGFsbCBuZWVkZWQgYWxpZ25tZW50cyBhcmUgc29tZWhvdyBk
ZXJpdmVkIGZyb20gc2l6ZQo+Pj4gKGl0IGlzIGVpdGhlciBkaXJlY3RseSBzaXplIGZvciBmdW5k
YW1lbnRhbCB0eXBlcywgb3IgYWxpZ25tZW50IG9mIHRoZQo+Pj4gbGFyZ2VzdCBtZW1iZXIgZm9y
IHN0cnVjdHMsIHdoaWNoIGlzIHRoZW4gc2l6ZSBvZiBsYXJnZXN0IG1lbWJlciksCj4+PiByZXR1
cm5pbmcgdGhlIHNpemUgc2VlbXMgdG8gYmUgZW5vdWdoIHRvIGFsbG93IHRoZSBKSVQgc2lkZSB0
byBjb21wdXRlCj4+PiBhbGlnbm1lbnRzLgo+Pgo+PiBJZiB5b3UgbWVhbiB0aGUgc2l6ZSBvZiAi
cHJpbWl0aXZlIiBmaWVsZCBhbmQvb3IgYXJyYXkgZWxlbWVudAo+PiAoYXBwbGllZCByZWN1cnNp
dmVseSBmb3IgYWxsIGVtYmVkZGVkIHN0cnVjdHMvdW5pb25zKSB0aGVuIHllcywgdGhhdCdzCj4+
IGNsb3NlIGVub3VnaC4gQnV0IHNheWluZyBqdXN0ICJsYXJnZXN0IHN0cnVjdCBtZW1iZXIiIGlz
IHdyb25nLAo+PiBiZWNhdXNlIGZvcgo+Pgo+PiBzdHJ1Y3QgYmxhaCB7Cj4+ICAgICAgc3RydWN0
IHsKPj4gICAgICAgICAgaW50IHdoYXRldmVyWzEyOF07Cj4+ICAgICAgfSBoZXlhOwo+PiB9Owo+
Pgo+Pgo+PiBibGFoLmhleWEgaGFzIGEgbGFyZ2Ugc2l6ZSwgYnV0IGFsaWdubWVudCBpcyBzdGls
bCBqdXN0IDQgYnl0ZXMuCj4gCj4gSW5kZWVkLCB0aGF0J3MgYW5vdGhlciBjYXNlIG1ha2luZyBt
eSBwcm9wb3NhbCBmYWlsIDopCj4gCj4+IEknZCBzdWdnZXN0IGxvb2tpbmcgYXQgYnRmX19hbGln
bl9vZigpIGluIGxpYmJwZiAodG9vbHMvbGliL2JwZi9idGYuYykKPj4gdG8gc2VlIGhvdyB3ZSBj
YWxjdWxhdGUgYWxpZ25tZW50IHRoZXJlLiBJdCBzZWVtcyB0byB3b3JrIGRlY2VudGx5Cj4+IGVu
b3VnaC4gSXQgd29uJ3QgY292ZXIgYW55IGFyY2gtc3BlY2lmaWMgZXh0cmEgcnVsZXMgbGlrZSBk
b3VibGUKPj4gbmVlZGluZyAxNi1ieXRlIGFsaWdubWVudCAoSSB2YWd1ZWx5IHJlbWVtYmVyIHNv
bWV0aGluZyBsaWtlIHRoYXQgZm9yCj4+IHNvbWUgYXJjaGl0ZWN0dXJlcywgYnV0IEkgbWlnaHQg
YmUgbWlzcmVtZW1iZXJpbmcpLCBvciBhbnl0aGluZwo+PiBzaW1pbGFyLiBJdCBhbHNvIHdvbid0
IGRldGVjdCAoSSBkb24ndCB0aGluayBpdCdzIHBvc3NpYmxlIHdpdGhvdXQKPj4gRFdBUkYpIGFy
dGlmaWNpYWxseSBpbmNyZWFzZWQgYWxpZ25tZW50IHdpdGggYXR0cmlidXRlKChhbGlnbmVkKE4p
KSkuCj4gCj4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciwgSSdsbCB0YWtlIGEgbG9vayBhdCBpdC4g
VGhlIG1vcmUgd2UgZGlzY3VzcyB0aGlzCj4gc2VyaWVzLCB0aGUgbGVzcyBtZW1iZXIgc2l6ZSBz
b3VuZHMgcmVsZXZhbnQgZm9yIHdoYXQgSSdtIHRyeWluZyB0byBhY2hpZXZlCj4gaGVyZS4KPiAK
PiBGb2xsb3dpbmcgWHUncyBjb21tZW50cywgSSBoYXZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgaG93
IEkgY291bGQgZGV0ZWN0IHRoZQo+IGN1c3RvbSBhbGlnbm1lbnRzIGFuZCBwYWNraW5nIG9uIHN0
cnVjdHVyZXMsIGFuZCBJIHdhcyB3b25kZXJpbmcgaWYgSSBjb3VsZAo+IHNvbWVob3cgYmVuZWZp
dCBmcm9tIF9fYXR0cmlidXRlX18gZW5jb2RpbmcgaW4gQlRGIGluZm8gKFsxXSkuIEJ1dAo+IGZv
bGxvd2luZyB5b3VyIGhpbnQsIEkgYWxzbyBzZWUgc29tZSBidGZfaXNfc3RydWN0X3BhY2tlZCgp
IGluCj4gdG9vbHMvbGliL2JwZi9idGZfZHVtcC5jIHRoYXQgY291bGQgaGVscC4gSSdsbCBkaWcg
dGhpcyBmdXJ0aGVyIGFuZCBzZWUgaWYKPiBJIGNhbiBtYW5hZ2UgdG8gbWFrZSBzb21ldGhpbmcg
d29yayB3aXRoIGFsbCBvZiB0aGlzLgo+CgpXaXRoIERXQVJGIGluZm8sIHdlIG1pZ2h0IG5vdCBu
ZWVkIHRvIGRldGVjdCB0aGUgc3RydWN0dXJlIGFsaWdubWVudCBhbnltb3JlLApzaW5jZSB0aGUg
RFdfQVRfbG9jYXRpb24gYXR0cmlidXRlIHRlbGxzIHVzIHdoZXJlIHRoZSBzdHJ1Y3R1cmUgcGFy
YW1ldGVyIGlzCmxvY2F0ZWQgb24gdGhlIHN0YWNrLCBhbmQgRFdfQVRfYnl0ZV9zaXplIGdpdmVz
IHVzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUuCgo+IFRoYW5rcywKPiAKPiBBbGV4aXMKPiAK
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjUwMTMwMjAxMjM5LjE0Mjk2NDgt
MS1paG9yLnNvbG9kcmFpQGxpbnV4LmRldi8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
