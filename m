Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E484A54B40
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 13:56:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADB32C7801E;
	Thu,  6 Mar 2025 12:56:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91EE9C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741265778; x=1772801778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9MvqC8ylQ6fQhKk8+WzF1GyYLgjYDw11/grvnNkl7YI=;
 b=NG/oalZen+LPl2aKBQxC1A1HpzJZ9GfVKssAtR2uGP7S/KGBc5AoY5m7
 ApAzRpWqxnM/h3HKRYWsmaZs0xg3c6zCNTn2UJxXWxQOCcpWk5fuEe9Kr
 SMnV+hvsAZQsfNC6oCWwnKRqX3KQB6odFoC95MmGMtGizedv94V8TjUxb
 WAzccP4tiijtYIPzeUCw2qLdSle/CEyJkNOQkIV4eacfdtR3GSxwljlGm
 1+MnnFPpOUS5fCBttRM0TeWn53+yuZ3KLP/1xEx54lbmxJTNmslpylIBS
 E+xj2o6McWNXyBgsgVZnVmFCSQ7ChcVaxtXjnVgT6jmV0cqpnt0g5ao4u g==;
X-CSE-ConnectionGUID: xEc02gQuS6mqKvxN+zvGkQ==
X-CSE-MsgGUID: fv39D320S8WKqKNoBNgNpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42405072"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42405072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:56:15 -0800
X-CSE-ConnectionGUID: L3j3voWzQZmgIzwPQH5Lpw==
X-CSE-MsgGUID: ExOupyuzT1OX+QCLAmrCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149940256"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.67.95])
 ([10.247.67.95])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:56:07 -0800
Message-ID: <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
Date: Thu, 6 Mar 2025 20:56:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
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

CgpPbiA2LzMvMjAyNSA1OjA1IHBtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gVGh1LCBN
YXIgNiwgMjAyNSBhdCAxMDozOeKAr0FNIENob29uZyBZb25nIExpYW5nCj4gPHlvbmcubGlhbmcu
Y2hvb25nQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+IE9uIDYvMy8yMDI1IDM6MTUgcG0sIEFu
ZHkgU2hldmNoZW5rbyB3cm90ZToKPj4+IFRodSwgRmViIDI3LCAyMDI1IGF0IDA4OjE1OjIxUE0g
KzA4MDAsIENob29uZyBZb25nIExpYW5nIGtpcmpvaXR0aToKPiAuLi4KPiAKPj4+PiBjb25maWcg
RFdNQUNfSU5URUwKPj4+PiAgICAgICBkZWZhdWx0IFg4Ngo+Pj4+ICAgICAgIGRlcGVuZHMgb24g
WDg2ICYmIFNUTU1BQ19FVEggJiYgUENJCj4+Pj4gICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xL
Cj4+Pj4gKyAgICBkZXBlbmRzIG9uIEFDUEkKPj4+IFN0cmF5IGFuZCB1bmV4cGxhaW5lZCBjaGFu
Z2UuIFBsZWFzZSwgZml4IGl0LiBXZSBkb24ndCBuZWVkIHRoZSBkZXBlbmRlbmNpZXMKPj4+IHdo
aWNoIGFyZSBub3QgcmVhbGlzZWQgaW4gdGhlIGNvbXBpbGUgdGltZS4KPj4gVGhlIGRlcGVuZGVu
Y3kgb24gQUNQSSBpcyBuZWNlc3NhcnkgYmVjYXVzZSB0aGUgaW50ZWxfcG1jX2lwYy5oIGhlYWRl
cgo+PiByZWxpZXMgb24gQUNQSSBmdW5jdGlvbmFsaXR5IHRvIGludGVyYWN0IHdpdGggdGhlIElu
dGVsIFBNQy4KPiBTbywgdGhhdCBoZWFkZXIgaGFzIHRvIGJlIGZpeGVkIGFzIEFDUEkgaGVyZSBp
cyByZWFsbHkgdW5uZWVkZWQKPiBkZXBlbmRlbmN5IGZvciB0aGUgY2FzZXMgd2hlbiBzb21lYm9k
eSAoZm9yIHdoYXRldmVyIHJlYXNvbnMpIHdhbnQgdG8KPiBidWlsZCBhIGtlcm5lbCB3aXRob3V0
IEFDUEkgc3VwcG9ydCBidXQgd2l0aCB0aGUgZHJpdmVyIGVuYWJsZWQgZm9yCj4gbGV0J3Mgc2F5
IFBDSSBkZXZpY2UuCj4gCj4gCj4gLS0gV2l0aCBCZXN0IFJlZ2FyZHMsIEFuZHkgU2hldmNoZW5r
bwoKSGkgQW5keSwKClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjaywgQW5keS4KSSBhcHByZWNp
YXRlIHlvdXIgaW5zaWdodHMgcmVnYXJkaW5nIHRoZSBBQ1BJIGRlcGVuZGVuY3kuClRoZSBpbnRl
bF9wbWNfaXBjLmggaGVhZGVyIGlzIHVuZGVyIHRoZSBvd25lcnNoaXAgb2YgRGF2aWQgRSBCb3gs
IHdobyAKZm9jdXNlcyBvbiB0aGUgcGxhdGZvcm0gY29kZSwgd2hpbGUgbXkgZm9jdXMgaXMgb24g
dGhlIG5ldGRldi4KCkhpIERhdmlkLAoKaWYgeW91IGNvdWxkIGtpbmRseSBsb29rIGludG8gbWFr
aW5nIHRoZSBBQ1BJIGRlcGVuZGVuY3kgb3B0aW9uYWwgaW4gdGhlIAppbnRlbF9wbWNfaXBjLmgg
aGVhZGVyLCBpdCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgpJIGFtIG1vcmUgdGhhbiB3
aWxsaW5nIHRvIHByb3ZpZGUgYW55IHN1cHBvcnQgbmVjZXNzYXJ5IHRvIGVuc3VyZSBhIHNtb290
aCAKcmVzb2x1dGlvbi4KClRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBhbHJlYWR5IGJlZW4gYWNjZXB0
ZWQsIGJ1dCB3ZSByZWNvZ25pemUgdGhlIAppbXBvcnRhbmNlIG9mIGFkZHJlc3NpbmcgdGhpcyBp
c3N1ZSBpbiB0aGUgbmV4dCBwYXRjaCBzZXJpZXMgZm9yIHVwc3RyZWFtLgpPdXIgZ29hbCBpcyB0
byBlbnN1cmUgdGhhdCB0aGUgZHJpdmVyIGNhbiBiZSBjb21waWxlZCBhbmQgZnVuY3Rpb24gCmNv
cnJlY3RseSBpbiBib3RoIEFDUEkgYW5kIG5vbi1BQ1BJIGVudmlyb25tZW50cy4KClRoYW5rIHlv
dSBib3RoIGZvciB5b3VyIHVuZGVyc3RhbmRpbmcgYW5kIGNvbGxhYm9yYXRpb24uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
