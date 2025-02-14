Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4AA355AB
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 05:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78DE0C78F89;
	Fri, 14 Feb 2025 04:20:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71CE7C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 04:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739506851; x=1771042851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0N+NIkjKA48xzvqbJnB29lAB08YfjMQLZFPJzVlNIO4=;
 b=D6cpSmPKVhevGDpDVta+MVEzVPXO1KlXhsyHwtpEQNEBPWRsh0/A6LEI
 YApwSRCmPYlFlLEcVt+tVq23BSRXycXGMuja4O+MY5kbkXkHfpR7pHAZU
 Mi4pdCbn0oq2v57HQjaGi7IhfltluboeL4+Ch3/kvheMlRGD9XIM4MmhK
 pK6VYmmNGXdufc86vj0jNRBOEy1QkvhZ+J4OJdN/absAOnIXDwLKMZLnb
 EnA0VXPM/R73jjZPV/nMQnTi05MUhwHJ1lj/Ied85IrO0IzQIH8FjFKTt
 YfUGnsyDFB331+ES3iZ+4KbV5GI3K5SW3IImb/uB9db27cpYerHV5ihD3 w==;
X-CSE-ConnectionGUID: GVCa2f/kRaWifDAa460SPQ==
X-CSE-MsgGUID: IwlsDK/NRmycGGlOO9EMBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40505974"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="40505974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 20:20:43 -0800
X-CSE-ConnectionGUID: VV+jgGj8RGadw8WZ3YmWXQ==
X-CSE-MsgGUID: ktMrD4xUQYq+G2zq3bq7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="144209439"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.123.6])
 ([10.247.123.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 20:20:33 -0800
Message-ID: <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
Date: Fri, 14 Feb 2025 12:20:31 +0800
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
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <87v7td3bi1.fsf@kurt.kurt.home>
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

CgpPbiAxNC8yLzIwMjUgMzoxMiBhbSwgS3VydCBLYW56ZW5iYWNoIHdyb3RlOgo+IE9uIFRodSBG
ZWIgMTMgMjAyNSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+PiBTbywgY29uZnVzaW5nbHkgdG8g
bWUsIGl0IHNlZW1zIGxpa2Ugb25lIG9wZXJhdGluZyBtb2RlIGlzIGZ1bmRhbWVudGFsbHkKPj4g
ZGlmZmVyZW50IGZyb20gdGhlIG90aGVyLCBhbmQgc29tZXRoaW5nIHdpbGwgaGF2ZSB0byBjaGFu
Z2UgaWYgYm90aCB3aWxsCj4+IGJlIG1hZGUgdG8gYmVoYXZlIHRoZSBzYW1lLiBXaGF0IHdpbGwg
Y2hhbmdlPyBZb3Ugc2F5IG1xcHJpbyB3aWxsIGJlaGF2ZQo+PiBsaWtlIHRhcHJpbywgYnV0IEkg
dGhpbmsgaWYgYW55dGhpbmcsIG1xcHJpbyBpcyB0aGUgb25lIHdoaWNoIGRvZXMgdGhlCj4+IHJp
Z2h0IHRoaW5nLCBpbiBpZ2NfdHNuX3R4X2FyYigpLCBhbmQgdGFwcmlvIHNlZW1zIHRvIHVzZSB0
aGUgZGVmYXVsdCBUeAo+PiBhcmJpdHJhdGlvbiBzY2hlbWU/Cj4gCj4gQ29ycmVjdC4gdGFwcmlv
IGlzIHVzaW5nIHRoZSBkZWZhdWx0IHNjaGVtZS4gbXFwcmlvIGNvbmZpZ3VyZXMgaXQgdG8KPiB3
aGF0IGV2ZXIgdGhlIHVzZXIgcHJvdmlkZWQgKGluIGlnY190c25fdHhfYXJiKCkpLgo+IAo+PiBJ
IGRvbid0IHRoaW5rIEknbSBvbiB0aGUgc2FtZSBwYWdlIGFzIHlvdSBndXlzLCBiZWNhdXNlIHRv
IG1lLCBpdCBpcwo+PiBqdXN0IG9kZCB0aGF0IHRoZSBQIHRyYWZmaWMgY2xhc3NlcyB3b3VsZCBi
ZSB0aGUgZmlyc3Qgb25lcyB3aXRoCj4+IG1xcHJpbywgYnV0IHRoZSBsYXN0IG9uZXMgd2l0aCB0
YXByaW8uCj4gCj4gSSB0aGluayB3ZSBhcmUgb24gdGhlIHNhbWUgcGFnZSBoZXJlLiBBdCB0aGUg
ZW5kIGJvdGggaGF2ZSB0byBiZWhhdmUgdGhlCj4gc2FtZS4gRWl0aGVyIGJ5IHVzaW5nIGlnY190
c25fdHhfYXJiKCkgZm9yIHRhcHJpbyB0b28gb3Igb25seSB1c2luZyB0aGUKPiBkZWZhdWx0IHNj
aGVtZSBmb3IgYm90aCAoYW5kIHRoZXJlYnkga2VlcGluZyBicm9rZW5fbXFwcmlvKS4gV2hhdGV2
ZXIKPiBGYWl6YWwgaW1wbGVtZW50cyBJJ2xsIG1hdGNoIHRoZSBiZWhhdmlvciB3aXRoIG1xcHJp
by4KPiAKCkhpIEt1cnQgJiBWbGFkaW1pciwKCkFmdGVyIHJlYWRpbmcgVmxhZGltaXIncyByZXBs
eSBvbiB0YywgaHcgcXVldWUsIGFuZCBzb2NrZXQgcHJpb3JpdHkgbWFwcGluZyAKZm9yIGJvdGgg
dGFwcmlvIGFuZCBtcXByaW8sIEkgYWdyZWUgdGhleSBzaG91bGQgZm9sbG93IHRoZSBzYW1lIHBy
aW9yaXR5IApzY2hlbWUgZm9yIGNvbnNpc3RlbmN54oCUYm90aCBpbiBjb2RlIGFuZCBjb21tYW5k
IHVzYWdlIChpLmUuLCB0YXByaW8sIAptcXByaW8sIGFuZCBmcGUgaW4gYm90aCBjb25maWd1cmF0
aW9ucykuIFNpbmNlIGlnY190c25fdHhfYXJiKCkgZW5zdXJlcyBhIApzdGFuZGFyZCBtYXBwaW5n
IG9mIHRjLCBzb2NrZXQgcHJpb3JpdHksIGFuZCBoYXJkd2FyZSBxdWV1ZSBwcmlvcml0eSwgSSds
bCAKZW5hYmxlIHRhcHJpbyB0byB1c2UgaWdjX3Rzbl90eF9hcmIoKSBpbiBhIHNlcGFyYXRlIHBh
dGNoIHN1Ym1pc3Npb24uCgpJJ2xsIHNwbGl0IHRoZSBjaGFuZ2VzIGJhc2VkIG9uIFZsYWRpbWly
J3Mgc3VnZ2VzdGlvbi4KCkZpcnN0IHBhcnQgLSBldGh0b29sLW1tIHJlbGF0ZWQ6CmlnYzogQWRk
IHN1cHBvcnQgdG8gZ2V0IGZyYW1lIHByZWVtcHRpb24gc3RhdGlzdGljcyB2aWEgZXRodG9vbApp
Z2M6IEFkZCBzdXBwb3J0IHRvIGdldCBNQUMgTWVyZ2UgZGF0YSB2aWEgZXRodG9vbAppZ2M6IEFk
ZCBzdXBwb3J0IHRvIHNldCB0eC1taW4tZnJhZy1zaXplCmlnYzogQWRkIHN1cHBvcnQgZm9yIGZy
YW1lIHByZWVtcHRpb24gdmVyaWZpY2F0aW9uCmlnYzogU2V0IHRoZSBSWCBwYWNrZXQgYnVmZmVy
IHNpemUgZm9yIFRTTiBtb2RlCmlnYzogT3B0aW1pemUgVFggcGFja2V0IGJ1ZmZlciB1dGlsaXph
dGlvbgppZ2M6IFJlbmFtZSB4ZHBfZ2V0X3R4X3JpbmcoKSBmb3Igbm9uLVhEUCB1c2FnZQpuZXQ6
IGV0aHRvb2w6IG1tOiBFeHRyYWN0IHN0bW1hYyB2ZXJpZmljYXRpb24gbG9naWMgaW50byBhIGNv
bW1vbiBsaWJyYXJ5CgpTZWNvbmQgcGFydDoKaWdjOiBBZGQgc3VwcG9ydCBmb3IgcHJlZW1wdGli
bGUgdHJhZmZpYyBjbGFzcyBpbiB0YXByaW8gYW5kIG1xcHJpbwppZ2M6IFVzZSBpZ2NfdHNuX3R4
X2FyYigpIGZvciB0YXByaW8gcXVldWUgcHJpb3JpdHkgc2NoZW1lCmlnYzogS3VydCdzIHBhdGNo
IG9uIG1xcHJpbyB0byB1c2Ugbm9ybWFsIFRTTiBUeCBtb2RlCgpLdXJ0IGNhbiBrZWVwIGlnY190
c25fdHhfYXJiKCkgZm9yIGhpcyBtcXByaW8gcGF0Y2gsIHNvIHByZWVtcHRpYmxlIHRjIApzaG91
bGQgd29yayB0aGUgc2FtZSBmb3IgYm90aCB0YXByaW8gYW5kIG1xcHJpby4KCkknbSBzdWdnZXN0
aW5nIHRvIGluY2x1ZGUgS3VydCdzIHBhdGNoIGluIHRoZSBzZWNvbmQgcGFydCBzaW5jZSB0aGVy
ZSdzIApzb21lIGRlcGVuZGVuY3kgYW5kIHBvdGVudGlhbCBjb2RlIGNvbmZsaWN0LCBldmVuIHRo
b3VnaCBpdCBtaXhlcyBkaWZmZXJlbnQgCmZ1bmN0aW9uYWwgY2hhbmdlcyBpbiB0aGUgc2FtZSBz
ZXJpZXMuCgpEb2VzIHRoaXMgc291bmQgZ29vZCB0byB5b3U/CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
