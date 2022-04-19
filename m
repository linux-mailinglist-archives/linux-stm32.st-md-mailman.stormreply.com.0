Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F350E615
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 023D2C628B4;
	Mon, 25 Apr 2022 16:45:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBBC8C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 00:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650329668; x=1681865668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bIElZ/ONSNAGuUnukdJ+HAUfMCgaREX0brCFR/k/fuk=;
 b=ehHGhJ/SumAPDz4GjrzAzjfpro5fJbp2vx8eio+xDBg1DMTjKPiIYKh0
 WwpgspHArBOzKyO2KnELsAvsjrd927wPQYYUwrq9V9bTPUZCvKeyZXkZu
 yIm0FnUuskOAOvyjFjZ/YTWQFzwfzPib9RTfAM9tHoHugxxYozqmSiH90
 lb0sZB6Ruk1NM/29GwPyPXQQUrVcv1uMcPVGE5t0PIwSWfWB34qYx4CQ6
 Y7qfxsK661BspvemeDDZSWZAzsJZ2lBVHUgnvySaVfeaBcyw7W0MwIu6P
 6favqpIJBeu1a7qYqsIg1eXQFLJk1QvT4gn8rOuBMw5VWVQC09x8RvQoC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="326543693"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; d="scan'208";a="326543693"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 17:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; d="scan'208";a="554472469"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 18 Apr 2022 17:54:23 -0700
Received: from linux.intel.com (ssid-ilbpg3-teeminta.png.intel.com
 [10.88.227.74])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 66F865808AE;
 Mon, 18 Apr 2022 17:54:19 -0700 (PDT)
Date: Tue, 19 Apr 2022 08:52:20 +0800
From: Tan Tee Min <tee.min.tan@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20220419005220.GA17634@linux.intel.com>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
 <20220414072934.GA10025@linux.intel.com>
 <20220414104259.0b928249@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414104259.0b928249@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMTA6NDI6NTlBTSArMDIwMCwgSmFrdWIgS2ljaW5za2kg
d3JvdGU6Cj4gT24gVGh1LCAxNCBBcHIgMjAyMiAxNToyOTozNCArMDgwMCBUYW4gVGVlIE1pbiB3
cm90ZToKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYzRfZGVzY3MuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjNF9kZXNjcy5jCj4gPiA+ID4gQEAgLTI3OSwxMCArMjc5LDExIEBAIHN0YXRp
YyBpbnQgZHdtYWM0X3dyYmFja19nZXRfcnhfdGltZXN0YW1wX3N0YXR1cyh2b2lkICpkZXNjLCB2
b2lkICpuZXh0X2Rlc2MsCj4gPiA+ID4gIAkJCS8qIENoZWNrIGlmIHRpbWVzdGFtcCBpcyBPSyBm
cm9tIGNvbnRleHQgZGVzY3JpcHRvciAqLwo+ID4gPiA+ICAJCQlkbyB7Cj4gPiA+ID4gIAkJCQly
ZXQgPSBkd21hYzRfcnhfY2hlY2tfdGltZXN0YW1wKG5leHRfZGVzYyk7Cj4gPiA+ID4gLQkJCQlp
ZiAocmV0IDwgMCkKPiA+ID4gPiArCQkJCWlmIChyZXQgPD0gMCkKPiA+ID4gPiAgCQkJCQlnb3Rv
IGV4aXQ7Cj4gPiA+ID4gIAkJCQlpKys7Cj4gPiA+ID4gIAo+ID4gPiA+ICsJCQkJZnNsZWVwKDEp
OyAgCj4gPiA+IAo+ID4gPiBUaGlzIGlzIG51dHR5LiAgV2h5IGlzbid0IHRoaXMgY29kZSB1c2lu
ZyBwcm9wZXIgZGVmZXJyYWwgbWVjaGFuaXNtcwo+ID4gPiBsaWtlIHdvcmsgb3Iga3RocmVhZD8g
IAo+ID4gCj4gPiBBcHByZWNpYXRlIHlvdXIgY29tbWVudC4KPiA+IFRoZSBkd21hYzRfd3JiYWNr
X2dldF9yeF90aW1lc3RhbXBfc3RhdHVzKCkgaXMgY2FsbGVkIGJ5IHN0bW1hY19yeCgpCj4gPiBm
dW5jdGlvbiB3aGljaCBpcyBzY2hlZHVsZWQgYnkgTkFQSSBmcmFtZXdvcmsuCj4gPiBEbyB3ZSBz
dGlsbCBuZWVkIHRvIGNyZWF0ZSBkZWZlcnJlZCB3b3JrIGluc2lkZSBOQVBJIHdvcms/Cj4gPiBX
b3VsZCB5b3UgbWluZCB0byBleHBsYWluIGl0IG1vcmUgaW4gZGV0YWlsPwo+IAo+IGZzbGVlcCgp
IGlzIGEgYmlnIGhhbW1lciwgY2FuIHlvdSB0cnkgY3B1X3JlbGF4KCkgYW5kIGJ1bXBpbmcgdGhl
IG1heAo+IGxvb3AgY291bnQgYSBsaXR0bGU/CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIQpJ
IHRyaWVkIGNwdV9yZWxheCgpLCB1bmZvcnR1bmF0ZWx5IHRoZSBpc3N1ZSBzdGlsbCBoYXBwZW5z
IHdoZW4KdGhlIHN5c3RlbSBpcyBpbiBhIGhpZ2gtbG9hZCBzaXR1YXRpb24uCgpJIGFncmVlIHRo
YXQgdGhlIGZzbGVlcCgxKSAoPTF1cykgaXMgYSBiaWcgaGFtbWVyLgpUaHVzIGluIG9yZGVyIHRv
IGltcHJvdmUgdGhpcywgSeKAmXZlIGZpZ3VyZWQgb3V0IGEgc21hbGxlciBkZWxheQp0aW1lIHRo
YXQgaXMgZW5vdWdoIGZvciB0aGUgY29udGV4dCBkZXNjcmlwdG9yIHRvIGJlIHJlYWR5IHdoaWNo
CmlzIG5kZWxheSg1MDApICg9NTAwbnMpLgoKV291bGQgeW91IHRoaW5rIHRoaXMgaXMgbW9yZSBh
Y2NlcHRhYmxlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
