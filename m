Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8180C746
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 11:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55BCAC6B475;
	Mon, 11 Dec 2023 10:52:31 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE4DC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Dec 2023 06:48:53 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.254])
 by gateway (Coremail) with SMTP id _____8BxHOtUX3Vll0xAAA--.58904S3;
 Sun, 10 Dec 2023 14:48:52 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.254])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxkN1NX3VldDNaAA--.5375S3; 
 Sun, 10 Dec 2023 14:48:47 +0800 (CST)
Message-ID: <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
Date: Sun, 10 Dec 2023 14:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, jiaxun.yang@flygoat.com,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor@kernel.org>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
 <20230616-activity-shed-be3c13e5ac71@spud>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20230616-activity-shed-be3c13e5ac71@spud>
X-CM-TRANSID: AQAAf8DxkN1NX3VldDNaAA--.5375S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZw1DGF4fJr1fAry5Aw15KFX_yoWDtwcEkF
 WfW3s7KrWIqFWDXwsYkFZ3tr90gF1qyF15Ary8Xwn2gwn5AFWkA3ykCryIq343XFWrCFsx
 uF1xAwnrCr12kosvyTuYvTs0mTUanT9S1TB71UUUUbDqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbTAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
 JVW8Jr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
 McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
 4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUstxhDUUUU
X-Mailman-Approved-At: Mon, 11 Dec 2023 10:52:30 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFT PATCH 1/2] stmmac: dwmac-loongson: drop
 useless check for compatible fallback
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

CuWcqCAyMDIzLzYvMTcgMDI6NTIsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gT24gRnJpLCBKdW4g
MTYsIDIwMjMgYXQgMTI6MzE6MjZQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
Pj4gRGV2aWNlIGJpbmRzIHRvIHByb3BlciBQQ0kgSUQgKExPT05HU09OLCAweDdhMDMpLCBhbHJl
YWR5IGxpc3RlZCBpbiBEVFMsCj4+IHNvIGNoZWNraW5nIGZvciBzb21lIG90aGVyIGNvbXBhdGli
bGUgZG9lcyBub3QgbWFrZSBzZW5zZS4gIEl0IGNhbm5vdCBiZQo+PiBib3VuZCB0byB1bnN1cHBv
cnRlZCBwbGF0Zm9ybS4KPj4KPj4gRHJvcCB1c2VsZXNzLCBpbmNvcnJlY3QgKHNwYWNlIGluIGJl
dHdlZW4pIGFuZCB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IE1p
Z2h0IGJlIHdvcnRoIG5vdGluZyB0aGF0IGRyb3BwaW5nIGl0IGlzIHJlcXVpcmVkIHRvIGFsbG93
IHRoZQo+IG5ldyBsb29uZ2FyY2ggZHRzIHN0dWZmIHRvIGJlIGZ1bmN0aW9uYWwgd2l0aCBhIHNh
bmUgc2V0IG9mIGNvbXBhdGlibGVzLgo+Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClRoYW5rIHlvdSBLcnp5c3p0b2YgZm9yIHlvdXIgd29y
ay4gd2hlbiBJIGFtCmFkZGluZyBtb3JlIGRldmljZXMgc3VwcG9ydCB0byBzdG1tYWMsIEkgZm91
bmQgdGhhdCB5b3VyCnR3byBwYXRjaGVzIHNlZW1lZCB0byBiZSBmb3Jnb3R0ZW4uClRob21hcywg
SmlheHVuLiBDYW4gdGhlIHR3byBwYXRjaGVzIGdldCBhbiBBY2tlZC1ieT8KTXkgc3RtbWFjIHBh
dGNoIHRocmVhZDoKPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC9jb3Zlci4xNjk5
NTMzNzQ1LmdpdCAKLnNpeWFudGVuZ0Bsb29uZ3Nvbi5jbi9ULyNtZDMxMDhkMjlhNWVmZTcxYjI3
ZjRjNWNjZjVkMDIxNzU3MWJmNjU4Nj4KVGhhbmtzLApZYW50ZW5nCgo+Cj4gQ2hlZXJzLAo+IENv
bm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
