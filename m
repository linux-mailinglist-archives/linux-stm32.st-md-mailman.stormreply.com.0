Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E396A3C60E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 18:22:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AC33C78F99;
	Wed, 19 Feb 2025 17:22:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1C8EC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739985772; x=1771521772;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=akhUxN+QxLEckZcxCpguN5EnjkBnD9oRnQSuFZ8ZKSM=;
 b=Lq0NYxHbRL5TyTSwIRXXPuP6yd5b4XjiMXlip7bkJrv7BLhccPBs1MwB
 OgT2pk6uI9wnParTr02Y7lF1q6HC0wBvnzkgklkcCECJExlfRejEAIjG8
 ioYB5jZ0moFZUnxND1ddn+5HPy9e9GwgcHvWrXlrphj0gGgTSnP/epQpl
 G8HXXNLSidkF62Orst+g3FuE9vHe+oTjesA7o77pwtAaIcXTWQnFivoOD
 6htzODSfVhjPZTvGvphVf9BKAxc9v8PMz0SbWth5Q4H8BwgtAsNX+pNBa
 O+X1sw4zHTrUgAq2OsPQH/6o4YWLfactnJUrc/APFwh/mAEKx4W09J8DJ A==;
X-CSE-ConnectionGUID: 1aRBxdpGQ/CfLm20kewHZQ==
X-CSE-MsgGUID: tiUpmlQSQpiNnTc4m4zq3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51354822"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="51354822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:22:49 -0800
X-CSE-ConnectionGUID: BRlidm1zTwmv/BO/vvlzuA==
X-CSE-MsgGUID: PHqqdaA9SB2DY4ysxBUtAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="115432705"
Received: from iherna2-mobl4.amr.corp.intel.com ([10.125.110.29])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:01:22 -0800
Message-ID: <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
From: "David E. Box" <david.e.box@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Simon Horman <horms@kernel.org>, Jose
 Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Rajneesh Bhardwaj
 <irenic.rajneesh@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Richard Cochran
 <richardcochran@gmail.com>, Serge Semin <fancer.lancer@gmail.com>
Date: Wed, 19 Feb 2025 09:01:20 -0800
In-Reply-To: <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
Organization: David E. Box
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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
Reply-To: david.e.box@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCAyMDI1LTAyLTA2IGF0IDA4OjQ2IC0wODAwLCBEYXZlIEhhbnNlbiB3cm90ZToKPiBP
biAyLzYvMjUgMDU6MTgsIENob29uZyBZb25nIExpYW5nIHdyb3RlOgo+ID4gCj4gPiAtIEV4cG9y
dHMgaW50ZWxfcG1jX2lwYygpIGZvciBob3N0IGFjY2VzcyB0byB0aGUgUE1DIElQQyBtYWlsYm94
Cj4gPiAtIEFkZCBzdXBwb3J0IHRvIHVzZSBJUEMgY29tbWFuZCBhbGxvd3MgaG9zdCB0byBhY2Nl
c3MgU29DIHJlZ2lzdGVycyAKPiA+IHRocm91Z2ggUE1DIGZpcm13YXJlIHRoYXQgYXJlIG90aGVy
d2lzZSBpbmFjY2Vzc2libGUgdG8gdGhlIGhvc3QgZHVlCj4gPiB0byBzZWN1cml0eSBwb2xpY2ll
cy4KPiBJJ20gbm90IHF1aXRlIHBhcnNpbmcgdGhhdCBzZWNvbmQgYnVsbGV0IGFzIGEgY29tcGxl
dGUgc2VudGVuY2UuCj4gCj4gQnV0IHRoYXQgc291bmRzIHNjYXJ5ISBXaHkgaXMgdGhlIGZhY3Qg
dGhhdCB0aGV5IGFyZSAib3RoZXJ3aXNlCj4gaW5hY2Nlc3NpYmxlIiByZWxldmFudCBoZXJlPwoK
VGhlIFBNQyBJUEMgbWFpbGJveCBpcyBhIGhvc3QgaW50ZXJmYWNlIHRvIHRoZSBQTUMuIEl0cyBw
dXJwb3NlIGlzIHRvIGFsbG93IHRoZQpob3N0IHRvIGFjY2VzcyBjZXJ0YWluIGFyZWFzIG9mIHRo
ZSBQTUMgdGhhdCBhcmUgcmVzdHJpY3RlZCBmcm9tIGRpcmVjdCBNTUlPCmFjY2VzcyBkdWUgdG8g
c2VjdXJpdHkgcG9saWNpZXMuIE90aGVyIHBhcnRzIG9mIHRoZSBQTUMgYXJlIGFjY2Vzc2libGUg
dmlhIE1NSU8KKG1vc3Qgb2Ygd2hhdCB0aGUgaW50ZWxfcG1jX2NvcmUgZHJpdmVyIHRvdWNoZXMg
d2l0aCBpcyBNTUlPKSwgc28gSSB0aGluayB0aGUKb3JpZ2luYWwgc3RhdGVtZW50IHdhcyB0cnlp
bmcgdG8gZXhwbGFpbiB3aHkgdGhlIG1haWxib3ggaXMgbmVlZGVkIGluc3RlYWQgb2YKTU1JTyBp
biB0aGlzIGNhc2UuIEhvd2V2ZXIsIEkgYWdyZWUgdGhhdCB0aGUgbWVudGlvbiBvZiBzZWN1cml0
eSBwb2xpY2llcyBpcyBub3QKcmVsZXZhbnQgdG8gdGhlIGNoYW5nZSBpdHNlbGYuCgo+IC4uLgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4gPiBp
bmRleCA4NzE5OGQ5NTdlMmYuLjYzMWMxZjEwNzc2YyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2
L0tjb25maWcKPiA+ICsrKyBiL2FyY2gveDg2L0tjb25maWcKPiA+IEBAIC02ODgsNiArNjg4LDE1
IEBAIGNvbmZpZyBYODZfQU1EX1BMQVRGT1JNX0RFVklDRQo+ID4gwqAJwqAgSTJDIGFuZCBVQVJU
IGRlcGVuZCBvbiBDT01NT05fQ0xLIHRvIHNldCBjbG9jay4gR1BJTyBkcml2ZXIgaXMKPiA+IMKg
CcKgIGltcGxlbWVudGVkIHVuZGVyIFBJTkNUUkwgc3Vic3lzdGVtLgo+ID4gwqAKPiA+ICtjb25m
aWcgSU5URUxfUE1DX0lQQwo+ID4gKwl0cmlzdGF0ZSAiSW50ZWwgQ29yZSBTb0MgUG93ZXIgTWFu
YWdlbWVudCBDb250cm9sbGVyIElQQyBtYWlsYm94Igo+ID4gKwlkZXBlbmRzIG9uIEFDUEkKPiA+
ICsJaGVscAo+ID4gKwnCoCBUaGlzIG9wdGlvbiBlbmFibGVzIHNpZGViYW5kIHJlZ2lzdGVyIGFj
Y2VzcyBzdXBwb3J0IGZvciBJbnRlbAo+ID4gU29DCj4gPiArCcKgIHBvd2VyIG1hbmFnZW1lbnQg
Y29udHJvbGxlciBJUEMgbWFpbGJveC4KPiA+ICsKPiA+ICsJwqAgSWYgeW91IGRvbid0IHJlcXVp
cmUgdGhlIG9wdGlvbiBvciBhcmUgaW4gZG91YnQsIHNheSBOLgo+IAo+IENvdWxkIHdlIHBlcmhh
cHMgYmVlZiB0aGlzIHVwIGEgYml0IHRvIGhlbHAgdXNlcnMgZmlndXJlIG91dCBpZiB0aGV5Cj4g
d2FudCB0byB0dXJuIHRoaXMgb24/IFJlYWxseSB0aGUgb25seSB3b3JkIGluIHRoZSBlbnRpcmUg
aGVscCB0ZXh0Cj4gdGhhdCdzIHVzZWZ1bCBpcyAiSW50ZWwiLgo+IAo+IEknbSBub3QgZXZlbiBz
dXJlIHdlICp3YW50KiB0byBleHBvc2UgdGhpcyB0byB1c2Vycy4gQ2FuIHdlIGp1c3QgbGVhdmUK
PiBpdCBhczoKPiAKPiAJY29uZmlnIElOVEVMX1BNQ19JUEMKPiAJCWRlZl90cmlzdGF0ZSBuCj4g
CQlkZXBlbmRzIG9uIEFDUEkKPiAKPiBzbyB0aGF0IGl0IG9ubHkgZ2V0cyBlbmFibGVkIGJ5IHRo
ZSAic2VsZWN0IiBpbiB0aGUgb3RoZXIgcGF0Y2hlcz8KCkkgYWdyZWUgd2l0aCB0aGlzIGNoYW5n
ZSBDaG9vbmcuIFRoaXMgY2FuIGJlIHNlbGVjdGVkIGJ5IHRoZSBkcml2ZXIgdGhhdCdzIHVzaW5n
Cml0LiBUaGVyZSdzIG5vIG5lZWQgdG8gZXhwb3NlIGl0IHRvIHVzZXJzLgoKPiAKPiA+ICsgKiBB
dXRob3JzOiBDaG9vbmcgWW9uZyBMaWFuZyA8eW9uZy5saWFuZy5jaG9vbmdAbGludXguaW50ZWwu
Y29tPgo+ID4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgIERhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hA
bGludXguaW50ZWwuY29tPgo+IAo+IEknZCBwcm9iYWJseSBqdXN0IGxlYXZlIHRoZSBhdXRob3Jz
IGJpdCBvdXQuIEl0IG1pZ2h0IGhhdmUgYmVlbiB1c2VmdWwKPiBpbiB0aGUgOTAncywgYnV0IHRo
YXQncyB3aGF0IGdpdCBpcyBmb3IgdG9kYXkuCj4gCj4gPiArCW9iaiA9IGJ1ZmZlci5wb2ludGVy
Owo+ID4gKwkvKiBDaGVjayBpZiB0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIGluIHBhY2thZ2UgaXMg
NSAqLwo+ID4gKwlpZiAob2JqICYmIG9iai0+dHlwZSA9PSBBQ1BJX1RZUEVfUEFDS0FHRSAmJiBv
YmotPnBhY2thZ2UuY291bnQgPT0KPiA+IDUpIHsKPiA+ICsJCWNvbnN0IHVuaW9uIGFjcGlfb2Jq
ZWN0ICpvYmpzID0gb2JqLT5wYWNrYWdlLmVsZW1lbnRzOwo+ID4gKwo+IAo+IFRoZSBjb21tZW50
IHRoZXJlIGlzIGp1c3Qgbm90IHN1cGVyIHVzZWZ1bC4gSXQgbWlnaHQgYmUgdXNlZnVsIHRvIHNh
eQo+ICp3aHkqIHRoZSBudW1iZXIgb2YgZWxlbWVudHMgbmVlZHMgdG8gYmUgNS4KPiAKPiA+ICtF
WFBPUlRfU1lNQk9MKGludGVsX3BtY19pcGMpOwo+ID4gKwo+ID4gK01PRFVMRV9MSUNFTlNFKCJH
UEwiKTsKPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkludGVsIFBNQyBJUEMgTWFpbGJveCBhY2Nl
c3NvciIpOwo+IAo+IEhvbmVzdGx5LCBpcyB0aGlzIGV2ZW4gd29ydGggYmVpbmcgYSBtb2R1bGU/
IEhvdyBtdWNoIGNvZGUgYXJlIHdlCj4gdGFsa2luZyBhYm91dCBoZXJlPwoKWWVhaCwgdGhpcyBk
b2Vzbid0IG5lZWQgdG8gYmUgYSBtb2R1bGUgZWl0aGVyLgoKRGF2aWQKCj4gCj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4Ni9pbnRlbF9wbWNfaXBjLmgKPiA+
IGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4Ni9pbnRlbF9wbWNfaXBjLmgKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ0N2I4OWY4NzNmYwo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4
Ni9pbnRlbF9wbWNfaXBjLmgKPiA+IEBAIC0wLDAgKzEsMzQgQEAKPiA+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ID4gKy8qCj4gPiArICogSW50ZWwgQ29yZSBTb0Mg
UG93ZXIgTWFuYWdlbWVudCBDb250cm9sbGVyIEhlYWRlciBGaWxlCj4gPiArICoKPiA+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMjMsIEludGVsIENvcnBvcmF0aW9uLgo+ID4gKyAqIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCj4gLi4uCj4gCj4gVGhpcyBjb3B5cmlnaHQgaXMgYSBfYml0XyBmdW5reS4gSXQn
cyB3b3J0aCBhdCBsZWFzdCBzYXlpbmcgaW4gdGhlIGNvdmVyCj4gbGV0dGVyIHRoYXQgdGhpcyBw
YXRjaCBoYXMgYmVlbiBzaXR0aW5nIHVudG91Y2hlZCBmb3Igb3ZlciBhIHllYXIsIHRodXMKPiB0
aGUgb2xkIGNvcHlyaWdodC4KPiAKPiBPciwgaWYgeW91J3ZlIGRvbmUgYWN0dWFsIHdvcmsgd2l0
aCBpdCwgSSdkIGFzc3VtZSB0aGUgY29weXJpZ2h0IG5lZWRzCj4gdG8gZ2V0IHVwZGF0ZWQuCj4g
Cj4gPiArc3RydWN0IHBtY19pcGNfY21kIHsKPiA+ICsJdTMyIGNtZDsKPiA+ICsJdTMyIHN1Yl9j
bWQ7Cj4gPiArCXUzMiBzaXplOwo+ID4gKwl1MzIgd2J1Zls0XTsKPiA+ICt9Owo+ID4gKwo+ID4g
Ky8qKgo+ID4gKyAqIGludGVsX3BtY19pcGMoKSAtIFBNQyBJUEMgTWFpbGJveCBhY2Nlc3Nvcgo+
ID4gKyAqIEBpcGNfY21kOsKgIHN0cnVjdCBwbWNfaXBjX2NtZCBwcmVwYXJlZCB3aXRoIGlucHV0
IHRvIHNlbmQKPiAKPiBZb3UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0byByZXN0YXRlIHRoZSBsaXRl
cmFsIHR5cGUgb2YgaXBjX2NtZC4KPiAKPiA+ICsgKiBAcmJ1ZjrCoMKgwqDCoCBBbGxvY2F0ZWQg
dTMyWzRdIGFycmF5IGZvciByZXR1cm5lZCBJUEMgZGF0YQo+IAo+IFRoZSAiQWxsb2NhdGVkIiB0
aGluZyBoZXJlIHRocmV3IG1lIGEgYml0LiBEb2VzIHRoaXMgbWVhbiBpdCAqbXVzdCogYmUKPiAi
YWxsb2NhdGVkIiBhcyBpbiBpdCBjb21lcyBmcm9tIGttYWxsb2MoKT8gT3IgY2FuIGl0IGJlIG9u
IHRoZSBzdGFjaz8gT3IKPiBwYXJ0IG9mIGEgc3RhdGljIHZhcmlhYmxlPwo+IAo+ID4gKyAqIFJl
dHVybjogMCBvbiBzdWNjZXNzLiBOb24temVybyBvbiBtYWlsYm94IGVycm9yCj4gPiArICovCj4g
PiAraW50IGludGVsX3BtY19pcGMoc3RydWN0IHBtY19pcGNfY21kICppcGNfY21kLCB1MzIgKnJi
dWYpOwo+IAo+IEFsc28sIGlmIGl0IGNhbiAqb25seSogYmUgdTMyWzRdLCB0aGVuIHRoZSBiZXN0
IHdheSB0byBkZWNsYXJlIGl0IGlzOgo+IAo+IHN0cnVjdCBwbWNfaXBjX3JidWYgewo+IAl1MzIg
YnVmWzRdOwo+IH07Cj4gCj4gYW5kOgo+IAo+IGludCBpbnRlbF9wbWNfaXBjKHN0cnVjdCBwbWNf
aXBjX2NtZCAqaXBjX2NtZCwKPiAJCcKgIHN0cnVjdCBwbWNfaXBjX3JidWYgcmJ1ZiAqcmJ1Zik7
Cj4gCj4gVGhlbiB5b3UgZG9uJ3QgbmVlZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgaXQgbXVzdCBi
ZSBhIHUzMls0XS4gSXQncwo+IGltcGxpZWQgaW4gdGhlIHN0cnVjdHVyZS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
