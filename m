Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBA846637
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 04:04:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56ADCC6DD9F;
	Fri,  2 Feb 2024 03:04:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 126A6C6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706843068; x=1738379068;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l3bgt/i5okwgssxhTR2nxbBEc5VyBQCo8JSDXE2iktI=;
 b=lfQXOfm+axgyyRN94lFY2zBBqyRHTa5JzQ37Ovbx63C++K6zXdU58mRv
 /RDSE+QNQnzBcre4i5PRfF029zf82t8tOtqtObpwKY23tNBS/PtFbb5g8
 vRDMhGTzHo6DmkZiBOUjAMQmtMHiJWToYSffv6o37lnrdAkHCDxunB/cN
 XpuLp/Qi3bfnXbsPuKY37uwRLDxlKCeQ7uR5Uo/JJuLfyPQrbwuuUIez9
 IeR5wHMszPwCq3Wse7tLP8wzc8zGyb+7B+V6aBgVsb+Z6X3QprWr8MnQq
 pR38qmPtDYnOsPkPgL24OasFCgALsMUKOatK8+yC0oMWiKobu2ukTcIOl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="468283596"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="468283596"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="859304037"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="859304037"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.22.55])
 ([10.247.22.55])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:04:17 -0800
Message-ID: <8fa87696-0c8d-405b-9e38-835d1ed65e90@linux.intel.com>
Date: Fri, 2 Feb 2024 11:04:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-8-yong.liang.choong@linux.intel.com>
 <1fccbf0d-5b96-447b-80f1-19af70628edc@linux.intel.com>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <1fccbf0d-5b96-447b-80f1-19af70628edc@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 07/11] arch: x86: Add IPC
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

CgpPbiAzMS8xLzIwMjQgNjo1NCBwbSwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gTW9uLCAy
OSBKYW4gMjAyNCwgQ2hvb25nIFlvbmcgTGlhbmcgd3JvdGU6Cj4gCj4+IEZyb206ICJEYXZpZCBF
LiBCb3giIDxkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IC0gRXhwb3J0cyBpbnRl
bF9wbWNfaXBjKCkgZm9yIGhvc3QgYWNjZXNzIHRvIHRoZSBQTUMgSVBDIG1haWxib3gKPj4gLSBB
ZGQgc3VwcG9ydCB0byB1c2UgSVBDIGNvbW1hbmQgYWxsb3dzIGhvc3QgdG8gYWNjZXNzIFNvQyBy
ZWdpc3RlcnMKPj4gdGhyb3VnaCBQTUMgZmlybXdhcmUgdGhhdCBhcmUgb3RoZXJ3aXNlIGluYWNj
ZXNzaWJsZSB0byB0aGUgaG9zdCBkdWUgdG8KPj4gc2VjdXJpdHkgcG9saWNpZXMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFFpbiA8Y2hhby5xaW5AaW50ZWwuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBDaG9vbmcgWW9uZyBMaWFuZyA8eW9uZy5saWFuZy5jaG9vbmdAbGludXguaW50ZWwu
Y29tPgo+PiAtLS0KPj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArCj4+ICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDkgKysrCj4+ICAgYXJjaC94ODYvcGxhdGZvcm0vaW50ZWwvTWFrZWZpbGUgICAg
ICAgICAgICAgIHwgIDEgKwo+PiAgIGFyY2gveDg2L3BsYXRmb3JtL2ludGVsL3BtY19pcGMuYyAg
ICAgICAgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKysKPj4gICAuLi4vbGludXgvcGxhdGZv
cm1fZGF0YS94ODYvaW50ZWxfcG1jX2lwYy5oICAgfCAzNCArKysrKysrKysKPj4gICA1IGZpbGVz
IGNoYW5nZWQsIDEyMSBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
eDg2L3BsYXRmb3JtL2ludGVsL3BtY19pcGMuYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEveDg2L2ludGVsX3BtY19pcGMuaAo+Pgo+PiBkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+PiBpbmRleCA4NzA5YzdjZDM2NTYuLjQ0
MWViOTIxZWRlZiAxMDA2NDQKPj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4gKysrIGIvTUFJTlRBSU5F
UlMKPj4gQEAgLTEwOTczLDggKzEwOTczLDEwIEBAIE06CVJham5lZXNoIEJoYXJkd2FqIDxpcmVu
aWMucmFqbmVlc2hAZ21haWwuY29tPgo+PiAgIE06CURhdmlkIEUgQm94IDxkYXZpZC5lLmJveEBp
bnRlbC5jb20+Cj4+ICAgTDoJcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcKPj4g
ICBTOglNYWludGFpbmVkCj4+ICtGOglhcmNoL3g4Ni9wbGF0Zm9ybS9pbnRlbC9wbWNfaXBjLmMK
Pj4gICBGOglEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWludGVsLXBt
Ywo+PiAgIEY6CWRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy8KPj4gK0Y6CWxpbnV4L3Bs
YXRmb3JtX2RhdGEveDg2L2ludGVsX3BtY19pcGMuaAo+PiAgIAo+PiAgIElOVEVMIFBNSUMgR1BJ
TyBEUklWRVJTCj4+ICAgTToJQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+PiBpbmRleCA1
ZWRlYzE3NWI5YmYuLmJjZWFlMjhiOTM4MSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvS2NvbmZp
Zwo+PiArKysgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IEBAIC02NjYsNiArNjY2LDE1IEBAIGNvbmZp
ZyBYODZfQU1EX1BMQVRGT1JNX0RFVklDRQo+PiAgIAkgIEkyQyBhbmQgVUFSVCBkZXBlbmQgb24g
Q09NTU9OX0NMSyB0byBzZXQgY2xvY2suIEdQSU8gZHJpdmVyIGlzCj4+ICAgCSAgaW1wbGVtZW50
ZWQgdW5kZXIgUElOQ1RSTCBzdWJzeXN0ZW0uCj4+ICAgCj4+ICtjb25maWcgSU5URUxfUE1DX0lQ
Qwo+PiArCXRyaXN0YXRlICJJbnRlbCBDb3JlIFNvQyBQb3dlciBNYW5hZ2VtZW50IENvbnRyb2xs
ZXIgSVBDIG1haWxib3giCj4+ICsJZGVwZW5kcyBvbiBBQ1BJCj4+ICsJaGVscAo+PiArCSAgVGhp
cyBvcHRpb24gZW5hYmxlcyBzaWRlYmFuZCByZWdpc3RlciBhY2Nlc3Mgc3VwcG9ydCBmb3IgSW50
ZWwgU29DCj4+ICsJICBwb3dlciBtYW5hZ2VtZW50IGNvbnRyb2xsZXIgSVBDIG1haWxib3guCj4+
ICsKPj4gKwkgIElmIHlvdSBkb24ndCByZXF1aXJlIHRoZSBvcHRpb24gb3IgYXJlIGluIGRvdWJ0
LCBzYXkgTi4KPj4gKwo+PiAgIGNvbmZpZyBJT1NGX01CSQo+PiAgIAl0cmlzdGF0ZSAiSW50ZWwg
U29DIElPU0YgU2lkZWJhbmQgc3VwcG9ydCBmb3IgU29DIHBsYXRmb3JtcyIKPj4gICAJZGVwZW5k
cyBvbiBQQ0kKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3BsYXRmb3JtL2ludGVsL01ha2VmaWxl
IGIvYXJjaC94ODYvcGxhdGZvcm0vaW50ZWwvTWFrZWZpbGUKPj4gaW5kZXggZGJlZTNiMDBmOWQw
Li40NzBmYzY4ZGU2YmEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3BsYXRmb3JtL2ludGVsL01h
a2VmaWxlCj4+ICsrKyBiL2FyY2gveDg2L3BsYXRmb3JtL2ludGVsL01ha2VmaWxlCj4+IEBAIC0x
LDIgKzEsMyBAQAo+PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+
PiAgIG9iai0kKENPTkZJR19JT1NGX01CSSkJCQkrPSBpb3NmX21iaS5vCj4+ICtvYmotJChDT05G
SUdfSU5URUxfUE1DX0lQQykJCSs9IHBtY19pcGMubwo+PiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGUKPiAKPiBOZXcgbGluZSBtaXNzaW5nLgo+IAo+IApUaGFuayB5b3UgZm9yIGxldHRpbmcg
bWUga25vdy4KSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV3IHBhdGNoIHNlcmllcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
