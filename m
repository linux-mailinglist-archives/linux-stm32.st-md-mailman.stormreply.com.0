Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE9A29EB2
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 03:21:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DFE3C7128F;
	Thu,  6 Feb 2025 02:21:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 771F8C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738808460; x=1770344460;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zPwqGjttrG32SeOK9jJ5H18H/d8dhdmDbDCuLS50y9c=;
 b=n6FDsaYRfz/QSc36dG77ccf0tjn1CDONtXDDw1mqecBNQmxtfu0Wm8cM
 7dV/QtQ9OPXfj6zQKcCX9wgya0NbnB3DQMMT+aGxVQ0dsMea/Pk913rMT
 isdv2CuM4I3Kj3nqaBo3OQm5Bwtq0i80EP/0uLJhA228/IAXfNOAw9iXv
 pnomcMpOtoaNilMRcyxo2xNwdEgKVwL0MUGj2AYkjHhamv14N/AXGlRE0
 65fF+Wc8zPrrMlPRHt+827gv9o99T+EFZQ3cNKKC9pRbZdTgGlEa3t2Q4
 rmY5wfxV0JP7+ATPs7VlijIEJsbLY42F7eXYee4dIqdWTlfRsNF+IhWy9 w==;
X-CSE-ConnectionGUID: ov/DlirGS1asiMQWwgk22g==
X-CSE-MsgGUID: hetTiZDxTrycjIebpkF5YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39293318"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="39293318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:20:58 -0800
X-CSE-ConnectionGUID: OK8fuaBZQQK2CspFAUPF7g==
X-CSE-MsgGUID: BWMiBxz9QR6bzBug7zF8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="116069233"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122])
 ([10.247.114.122])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:20:50 -0800
Message-ID: <b0b9e3d4-5e65-491d-81c1-232520d73ab3@linux.intel.com>
Date: Thu, 6 Feb 2025 10:20:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <71b15c65-4790-50e0-fa96-dbc42c90079f@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <71b15c65-4790-50e0-fa96-dbc42c90079f@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] stmmac: intel: configure
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

CgpPbiA0LzIvMjAyNSA0OjI1IHBtLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToKPiBPbiBUdWUsIDQg
RmViIDIwMjUsIENob29uZyBZb25nIExpYW5nIHdyb3RlOgo+IAo+IFRoZSBsb2dpYyBjb3VsZCBi
ZSByZXZlcnNlZCArIHJldHVybiBpbW1lZGlhdGVseSB0byByZWR1Y2UgdGhlIGluZGVudGF0aW9u
Cj4gb2YgdGhlIGJsb2NrIGJlbG93Lgo+IAo+IElmIHlvdSBqdXN0IHdhbnQgdG8gaGF2ZSB0aGVt
IGluaXRpYWxpemVkLCBpdCdzIGVub3VnaCB0byB1c2Uge30sIG5vIGR1bW15Cj4gMCBpcyBuZWNl
c3NhcnkuCj4gCj4gVGhpcyBsb29rcyBzb21ld2hhdCB1Z2x5LiBQZXJoYXBzIGl0IHdvdWxkIGJl
IGJldHRlciBpZiB5b3UgbWFrZSB0aGUgY2FsbAo+IG9uIG1haW4gbGV2ZWwgb2YgdGhlIGZ1bmN0
aW9uIGFuZCB1c2UgbG9jYWwgdmFyaWFibGVzIHRvIGhvbGQgdGhlIHJlZ3MKPiBhcnJheSBhbmQg
aXRzIG51bWJlciBvZiBlbGVtZW50cyB1bnRpbCB0aGVuLgo+IAo+IEl0IHdvdWxkIGJlIGV2ZW4g
YmV0dGVyIGlmIHlvdSBjb3VsZCBqdXN0IHN0b3JlIHRoZSBwb2ludGVyIGFuZCAjIG9mCj4gZWxl
bWVudHMgaW50byBzb21lIHBsYXRmb3JtIGluZm8gc3RydWN0dXJlIHNvIHRoYXQgaXQgd291bGRu
J3QgbmVlZCB0byBiZQo+IGNhbGN1bGF0ZWQgb24gdGhlIGZseSBoZXJlIChidXQgSSBkb24ndCBr
bm93IHRoaXMgZHJpdmVyIHdlbGwgZW5vdWdoIHRvCj4ga25vdyBpZiB0aGF0J3MgdmlhYmxlL2Vh
c3kgdG8gZG8pLgo+IAo+IFdoeSBhcmUgdGhlc2UgYXJyYXlzIGluIGEgaGVhZGVyIGFuZCBub3Qg
aW4gdGhlIEMgZmlsZSB0aGF0IHVzZXMgdGhlbT8/Pwo+IAoKSGkgSWxwbywKClRoYW5rIHlvdSBm
b3IgeW91ciBkZXRhaWxlZCByZXZpZXcgYW5kIGNvbW1lbnRzIG9uIHRoZSBwYXRjaC4KCkknbGwg
cmV2ZXJzZSB0aGUgbG9naWMgaW4gaW50ZWxfdHNuX2xhbmVfaXNfYXZhaWxhYmxlLCBkZWZpbmUg
dGhlIG1hZ2ljIApudW1iZXIsIGluaXRpYWxpemUgYXJyYXlzIHdpdGgge30sIHJlZmFjdG9yIGlu
dGVsX2NvbmZpZ19zZXJkZXMsIGFuZCBtb3ZlIAp0aGUgYXJyYXlzIHRvIHRoZSBDIGZpbGUuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
