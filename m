Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D9A35A8C
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 10:43:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 816CCC78F8D;
	Fri, 14 Feb 2025 09:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC899C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739526219; x=1771062219;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zLq34zyZ+vn2x8EHLG71uh1H2EfQ4PWpqK69Hy66e7w=;
 b=l4LGfMjsrNQrVb0AvoqZO9dAaXMMEgd887nnPNbGgYad/qLzBhDY5v7u
 EhNWyLik6Y1jA7k7Mnfdtuv00E1W+i/eGCMQr0XW7TOJfjMK5U/qolAC+
 AwiOTN3XUn6oIlBeWIAwh/OLABa93gT5KX9dHEqgrsv3RFfGSarwdlzfT
 HMEs2FR+TenQQ0jMLwZxGuiWMFwFLbXU63b5VjDQ156fVbYle7NHX1I6b
 2fviSLpnDag94qMCOCIILwCNhp3+5iZwE0ADIAatnYUeoEVbyHRoDQZX5
 7a7eZI2tkzf2uDM+PBc4NPHuwtO4ISOZZDZfs/IzHl9pcA5KDlCp+Zle0 Q==;
X-CSE-ConnectionGUID: Ic7OpFDnQNmRs4KZs++PuQ==
X-CSE-MsgGUID: bV/b/zmFRyOWXZef1AXNSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44197309"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="44197309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:43:30 -0800
X-CSE-ConnectionGUID: ZO0UWXkJQOin2e28wbPaEw==
X-CSE-MsgGUID: Hg2vL6gvSzaFtD29bl+/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118036852"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.89.75])
 ([10.247.89.75])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:43:22 -0800
Message-ID: <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
Date: Fri, 14 Feb 2025 17:43:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kurt Kanzenbach <kurt@linutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
 <874j0wrjk2.fsf@kurt.kurt.home>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <874j0wrjk2.fsf@kurt.kurt.home>
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

CgpPbiAxNC8yLzIwMjUgNDo1NiBwbSwgS3VydCBLYW56ZW5iYWNoIHdyb3RlOgo+IE9uIEZyaSBG
ZWIgMTQgMjAyNSwgQWJkdWwgUmFoaW0sIEZhaXphbCB3cm90ZToKPj4gT24gMTQvMi8yMDI1IDM6
MTIgYW0sIEt1cnQgS2FuemVuYmFjaCB3cm90ZToKPj4+IE9uIFRodSBGZWIgMTMgMjAyNSwgVmxh
ZGltaXIgT2x0ZWFuIHdyb3RlOgo+Pj4+IFNvLCBjb25mdXNpbmdseSB0byBtZSwgaXQgc2VlbXMg
bGlrZSBvbmUgb3BlcmF0aW5nIG1vZGUgaXMgZnVuZGFtZW50YWxseQo+Pj4+IGRpZmZlcmVudCBm
cm9tIHRoZSBvdGhlciwgYW5kIHNvbWV0aGluZyB3aWxsIGhhdmUgdG8gY2hhbmdlIGlmIGJvdGgg
d2lsbAo+Pj4+IGJlIG1hZGUgdG8gYmVoYXZlIHRoZSBzYW1lLiBXaGF0IHdpbGwgY2hhbmdlPyBZ
b3Ugc2F5IG1xcHJpbyB3aWxsIGJlaGF2ZQo+Pj4+IGxpa2UgdGFwcmlvLCBidXQgSSB0aGluayBp
ZiBhbnl0aGluZywgbXFwcmlvIGlzIHRoZSBvbmUgd2hpY2ggZG9lcyB0aGUKPj4+PiByaWdodCB0
aGluZywgaW4gaWdjX3Rzbl90eF9hcmIoKSwgYW5kIHRhcHJpbyBzZWVtcyB0byB1c2UgdGhlIGRl
ZmF1bHQgVHgKPj4+PiBhcmJpdHJhdGlvbiBzY2hlbWU/Cj4+Pgo+Pj4gQ29ycmVjdC4gdGFwcmlv
IGlzIHVzaW5nIHRoZSBkZWZhdWx0IHNjaGVtZS4gbXFwcmlvIGNvbmZpZ3VyZXMgaXQgdG8KPj4+
IHdoYXQgZXZlciB0aGUgdXNlciBwcm92aWRlZCAoaW4gaWdjX3Rzbl90eF9hcmIoKSkuCj4+Pgo+
Pj4+IEkgZG9uJ3QgdGhpbmsgSSdtIG9uIHRoZSBzYW1lIHBhZ2UgYXMgeW91IGd1eXMsIGJlY2F1
c2UgdG8gbWUsIGl0IGlzCj4+Pj4ganVzdCBvZGQgdGhhdCB0aGUgUCB0cmFmZmljIGNsYXNzZXMg
d291bGQgYmUgdGhlIGZpcnN0IG9uZXMgd2l0aAo+Pj4+IG1xcHJpbywgYnV0IHRoZSBsYXN0IG9u
ZXMgd2l0aCB0YXByaW8uCj4+Pgo+Pj4gSSB0aGluayB3ZSBhcmUgb24gdGhlIHNhbWUgcGFnZSBo
ZXJlLiBBdCB0aGUgZW5kIGJvdGggaGF2ZSB0byBiZWhhdmUgdGhlCj4+PiBzYW1lLiBFaXRoZXIg
YnkgdXNpbmcgaWdjX3Rzbl90eF9hcmIoKSBmb3IgdGFwcmlvIHRvbyBvciBvbmx5IHVzaW5nIHRo
ZQo+Pj4gZGVmYXVsdCBzY2hlbWUgZm9yIGJvdGggKGFuZCB0aGVyZWJ5IGtlZXBpbmcgYnJva2Vu
X21xcHJpbykuIFdoYXRldmVyCj4+PiBGYWl6YWwgaW1wbGVtZW50cyBJJ2xsIG1hdGNoIHRoZSBi
ZWhhdmlvciB3aXRoIG1xcHJpby4KPj4+Cj4+Cj4+IEhpIEt1cnQgJiBWbGFkaW1pciwKPj4KPj4g
QWZ0ZXIgcmVhZGluZyBWbGFkaW1pcidzIHJlcGx5IG9uIHRjLCBodyBxdWV1ZSwgYW5kIHNvY2tl
dCBwcmlvcml0eSBtYXBwaW5nCj4+IGZvciBib3RoIHRhcHJpbyBhbmQgbXFwcmlvLCBJIGFncmVl
IHRoZXkgc2hvdWxkIGZvbGxvdyB0aGUgc2FtZSBwcmlvcml0eQo+PiBzY2hlbWUgZm9yIGNvbnNp
c3RlbmN54oCUYm90aCBpbiBjb2RlIGFuZCBjb21tYW5kIHVzYWdlIChpLmUuLCB0YXByaW8sCj4+
IG1xcHJpbywgYW5kIGZwZSBpbiBib3RoIGNvbmZpZ3VyYXRpb25zKS4gU2luY2UgaWdjX3Rzbl90
eF9hcmIoKSBlbnN1cmVzIGEKPj4gc3RhbmRhcmQgbWFwcGluZyBvZiB0Yywgc29ja2V0IHByaW9y
aXR5LCBhbmQgaGFyZHdhcmUgcXVldWUgcHJpb3JpdHksIEknbGwKPj4gZW5hYmxlIHRhcHJpbyB0
byB1c2UgaWdjX3Rzbl90eF9hcmIoKSBpbiBhIHNlcGFyYXRlIHBhdGNoIHN1Ym1pc3Npb24uCj4g
Cj4gVGhlcmUncyBvbmUgcG9pbnQgdG8gY29uc2lkZXIgaGVyZTogaWdjX3Rzbl90eF9hcmIoKSBj
aGFuZ2VzIHRoZSBtYXBwaW5nCj4gYmV0d2VlbiBwcmlvcml0aWVzIGFuZCBUeCBxdWV1ZXMuIEkg
aGF2ZSBubyBpZGVhIGhvdyBtYW55IHBlb3BsZSByZWx5IG9uCj4gdGhlIGZhY3QgdGhhdCBxdWV1
ZSAwIGhhcyBhbHdheXMgdGhlIGhpZ2hlc3QgcHJpb3JpdHkuIEZvciBleGFtcGxlLCBpdAo+IHdp
bGwgY2hhbmdlIHRoZSBUeCBiZWhhdmlvciBmb3Igc2NoZWR1bGVzIHdoaWNoIG9wZW4gbXVsdGlw
bGUgdHJhZmZpYwo+IGNsYXNzZXMgYXQgdGhlIHNhbWUgdGltZS4gVXNlcnMgbWF5IG5vdGljZS4K
ClllYWgsIEkgd2FzIGNvbnNpZGVyaW5nIHRoZSBpbXBhY3Qgb24gZXhpc3RpbmcgdXNlcnMgdG9v
LiBJIGhhZG7igJl0IGdpdmVuIGl0IAptdWNoIHRob3VnaHQgaW5pdGlhbGx5IGFuZCBmaWd1cmVk
IHRoZXnigJlkIGp1c3QgbmVlZCB0byBhZGFwdCB0byB0aGUgCmNoYW5nZXMsIGJ1dCBub3cgdGhh
dCBJIHRoaW5rIGFib3V0IGl0LCBwcm9wZXJseSBjb21tdW5pY2F0aW5nIHRoaXMgd291bGQgCmJl
IHRvdWdoLiB0YXByaW8gb24gaWdjIChpMjI1LCBpMjI2KSBoYXMgYmVlbiBhcm91bmQgZm9yIGEg
d2hpbGUsIHNvIGEgbG90IApvZiB1c2VycyB3b3VsZCBiZSBhZmZlY3RlZC4KCj4gT1RPSCBjaGFu
Z2luZyBtcXByaW8gdG8gdGhlIGJyb2tlbl9tcXByaW8gbW9kZWwgaXMgZWFzeSwgYmVjYXVzZSBB
RkFJSwo+IHRoZXJlJ3Mgb25seSBvbmUgY3VzdG9tZXIgdXNpbmcgdGhpcy4KPiAKCkhtbW1tLCBu
b3cgSeKAmW0gbGVhbmluZyB0b3dhcmQga2VlcGluZyB0YXByaW8gYXMgaXMgKGh3IHF1ZXVlIDAg
aGlnaGVzdCAKcHJpb3JpdHkpIGFuZCBoYXZpbmcgbXFwcmlvIGZvbGxvdyB0aGUgZGVmYXVsdCBw
cmlvcml0eSBzY2hlbWUgKGFrYSAKYnJva2VuX21xcHJpbykuIEV2ZW4gdGhvdWdoIGl04oCZcyBu
b3QgdGhlIG5vcm0sIHRoZSBpbXBhY3QgZG9lc27igJl0IHNlZW0gCndvcnRoIHRoZSBnYWluLiBP
cGVuIHRvIGhlYXJpbmcgb3RoZXJzJyB0aG91Z2h0cy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
