Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B311A55FFA
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 06:29:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C9A4C78F87;
	Fri,  7 Mar 2025 05:29:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 371BCC78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 05:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741325340; x=1772861340;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E2Y/GlpLCkl4xHcskn4WALbBs9h6FoTrMIP+94YBi9M=;
 b=ET11g9Is2pj2hrxcK2Tmkzbsxgssor/VVjWmEMQ63919U4wJxe5/Haxc
 npoClKM2BNzCRBL3BtD2oSOegUfhOIM7dC5znZFtN3fQanYUjD66cy1OT
 zu94EAqDBPTggtnxK5jWWnh7Ghx4PTvwmN7bmgArIIth8NkzRS12kOJYt
 Dsck9Jf2D/RorC20DWb8JWUCXQVIZx1LqQuDLKoJctRawwBQ/w8Bw26wL
 rnPbSJ/7rNONOggZ8KYgxE9uj+AHLAqYBIpm0FxVNu7oxRKn9doczLHde
 2A//PmNm82dqOHPSl+HdagBVeCaiQnQ7HnoDoQ7ujyk+nzcEA00CgIgWw w==;
X-CSE-ConnectionGUID: 65ZGpW0tQaSkFtoativ5eQ==
X-CSE-MsgGUID: iT7r2N1pTTOQ+HM17xV0Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46142881"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="46142881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:28:57 -0800
X-CSE-ConnectionGUID: Gav6l5ujTTC3cGO4QrwZ5w==
X-CSE-MsgGUID: +DtmNiMrS1qMuYKKWLnO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="124261411"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67])
 ([10.247.53.67])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:28:49 -0800
Message-ID: <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
Date: Fri, 7 Mar 2025 13:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david.e.box@linux.intel.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
 <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, "H . Peter Anvin" <hpa@zytor.com>,
 linux-stm32@st-md-mailman.stormreply.com, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v9 5/6] net: stmmac: configure
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

CgpPbiA3LzMvMjAyNSA0OjUyIGFtLCBEYXZpZCBFLiBCb3ggd3JvdGU6Cj4gT24gVGh1LCAyMDI1
LTAzLTA2IGF0IDIwOjU2ICswODAwLCBDaG9vbmcgWW9uZyBMaWFuZyB3cm90ZToKPj4KPj4KPj4g
T24gNi8zLzIwMjUgNTowNSBwbSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4gT24gVGh1LCBN
YXIgNiwgMjAyNSBhdCAxMDozOeKAr0FNIENob29uZyBZb25nIExpYW5nCj4+PiA8eW9uZy5saWFu
Zy5jaG9vbmdAbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4+PiBPbiA2LzMvMjAyNSAzOjE1IHBt
LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+Pj4+IFRodSwgRmViIDI3LCAyMDI1IGF0IDA4OjE1
OjIxUE0gKzA4MDAsIENob29uZyBZb25nIExpYW5nIGtpcmpvaXR0aToKPj4+IC4uLgo+Pj4KPj4+
Pj4+IGNvbmZpZyBEV01BQ19JTlRFTAo+Pj4+Pj4gIMKgwqDCoMKgwqAgZGVmYXVsdCBYODYKPj4+
Pj4+ICDCoMKgwqDCoMKgIGRlcGVuZHMgb24gWDg2ICYmIFNUTU1BQ19FVEggJiYgUENJCj4+Pj4+
PiAgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPj4+Pj4+ICvCoMKgwqAgZGVwZW5k
cyBvbiBBQ1BJCj4+Pj4+IFN0cmF5IGFuZCB1bmV4cGxhaW5lZCBjaGFuZ2UuIFBsZWFzZSwgZml4
IGl0LiBXZSBkb24ndCBuZWVkIHRoZQo+Pj4+PiBkZXBlbmRlbmNpZXMKPj4+Pj4gd2hpY2ggYXJl
IG5vdCByZWFsaXNlZCBpbiB0aGUgY29tcGlsZSB0aW1lLgo+Pj4+IFRoZSBkZXBlbmRlbmN5IG9u
IEFDUEkgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlIGludGVsX3BtY19pcGMuaCBoZWFkZXIKPj4+
PiByZWxpZXMgb24gQUNQSSBmdW5jdGlvbmFsaXR5IHRvIGludGVyYWN0IHdpdGggdGhlIEludGVs
IFBNQy4KPj4+IFNvLCB0aGF0IGhlYWRlciBoYXMgdG8gYmUgZml4ZWQgYXMgQUNQSSBoZXJlIGlz
IHJlYWxseSB1bm5lZWRlZAo+Pj4gZGVwZW5kZW5jeSBmb3IgdGhlIGNhc2VzIHdoZW4gc29tZWJv
ZHkgKGZvciB3aGF0ZXZlciByZWFzb25zKSB3YW50IHRvCj4+PiBidWlsZCBhIGtlcm5lbCB3aXRo
b3V0IEFDUEkgc3VwcG9ydCBidXQgd2l0aCB0aGUgZHJpdmVyIGVuYWJsZWQgZm9yCj4+PiBsZXQn
cyBzYXkgUENJIGRldmljZS4KPj4+Cj4+Pgo+Pj4gLS0gV2l0aCBCZXN0IFJlZ2FyZHMsIEFuZHkg
U2hldmNoZW5rbwo+Pgo+PiBIaSBBbmR5LAo+Pgo+PiBUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJh
Y2ssIEFuZHkuCj4+IEkgYXBwcmVjaWF0ZSB5b3VyIGluc2lnaHRzIHJlZ2FyZGluZyB0aGUgQUNQ
SSBkZXBlbmRlbmN5Lgo+PiBUaGUgaW50ZWxfcG1jX2lwYy5oIGhlYWRlciBpcyB1bmRlciB0aGUg
b3duZXJzaGlwIG9mIERhdmlkIEUgQm94LCB3aG8KPj4gZm9jdXNlcyBvbiB0aGUgcGxhdGZvcm0g
Y29kZSwgd2hpbGUgbXkgZm9jdXMgaXMgb24gdGhlIG5ldGRldi4KPj4KPj4gSGkgRGF2aWQsCj4+
Cj4+IGlmIHlvdSBjb3VsZCBraW5kbHkgbG9vayBpbnRvIG1ha2luZyB0aGUgQUNQSSBkZXBlbmRl
bmN5IG9wdGlvbmFsIGluIHRoZQo+PiBpbnRlbF9wbWNfaXBjLmggaGVhZGVyLCBpdCB3b3VsZCBi
ZSBncmVhdGx5IGFwcHJlY2lhdGVkLgo+PiBJIGFtIG1vcmUgdGhhbiB3aWxsaW5nIHRvIHByb3Zp
ZGUgYW55IHN1cHBvcnQgbmVjZXNzYXJ5IHRvIGVuc3VyZSBhIHNtb290aAo+PiByZXNvbHV0aW9u
Lgo+IAo+IENob29uZyB5b3Ugb25seSBuZWVkIHB1dCB0aGUgZnVuY3Rpb24gdW5kZXIgYSAjaWYg
Q09ORklHX0FDUEkgYmxvY2sgYW5kIHByb3ZpZGUKPiBhbiBhbHRlcm5hdGl2ZSB0aGF0IHJldHVy
bnMgYW4gZXJyb3Igd2hlbiB0aGUgY29kZSBpcyBub3QgYnVpbGQuIExpa2UgdGhpcywKPiAKPiAj
aWYgQ09ORklHX0FDUEkKPiBzdGF0aWMgaW5saW5lIGludCBpbnRlbF9wbWNfaXBjKHN0cnVjdCBw
bWNfaXBjX2NtZCAqaXBjX2NtZCwgc3RydWN0IHBtY19pcGNfcmJ1Zgo+ICpyYnVmKQo+IHsKPiAg
ICAgLi4uCj4gfQo+ICNlbHNlCj4gc3RhdGljIGlubGluZSBpbnQgaW50ZWxfcG1jX2lwYyhzdHJ1
Y3QgcG1jX2lwY19jbWQgKmlwY19jbWQsIHN0cnVjdCBwbWNfaXBjX3JidWYKPiAqcmJ1ZikgeyBy
ZXR1cm4gLUVOT0RFVjsgfQo+ICNlbmRpZgo+IAo+IERhdmlkCj4gCj4+Cj4+IFRoaXMgcGF0Y2gg
c2VyaWVzIGhhcyBhbHJlYWR5IGJlZW4gYWNjZXB0ZWQsIGJ1dCB3ZSByZWNvZ25pemUgdGhlCj4+
IGltcG9ydGFuY2Ugb2YgYWRkcmVzc2luZyB0aGlzIGlzc3VlIGluIHRoZSBuZXh0IHBhdGNoIHNl
cmllcyBmb3IgdXBzdHJlYW0uCj4+IE91ciBnb2FsIGlzIHRvIGVuc3VyZSB0aGF0IHRoZSBkcml2
ZXIgY2FuIGJlIGNvbXBpbGVkIGFuZCBmdW5jdGlvbgo+PiBjb3JyZWN0bHkgaW4gYm90aCBBQ1BJ
IGFuZCBub24tQUNQSSBlbnZpcm9ubWVudHMuCj4+Cj4+IFRoYW5rIHlvdSBib3RoIGZvciB5b3Vy
IHVuZGVyc3RhbmRpbmcgYW5kIGNvbGxhYm9yYXRpb24uCj4gCj4gCkhpIEFuZHkgYW5kIERhdmlk
LAoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suCgpUaGUgY3VycmVudCBBQ1BJIGRlcGVuZGVu
Y3kgZm9yIHRoZSBjb25maWcgRFdNQUNfSU5URUwgaXMgbmVjZXNzYXJ5LCBidXQgSSAKYWdyZWUg
b24gbWFraW5nIGl0IG9wdGlvbmFsLgoKSW1wbGVtZW50aW5nIHRoZSBzdWdnZXN0aW9uIGZyb20g
RGF2aWQgdXNpbmcgdGhlICIjaWYgQ09ORklHX0FDUEkiIGFwcHJvYWNoIAp3b3VsZCBhZGRyZXNz
IHlvdXIgY29uY2VybiBhYm91dCB1c2VycyB3aG8gbmVlZCB0byBidWlsZCBhIGtlcm5lbCB3aXRo
b3V0IApBQ1BJIHN1cHBvcnQuCgpJZiB5b3UgYXJlIG9rYXkgd2l0aCB0aGlzIGFwcHJvYWNoLCB0
aGVuIEkgd2lsbCBzdWJtaXQgdGhlIHNvbHV0aW9uIGZvciAKdXBzdHJlYW0uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
