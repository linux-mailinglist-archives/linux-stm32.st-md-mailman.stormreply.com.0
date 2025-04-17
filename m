Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED541A95F53
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78B44C78F9A;
	Tue, 22 Apr 2025 07:27:03 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D73FCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 14:10:12 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zdfsg1q9mz4f3m6g
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 22:09:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
 by mail.maildlp.com (Postfix) with ESMTP id 84A6A1A06DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 22:10:08 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP2 (Coremail) with SMTP id Syh0CgDHhGe+CwFowTzCJg--.63259S2;
 Thu, 17 Apr 2025 22:10:08 +0800 (CST)
Message-ID: <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
Date: Thu, 17 Apr 2025 22:10:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
Content-Language: en-US
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
X-CM-TRANSID: Syh0CgDHhGe+CwFowTzCJg--.63259S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr18Kw48WrWftF1kJF47urg_yoWrGw4fpF
 ZYg3Z8tF4kJr4xua1qy3yUZrWSq34rCryUCry3tw17tFWDGF1kKFW7KF45ury5Gr1kG342
 vF42qF45Aa43ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Mailman-Approved-At: Tue, 22 Apr 2025 07:27:00 +0000
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

T24gNC8xNy8yMDI1IDM6MTQgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiBIaSBBbmRyaWks
Cj4gCj4gT24gV2VkIEFwciAxNiwgMjAyNSBhdCAxMToyNCBQTSBDRVNULCBBbmRyaWkgTmFrcnlp
a28gd3JvdGU6Cj4+IE9uIEZyaSwgQXByIDExLCAyMDI1IGF0IDE6MzLigK9QTSBBbGV4aXMgTG90
aG9yw6kgKGVCUEYgRm91bmRhdGlvbikKPj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3
cm90ZToKPj4+Cj4+PiBJbiBvcmRlciB0byBwcm9wZXJseSBKSVQgdGhlIHRyYW1wb2xpbmVzIG5l
ZWRlZCB0byBhdHRhY2ggQlBGIHByb2dyYW1zCj4+PiB0byBmdW5jdGlvbnMsIHNvbWUgYXJjaGl0
ZWN0dXJlcyBsaWtlIEFSTTY0IG5lZWQgdG8ga25vdyBhYm91dCB0aGUKPj4+IGFsaWdubWVudCBu
ZWVkZWQgZm9yIHRoZSBmdW5jdGlvbiBhcmd1bWVudHMuIFN1Y2ggYWxpZ25tZW50IGNhbgo+Pj4g
Z2VuZXJhbGx5IGJlIGRlZHVjZWQgZnJvbSB0aGUgYXJndW1lbnQgc2l6ZSwgYnV0IHRoYXQncyBu
b3QgY29tcGxldGVseQo+Pj4gdHJ1ZSBmb3IgY29tcG9zaXRlIHR5cGVzLiBJbiB0aGUgc3BlY2lm
aWMgY2FzZSBvZiBBUk02NCwgdGhlIEFBUENTNjQgQUJJCj4+PiBkZWZpbmVzIHRoYXQgYSBjb21w
b3NpdGUgdHlwZSB3aGljaCBuZWVkcyB0byBiZSBwYXNzZWQgdGhyb3VnaCBzdGFjawo+Pj4gbXVz
dCBiZSBhbGlnbmVkIG9uIHRoZSBtYXhpbXVtIGJldHdlZW4gOCBhbmQgdGhlIGxhcmdlc3QgYWxp
Z25tZW50Cj4+PiBjb25zdHJhaW50IG9mIGl0cyBmaXJzdC1sZXZlbCBtZW1iZXJzLiBTbyB0aGUg
SklUIGNvbXBpbGVyIG5lZWRzIG1vcmUKPj4+IGluZm9ybWF0aW9uIGFib3V0IHRoZSBhcmd1bWVu
dHMgdG8gbWFrZSBzdXJlIHRvIGdlbmVyYXRlIGNvZGUgdGhhdAo+Pj4gcmVzcGVjdHMgdGhvc2Ug
YWxpZ25tZW50IGNvbnN0cmFpbnRzLgo+Pj4KPj4+IEZvciBzdHJ1Y3QgYXJndW1lbnRzLCBhZGQg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIHNpemUgb2YgdGhlIGxhcmdlc3QKPj4+IGZpcnN0LWxldmVs
IG1lbWJlciBpbiB0aGUgc3RydWN0IGJ0Zl9mdW5jX21vZGVsIHRvIGFsbG93IHRoZSBKSVQKPj4+
IGNvbXBpbGVyIHRvIGd1ZXNzIHRoZSBuZWVkZWQgYWxpZ25tZW50LiBUaGUgaW5mb3JtYXRpb24g
aXMgcXVpdGUKPj4KPj4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGhvdyBjYW4g
dGhlICpzaXplKiBvZiB0aGUgZmllbGQgYmUKPj4gdXNlZCB0byBjYWxjdWxhdGUgdGhhdCBhcmd1
bWVudCdzICphbGlnbm1lbnQqPyBpLmUuLCBJIGRvbid0Cj4+IHVuZGVyc3RhbmQgd2h5IGFyZ19s
YXJnZXN0X21lbWJlcl9zaXplIG5lZWRzIHRvIGJlIGNhbGN1bGF0ZWQgaW5zdGVhZAo+PiBvZiBh
cmdfbGFyZ2VzdF9tZW1iZXJfYWxpZ25tZW50Li4uCj4gCj4gSW5kZWVkIEkgaW5pdGlhbGx5IGNo
ZWNrZWQgd2hldGhlciBJIGNvdWxkIHJldHVybiBkaXJlY3RseSBzb21lIGFsaWdubWVudAo+IGlu
Zm8gZnJvbSBidGYsIGJ1dCBpdCB0aGVuIGludm9sdmVzIHRoZSBhbGlnbm1lbnQgY29tcHV0YXRp
b24gaW4gdGhlIGJ0Zgo+IG1vZHVsZS4gU2luY2UgdGhlcmUgY291bGQgYmUgbWlub3IgZGlmZmVy
ZW5jZXMgYmV0d2VlbiBhcmNoaXRlY3R1cmVzIGFib3V0Cj4gYWxpZ25tZW50IHJlcXVpcmVtZW50
cywgSSB0aG91Z2ggaXQgd291bGQgYmUgYmV0dGVyIHRvIGluIGZhY3Qga2VlcCBhbGlnbm1lbnQK
PiBjb21wdXRhdGlvbiBvdXQgb2YgdGhlIGJ0ZiBtb2R1bGUuIEZvciBleGFtcGxlLCBJIHNlZSB0
aGF0IDEyOCBiaXRzIHZhbHVlcwo+IGFyZSBhbGlnbmVkIG9uIDE2IGJ5dGVzIG9uIEFSTTY0LCB3
aGlsZSBiZWluZyBhbGlnbmVkIG9uIDggYnl0ZXMgb24gUzM5MC4KPiAKPiBBbmQgc2luY2UgZm9y
IEFSTTY0LCBhbGwgbmVlZGVkIGFsaWdubWVudHMgYXJlIHNvbWVob3cgZGVyaXZlZCBmcm9tIHNp
emUKPiAoaXQgaXMgZWl0aGVyIGRpcmVjdGx5IHNpemUgZm9yIGZ1bmRhbWVudGFsIHR5cGVzLCBv
ciBhbGlnbm1lbnQgb2YgdGhlCj4gbGFyZ2VzdCBtZW1iZXIgZm9yIHN0cnVjdHMsIHdoaWNoIGlz
IHRoZW4gc2l6ZSBvZiBsYXJnZXN0IG1lbWJlciksCj4gcmV0dXJuaW5nIHRoZSBzaXplIHNlZW1z
IHRvIGJlIGVub3VnaCB0byBhbGxvdyB0aGUgSklUIHNpZGUgdG8gY29tcHV0ZQo+IGFsaWdubWVu
dHMuCj4KCk5vdCBleGFjdGx5LiBUaGUgY29tcGlsZXIncyAicGFja2VkIiBhbmQgImFsaWdubWVu
dCIgYXR0cmlidXRlcyBjYXVzZSBhCnN0cnVjdHVyZSB0byBiZSBhbGlnbmVkIGRpZmZlcmVudGx5
IGZyb20gaXRzIG5hdHVyYWwgYWxpZ25tZW50LgoKRm9yIGV4YW1wbGUsIHdpdGggdGhlIGZvbGxv
d2luZyB0aHJlZSBzdHJ1Y3R1cmVzOgoKc3RydWN0IHMwIHsKICAgICBfX2ludDEyOCB4Owp9OwoK
c3RydWN0IHMxIHsKICAgICBfX2ludDEyOCB4Owp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOwoK
c3RydWN0IHMyIHsKICAgICBfX2ludDEyOCB4Owp9IF9fYXR0cmlidXRlX18oKGFsaWduZWQoNjQp
KSk7CgpFdmVuIHRob3VnaCB0aGUgbGFyZ2VzdCBtZW1iZXIgc2l6ZSBpcyB0aGUgc2FtZSwgczAg
d2lsbCBiZSBhbGlnbmVkIHRvIDE2CmJ5dGVzLCBzMSBhbmQgczIgYXJlIG5vdCBhbGlnbmVkIHRo
ZSBzYW1lIHdheS4gczEgaGFzIG5vIGFsaWdubWVudCBkdWUgdG8KdGhlICJwYWNrZWQiIGF0dHJp
YnV0ZSwgd2hpbGUgczIgd2lsbCBiZSBhbGlnbmVkIHRvIDY0IGJ5dGVzLgoKV2hlbiB0aGVzZSB0
aHJlZSBzdHJ1Y3R1cmVzIGFyZSBwYXNzZWQgYXMgZnVuY3Rpb24gYXJndW1lbnRzLCB0aGV5IHdp
bGwgYmUKbG9jYXRlZCBvbiBkaWZmZXJlbnQgcG9zaXRpb25zIG9uIHRoZSBzdGFjay4KCkZvciB0
aGUgZm9sbG93aW5nIHRocmVlIGZ1bmN0aW9uczoKCmludCBmMChfX2ludDEyOCBhLCBfX2ludDEy
OCBiLCBfX2ludDEyOCBjLCBpbnQ2NF90IGQsIF9faW50MTI4IGUsIGludDY0X3QgZiwgc3RydWN0
IHMwIGcpOwppbnQgZjEoX19pbnQxMjggYSwgX19pbnQxMjggYiwgX19pbnQxMjggYywgaW50NjRf
dCBkLCBfX2ludDEyOCBlLCBpbnQ2NF90IGYsIHN0cnVjdCBzMSBnKTsKaW50IGYyKF9faW50MTI4
IGEsIF9faW50MTI4IGIsIF9faW50MTI4IGMsIGludDY0X3QgZCwgX19pbnQxMjggZSwgaW50NjRf
dCBmLCBzdHJ1Y3QgczIgZyk7CgpnIHdpbGwgYmUgbG9jYXRlZCBhdCBzcCszMiBpbiBmMCwgc3Ag
KyAyNCBpbiBmMSwgYW5kIHNvbWUgNjQtYnl0ZSBhbGlnbmVkCnN0YWNrIGFkZHJlc3MgaW4gZjIu
Cgo+Pj4gc3BlY2lmaWMsIGJ1dCBpdCBhbGxvd3MgdG8ga2VlcCBhcmNoLXNwZWNpZmljIGNvbmNl
cm5zIChpZTogZ3Vlc3NpbmcgdGhlCj4+PiBmaW5hbCBuZWVkZWQgYWxpZ25tZW50IGZvciBhbiBh
cmd1bWVudCkgaXNvbGF0ZWQgaW4gZWFjaCBKSVQgY29tcGlsZXIuCj4+Cj4+IGNvdWxkbid0IGFs
bCB0aGlzIGluZm9ybWF0aW9uIGJlIGNhbGN1bGF0ZWQgaW4gdGhlIEpJVCBjb21waWxlciAoaWYK
Pj4gSklUIG5lZWRzIHRoYXQpIGZyb20gQlRGPwo+IAo+PkZyb20gd2hhdCBJIHVuZGVyc3RhbmQs
IHRoZSBKSVQgY29tcGlsZXIgZG9lcyBub3QgaGF2ZSBhY2Nlc3MgdG8gQlRGIGluZm8sCj4gb25s
eSBhIHN1YnN0cmFjdCBmcm9tIGl0LCBhcnJhbmdlZCBpbiBhIHN0cnVjdCBidGZfZnVuY19tb2Rl
bCA/IFRoaXMKPiBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgYWxyZWFkeSBoYXMgc2l6ZSBpbmZvIGZv
ciBzdGFuZGFyZCB0eXBlcywgYnV0IGZvcgo+IHN0cnVjdHMgd2UgbmVlZCBzb21lIGFkZGl0aW9u
YWwgaW5mbyBhYm91dCB0aGUgbWVtYmVycywgaGVuY2UgdGhpcwo+IGFyZ19sYXJnZXN0X21lbWJl
cl9hbGlnbm1lbnQgYWRkaXRpb24gaW4gYnRmX2Z1bmNfbW9kZWwuCj4gCj4gVGhhbmtzLAo+IAo+
IEFsZXhpcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
