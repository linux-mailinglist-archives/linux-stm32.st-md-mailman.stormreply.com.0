Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF16A337C1
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 07:13:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 103B9C78039;
	Thu, 13 Feb 2025 06:13:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86B3DC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 06:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739427185; x=1770963185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GEJZwnWqsIMq3HKET1mdxf8SV5zMREPN381jd4cLlhM=;
 b=AsSgCmv9m8rZunISQ+qW/YQhAJWGYzCJ8Yjq84qa1ydCCEtzs6jR8QlH
 3FWdlBB1gV62kWkUdH5BUvEDCtb3bpz+cniD2QDwHyFHGfK5nCniBn62M
 ogg2SVLsI26SD7pREy+BRoYVlUFl8gi7fW32e1jMgpUPAYPg28DfrC9S6
 T4i7eBzx5SeZIRD1LbhDjPwSf32GqEsr+VX5mJYbrc4KiKYXbi9R1GOQ6
 3psjs0cE8y2t06BP6acQtaO050XerZpfRvoQzcmRRuEuKZFpeHs+5aoXN
 cSBAP5V8pUK9wOMfb7Q9ArR5yixOaRnxoQ37XWD95V/HG4/5uSrEkV2tw g==;
X-CSE-ConnectionGUID: f/oZt+VdQCSPar4NZa5jPQ==
X-CSE-MsgGUID: qA6u1T6oQSCziqHgwNo5qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44046225"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="44046225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:12:57 -0800
X-CSE-ConnectionGUID: bkfrU6y2QB2L4ycTkHh9VA==
X-CSE-MsgGUID: VzfZiVD2SRO52yQ6ry9WDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117156622"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34])
 ([10.247.42.34])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:12:50 -0800
Message-ID: <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
Date: Thu, 13 Feb 2025 14:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250212220121.ici3qll66pfoov62@skbuf>
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

CgpPbiAxMy8yLzIwMjUgNjowMSBhbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+IE9uIE1vbiwg
RmViIDEwLCAyMDI1IGF0IDAyOjAxOjU4QU0gLTA1MDAsIEZhaXphbCBSYWhpbSB3cm90ZToKPj4g
SW50cm9kdWNlcyBzdXBwb3J0IGZvciB0aGUgRlBFIGZlYXR1cmUgaW4gdGhlIElHQyBkcml2ZXIu
Cj4+Cj4+IFRoZSBwYXRjaGVzIGFsaWducyB3aXRoIHRoZSB1cHN0cmVhbSBGUEUgQVBJOgo+PiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbmV0ZGV2YnBmL2NvdmVyLzIwMjMw
MjIwMTIyMzQzLjExNTY2MTQtMS12bGFkaW1pci5vbHRlYW5AbnhwLmNvbS8KPj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L25ldGRldmJwZi9jb3Zlci8yMDIzMDExOTEyMjcw
NS43MzA1NC0xLXZsYWRpbWlyLm9sdGVhbkBueHAuY29tLwo+Pgo+PiBJdCBidWlsZHMgdXBvbiBl
YXJsaWVyIHdvcms6Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRk
ZXZicGYvY292ZXIvMjAyMjA1MjAwMTE1MzguMTA5ODg4OC0xLXZpbmljaXVzLmdvbWVzQGludGVs
LmNvbS8KPj4KPj4gVGhlIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25h
bGl0aWVzIHRvIHRoZSBJR0MgZHJpdmVyOgo+PiBhKSBDb25maWd1cmUgRlBFIHVzaW5nIGBldGh0
b29sIC0tc2V0LW1tYC4KPj4gYikgRGlzcGxheSBGUEUgc2V0dGluZ3MgdmlhIGBldGh0b29sIC0t
c2hvdy1tbWAuCj4+IGMpIFZpZXcgRlBFIHN0YXRpc3RpY3MgdXNpbmcgYGV0aHRvb2wgLS1pbmNs
dWRlLXN0YXRpc3RpY3MgLS1zaG93LW1tJy4KPj4gZSkgRW5hYmxlIHByZWVtcHRpYmxlL2V4cHJl
c3MgcXVldWUgd2l0aCBgZnBgOgo+PiAgICAgdGMgcWRpc2MgYWRkIC4uLiByb290IHRhcHJpbyBc
Cj4+ICAgICBmcCBFIEUgUCBQCj4gCj4gQW55IHJlYXNvbiB3aHkgeW91IGFyZSBvbmx5IGVuYWJs
aW5nIHRoZSBwcmVlbXB0aWJsZSB0cmFmZmljIGNsYXNzZXMKPiB3aXRoIHRhcHJpbywgYW5kIG5v
dCB3aXRoIG1xcHJpbyBhcyB3ZWxsPyBJIHNlZSB0aGVyZSB3aWxsIGhhdmUgdG8gYmUKPiBzb21l
IHdvcmsgaGFybW9uaXppbmcgaWdjJ3MgZXhpc3RpbmcgdW5kZXJzdGFuZGluZyBvZiByaW5nIHBy
aW9yaXRpZXMKPiB3aXRoIHdoYXQgS3VydCBkaWQgaW4gOWYzMjk3NTExZGFlICgiaWdjOiBBZGQg
TVFQUklPIG9mZmxvYWQgc3VwcG9ydCIpLAo+IGFuZCBJIHdhcyBraW5kIG9mIGV4cGVjdGluZyB0
byBzZWUgYSBwcm9wb3NhbCBmb3IgdGhhdCBhcyBwYXJ0IG9mIHRoaXMuCj4gCgpJIHdhcyBwbGFu
bmluZyB0byBlbmFibGUgZnBlICsgbXFwcmlvIHNlcGFyYXRlbHkgc2luY2UgaXQgcmVxdWlyZXMg
ZXh0cmEgCmVmZm9ydCB0byBleHBsb3JlIG1xcHJpbyB3aXRoIHByZWVtcHRpYmxlIHJpbmdzLCBy
aW5nIHByaW9yaXRpZXMsIGFuZCAKdGVzdGluZyB0byBlbnN1cmUgaXQgd29ya3MgcHJvcGVybHkg
YW5kIHRoZXJlIGFyZSBubyByZWdyZXNzaW9ucy4KCknigJltIHJlYWxseSBob3BpbmcgdGhhdCBm
cGUgKyBtcXByaW8gZG9lc27igJl0IGhhdmUgdG8gYmUgZW5hYmxlZCB0b2dldGhlciBpbiAKdGhp
cyBzZXJpZXMgdG8ga2VlcCB0aGluZ3Mgc2ltcGxlLiBJdCBjb3VsZCBiZSBhZGRlZCBsYXRlcuKA
lGFkZGluZyBpdCBub3cgCndvdWxkIGludHJvZHVjZSBhZGRpdGlvbmFsIGNvbXBsZXhpdHkgYW5k
IGRlbGF5IHRoaXMgc2VyaWVzIGZ1cnRoZXIsIHdoaWNoIAppcyBmb2N1c2VkIG9uIGVuYWJsaW5n
IGJhc2ljLCB3b3JraW5nIGZwZSBvbiBpMjI2LgoKV291bGQgdGhhdCBiZSBva2F5IHdpdGggeW91
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
