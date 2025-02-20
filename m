Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC418A3CF5B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 03:29:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84991C78F6A;
	Thu, 20 Feb 2025 02:29:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0965EC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 02:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740018583; x=1771554583;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qHJy/wVMlxB0RzaDnffLNI7sYULYz+gIzJ4B57XyBGM=;
 b=KdT2bkXv0s75YLFwu+sh+jPfIvV7B2hsXUU7qDAgZDa/GNULENJLn84f
 D/l5pBX4NED1k2LUP3WTaX70aDpjS19u2vp+GDzedB7ntHmEZIOHHTaxT
 GnosskjKZjrbBAbxV4XgIEnNkFCCkb4PMDUDRRD6MT9M3WSmicOtRqxhm
 tL+DCQeUy3++k2iztGadX3s9qnZyKxflZlXIWczQIn21EnhIRM/FvWKHc
 UCEsR7gW24vHM+YsZtIhRChuwT3tTqrzhGdwD7EeyTGoSPj3lXLm8OCVm
 gYZDT8kNizBsGWy3+5zUcvh16guzu3/H3J/gL2WheFPmjOAxsm5+dKbO5 Q==;
X-CSE-ConnectionGUID: VlgFUFtvQpu0EX3LIV9jaA==
X-CSE-MsgGUID: hav2ByPOS5a9ia5RXmGFeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28378273"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="28378273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 18:29:41 -0800
X-CSE-ConnectionGUID: ZqGHmeIwRl65QQYDBiVAyw==
X-CSE-MsgGUID: 0W87J4dIQfylMzMyKIP0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="115572775"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67])
 ([10.247.53.67])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 18:29:34 -0800
Message-ID: <0307750b-dd98-4718-8c3c-928df6a80ef5@linux.intel.com>
Date: Thu, 20 Feb 2025 10:29:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david.e.box@linux.intel.com, Dave Hansen <dave.hansen@intel.com>,
 Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
 <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] arch: x86: add IPC
 mailbox accessor function and add SoC register access
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

CgpPbiAyMC8yLzIwMjUgMTowMSBhbSwgRGF2aWQgRS4gQm94IHdyb3RlOgo+IE9uIFRodSwgMjAy
NS0wMi0wNiBhdCAwODo0NiAtMDgwMCwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4+IE9uIDIvNi8yNSAw
NToxOCwgQ2hvb25nIFlvbmcgTGlhbmcgd3JvdGU6Cj4+Pgo+Pj4gLSBFeHBvcnRzIGludGVsX3Bt
Y19pcGMoKSBmb3IgaG9zdCBhY2Nlc3MgdG8gdGhlIFBNQyBJUEMgbWFpbGJveAo+Pj4gLSBBZGQg
c3VwcG9ydCB0byB1c2UgSVBDIGNvbW1hbmQgYWxsb3dzIGhvc3QgdG8gYWNjZXNzIFNvQyByZWdp
c3RlcnMKPj4+IHRocm91Z2ggUE1DIGZpcm13YXJlIHRoYXQgYXJlIG90aGVyd2lzZSBpbmFjY2Vz
c2libGUgdG8gdGhlIGhvc3QgZHVlCj4+PiB0byBzZWN1cml0eSBwb2xpY2llcy4KPj4gSSdtIG5v
dCBxdWl0ZSBwYXJzaW5nIHRoYXQgc2Vjb25kIGJ1bGxldCBhcyBhIGNvbXBsZXRlIHNlbnRlbmNl
Lgo+Pgo+PiBCdXQgdGhhdCBzb3VuZHMgc2NhcnkhIFdoeSBpcyB0aGUgZmFjdCB0aGF0IHRoZXkg
YXJlICJvdGhlcndpc2UKPj4gaW5hY2Nlc3NpYmxlIiByZWxldmFudCBoZXJlPwo+IAo+IFRoZSBQ
TUMgSVBDIG1haWxib3ggaXMgYSBob3N0IGludGVyZmFjZSB0byB0aGUgUE1DLiBJdHMgcHVycG9z
ZSBpcyB0byBhbGxvdyB0aGUKPiBob3N0IHRvIGFjY2VzcyBjZXJ0YWluIGFyZWFzIG9mIHRoZSBQ
TUMgdGhhdCBhcmUgcmVzdHJpY3RlZCBmcm9tIGRpcmVjdCBNTUlPCj4gYWNjZXNzIGR1ZSB0byBz
ZWN1cml0eSBwb2xpY2llcy4gT3RoZXIgcGFydHMgb2YgdGhlIFBNQyBhcmUgYWNjZXNzaWJsZSB2
aWEgTU1JTwo+IChtb3N0IG9mIHdoYXQgdGhlIGludGVsX3BtY19jb3JlIGRyaXZlciB0b3VjaGVz
IHdpdGggaXMgTU1JTyksIHNvIEkgdGhpbmsgdGhlCj4gb3JpZ2luYWwgc3RhdGVtZW50IHdhcyB0
cnlpbmcgdG8gZXhwbGFpbiB3aHkgdGhlIG1haWxib3ggaXMgbmVlZGVkIGluc3RlYWQgb2YKPiBN
TUlPIGluIHRoaXMgY2FzZS4gSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoZSBtZW50aW9uIG9mIHNl
Y3VyaXR5IHBvbGljaWVzIGlzIG5vdAo+IHJlbGV2YW50IHRvIHRoZSBjaGFuZ2UgaXRzZWxmLgo+
IAo+PiAuLi4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2Nv
bmZpZwo+Pj4gaW5kZXggODcxOThkOTU3ZTJmLi42MzFjMWYxMDc3NmMgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3g4Ni9LY29uZmlnCj4+PiArKysgYi9hcmNoL3g4Ni9LY29uZmlnCj4+PiBAQCAtNjg4
LDYgKzY4OCwxNSBAQCBjb25maWcgWDg2X0FNRF9QTEFURk9STV9ERVZJQ0UKPj4+ICDCoAnCoCBJ
MkMgYW5kIFVBUlQgZGVwZW5kIG9uIENPTU1PTl9DTEsgdG8gc2V0IGNsb2NrLiBHUElPIGRyaXZl
ciBpcwo+Pj4gIMKgCcKgIGltcGxlbWVudGVkIHVuZGVyIFBJTkNUUkwgc3Vic3lzdGVtLgo+Pj4g
ICAKPj4+ICtjb25maWcgSU5URUxfUE1DX0lQQwo+Pj4gKwl0cmlzdGF0ZSAiSW50ZWwgQ29yZSBT
b0MgUG93ZXIgTWFuYWdlbWVudCBDb250cm9sbGVyIElQQyBtYWlsYm94Igo+Pj4gKwlkZXBlbmRz
IG9uIEFDUEkKPj4+ICsJaGVscAo+Pj4gKwnCoCBUaGlzIG9wdGlvbiBlbmFibGVzIHNpZGViYW5k
IHJlZ2lzdGVyIGFjY2VzcyBzdXBwb3J0IGZvciBJbnRlbAo+Pj4gU29DCj4+PiArCcKgIHBvd2Vy
IG1hbmFnZW1lbnQgY29udHJvbGxlciBJUEMgbWFpbGJveC4KPj4+ICsKPj4+ICsJwqAgSWYgeW91
IGRvbid0IHJlcXVpcmUgdGhlIG9wdGlvbiBvciBhcmUgaW4gZG91YnQsIHNheSBOLgo+Pgo+PiBD
b3VsZCB3ZSBwZXJoYXBzIGJlZWYgdGhpcyB1cCBhIGJpdCB0byBoZWxwIHVzZXJzIGZpZ3VyZSBv
dXQgaWYgdGhleQo+PiB3YW50IHRvIHR1cm4gdGhpcyBvbj8gUmVhbGx5IHRoZSBvbmx5IHdvcmQg
aW4gdGhlIGVudGlyZSBoZWxwIHRleHQKPj4gdGhhdCdzIHVzZWZ1bCBpcyAiSW50ZWwiLgo+Pgo+
PiBJJ20gbm90IGV2ZW4gc3VyZSB3ZSAqd2FudCogdG8gZXhwb3NlIHRoaXMgdG8gdXNlcnMuIENh
biB3ZSBqdXN0IGxlYXZlCj4+IGl0IGFzOgo+Pgo+PiAJY29uZmlnIElOVEVMX1BNQ19JUEMKPj4g
CQlkZWZfdHJpc3RhdGUgbgo+PiAJCWRlcGVuZHMgb24gQUNQSQo+Pgo+PiBzbyB0aGF0IGl0IG9u
bHkgZ2V0cyBlbmFibGVkIGJ5IHRoZSAic2VsZWN0IiBpbiB0aGUgb3RoZXIgcGF0Y2hlcz8KPiAK
PiBJIGFncmVlIHdpdGggdGhpcyBjaGFuZ2UgQ2hvb25nLiBUaGlzIGNhbiBiZSBzZWxlY3RlZCBi
eSB0aGUgZHJpdmVyIHRoYXQncyB1c2luZwo+IGl0LiBUaGVyZSdzIG5vIG5lZWQgdG8gZXhwb3Nl
IGl0IHRvIHVzZXJzLgo+IAo+Pgo+Pj4gKyAqIEF1dGhvcnM6IENob29uZyBZb25nIExpYW5nIDx5
b25nLmxpYW5nLmNob29uZ0BsaW51eC5pbnRlbC5jb20+Cj4+PiArICrCoMKgwqDCoMKgwqDCoMKg
wqAgRGF2aWQgRS4gQm94IDxkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IEknZCBw
cm9iYWJseSBqdXN0IGxlYXZlIHRoZSBhdXRob3JzIGJpdCBvdXQuIEl0IG1pZ2h0IGhhdmUgYmVl
biB1c2VmdWwKPj4gaW4gdGhlIDkwJ3MsIGJ1dCB0aGF0J3Mgd2hhdCBnaXQgaXMgZm9yIHRvZGF5
Lgo+Pgo+Pj4gKwlvYmogPSBidWZmZXIucG9pbnRlcjsKPj4+ICsJLyogQ2hlY2sgaWYgdGhlIG51
bWJlciBvZiBlbGVtZW50cyBpbiBwYWNrYWdlIGlzIDUgKi8KPj4+ICsJaWYgKG9iaiAmJiBvYmot
PnR5cGUgPT0gQUNQSV9UWVBFX1BBQ0tBR0UgJiYgb2JqLT5wYWNrYWdlLmNvdW50ID09Cj4+PiA1
KSB7Cj4+PiArCQljb25zdCB1bmlvbiBhY3BpX29iamVjdCAqb2JqcyA9IG9iai0+cGFja2FnZS5l
bGVtZW50czsKPj4+ICsKPj4KPj4gVGhlIGNvbW1lbnQgdGhlcmUgaXMganVzdCBub3Qgc3VwZXIg
dXNlZnVsLiBJdCBtaWdodCBiZSB1c2VmdWwgdG8gc2F5Cj4+ICp3aHkqIHRoZSBudW1iZXIgb2Yg
ZWxlbWVudHMgbmVlZHMgdG8gYmUgNS4KPj4KPj4+ICtFWFBPUlRfU1lNQk9MKGludGVsX3BtY19p
cGMpOwo+Pj4gKwo+Pj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPj4+ICtNT0RVTEVfREVTQ1JJ
UFRJT04oIkludGVsIFBNQyBJUEMgTWFpbGJveCBhY2Nlc3NvciIpOwo+Pgo+PiBIb25lc3RseSwg
aXMgdGhpcyBldmVuIHdvcnRoIGJlaW5nIGEgbW9kdWxlPyBIb3cgbXVjaCBjb2RlIGFyZSB3ZQo+
PiB0YWxraW5nIGFib3V0IGhlcmU/Cj4gCj4gWWVhaCwgdGhpcyBkb2Vzbid0IG5lZWQgdG8gYmUg
YSBtb2R1bGUgZWl0aGVyLgo+IAo+IERhdmlkCj4gCgpIaSBEYXZpZCwKClRoYW5rIHlvdSBmb3Ig
dGhlIGNvbmZpcm1hdGlvbi4KTGV0J3Mgd29yayB0b2dldGhlciB0byBhZGRyZXNzIHRoZSBjb21t
ZW50cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
