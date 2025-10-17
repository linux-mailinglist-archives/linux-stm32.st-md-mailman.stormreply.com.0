Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE609BE891D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 14:22:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0476EC59788;
	Fri, 17 Oct 2025 12:22:02 +0000 (UTC)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064AAC36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:22:00 +0000 (UTC)
Message-ID: <83ffc316-6711-4ae4-ad10-917f678de331@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1760703720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm4SvBhyBXqqMBUE8P86/UF8WP0RkuXkSVtcysJBKDc=;
 b=stBFIijknAIaQCktEObO1xPMD1ChASDC9VZojqVyFVrqnsIFbs9oq/ezFB8rp7D4w1ms5a
 Vbg5rmvsgtccQsQwbkSfu2j94pn4HRe+HSNysIhQlWvpzgObZQbA2RgkztsgdXWT/rNVjG
 GeBghovGgUutRQLjuvLSY6O44YANHWM=
Date: Fri, 17 Oct 2025 13:21:54 +0100
MIME-Version: 1.0
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

T24gMTcvMTAvMjAyNSAwODozNiwgRyBUaG9tYXMsIFJvaGFuIHdyb3RlOgo+IEhpIEFsbCwKPiAK
PiBPbiAxMC8xNy8yMDI1IDExOjQxIEFNLCBSb2hhbiBHIFRob21hcyB2aWEgQjQgUmVsYXkgd3Jv
dGU6Cj4+ICvCoMKgwqAgc2R1X2xlbiA9IHNrYi0+bGVuOwo+PiDCoMKgwqDCoMKgIC8qIENoZWNr
IGlmIFZMQU4gY2FuIGJlIGluc2VydGVkIGJ5IEhXICovCj4+IMKgwqDCoMKgwqAgaGFzX3ZsYW4g
PSBzdG1tYWNfdmxhbl9pbnNlcnQocHJpdiwgc2tiLCB0eF9xKTsKPj4gK8KgwqDCoCBpZiAoaGFz
X3ZsYW4pCj4+ICvCoMKgwqDCoMKgwqDCoCBzZHVfbGVuICs9IFZMQU5fSExFTjsKPj4gKwo+PiAr
wqDCoMKgIGlmIChwcml2LT5lc3QgJiYgcHJpdi0+ZXN0LT5lbmFibGUgJiYKPj4gK8KgwqDCoMKg
wqDCoMKgIHByaXYtPmVzdC0+bWF4X3NkdVtxdWV1ZV0gJiYKPj4gK8KgwqDCoMKgwqDCoMKgIHNr
Yi0+bGVuID4gcHJpdi0+ZXN0LT5tYXhfc2R1W3F1ZXVlXSl7Cj4gCj4gSSBqdXN0IG5vdGljZWQg
YW4gaXNzdWUgd2l0aCB0aGUgcmV3b3JrZWQgZml4IGFmdGVyIHNlbmRpbmcgdGhlIHBhdGNoLgo+
IFRoZSBjb25kaXRpb24gc2hvdWxkIGJlOiBzZHVfbGVuID4gcHJpdi0+ZXN0LT5tYXhfc2R1W3F1
ZXVlXQo+IAo+IEnigJlsbCBzZW5kIGEgY29ycmVjdGVkIHZlcnNpb24sIGFuZCB3aWxsIHdhaXQg
Zm9yIGFueSBhZGRpdGlvbmFsIGNvbW1lbnRzCj4gaW4gdGhlIG1lYW50aW1lLgoKV2VsbCwgZXZl
biB0aG91Z2ggaXQncyBhIGNvcHkgb2Ygb3JpZ2luYWwgY29kZSwgaXQgd291bGQgYmUgZ29vZCB0
bwppbXByb3ZlIHNvbWUgZm9ybWF0dGluZyBhbmQgYWRkIGEgc3BhY2UgYXQgdGhlIGVuZCBvZiBp
ZiBzdGF0ZW1lbnQgdG8KbWFrZSBpdCBsb29rIGxpa2UgJ2lmICgpIHsnPgo+PiArwqDCoMKgwqDC
oMKgwqAgcHJpdi0+eHN0YXRzLm1heF9zZHVfdHhxX2Ryb3BbcXVldWVdKys7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBnb3RvIG1heF9zZHVfZXJyOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBlbnRy
eSA9IHR4X3EtPmN1cl90eDsKPj4gwqDCoMKgwqDCoCBmaXJzdF9lbnRyeSA9IGVudHJ5Owo+Pgo+
IAo+IEJlc3QgUmVnYXJkcywKPiBSb2hhbgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
