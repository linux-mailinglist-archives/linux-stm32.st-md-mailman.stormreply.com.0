Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC0AC4E96
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 14:19:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CDD6C36B1E;
	Tue, 27 May 2025 12:19:24 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE93BC36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 12:19:22 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b6BWs3h5HzYQtLc
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 20:19:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id A23B11A1A74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 20:19:20 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP4 (Coremail) with SMTP id gCh0CgB33GDFrTVoSsiwNg--.53275S2;
 Tue, 27 May 2025 20:19:18 +0800 (CST)
Message-ID: <69b24e21-13aa-42b6-bb42-6aad89284aee@huaweicloud.com>
Date: Tue, 27 May 2025 20:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florent Revest <revest@chromium.org>
References: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
X-CM-TRANSID: gCh0CgB33GDFrTVoSsiwNg--.53275S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF47tr47Xw1UJF1kWw1fCrg_yoW5Wr1rpF
 Wvga13Kas7Aw4xuFsavw12ga15Ka95ta1a9F1ay343ZFn0yFy8XF4SkFsI9ry5Xr93Wry2
 vr429F13G3WUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/2] bpf,
	arm64: support up to 12 arguments
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

T24gNS8yNy8yMDI1IDY6MDYgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiBIZWxsbywKPiAK
PiB0aGlzIGlzIHRoZSB2MiBvZiB0aGUgbWFueSBhcmdzIHNlcmllcyBmb3IgYXJtNjQsIGJlaW5n
IGl0c2VsZiBhIHJldml2YWwKPiBvZiBYdSBLdWhvYWkncyB3b3JrIHRvIGVuYWJsZSBsYXJnZXIg
YXJndW1lbnRzIGNvdW50IGZvciBCUEYgcHJvZ3JhbXMgb24KPiBBUk02NCAoWzFdKS4KPiAKPiBU
aGUgZGlzY3Vzc2lvbnMgaW4gdjEgc2hlZCBzb21lIGxpZ2h0IG9uIHNvbWUgaXNzdWVzIGFyb3Vu
ZCBzcGVjaWZpYwo+IGNhc2VzLCBmb3IgZXhhbXBsZSB3aXRoIGZ1bmN0aW9ucyBwYXNzaW5nIHN0
cnVjdCBvbiBzdGFjayB3aXRoIGN1c3RvbQo+IHBhY2tpbmcvYWxpZ25tZW50IGF0dHJpYnV0ZXM6
IHRob3NlIGNhc2VzIGNhbiBub3QgYmUgcHJvcGVybHkgZGV0ZWN0ZWQKPiB3aXRoIHRoZSBjdXJy
ZW50IEJURiBpbmZvLiBTbyB0aGlzIG5ldyByZXZpc2lvbiBhaW1zIHRvIHNlcGFyYXRlCj4gY29u
Y2VybnMgd2l0aCBhIHNpbXBsZXIgaW1wbGVtZW50YXRpb24sIGp1c3QgYWNjZXB0aW5nIGFkZGl0
aW9uYWwgYXJncwo+IG9uIHN0YWNrIGlmIHdlIGNhbiBtYWtlIHN1cmUgYWJvdXQgdGhlIGFsaWdu
bWVudCBjb25zdHJhaW50cyAoYW5kIHNvLAo+IHJlZnVzaW5nIGF0dGFjaG1lbnQgdG8gZnVuY3Rp
b25zIHBhc3Npbmcgc3RydWN0cyBvbiBzdGFja3MpLiBJIHRoZW4KPiBjaGVja2VkIGlmIHRoZSBz
cGVjaWZpYyBhbGlnbm1lbnQgY29uc3RyYWludHMgY291bGQgYmUgY2hlY2tlZCB3aXRoCj4gbGFy
Z2VyIHNjYWxhciB0eXBlcyByYXRoZXIgdGhhbiBzdHJ1Y3RzLCBidXQgaXQgYXBwZWFycyB0aGF0
IHRoaXMgdXNlCj4gY2FzZSBpcyBpbiBmYWN0IHJlamVjdGVkIGF0IHRoZSB2ZXJpZmllciBsZXZl
bCAoc2VlIGE5YjU5MTU5ZDMzOCAoImJwZjoKPiBEbyBub3QgYWxsb3cgYnRmX2N0eF9hY2Nlc3Mg
d2l0aCBfX2ludDEyOCB0eXBlcyIpKS4gU28gaW4gdGhlIGVuZCB0aGUKPiBzcGVjaWZpYyBhbGln
bm1lbnQgY29ybmVyIGNhc2VzIHJhaXNlZCBpbiBbMV0gY2FuIG5vdCByZWFsbHkgaGFwcGVuIGlu
Cj4gdGhlIGtlcm5lbCBpbiBpdHMgY3VycmVudCBzdGF0ZS4gVGhpcyBuZXcgcmV2aXNpb24gc3Rp
bGwgYnJpbmdzIHN1cHBvcnQKPiBmb3IgdGhlIHN0YW5kYXJkIGNhc2VzIGFzIGEgZmlyc3Qgc3Rl
cCwgaXQgd2lsbCB0aGVuIGJlIHBvc3NpYmxlIHRvCj4gaXRlcmF0ZSBvbiB0b3Agb2YgaXQgdG8g
YWRkIHRoZSBtb3JlIHNwZWNpZmljIGNhc2VzIGxpa2Ugc3RydWN0IHBhc3NlZAo+IG9uIHN0YWNr
IGFuZCBsYXJnZXIgdHlwZXMuCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIzMDkxNzE1MDc1Mi42OTYxMi0xLXh1a3VvaGFpQGh1YXdlaWNsb3VkLmNvbS8jdAo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxv
dGhvcmVAYm9vdGxpbi5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIHN3aXRjaCBiYWNr
IC1FT1BOT1RTVVBQIHRvIC1FTk9UU1VQUAo+IC0gZml4IGNvbW1lbnQgc3R5bGUKPiAtIGdyb3Vw
IGludGlhbGl6YXRpb25zIGZvciBhcmdfYXV4Cj4gLSByZW1vdmUgc29tZSB1bm5lZWRlZCByb3Vu
ZF91cAo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyMi1t
YW55X2FyZ3NfYXJtNjQtdjItMC1kNmFmZGI5Y2Y4MTlAYm9vdGxpbi5jb20KPiAKPiBDaGFuZ2Vz
IGluIHYyOgo+IC0gcmVtb3ZlIGFsaWdubWVudCBjb21wdXRhdGlvbiBmcm9tIGJ0Zi5jCj4gLSBk
ZWR1Y2UgYWxpZ25tZW50IGNvbnN0cmFpbnRzIGRpcmVjdGx5IGluIGppdCBjb21waWxlciBmb3Ig
c2ltcGxlIHR5cGVzCj4gLSBkZW55IGF0dGFjaG1lbnQgdG8gZnVuY3Rpb25zIHdpdGggImNvcm5l
ci1jYXNlcyIgYXJndW1lbnRzIChpZToKPiAgICBzdHJ1Y3RzIG9uIHN0YWNrKQo+IC0gcmVtb3Zl
IGN1c3RvbSB0ZXN0cywgYXMgdGhlIGNvcnJlc3BvbmRpbmcgdXNlIGNhc2VzIGFyZSBsb2NrZWQg
ZWl0aGVyCj4gICAgYnkgdGhlIEpJVCBjb21wIG9yIHRoZSB2ZXJpZmllcgo+IC0gZHJvcCBSRkMK
PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MTEtbWFueV9h
cmdzX2FybTY0LXYxLTAtMGEzMmZlNzIzMzllQGJvb3RsaW4uY29tCj4gCj4gLS0tCj4gQWxleGlz
IExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pICgxKToKPiAgICAgICAgc2VsZnRlc3RzL2JwZjog
ZW5hYmxlIG1hbnktYXJncyB0ZXN0cyBmb3IgYXJtNjQKPiAKPiBYdSBLdW9oYWkgKDEpOgo+ICAg
ICAgICBicGYsIGFybTY0OiBTdXBwb3J0IHVwIHRvIDEyIGZ1bmN0aW9uIGFyZ3VtZW50cwo+IAo+
ICAgYXJjaC9hcm02NC9uZXQvYnBmX2ppdF9jb21wLmMgICAgICAgICAgICAgICAgfCAyMjUgKysr
KysrKysrKysrKysrKysrKystLS0tLS0tCj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYv
REVOWUxJU1QuYWFyY2g2NCB8ICAgMiAtCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3MSBpbnNlcnRp
b25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogOTQzNTEzOGMwNjkx
MTdjZDU5YTQ5MTJiNWVhMmFlNDRjYzJjNWZmYQo+IGNoYW5nZS1pZDogMjAyNTAyMjAtbWFueV9h
cmdzX2FybTY0LThiZDM3NDdlNjk0OAo+IAo+IEJlc3QgcmVnYXJkcywKCkZvciB0aGUgc2VyaWVz
OgoKQWNrZWQtYnk6IFh1IEt1b2hhaSA8eHVrdW9oYWlAaHVhd2VpLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
