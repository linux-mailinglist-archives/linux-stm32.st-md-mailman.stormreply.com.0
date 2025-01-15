Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B0A11EEE
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 11:07:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43417C78F77;
	Wed, 15 Jan 2025 10:07:51 +0000 (UTC)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8943C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 10:07:43 +0000 (UTC)
Message-ID: <7b6acdc1-5151-427a-ac84-a6cb666f53ca@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736935663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ryMO4/DGARz6dpCLQgFlxwCCK8jbknJTAtU+Z1iluM=;
 b=sQ5UBkzG6Sa3qwVPFnRjJjSi78MlbdlIdHnotUb3Krv0djZP3ulfjNYrnAvnejXn9nljQU
 SvZ+0x2kBc/MdnUJ3aGiOIqMwLFJVYJUtFNSTWSgld9Cfw7zvgM3nDN7uL4BSNBcKXVIVO
 ZkT9vGUEOC1SEqDw/a7zktPocbQc8Pk=
Date: Wed, 15 Jan 2025 18:07:32 +0800
MIME-Version: 1.0
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1736910454.git.0x1207@gmail.com>
 <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] net: stmmac: Set
 page_pool_params.max_len to a precise size
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

5ZyoIDIwMjUvMS8xNSAxMToyNywgRnVyb25nIFh1IOWGmemBkzoKPiBETUEgZW5naW5lIHdpbGwg
YWx3YXlzIHdyaXRlIG5vIG1vcmUgdGhhbiBkbWFfYnVmX3N6IGJ5dGVzIG9mIGEgcmVjZWl2ZWQK
PiBmcmFtZSBpbnRvIGEgcGFnZSBidWZmZXIsIHRoZSByZW1haW5pbmcgc3BhY2VzIGFyZSB1bnVz
ZWQgb3IgdXNlZCBieSBDUFUKPiBleGNsdXNpdmVseS4KPiBTZXR0aW5nIHBhZ2VfcG9vbF9wYXJh
bXMubWF4X2xlbiB0byBhbG1vc3QgdGhlIGZ1bGwgc2l6ZSBvZiBwYWdlKHMpIGhlbHBzCj4gbm90
aGluZyBtb3JlLCBidXQgd2FzdGVzIG1vcmUgQ1BVIGN5Y2xlcyBvbiBjYWNoZSBtYWludGVuYW5j
ZS4KPiAKPiBGb3IgYSBzdGFuZGFyZCBNVFUgb2YgMTUwMCwgdGhlbiBkbWFfYnVmX3N6IGlzIGFz
c2lnbmVkIHRvIDE1MzYsIGFuZCB0aGlzCj4gcGF0Y2ggYnJpbmdzIH4xNi45JSBkcml2ZXIgcGVy
Zm9ybWFuY2UgaW1wcm92ZW1lbnQgaW4gYSBUQ1AgUlgKPiB0aHJvdWdocHV0IHRlc3Qgd2l0aCBp
UGVyZiB0b29sIG9uIGEgc2luZ2xlIGlzb2xhdGVkIENvcnRleC1BNjUgQ1BVCj4gY29yZSwgZnJv
bSAyLjQzIEdiaXRzL3NlYyBpbmNyZWFzZWQgdG8gMi44NCBHYml0cy9zZWMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRnVyb25nIFh1IDwweDEyMDdAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBBbGV4
YW5kZXIgTG9iYWtpbiA8YWxla3NhbmRlci5sb2Jha2luQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6
IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2PgoKVGhhbmtzLApZYW50ZW5nCgo+IC0t
LQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8
IDIgKy0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY194ZHAu
aCAgfCAxIC0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
