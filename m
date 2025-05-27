Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E66AC4B2D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 11:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78CF2C36B16;
	Tue, 27 May 2025 09:09:24 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB62C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 09:09:22 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b66Jc4rLvzYQtxx
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 17:09:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id C7CBA1A07BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 17:09:19 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP4 (Coremail) with SMTP id gCh0CgDnSF0+gTVoOO+iNg--.59571S2;
 Tue, 27 May 2025 17:09:19 +0800 (CST)
Message-ID: <5535f49f-8903-4055-b99a-cf8b2d4666e1@huaweicloud.com>
Date: Tue, 27 May 2025 17:09:18 +0800
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
References: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
 <20250522-many_args_arm64-v2-1-d6afdb9cf819@bootlin.com>
 <8d184497-fecf-497f-8b4c-bcd4b0a697ce@huaweicloud.com>
 <DA6T7OEF94IG.2BH2PWTCVEOTA@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <DA6T7OEF94IG.2BH2PWTCVEOTA@bootlin.com>
X-CM-TRANSID: gCh0CgDnSF0+gTVoOO+iNg--.59571S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7kC6x804xWl14x267AKxVWrJVCq3wAF
 c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
 0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xv
 wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
 x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
 64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
 1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kI
 c2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x07UAkuxUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 1/2] bpf,
 arm64: Support up to 12 function arguments
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

T24gNS8yNy8yMDI1IDQ6NDUgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKClsuLi5dCgo+Pj4g
KwkJLyogV2UgY2FuIG5vdCBrbm93IGZvciBzdXJlIGFib3V0IGV4YWN0IGFsaWdubWVudCBuZWVk
cyBmb3IKPj4+ICsJCSAqIHN0cnVjdCBwYXNzZWQgb24gc3RhY2ssIHNvIGRlbnkgdGhvc2UKPj4+
ICsJCSAqLwo+Pj4gKwkJaWYgKG0tPmFyZ19mbGFnc1tpXSAmIEJURl9GTU9ERUxfU1RSVUNUX0FS
RykKPj4+ICsJCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+IGxlYXZlIHRoZSBlcnJvciBjb2RlIGFz
IGlzLCBuYW1lbHksIHJldHVybiAtRU5PVFNVUFA/Cj4gQWN0dWFsbHkgdGhpcyBjaGFuZ2UgZm9s
bG93cyBhIGNvbXBsYWludCBmcm9tIGNoZWNrcGF0Y2g6Cj4gCj4gIldBUk5JTkc6IEVOT1RTVVBQ
IGlzIG5vdCBhIFNVU1Y0IGVycm9yIGNvZGUsIHByZWZlciBFT1BOT1RTVVBQIgoKU2VlbXMgd2Ug
Y2FuIGp1c3QgaWdub3JlIHRoaXMgd2FybmluZywgYXMgRU5PVFNVUFAgaXMgYWxyZWFkeSB1c2Vk
CnRocm91Z2hvdXQgYnBmLCBhbmQgdGhlIGFjdHVhbCB2YWx1ZSAtNTI0IGlzIHdlbGwgcmVjb2du
aXplZC4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
