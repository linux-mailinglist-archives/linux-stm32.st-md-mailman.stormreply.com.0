Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAFCA2BFF9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 10:53:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D929C78F6D;
	Fri,  7 Feb 2025 09:53:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE758C78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738922037; x=1770458037;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hlTuVm1xxYrUR9UPnzCM2Z9PktNqKKSfUmGDWh3FPCs=;
 b=ZtMCQP2zVJd7TStLcvazeS7UXYwXLiJbcudTPCP2LeKlLVztsjxn/Jzs
 dwady7k4+RzzBkZTYrtIznikgZFYkAz92cHRx/WWR2USwLNQ/NMSu0/XX
 gXCuMmFoGxFXNCLmpKGBtqIVzDvS0aiP9d+oZIh9rirrUeQB+NNHkWlie
 UYNjnZwi5hvtbNqA+rMTQ/UnpGGSIHxvZMyt88ZCtMJkrGnm7NTLXvbqz
 UV2/X0NsMtj1hGDvy3/2496386lTxn0fjk45W6c0HRKcvA6fX3QW052XD
 /r3U8J6IAWaXTdiTClqem4d82bRl7R/KQIqBQ/l1kSlD+2Dsw8SO5FnC1 A==;
X-CSE-ConnectionGUID: hiqKuw0cRwaKsGg06NX6qg==
X-CSE-MsgGUID: 3daCv+VLS8+/fcH2T5Vajw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49800803"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="49800803"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:53:49 -0800
X-CSE-ConnectionGUID: WwnCJ8nBS7qhQMAwq3M/2g==
X-CSE-MsgGUID: wUf5a5DCSSSsebhSBlTGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112379199"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73])
 ([10.247.39.73])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:53:40 -0800
Message-ID: <ceb6cee6-9cfb-4363-9d23-dfd21f78d486@linux.intel.com>
Date: Fri, 7 Feb 2025 17:53:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-5-yong.liang.choong@linux.intel.com>
 <c15078bf-b6f3-5b4b-82ca-668d47168ce0@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <c15078bf-b6f3-5b4b-82ca-668d47168ce0@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 4/7] stmmac: intel: configure
 SerDes according to the interface mode
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

CgpPbiA2LzIvMjAyNSA5OjMxIHBtLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToKPj4gK3N0YXRpYyBp
bnQgaW50ZWxfdHNuX2xhbmVfaXNfYXZhaWxhYmxlKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2LAo+
PiArCQkJCSAgICAgICBzdHJ1Y3QgaW50ZWxfcHJpdl9kYXRhICppbnRlbF9wcml2KQo+PiArewo+
PiArCXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+PiArCXN0
cnVjdCBwbWNfaXBjX2NtZCB0bXAgPSB7fTsKPj4gKwl1MzIgcmJ1Zls0XSA9IHt9Owo+PiArCWlu
dCByZXQgPSAwLCBpLCBqOwo+PiArCWNvbnN0IGludCBtYXhfZmlhX3JlZ3MgPSA1Owo+PiArCj4+
ICsJdG1wLmNtZCA9IElQQ19TT0NfUkVHSVNURVJfQUNDRVNTOwo+PiArCXRtcC5zdWJfY21kID0g
SVBDX1NPQ19TVUJfQ01EX1JFQUQ7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgbWF4X2ZpYV9y
ZWdzOyBpKyspIHsKPiAKPiBVc3VhbGx5LCBkZWZpbmVzIGFyZSB1c2VkIGZvciB0cnVlIGNvbnN0
cy4KPiAKSGkgSWxwbywKVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBJIHVzZWQgY29uc3Qg
aW50IG1heF9maWFfcmVncyA9IDU7IHRvIGxldmVyYWdlIAp0eXBlIHNhZmV0eSBhbmQgc2NvcGUg
Y29udHJvbCBpbiBtb2Rlcm4gQy4gSG93ZXZlciwgSSB1bmRlcnN0YW5kIHRoYXQgCiNkZWZpbmUg
aXMgYSBjb21tb24gcHJhY3RpY2UuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgcHJlZmVyIEkg
c3dpdGNoIHRvIAojZGVmaW5lIGZvciBjb25zaXN0ZW5jeS4KCj4+ICtzdGF0aWMgaW50IGludGVs
X21hY19maW5pc2goc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsCj4+ICsJCQkgICAgdm9pZCAqaW50
ZWxfZGF0YSwKPj4gKwkJCSAgICB1bnNpZ25lZCBpbnQgbW9kZSwKPj4gKwkJCSAgICBwaHlfaW50
ZXJmYWNlX3QgaW50ZXJmYWNlKQo+PiArewo+PiArCXN0cnVjdCBpbnRlbF9wcml2X2RhdGEgKmlu
dGVsX3ByaXYgPSBpbnRlbF9kYXRhOwo+PiArCXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5l
dGRldl9wcml2KG5kZXYpOwo+PiArCWNvbnN0IHN0cnVjdCBwbWNfc2VyZGVzX3JlZ3MgKnJlZ3M7
Cj4+ICsJaW50IG1heF9yZWdzID0gMDsKPj4gKwlpbnQgcmV0ID0gMDsKPj4gKwo+PiArCXJldCA9
IGludGVsX3Rzbl9sYW5lX2lzX2F2YWlsYWJsZShuZGV2LCBpbnRlbF9wcml2KTsKPj4gKwlpZiAo
cmV0IDwgMCkgewo+PiArCQluZXRkZXZfaW5mbyhwcml2LT5kZXYsICJObyBUU04gbGFuZSBhdmFp
bGFibGUgdG8gc2V0IHRoZSByZWdpc3RlcnMuXG4iKTsKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9
Cj4+ICsKPj4gKwlpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV8yNTAwQkFTRVgp
IHsKPj4gKwkJcmVncyA9IGludGVsX3ByaXYtPnBpZF8ycDVnLnJlZ3M7Cj4+ICsJCW1heF9yZWdz
ID0gaW50ZWxfcHJpdi0+cGlkXzJwNWcubnVtX3JlZ3M7Cj4+ICsJfSBlbHNlIHsKPj4gKwkJcmVn
cyA9IGludGVsX3ByaXYtPnBpZF8xZy5yZWdzOwo+PiArCQltYXhfcmVncyA9IGludGVsX3ByaXYt
PnBpZF8xZy5udW1fcmVnczsKPj4gKwl9Cj4+ICsKPj4gKwlyZXQgPSBpbnRlbF9zZXRfcmVnX2Fj
Y2VzcyhyZWdzLCBtYXhfcmVncyk7Cj4+ICsJaWYgKHJldCA8IDApCj4+ICsJCXJldHVybiByZXQ7
Cj4gCj4gVGhpcyBsb29rcyBtdWNoIGNsZWFuZXIgbm93LCB0aGFua3MgdGhlIHVwZGF0ZS4KPiAK
PiBIb3dldmVyLCB0aGUgaW50ZWxfcHJpdiBmaWVsZHMgeW91IGludHJvZHVjZWQgYXJlIG5vdCBz
ZXR1cCB1bnRpbCBwYXRjaAo+IDYvNz8gV2lsbCB0aGlzIGNhdXNlIE5VTEwgcHRyIGRlcmVmIGlz
c3VlcyBpbiBiZXR3ZWVuIHRoZSB0d28gY2hhbmdlcz8gQnkKPiBpbnRyb2R1Y2luZyB0aGUgcmVn
IGFycmF5cyBpbiB0aGlzIHBhdGNoIGJ1dCBvbmx5IHVzZSB0aGVtIGFmdGVyIHBhdGNoIDYsCj4g
eW91J2xsIGFsc28gZ2V0IHVudXNlZCB2YXJpYWJsZSB3YXJuaW5ncyBvdXQgb2YgdGhlbSBpbiBi
ZXR3ZWVuIHRoZQo+IGNoYW5nZXMgd2hpY2ggaXMgdW5hY2NlcHRhYmxlLgo+IApUaGFuayB5b3Ug
Zm9yIHBvaW50aW5nIG91dCB0aGUgcG90ZW50aWFsIGlzc3VlcyB3aXRoIHRoZSBpbnRlbF9wcml2
IGZpZWxkcy4gCkkgd2lsbCBtb3ZlIHRoZSBjaGFuZ2VzIGZyb20gcGF0Y2ggNiBpbnRvIHRoaXMg
cGF0Y2ggdG8gYXZvaWQgTlVMTCBwb2ludGVyIApkZS1yZWZlcmVuY2UgaXNzdWVzIGFuZCB1bnVz
ZWQgdmFyaWFibGUgd2FybmluZ3MuIFRoaXMgd2lsbCBlbnN1cmUgCmV2ZXJ5dGhpbmcgaXMgcHJv
cGVybHkgc2V0IHVwIGFuZCB1c2VkIHdpdGhpbiB0aGUgc2FtZSBwYXRjaC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
