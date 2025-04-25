Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A5A9C343
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Apr 2025 11:23:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D88C78F88;
	Fri, 25 Apr 2025 09:23:35 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EEE0C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 09:23:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZkS7F5z0Kz4f3lWD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 17:23:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 55F581A1BE7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 17:23:31 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP1 (Coremail) with SMTP id cCh0CgAHanqRVAtoENpoKQ--.39960S2;
 Fri, 25 Apr 2025 17:23:30 +0800 (CST)
Message-ID: <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
Date: Fri, 25 Apr 2025 17:23:29 +0800
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
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
X-CM-TRANSID: cCh0CgAHanqRVAtoENpoKQ--.39960S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4DtFW8Gry3urWkury7trb_yoW5Ar48pF
 WftFyktrs7GF1xZF1qqw4IvFWDtwsxKr18W3yDtr18Aws0q3saqr1jkF1Y9FWxKw1kWw47
 XayY9ayxCFy5ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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

T24gNC8yNC8yMDI1IDk6MzggUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiBIaSBYdSwKPiAK
PiBPbiBUaHUgQXByIDI0LCAyMDI1IGF0IDI6MDAgUE0gQ0VTVCwgWHUgS3VvaGFpIHdyb3RlOgo+
PiBPbiA0LzI0LzIwMjUgMzoyNCBBTSwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+Pj4gSGkgQW5k
cmlpLAo+Pj4KPj4+IE9uIFdlZCBBcHIgMjMsIDIwMjUgYXQgNzoxNSBQTSBDRVNULCBBbmRyaWkg
TmFrcnlpa28gd3JvdGU6Cj4+Pj4gT24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMTI6MTTigK9BTSBB
bGV4aXMgTG90aG9yw6kKPj4+PiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Pj4+Pgo+Pj4+PiBIaSBBbmRyaWksCj4+Pj4+Cj4+Pj4+IE9uIFdlZCBBcHIgMTYsIDIwMjUgYXQg
MTE6MjQgUE0gQ0VTVCwgQW5kcmlpIE5ha3J5aWtvIHdyb3RlOgo+Pj4+Pj4gT24gRnJpLCBBcHIg
MTEsIDIwMjUgYXQgMTozMuKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+
Pj4+Pj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiBbLi4uXQo+IAo+
Pj4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciwgSSdsbCB0YWtlIGEgbG9vayBhdCBpdC4gVGhlIG1v
cmUgd2UgZGlzY3VzcyB0aGlzCj4+PiBzZXJpZXMsIHRoZSBsZXNzIG1lbWJlciBzaXplIHNvdW5k
cyByZWxldmFudCBmb3Igd2hhdCBJJ20gdHJ5aW5nIHRvIGFjaGlldmUKPj4+IGhlcmUuCj4+Pgo+
Pj4gRm9sbG93aW5nIFh1J3MgY29tbWVudHMsIEkgaGF2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGhv
dyBJIGNvdWxkIGRldGVjdCB0aGUKPj4+IGN1c3RvbSBhbGlnbm1lbnRzIGFuZCBwYWNraW5nIG9u
IHN0cnVjdHVyZXMsIGFuZCBJIHdhcyB3b25kZXJpbmcgaWYgSSBjb3VsZAo+Pj4gc29tZWhvdyBi
ZW5lZml0IGZyb20gX19hdHRyaWJ1dGVfXyBlbmNvZGluZyBpbiBCVEYgaW5mbyAoWzFdKS4gQnV0
Cj4+PiBmb2xsb3dpbmcgeW91ciBoaW50LCBJIGFsc28gc2VlIHNvbWUgYnRmX2lzX3N0cnVjdF9w
YWNrZWQoKSBpbgo+Pj4gdG9vbHMvbGliL2JwZi9idGZfZHVtcC5jIHRoYXQgY291bGQgaGVscC4g
SSdsbCBkaWcgdGhpcyBmdXJ0aGVyIGFuZCBzZWUgaWYKPj4+IEkgY2FuIG1hbmFnZSB0byBtYWtl
IHNvbWV0aGluZyB3b3JrIHdpdGggYWxsIG9mIHRoaXMuCj4+Pgo+Pgo+PiBXaXRoIERXQVJGIGlu
Zm8sIHdlIG1pZ2h0IG5vdCBuZWVkIHRvIGRldGVjdCB0aGUgc3RydWN0dXJlIGFsaWdubWVudCBh
bnltb3JlLAo+PiBzaW5jZSB0aGUgRFdfQVRfbG9jYXRpb24gYXR0cmlidXRlIHRlbGxzIHVzIHdo
ZXJlIHRoZSBzdHJ1Y3R1cmUgcGFyYW1ldGVyIGlzCj4+IGxvY2F0ZWQgb24gdGhlIHN0YWNrLCBh
bmQgRFdfQVRfYnl0ZV9zaXplIGdpdmVzIHVzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUuCj4g
Cj4gSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgeW91IGhlcmUsIGJlY2F1c2UgRFdBUkYgaW5mbyBp
cyBub3QgYWNjZXNzaWJsZQo+IGZyb20ga2VybmVsIGF0IHJ1bnRpbWUsIHJpZ2h0ID8gT3IgYXJl
IHlvdSBtZWFuaW5nIHRoYXQgd2UgY291bGQsIGF0IGJ1aWxkCj4gdGltZSwgZW5yaWNoIHRoZSBC
VEYgaW5mbyBlbWJlZGRlZCBpbiB0aGUga2VybmVsIHRoYW5rcyB0byBEV0FSRiBpbmZvID8KPgoK
U29ycnkgZm9yIHRoZSBjb25mdXNpb24uCgpXaGF0IEkgbWVhbnQgaXMgdGhhdCB0aGVyZSBhcmUg
dHdvIERXQVJGIGF0dHJpYnV0ZXMsIERXX0FUX2xvY2F0aW9uIGFuZApEV19BVF9ieXRlX3NpemUs
IHdoaWNoIHRlbGwgdXMgdGhlIHBvc2l0aW9uIGFuZCBzaXplIG9mIGZ1bmN0aW9uIHBhcmFtZXRl
cnMuCgpGb3IgdGhlIGV4YW1wbGUgZWFybGllcjoKCnN0cnVjdCBzMiB7CiAgICAgICBfX2ludDEy
OCB4Owp9IF9fYXR0cmlidXRlX18oKGFsaWduZWQoNjQpKSk7CgppbnQgZjIoX19pbnQxMjggYSwg
X19pbnQxMjggYiwgX19pbnQxMjggYywgaW50NjRfdCBkLCBfX2ludDEyOCBlLCBpbnQ2NF90IGYs
IHN0cnVjdCBzMiBnKQp7CiAgICAgcmV0dXJuIDA7Cn0KCk9uIG15IGJ1aWxkIGhvc3QsIHRoZSBE
V19BVF9sb2NhdGlvbiBhdHRyaWJ1dGVzIGZvciAiZSIsICJmIiwgYW5kICJnIiBhcmU6Cgo8Mj48
ZWU+OiBBYmJyZXYgTnVtYmVyOiAyIChEV19UQUdfZm9ybWFsX3BhcmFtZXRlcikKICAgICA8ZWY+
ICAgRFdfQVRfbmFtZSAgICAgICAgOiBlCiAgICAgLi4uCiAgICAgPGY2PiAgIERXX0FUX2xvY2F0
aW9uICAgIDogMiBieXRlIGJsb2NrOiA5MSAwICAgICAgIChEV19PUF9mYnJlZzogMCkKCjwyPjxm
OT46IEFiYnJldiBOdW1iZXI6IDIgKERXX1RBR19mb3JtYWxfcGFyYW1ldGVyKQogICAgIDxmYT4g
ICBEV19BVF9uYW1lICAgICAgICA6IGYKICAgICAgLi4uCiAgICAgPDEwMT4gICBEV19BVF9sb2Nh
dGlvbiAgICA6IDIgYnl0ZSBibG9jazogOTEgMTAgICAgIChEV19PUF9mYnJlZzogMTYpCgo8Mj48
MTA0PjogQWJicmV2IE51bWJlcjogMiAoRFdfVEFHX2Zvcm1hbF9wYXJhbWV0ZXIpCiAgICAgPDEw
NT4gICBEV19BVF9uYW1lICAgICAgICA6IGcKICAgICAgLi4uCiAgICAgPDEwYz4gICBEV19BVF9s
b2NhdGlvbiAgICA6IDIgYnl0ZSBibG9jazogODMgMCAgICAgIChEV19PUF9icmVnMTkgKHgxOSk6
IDApCgpXZSBjYW4gc2VlICJlIiBhbmQgImYiIGFyZSBhdCBmcCswIGFuZCBmcCsxNiwgYnV0ICJn
IiBpcyBpbiB4MTkrMC4gRGlzYXNzZW1ibHkgc2hvd3MgeDE5CmhvbGRzIGEgNjQtYnl0ZSBhbGln
bmVkIHN0YWNrIGFkZHJlc3MuCgpGb3IgdGhlIHR3byBxdWVzdGlvbnMgeW91IG1lbnRpb25lZCwg
SeKAmW0gbm90IHN1cmUgaWYgd2UgY2FuIGFjY2VzcyBEV0FSRiBhdHRyaWJ1dGVzCmF0IHJ1bnRp
bWUuIEFzIGZvciBhZGRpbmcgcGFyYW1ldGVyIGxvY2F0aW9ucyB0byBCVEYgYXQgYnVpbGRpbmcg
dGltZSwgSSB0aGluayBpdAptZWFucyB3ZSB3b3VsZCBuZWVkIHRvIHJlY29yZCBDUFUtcmVsYXRl
ZCByZWdpc3RlciBpbmZvIGluIEJURiwgd2hpY2ggSSBkb27igJl0IHRoaW5rCmlzIGEgZ29vZCBp
ZGVhLgoKPiBUaGFua3MsCj4gCj4gQWxleGlzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
