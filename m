Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C059F846648
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 04:06:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DBDAC6DD9F;
	Fri,  2 Feb 2024 03:06:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC9A6C6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706843171; x=1738379171;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tGLiGtD2ffb0omsWaMaWz1meXi7Me/QbXHDdjQQbe+c=;
 b=iJpo4bFChC9X7kZ6k8wND0L+OrzpKOpDgb1FBvCr+MpJwJ3AjBAiFeUf
 /aoGNXy24ESQPoJQvWjrTbvAOJKqemsOp4IXdhiWH1uRkNUVTHozPRPOq
 CmHBkfs0g5EHyy39wn52hRjm8ElLT7Nn4jx637IYVkIPNt3+SAODdkK2m
 pdijyzWATzyM9lsRybBMFlsSvQC0PN4PeJALTdNOF9K7IvUtsEoZTF3g5
 3q356Z/SmaDoF6PjVdCCGh+xUV6MA38wuq8841lqrCSyFJjQ+9uQZ5ZLD
 +ub2KiBcnj4b/wWmA5BTyfTAgiAkjKmp35Ew6RWIfDq2391u8eL0lrwbp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="468283915"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="468283915"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="859304194"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="859304194"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.22.55])
 ([10.247.22.55])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:06:01 -0800
Message-ID: <c0a87401-9f8b-4b60-b47d-31232873bba9@linux.intel.com>
Date: Fri, 2 Feb 2024 11:06:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-9-yong.liang.choong@linux.intel.com>
 <99d78f25-dd2a-4a52-4c2a-b0e29505a776@linux.intel.com>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <99d78f25-dd2a-4a52-4c2a-b0e29505a776@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v4 08/11] stmmac: intel:
 configure SerDes according to the interface mode
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

CgpPbiAzMS8xLzIwMjQgNjo1OCBwbSwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gTW9uLCAy
OSBKYW4gMjAyNCwgQ2hvb25nIFlvbmcgTGlhbmcgd3JvdGU6Cj4gCj4+IEZyb206ICJUYW4sIFRl
ZSBNaW4iIDx0ZWUubWluLnRhbkBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IEludGVsIHBsYXRmb3Jt
IHdpbGwgY29uZmlndXJlIHRoZSBTZXJEZXMgdGhyb3VnaCBQTUMgYXBpIGJhc2VkIG9uIHRoZQo+
PiBwcm92aWRlZCBpbnRlcmZhY2UgbW9kZS4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHNldmVyYWwg
bmV3IGZ1bmN0aW9ucyBiZWxvdzotCj4+IC0gaW50ZWxfdHNuX2ludGVyZmFjZV9pc19hdmFpbGFi
bGUoKTogVGhpcyBuZXcgZnVuY3Rpb24gcmVhZHMgRklBIGxhbmUKPj4gICAgb3duZXJzaGlwIHJl
Z2lzdGVycyBhbmQgY29tbW9uIGxhbmUgcmVnaXN0ZXJzIHRocm91Z2ggSVBDIGNvbW1hbmRzCj4+
ICAgIHRvIGtub3cgd2hpY2ggbGFuZSB0aGUgbUdiRSBwb3J0IGlzIGFzc2lnbmVkIHRvLgo+PiAt
IGludGVsX2NvbmZpZ19zZXJkZXMoKTogVG8gY29uZmlndXJlIHRoZSBTZXJEZXMgYmFzZWQgb24g
dGhlIGFzc2lnbmVkCj4+ICAgIGxhbmUgYW5kIGxhdGVzdCBpbnRlcmZhY2UgbW9kZSwgaXQgc2Vu
ZHMgSVBDIGNvbW1hbmQgdG8gdGhlIFBNQyB0aHJvdWdoCj4+ICAgIFBNQyBkcml2ZXIvQVBJLiBU
aGUgUE1DIGFjdHMgYXMgYSBwcm94eSBmb3IgUi9XIG9uIGJlaGFsZiBvZiB0aGUgZHJpdmVyLgo+
PiAtIGludGVsX3NldF9yZWdfYWNjZXNzKCk6IFNldCB0aGUgcmVnaXN0ZXIgYWNjZXNzIHRvIHRo
ZSBhdmFpbGFibGUgVFNOCj4+ICAgIGludGVyZmFjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFu
LCBUZWUgTWluIDx0ZWUubWluLnRhbkBsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IENob29uZyBZb25nIExpYW5nIDx5b25nLmxpYW5nLmNob29uZ0BsaW51eC5pbnRlbC5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICB8
ICAgMSArCj4+ICAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5j
IHwgMTEzICsrKysrKysrKysrKysrKysrLQo+PiAgIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtaW50ZWwuaCB8ICA3NSArKysrKysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDE4OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZwo+PiBpbmRleCA4NWRjZGE1MWRmMDUuLmJl
NDIzZmIyYjQ2YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9LY29uZmlnCj4+IEBAIC0yNzMsNiArMjczLDcgQEAgY29uZmlnIERXTUFDX0lOVEVMCj4+ICAg
CWRlZmF1bHQgWDg2Cj4+ICAgCWRlcGVuZHMgb24gWDg2ICYmIFNUTU1BQ19FVEggJiYgUENJCj4+
ICAgCWRlcGVuZHMgb24gQ09NTU9OX0NMSwo+PiArCXNlbGVjdCBJTlRFTF9QTUNfSVBDCj4gCj4g
SU5URUxfUE1DX0lQQyBoYXMgZGVwZW5kcyBvbiBBQ1BJIGJ1dCBzZWxlY3RpbmcgSU5URUxfUE1D
X0lQQyB3b24ndAo+IGVuZm9yY2UgaXQgQUZBSUsuCj4gCkhpIElscG8sCgpUaGFuayB5b3UgZm9y
IHBvaW50aW5nIHRoaXMgb3V0LgpJIHdpbGwgY2hlY2sgb24gbXkgc2lkZSB0b28uCldpbGwgZml4
IGl0IGluIHRoZSBuZXcgcGF0Y2ggc2VyaWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
