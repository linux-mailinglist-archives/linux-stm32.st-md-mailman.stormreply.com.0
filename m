Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC99A33F8C
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 13:54:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4F1DC78F6D;
	Thu, 13 Feb 2025 12:54:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 797AEC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739451278; x=1770987278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UN3Y9x428Mk8h/CXSju3Mtr+T4Cd2Rs3PZKgk+wNRiA=;
 b=LrOqnk/NvfEcNyk+kYhnWdoBWlAs6wBBJCHdVD3YpuUuQauUw6RnYw84
 qrUjXSZfVdpqv9a0oWR7KnJoOQhSi9obf2Y7srALH+Go8OdMSd1GmIyeO
 yjRq9pCkICVTARMRuBX95qh+2Ymkx2AaoE/B9Pm4M7erjUYcUmvTXpPXq
 yMB8Mh2RbNT/+h0EPXOnuDmasHCvRp6TlXat/Tgjzc21myN6NgyykDvyW
 MBVSIIyGYaYgjzFnDxwKvWniz1F2cfbYnLOlcRQqCMZoha9Rbfi2Cz5nB
 9S2GN9Xve1MjL8YP8Qeqh14YwsWwoHAA+UO7Vo1vTpeewqG/DVUDlEbQT g==;
X-CSE-ConnectionGUID: A8ggFOCqSEK9s2vTNVlYGg==
X-CSE-MsgGUID: zdFK824dRLuQr6uG+KZ0pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40266551"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40266551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:54:30 -0800
X-CSE-ConnectionGUID: hz/02A95Toi+RKP8+COzSA==
X-CSE-MsgGUID: 3oCHI4xJSWuWUpbQsVvUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150303991"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34])
 ([10.247.42.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:54:22 -0800
Message-ID: <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
Date: Thu, 13 Feb 2025 20:54:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kurt Kanzenbach <kurt@linutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <87cyfmnjdh.fsf@kurt.kurt.home>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

CgpPbiAxMy8yLzIwMjUgODowMSBwbSwgS3VydCBLYW56ZW5iYWNoIHdyb3RlOgo+IE9uIFRodSBG
ZWIgMTMgMjAyNSwgQWJkdWwgUmFoaW0sIEZhaXphbCB3cm90ZToKPj4gT24gMTMvMi8yMDI1IDY6
MDEgYW0sIFZsYWRpbWlyIE9sdGVhbiB3cm90ZToKPj4+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0
IDAyOjAxOjU4QU0gLTA1MDAsIEZhaXphbCBSYWhpbSB3cm90ZToKPj4+PiBJbnRyb2R1Y2VzIHN1
cHBvcnQgZm9yIHRoZSBGUEUgZmVhdHVyZSBpbiB0aGUgSUdDIGRyaXZlci4KPj4+Pgo+Pj4+IFRo
ZSBwYXRjaGVzIGFsaWducyB3aXRoIHRoZSB1cHN0cmVhbSBGUEUgQVBJOgo+Pj4+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRkZXZicGYvY292ZXIvMjAyMzAyMjAxMjIz
NDMuMTE1NjYxNC0xLXZsYWRpbWlyLm9sdGVhbkBueHAuY29tLwo+Pj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRkZXZicGYvY292ZXIvMjAyMzAxMTkxMjI3MDUuNzMw
NTQtMS12bGFkaW1pci5vbHRlYW5AbnhwLmNvbS8KPj4+Pgo+Pj4+IEl0IGJ1aWxkcyB1cG9uIGVh
cmxpZXIgd29yazoKPj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbmV0
ZGV2YnBmL2NvdmVyLzIwMjIwNTIwMDExNTM4LjEwOTg4ODgtMS12aW5pY2l1cy5nb21lc0BpbnRl
bC5jb20vCj4+Pj4KPj4+PiBUaGUgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGZvbGxvd2luZyBmdW5j
dGlvbmFsaXRpZXMgdG8gdGhlIElHQyBkcml2ZXI6Cj4+Pj4gYSkgQ29uZmlndXJlIEZQRSB1c2lu
ZyBgZXRodG9vbCAtLXNldC1tbWAuCj4+Pj4gYikgRGlzcGxheSBGUEUgc2V0dGluZ3MgdmlhIGBl
dGh0b29sIC0tc2hvdy1tbWAuCj4+Pj4gYykgVmlldyBGUEUgc3RhdGlzdGljcyB1c2luZyBgZXRo
dG9vbCAtLWluY2x1ZGUtc3RhdGlzdGljcyAtLXNob3ctbW0nLgo+Pj4+IGUpIEVuYWJsZSBwcmVl
bXB0aWJsZS9leHByZXNzIHF1ZXVlIHdpdGggYGZwYDoKPj4+PiAgICAgIHRjIHFkaXNjIGFkZCAu
Li4gcm9vdCB0YXByaW8gXAo+Pj4+ICAgICAgZnAgRSBFIFAgUAo+Pj4KPj4+IEFueSByZWFzb24g
d2h5IHlvdSBhcmUgb25seSBlbmFibGluZyB0aGUgcHJlZW1wdGlibGUgdHJhZmZpYyBjbGFzc2Vz
Cj4+PiB3aXRoIHRhcHJpbywgYW5kIG5vdCB3aXRoIG1xcHJpbyBhcyB3ZWxsPyBJIHNlZSB0aGVy
ZSB3aWxsIGhhdmUgdG8gYmUKPj4+IHNvbWUgd29yayBoYXJtb25pemluZyBpZ2MncyBleGlzdGlu
ZyB1bmRlcnN0YW5kaW5nIG9mIHJpbmcgcHJpb3JpdGllcwo+Pj4gd2l0aCB3aGF0IEt1cnQgZGlk
IGluIDlmMzI5NzUxMWRhZSAoImlnYzogQWRkIE1RUFJJTyBvZmZsb2FkIHN1cHBvcnQiKSwKPj4+
IGFuZCBJIHdhcyBraW5kIG9mIGV4cGVjdGluZyB0byBzZWUgYSBwcm9wb3NhbCBmb3IgdGhhdCBh
cyBwYXJ0IG9mIHRoaXMuCj4+Pgo+Pgo+PiBJIHdhcyBwbGFubmluZyB0byBlbmFibGUgZnBlICsg
bXFwcmlvIHNlcGFyYXRlbHkgc2luY2UgaXQgcmVxdWlyZXMgZXh0cmEKPj4gZWZmb3J0IHRvIGV4
cGxvcmUgbXFwcmlvIHdpdGggcHJlZW1wdGlibGUgcmluZ3MsIHJpbmcgcHJpb3JpdGllcywgYW5k
Cj4+IHRlc3RpbmcgdG8gZW5zdXJlIGl0IHdvcmtzIHByb3Blcmx5IGFuZCB0aGVyZSBhcmUgbm8g
cmVncmVzc2lvbnMuCj4gCj4gV2VsbCwgbXkgaWRlYSB3YXMgdG8gbW92ZSB0aGUgY3VycmVudCBt
cXByaW8gb2ZmbG9hZCBpbXBsZW1lbnRhdGlvbiBmcm9tCj4gbGVnYWN5IFRTTiBUeCBtb2RlIHRv
IHRoZSBub3JtYWwgVFNOIFR4IG1vZGUuIFRoZW4sIHRhcHJpbyBhbmQgbXFwcmlvCj4gY2FuIHNo
YXJlIHRoZSBzYW1lIGNvZGUgKHdpdGggb3Igd2l0aG91dCBmcGUpLiBJIGhhdmUgYSBkcmFmdCBw
YXRjaAo+IHJlYWR5IGZvciB0aGF0LiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdD8KPiAKPiBU
aGFua3MsCj4gS3VydAoKSGkgS3VydCwKCknigJltIG9rYXkgd2l0aCBpbmNsdWRpbmcgaXQgaW4g
dGhpcyBzZXJpZXMgYW5kIHRlc3RpbmcgZnBlICsgbXFwcmlvLCBidXQgSeKAmW0gCm5vdCBzdXJl
IGlmIG90aGVycyBtaWdodCBiZSBjb25jZXJuZWQgYWJvdXQgYWRkaW5nIGRpZmZlcmVudCBmdW5j
dGlvbmFsIApjaGFuZ2VzIGluIHRoaXMgZnBlIHNlcmllcy4KCkhpIFZsYWRpbWlyLApBbnkgdGhv
dWdodHMgb24gdGhpcyA/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
