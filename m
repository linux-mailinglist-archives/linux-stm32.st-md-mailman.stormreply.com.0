Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91578A557D0
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 21:52:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40EFCC78F81;
	Thu,  6 Mar 2025 20:52:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3E8DC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741294354; x=1772830354;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9/k5vAQPlllkqeoVC6KPl7jGub6QSCj8r/sPKoAFx1g=;
 b=TdPFZGNQzRGUfxUA5d20SghpwetZ27SHZ6BEEIMDV7yIlrymw33VQsLD
 G1K8+AQIit7PAMiA8G1rD4wk4wA5rAq8q0qJZoiCw1/8liv5zYjOq7mE7
 wfDFuzmMAda2qJjEUxQ/HaneGwlJPg9z5b4489XdbGBiwC9e/kk5j2xCL
 8ACQ0nviQj4fmZ2KaSOCV1LSaahWZZYrFWquShAKX73ms+Hde2fCobp6T
 ens72bzEyGHa0i24iI77bkh5avVN5aOmakosqM5qi60LtbfxFongqwpFt
 QhZNYs/ugmekjZMRSGJw3m28maH4AlgFpVtPraxorZawAXwk1K1opqhHd A==;
X-CSE-ConnectionGUID: BnIGSUBkTsCH/MHTZ7q/Ew==
X-CSE-MsgGUID: 24k8rELCTU6PvYjT9I0cvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45135668"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="45135668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:52:32 -0800
X-CSE-ConnectionGUID: NWY+K21hQYiBE5DOFr55fw==
X-CSE-MsgGUID: sBEcyVq0Q/OUlTi1Db5nYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156354902"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:52:32 -0800
Received: from [10.54.75.34] (debox1-desk1.jf.intel.com [10.54.75.34])
 by linux.intel.com (Postfix) with ESMTP id 455C920B5736;
 Thu,  6 Mar 2025 12:52:31 -0800 (PST)
Message-ID: <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
From: "David E. Box" <david.e.box@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
Date: Thu, 06 Mar 2025 12:52:31 -0800
In-Reply-To: <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
 FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
MIME-Version: 1.0
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
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Reply-To: david.e.box@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCAyMDI1LTAzLTA2IGF0IDIwOjU2ICswODAwLCBDaG9vbmcgWW9uZyBMaWFuZyB3cm90
ZToKPiAKPiAKPiBPbiA2LzMvMjAyNSA1OjA1IHBtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4g
PiBPbiBUaHUsIE1hciA2LCAyMDI1IGF0IDEwOjM54oCvQU0gQ2hvb25nIFlvbmcgTGlhbmcKPiA+
IDx5b25nLmxpYW5nLmNob29uZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiBPbiA2LzMv
MjAyNSAzOjE1IHBtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiA+ID4gVGh1LCBGZWIgMjcs
IDIwMjUgYXQgMDg6MTU6MjFQTSArMDgwMCwgQ2hvb25nIFlvbmcgTGlhbmcga2lyam9pdHRpOgo+
ID4gLi4uCj4gPiAKPiA+ID4gPiA+IGNvbmZpZyBEV01BQ19JTlRFTAo+ID4gPiA+ID4gwqDCoMKg
wqDCoCBkZWZhdWx0IFg4Ngo+ID4gPiA+ID4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFg4NiAmJiBT
VE1NQUNfRVRIICYmIFBDSQo+ID4gPiA+ID4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIENPTU1PTl9D
TEsKPiA+ID4gPiA+ICvCoMKgwqAgZGVwZW5kcyBvbiBBQ1BJCj4gPiA+ID4gU3RyYXkgYW5kIHVu
ZXhwbGFpbmVkIGNoYW5nZS4gUGxlYXNlLCBmaXggaXQuIFdlIGRvbid0IG5lZWQgdGhlCj4gPiA+
ID4gZGVwZW5kZW5jaWVzCj4gPiA+ID4gd2hpY2ggYXJlIG5vdCByZWFsaXNlZCBpbiB0aGUgY29t
cGlsZSB0aW1lLgo+ID4gPiBUaGUgZGVwZW5kZW5jeSBvbiBBQ1BJIGlzIG5lY2Vzc2FyeSBiZWNh
dXNlIHRoZSBpbnRlbF9wbWNfaXBjLmggaGVhZGVyCj4gPiA+IHJlbGllcyBvbiBBQ1BJIGZ1bmN0
aW9uYWxpdHkgdG8gaW50ZXJhY3Qgd2l0aCB0aGUgSW50ZWwgUE1DLgo+ID4gU28sIHRoYXQgaGVh
ZGVyIGhhcyB0byBiZSBmaXhlZCBhcyBBQ1BJIGhlcmUgaXMgcmVhbGx5IHVubmVlZGVkCj4gPiBk
ZXBlbmRlbmN5IGZvciB0aGUgY2FzZXMgd2hlbiBzb21lYm9keSAoZm9yIHdoYXRldmVyIHJlYXNv
bnMpIHdhbnQgdG8KPiA+IGJ1aWxkIGEga2VybmVsIHdpdGhvdXQgQUNQSSBzdXBwb3J0IGJ1dCB3
aXRoIHRoZSBkcml2ZXIgZW5hYmxlZCBmb3IKPiA+IGxldCdzIHNheSBQQ0kgZGV2aWNlLgo+ID4g
Cj4gPiAKPiA+IC0tIFdpdGggQmVzdCBSZWdhcmRzLCBBbmR5IFNoZXZjaGVua28KPiAKPiBIaSBB
bmR5LAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjaywgQW5keS4KPiBJIGFwcHJlY2lh
dGUgeW91ciBpbnNpZ2h0cyByZWdhcmRpbmcgdGhlIEFDUEkgZGVwZW5kZW5jeS4KPiBUaGUgaW50
ZWxfcG1jX2lwYy5oIGhlYWRlciBpcyB1bmRlciB0aGUgb3duZXJzaGlwIG9mIERhdmlkIEUgQm94
LCB3aG8gCj4gZm9jdXNlcyBvbiB0aGUgcGxhdGZvcm0gY29kZSwgd2hpbGUgbXkgZm9jdXMgaXMg
b24gdGhlIG5ldGRldi4KPiAKPiBIaSBEYXZpZCwKPiAKPiBpZiB5b3UgY291bGQga2luZGx5IGxv
b2sgaW50byBtYWtpbmcgdGhlIEFDUEkgZGVwZW5kZW5jeSBvcHRpb25hbCBpbiB0aGUgCj4gaW50
ZWxfcG1jX2lwYy5oIGhlYWRlciwgaXQgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4KPiBJ
IGFtIG1vcmUgdGhhbiB3aWxsaW5nIHRvIHByb3ZpZGUgYW55IHN1cHBvcnQgbmVjZXNzYXJ5IHRv
IGVuc3VyZSBhIHNtb290aCAKPiByZXNvbHV0aW9uLgoKQ2hvb25nIHlvdSBvbmx5IG5lZWQgcHV0
IHRoZSBmdW5jdGlvbiB1bmRlciBhICNpZiBDT05GSUdfQUNQSSBibG9jayBhbmQgcHJvdmlkZQph
biBhbHRlcm5hdGl2ZSB0aGF0IHJldHVybnMgYW4gZXJyb3Igd2hlbiB0aGUgY29kZSBpcyBub3Qg
YnVpbGQuIExpa2UgdGhpcywKCiNpZiBDT05GSUdfQUNQSQpzdGF0aWMgaW5saW5lIGludCBpbnRl
bF9wbWNfaXBjKHN0cnVjdCBwbWNfaXBjX2NtZCAqaXBjX2NtZCwgc3RydWN0IHBtY19pcGNfcmJ1
ZgoqcmJ1ZikKewogICAuLi4KfQojZWxzZQpzdGF0aWMgaW5saW5lIGludCBpbnRlbF9wbWNfaXBj
KHN0cnVjdCBwbWNfaXBjX2NtZCAqaXBjX2NtZCwgc3RydWN0IHBtY19pcGNfcmJ1ZgoqcmJ1Zikg
eyByZXR1cm4gLUVOT0RFVjsgfQojZW5kaWYKCkRhdmlkCgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVz
IGhhcyBhbHJlYWR5IGJlZW4gYWNjZXB0ZWQsIGJ1dCB3ZSByZWNvZ25pemUgdGhlIAo+IGltcG9y
dGFuY2Ugb2YgYWRkcmVzc2luZyB0aGlzIGlzc3VlIGluIHRoZSBuZXh0IHBhdGNoIHNlcmllcyBm
b3IgdXBzdHJlYW0uCj4gT3VyIGdvYWwgaXMgdG8gZW5zdXJlIHRoYXQgdGhlIGRyaXZlciBjYW4g
YmUgY29tcGlsZWQgYW5kIGZ1bmN0aW9uIAo+IGNvcnJlY3RseSBpbiBib3RoIEFDUEkgYW5kIG5v
bi1BQ1BJIGVudmlyb25tZW50cy4KPiAKPiBUaGFuayB5b3UgYm90aCBmb3IgeW91ciB1bmRlcnN0
YW5kaW5nIGFuZCBjb2xsYWJvcmF0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
