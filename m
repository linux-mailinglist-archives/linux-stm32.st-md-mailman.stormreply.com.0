Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE9A95F55
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA956C78F9F;
	Tue, 22 Apr 2025 07:27:03 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59E09C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 02:14:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZgppV5JZ6z4f3jtK
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 10:14:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
 by mail.maildlp.com (Postfix) with ESMTP id 48AB91A06D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 10:14:45 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP2 (Coremail) with SMTP id Syh0CgDX4WQTqgVo5dAZKA--.45218S2;
 Mon, 21 Apr 2025 10:14:44 +0800 (CST)
Message-ID: <8b800c09-eade-4dcf-90f6-2f5a78170bc4@huaweicloud.com>
Date: Mon, 21 Apr 2025 10:14:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
 <D9BLCJSCHE9A.1IKHK3XBPF8MU@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D9BLCJSCHE9A.1IKHK3XBPF8MU@bootlin.com>
X-CM-TRANSID: Syh0CgDX4WQTqgVo5dAZKA--.45218S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW3JryUGw4rWryDXr4fZrb_yoWrJw18pF
 ZxX3Z8tF4kJr1xZa1qy3yxZrWSq348KryUCrW5tw13trn8GF1xJFW2gF4Y9Fy5Gr1kG3W2
 vF1jqFy3Za4fZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjTRM6wCDUUUU
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

T24gNC8yMS8yMDI1IDEyOjAyIEFNLCBBbGV4aXMgTG90aG9yw6kgd3JvdGU6Cj4gSGkgWHUsCj4g
Cj4gT24gVGh1IEFwciAxNywgMjAyNSBhdCA0OjEwIFBNIENFU1QsIFh1IEt1b2hhaSB3cm90ZToK
Pj4gT24gNC8xNy8yMDI1IDM6MTQgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4+IEhpIEFu
ZHJpaSwKPj4+Cj4+PiBPbiBXZWQgQXByIDE2LCAyMDI1IGF0IDExOjI0IFBNIENFU1QsIEFuZHJp
aSBOYWtyeWlrbyB3cm90ZToKPj4+PiBPbiBGcmksIEFwciAxMSwgMjAyNSBhdCAxOjMy4oCvUE0g
QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pCj4+Pj4gPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPiB3cm90ZToKPiAKPiBbLi4uXQo+IAo+Pj4+IEkgbWlnaHQgYmUgbWlzc2luZyBz
b21ldGhpbmcsIGJ1dCBob3cgY2FuIHRoZSAqc2l6ZSogb2YgdGhlIGZpZWxkIGJlCj4+Pj4gdXNl
ZCB0byBjYWxjdWxhdGUgdGhhdCBhcmd1bWVudCdzICphbGlnbm1lbnQqPyBpLmUuLCBJIGRvbid0
Cj4+Pj4gdW5kZXJzdGFuZCB3aHkgYXJnX2xhcmdlc3RfbWVtYmVyX3NpemUgbmVlZHMgdG8gYmUg
Y2FsY3VsYXRlZCBpbnN0ZWFkCj4+Pj4gb2YgYXJnX2xhcmdlc3RfbWVtYmVyX2FsaWdubWVudC4u
Lgo+Pj4KPj4+IEluZGVlZCBJIGluaXRpYWxseSBjaGVja2VkIHdoZXRoZXIgSSBjb3VsZCByZXR1
cm4gZGlyZWN0bHkgc29tZSBhbGlnbm1lbnQKPj4+IGluZm8gZnJvbSBidGYsIGJ1dCBpdCB0aGVu
IGludm9sdmVzIHRoZSBhbGlnbm1lbnQgY29tcHV0YXRpb24gaW4gdGhlIGJ0Zgo+Pj4gbW9kdWxl
LiBTaW5jZSB0aGVyZSBjb3VsZCBiZSBtaW5vciBkaWZmZXJlbmNlcyBiZXR3ZWVuIGFyY2hpdGVj
dHVyZXMgYWJvdXQKPj4+IGFsaWdubWVudCByZXF1aXJlbWVudHMsIEkgdGhvdWdoIGl0IHdvdWxk
IGJlIGJldHRlciB0byBpbiBmYWN0IGtlZXAgYWxpZ25tZW50Cj4+PiBjb21wdXRhdGlvbiBvdXQg
b2YgdGhlIGJ0ZiBtb2R1bGUuIEZvciBleGFtcGxlLCBJIHNlZSB0aGF0IDEyOCBiaXRzIHZhbHVl
cwo+Pj4gYXJlIGFsaWduZWQgb24gMTYgYnl0ZXMgb24gQVJNNjQsIHdoaWxlIGJlaW5nIGFsaWdu
ZWQgb24gOCBieXRlcyBvbiBTMzkwLgo+Pj4KPj4+IEFuZCBzaW5jZSBmb3IgQVJNNjQsIGFsbCBu
ZWVkZWQgYWxpZ25tZW50cyBhcmUgc29tZWhvdyBkZXJpdmVkIGZyb20gc2l6ZQo+Pj4gKGl0IGlz
IGVpdGhlciBkaXJlY3RseSBzaXplIGZvciBmdW5kYW1lbnRhbCB0eXBlcywgb3IgYWxpZ25tZW50
IG9mIHRoZQo+Pj4gbGFyZ2VzdCBtZW1iZXIgZm9yIHN0cnVjdHMsIHdoaWNoIGlzIHRoZW4gc2l6
ZSBvZiBsYXJnZXN0IG1lbWJlciksCj4+PiByZXR1cm5pbmcgdGhlIHNpemUgc2VlbXMgdG8gYmUg
ZW5vdWdoIHRvIGFsbG93IHRoZSBKSVQgc2lkZSB0byBjb21wdXRlCj4+PiBhbGlnbm1lbnRzLgo+
Pj4KPj4KPj4gTm90IGV4YWN0bHkuIFRoZSBjb21waWxlcidzICJwYWNrZWQiIGFuZCAiYWxpZ25t
ZW50IiBhdHRyaWJ1dGVzIGNhdXNlIGEKPj4gc3RydWN0dXJlIHRvIGJlIGFsaWduZWQgZGlmZmVy
ZW50bHkgZnJvbSBpdHMgbmF0dXJhbCBhbGlnbm1lbnQuCj4+Cj4+IEZvciBleGFtcGxlLCB3aXRo
IHRoZSBmb2xsb3dpbmcgdGhyZWUgc3RydWN0dXJlczoKPj4KPj4gc3RydWN0IHMwIHsKPj4gICAg
ICAgX19pbnQxMjggeDsKPj4gfTsKPj4KPj4gc3RydWN0IHMxIHsKPj4gICAgICAgX19pbnQxMjgg
eDsKPj4gfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKTsKPj4KPj4gc3RydWN0IHMyIHsKPj4gICAg
ICAgX19pbnQxMjggeDsKPj4gfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDY0KSkpOwo+Pgo+PiBF
dmVuIHRob3VnaCB0aGUgbGFyZ2VzdCBtZW1iZXIgc2l6ZSBpcyB0aGUgc2FtZSwgczAgd2lsbCBi
ZSBhbGlnbmVkIHRvIDE2Cj4+IGJ5dGVzLCBzMSBhbmQgczIgYXJlIG5vdCBhbGlnbmVkIHRoZSBz
YW1lIHdheS4gczEgaGFzIG5vIGFsaWdubWVudCBkdWUgdG8KPj4gdGhlICJwYWNrZWQiIGF0dHJp
YnV0ZSwgd2hpbGUgczIgd2lsbCBiZSBhbGlnbmVkIHRvIDY0IGJ5dGVzLgo+Pgo+PiBXaGVuIHRo
ZXNlIHRocmVlIHN0cnVjdHVyZXMgYXJlIHBhc3NlZCBhcyBmdW5jdGlvbiBhcmd1bWVudHMsIHRo
ZXkgd2lsbCBiZQo+PiBsb2NhdGVkIG9uIGRpZmZlcmVudCBwb3NpdGlvbnMgb24gdGhlIHN0YWNr
Lgo+Pgo+PiBGb3IgdGhlIGZvbGxvd2luZyB0aHJlZSBmdW5jdGlvbnM6Cj4+Cj4+IGludCBmMChf
X2ludDEyOCBhLCBfX2ludDEyOCBiLCBfX2ludDEyOCBjLCBpbnQ2NF90IGQsIF9faW50MTI4IGUs
IGludDY0X3QgZiwgc3RydWN0IHMwIGcpOwo+PiBpbnQgZjEoX19pbnQxMjggYSwgX19pbnQxMjgg
YiwgX19pbnQxMjggYywgaW50NjRfdCBkLCBfX2ludDEyOCBlLCBpbnQ2NF90IGYsIHN0cnVjdCBz
MSBnKTsKPj4gaW50IGYyKF9faW50MTI4IGEsIF9faW50MTI4IGIsIF9faW50MTI4IGMsIGludDY0
X3QgZCwgX19pbnQxMjggZSwgaW50NjRfdCBmLCBzdHJ1Y3QgczIgZyk7Cj4+Cj4+IGcgd2lsbCBi
ZSBsb2NhdGVkIGF0IHNwKzMyIGluIGYwLCBzcCArIDI0IGluIGYxLCBhbmQgc29tZSA2NC1ieXRl
IGFsaWduZWQKPj4gc3RhY2sgYWRkcmVzcyBpbiBmMi4KPiAKPiBBaCwgdGhhbmtzIGZvciB0aG9z
ZSBjbGVhciBleGFtcGxlcywgSSBjb21wbGV0ZWx5IG92ZXJsb29rZWQgdGhpcwo+IHBvc3NpYmls
aXR5LiBBbmQgbm93IHRoYXQgeW91IG1lbnRpb24gaXQsIEkgZmVlbCBhIGJpdCBkdW1iIGJlY2F1
c2UgSSBub3cKPiByZW1lbWJlciB0aGF0IHlvdSBtZW50aW9uZWQgdGhpcyBpbiBQdXJhbmpheSdz
IHNlcmllcy4uLgo+IAo+IEkgdG9vayBhIHF1aWNrIGxvb2sgYXQgdGhlIHg4NiBKSVQgY29tcGls
ZXIgZm9yIHJlZmVyZW5jZSwgYW5kIHNhdyBubyBjb2RlCj4gcmVsYXRlZCB0byB0aGlzIHNwZWNp
ZmljIGNhc2UgbmVpdGhlci4gU28gSSBzZWFyY2hlZCBpbiB0aGUga2VybmVsIGZvcgo+IGFjdHVh
bCBmdW5jdGlvbnMgdGFraW5nIHN0cnVjdCBhcmd1bWVudHMgYnkgdmFsdWUgQU5EIGJlaW5nIGRl
Y2xhcmVkIHdpdGggc29tZQo+IHBhY2tlZCBvciBhbGlnbmVkIGF0dHJpYnV0ZS4gSSBvbmx5IGZv
dW5kIGEgaGFuZGZ1bCBvZiB0aG9zZSwgYW5kIG5vbmUKPiBzZWVtcyB0byB0YWtlIGVub3VnaCBh
cmd1bWVudHMgdG8gaGF2ZSB0aGUgY29ycmVzcG9uZGluZyBzdHJ1Y3QgcGFzc2VkIG9uIHRoZQo+
IHN0YWNrLiBTbyByYXRoZXIgdGhhbiBzdXBwb3J0aW5nIHRoaXMgdmVyeSBzcGVjaWZpYyBjYXNl
LCBJIGFtIHRlbXB0ZWQKPiB0byBqdXN0IHJldHVybiBhbiBlcnJvciBmb3Igbm93IGR1cmluZyB0
cmFtcG9saW5lIGNyZWF0aW9uIGlmIHdlIGRldGVjdCBzdWNoCj4gc3RydWN0dXJlIChhbmQgdGhl
biB0aGUgSklUIGNvbXBpbGVyIGNhbiBrZWVwIHVzaW5nIGRhdGEgc2l6ZSB0byBjb21wdXRlCj4g
YWxpZ25tZW50LCBub3cgdGhhdCBpdCBpcyBzdXJlIG5vdCB0byByZWNlaXZlIGN1c3RvbSBhbGln
bm1lbnRzKS4gT3IgYW0gSQo+IG1pc3Npbmcgc29tZSBhY3R1YWwgY2FzZXMgaW52b2x2aW5nIHRo
b3NlIHZlcnkgc3BlY2lmaWMgYWxpZ25tZW50cyA/Cj4gCgpIb3cgY2FuIHdlIHJlbGlhYmx5ICdk
ZXRlY3QnIHRoZSBjYXNlPyBJZiBhIGZ1bmN0aW9uIGhhcyBzdWNoIGEgcGFyYW1ldGVyCmJ1dCB3
ZSBmYWlsIHRvIGRldGVjdCBpdCwgdGhlIEJQRiB0cmFtcG9saW5lIHdpbGwgcGFzcyBhbiBpbmNv
cnJlY3QgdmFsdWUKdG8gdGhlIGZ1bmN0aW9uLCB3aGljaCBpcyBhbHNvIHVuYWNjZXB0YWJsZS4K
Cj4gVGhhbmtzLAo+IAo+IEFsZXhpcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
