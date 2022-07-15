Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72357623D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:51:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0635C0D2BF;
	Fri, 15 Jul 2022 12:51:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 779B7C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657889515; x=1689425515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XsGDBcS88q7D9OrBG2oRt2Ha1lahH1bzbIJidg/N+fo=;
 b=eWWzAvckn+i2jyK1Y7hz/OoKNddfm+q5UPUREwcJyLLpgZBhR4JHaWtO
 U70MTrTIqD21meL+xx6cF7pj6QvwQEy+mkTCHmiuFil4KUNLCCIdRjWNr
 i5YpjYCKCG+CnuKCsYDUddwP7xGMExlMBgH/57jNkrg7RonUOynViwQ65
 ELe1Q0i8j3SYwa9zzSLdmQui3ck7c1Hjnl5ljc6Y0VWcu10RYvu50fjfz
 Nhu4QpjwrUmcvz86khUCYsDSgcZnkP9JihjBLpChw4YdkHI6ElI4mVdFB
 ZSrta0xxKk9L9lnLDUjAEQBfrzbcL3gqRTJ28tqIlv4LDqr6ZHFCX6i5J A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="349749157"
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="349749157"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 05:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="596459264"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 15 Jul 2022 05:51:53 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 11086580970;
 Fri, 15 Jul 2022 05:51:50 -0700 (PDT)
Date: Fri, 15 Jul 2022 20:51:48 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20220715125148.GA21603@linux.intel.com>
References: <20220228111558.3825974-1-vee.khee.wong@linux.intel.com>
 <20220302223248.2492658e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220302223248.2492658e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 pei.lee.ling@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Resolve poor line
 rate after switching from TSO off to TSO on
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

T24gV2VkLCBNYXIgMDIsIDIwMjIgYXQgMTA6MzI6NDhQTSAtMDgwMCwgSmFrdWIgS2ljaW5za2kg
d3JvdGU6Cj4gT24gTW9uLCAyOCBGZWIgMjAyMiAxOToxNTo1OCArMDgwMCBXb25nIFZlZSBLaGVl
IHdyb3RlOgo+ID4gRnJvbTogTGluZyBQZWkgTGVlIDxwZWkubGVlLmxpbmdAaW50ZWwuY29tPgo+
ID4gCj4gPiBTZXF1ZW50aWFsIGV4ZWN1dGlvbiBvZiB0aGVzZSBzdGVwczoKPiA+IGkpIFRTTyBP
TiDigJMgaXBlcmYzIGV4ZWN1dGlvbiwKPiA+IGlpKSBUU08gT0ZGIOKAkyBpcGVyZjMgZXhlY3V0
aW9uLAo+ID4gaWlpKSBUU08gT04g4oCTIGlwZXJmMyBleGVjdXRpb24sIGl0IGxlYWRzIHRvIGlw
ZXJmMyAwIGJ5dGVzIHRyYW5zZmVyLgo+IAo+IElNSE8gdGhlIGlwZXJmIG91dHB1dCBjYW4gYmUg
ZHJvcHBlZCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSwgCj4gaXQgZG9lc24ndCBhZGQgbXVjaCBi
ZXlvbmQgdGhpcyBkZXNjcmlwdGlvbi4KPgoKTm90ZWQuIFdpbGwgZHJvcCB0aG9zZSBvbiBuZXh0
IHJldmlzaW9uIG9mIHB1bGwgcmVxdWVzdC4KIAo+ID4gQ2xlYXIgbXNzIGluIFRERVMgYW5kIGNh
bGwgc3RtbWFjX2VuYWJsZV90c28oKSB0byBpbmRpY2F0ZQo+ID4gYSBuZXcgVFNPIHRyYW5zbWlz
c2lvbiB3aGVuIGl0IGlzIGVuYWJsZWQgZnJvbSBUU08gb2ZmIHVzaW5nCj4gPiBldGh0b29sIGNv
bW1hbmQKPiAKPiBIb3cgZG9lcyB0aGUgVFNPIGdldCBkaXNhYmxlZCBJIGRvbid0IHNlZSBhbnkg
Li4uZW5hYmxlX3RzbygsIDAsICkKPiBjYWxscyBpbiB0aGUgZHJpdmVyPyBBbmQgd2h5IGNhbGwg
ZW5hYmxlIGluIGZpeF9mZWF0dXJlcyByYXRoZXIgCj4gdGhhbiBzZXRfZmVhdHVyZXM/CgpJdCBp
cyBkaXNhYmxlIHdoZW4gJ3ByaXYtPnRzbyA9IDAnIGluIHRoaXMgc2FtZSBmdW5jdGlvbi4KVGhl
IHJlYXNvbiBJIHB1dCB0aGlzIGluIGZpeF9mZWF0dXJlcyByYXRoZXIgdGhhbiBzZXRfZmVhdHVy
ZXMgaXMKYmVjYXVzZSB0aGUgY29tbWl0IGY3NDhiZTUzMWQ3MCgic3RtbWFjOiBzdXBwb3J0IG5l
dyBHTUFDNCIpIGhhcwphbHJlYWR5IGludHJvZHVjZWQgdGhlIGZvbGxvd2luZyBjb2RlcyBpbiBm
aXhfZmVhdHVyZXM6LQoKKwkvKiBEaXNhYmxlIHRzbyBpZiBhc2tlZCBieSBldGh0b29sICovCisJ
aWYgKChwcml2LT5wbGF0LT50c29fZW4pICYmIChwcml2LT5kbWFfY2FwLnRzb2VuKSkgeworCQlp
ZiAoZmVhdHVyZXMgJiBORVRJRl9GX1RTTykKKwkJCXByaXYtPnRzbyA9IHRydWU7CisJCWVsc2UK
KwkJCXByaXYtPnRzbyA9IGZhbHNlOworCX0KCkJSLAogVmVlIEtoZWUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
