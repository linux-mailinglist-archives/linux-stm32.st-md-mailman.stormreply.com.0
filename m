Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F453F053
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 22:42:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F37CAC5662F;
	Mon,  6 Jun 2022 20:42:16 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81543C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 20:42:15 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id yJY7nohIwJXxRyJY8nmBKa; Mon, 06 Jun 2022 22:42:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 06 Jun 2022 22:42:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <75b293bd-ec8d-8c90-ffe5-afa49d6a218d@wanadoo.fr>
Date: Mon, 6 Jun 2022 22:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
References: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
 <20220606062650.GA31937@linux.intel.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220606062650.GA31937@linux.intel.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: intel: Fix an error handling path
 in intel_eth_pci_probe()
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

TGUgMDYvMDYvMjAyMiDDoCAwODoyNiwgV29uZyBWZWUgS2hlZSBhIMOpY3JpdMKgOgo+IE9uIFN1
biwgSnVuIDA1LCAyMDIyIGF0IDEwOjUwOjQ4UE0gKzAyMDAsIENocmlzdG9waGUgSkFJTExFVCB3
cm90ZToKPj4gV2hlbiB0aGUgbWFuYWdlZCBBUEkgaXMgdXNlZCwgdGhlcmUgaXMgbm8gbmVlZCB0
byBleHBsaWNpdGx5IGNhbGwKPj4gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKS4KPj4KPj4gVGhpcyBs
b29rcyB0byBiZSBhIGxlZnQtb3ZlciBmcm9tIHRoZSBjb21taXQgaW4gdGhlIEZpeGVzIHRhZy4g
T25seSB0aGUKPj4gLnJlbW92ZSgpIGZ1bmN0aW9uIGhhZCBiZWVuIHVwZGF0ZWQuCj4+Cj4+IFNv
IHJlbW92ZSB0aGlzIHVudXNlZCBmdW5jdGlvbiBjYWxsIGFuZCB1cGRhdGUgZ290byBsYWJlbCBh
Y2NvcmRpbmdseS4KPj4KPj4gRml4ZXM6IDhhY2NjNDY3NzU4ZSAoInN0bW1hYzogaW50ZWw6IHVz
ZSBtYW5hZ2VkIFBDSSBmdW5jdGlvbiBvbiBwcm9iZSBhbmQgcmVzdW1lIikKPj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4K
Pj4gLS0tCj4+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50
ZWwuYyB8IDQgKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKPj4KPiAKPiBMR1RNCj4gCj4gUmV2aWV3ZWQtYnk6IFdvbmcgVmVlIEtoZWUgPHZl
ZS5raGVlLndvbmdAbGludXguaW50ZWwuY29tPgo+IAo+IAoKSGksCgpJJ3ZlIGxvb2tlZCBhdCBp
dCBhZ2Fpbi4KCkkgc3RpbGwgdGhpbmsgdGhhdCB0aGUgcGF0Y2ggaXMgZ29vZCwgYnV0IHBjaW1f
cmVsZWFzZSgpIGhhcyBjaGFuZ2VkIGluIAo1LjE4IHNpbmNlIGNvbW1pdCAzZjM1ZDJjZjlmYmMg
KCJQQ0kvTVNJOiBEZWNvdXBsZSBNU0lbLVhdIGRpc2FibGUgZnJvbSAKcGNpbV9yZWxlYXNlKCki
KQoKSSBndWVzcyB0aGF0IGFsbCB0aGUgbWVjaGFuaWMgaXMgaW4gcGxhY2Ugc28gdGhhdCBldmVy
eXRoaW5nIGlzIApyZWdpc3RlcmVkIHdoZW4gbmVlZGVkLCBidXQgSSd2ZSBub3QgYmVlbiBhYmxl
IHRvIGZpZ3VyZSBpdCBvdXQgaW4gdGhlIApjYXNlIG9mIGR3bWFjLWludGVsLmMuCgpTbywgZG91
YmxlIGNoZWNrIDopLgoKQ0oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
