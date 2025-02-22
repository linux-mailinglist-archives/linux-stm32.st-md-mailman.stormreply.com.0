Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E031CA40415
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2025 01:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD93C7803D;
	Sat, 22 Feb 2025 00:26:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB703C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2025 00:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183976; x=1771719976;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vrsf0n7ZKY8Rgo7QAxaBCIwX0QhPlVwAlrXV1JsxYTc=;
 b=FUDYZiDn/GW3AQIGJpTHYVKw1JtbrDxafYgaHp+c88faMBTtfQEJYQVB
 SK7pAGuByCPbfMRMRPkCm4BgeVfRgGGfSxyj1GP1IouRzzBrxvWOdIyZq
 KbjkX6D82seM8ZxJYs/Es8/zgfs3ZgHjrGzLPcJCLAhjsB9wTf/nWMCtq
 8+Crk61zddSdjCBFmYEifbJwYsLplmLmo3NZqQ/XH52+jLNikA+KNJasd
 6vVaS+vWZfBleDAAEN4j3OQLPVQxeaErCxWk6THV+FSR9Gw/8nPEYO4as
 vgCdtCAOBQA1rdW6Aqr5Ych8x+5DpOFieVDSLzUaHtv0jFKfe3zUzsyGy A==;
X-CSE-ConnectionGUID: fF/mGJOCRsm3tY2bmDi/QA==
X-CSE-MsgGUID: DYysmtwwTqi5ajX5OK54CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="63488040"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="63488040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:26:13 -0800
X-CSE-ConnectionGUID: PHiHpXemQRq6zbcoQudtdA==
X-CSE-MsgGUID: +tqM9EucTUKBlk9KS9eT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115474920"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.60.175])
 ([10.247.60.175])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:26:05 -0800
Message-ID: <fbcbfdc4-5f20-4dbc-9e46-e9c28fc399c8@linux.intel.com>
Date: Sat, 22 Feb 2025 08:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com> <20250221095651.npjpkoy2y6nehusy@skbuf>
 <20250221182409.00006fd1@gmail.com> <20250221104333.6s7nvn2wwco3axr3@skbuf>
 <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
 <20250221144402.6nuuosfjmo5tqgmj@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250221144402.6nuuosfjmo5tqgmj@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

CgpPbiAyMS8yLzIwMjUgMTA6NDQgcG0sIFZsYWRpbWlyIE9sdGVhbiB3cm90ZToKPiBPbiBGcmks
IEZlYiAyMSwgMjAyNSBhdCAwOTozMDowOVBNICswODAwLCBBYmR1bCBSYWhpbSwgRmFpemFsIHdy
b3RlOgo+PiBPbiAyMS8yLzIwMjUgNjo0MyBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+Pj4g
T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMDY6MjQ6MDlQTSArMDgwMCwgRnVyb25nIFh1IHdyb3Rl
Ogo+Pj4+IFlvdXIgZml4IGlzIGJldHRlciB3aGVuIGxpbmsgaXMgdXAvZG93biwgc28gSSB2b3Rl
IHZlcmlmeV9lbmFibGVkLgo+Pj4KPj4+IEhtbW0uLi4gSSB0aG91Z2h0IHRoaXMgd2FzIGEgYnVn
IGluIHN0bW1hYyB0aGF0IHdhcyBjYXJyaWVkIG92ZXIgdG8KPj4+IGV0aHRvb2xfbW1zdiwgYnV0
IGl0IGxvb2tzIGxpa2UgaXQgaXNuJ3QuCj4+Pgo+Pj4gSW4gZmFjdCwgbG9va2luZyBhdCB0aGUg
b3JpZ2luYWwgcmVmYWN0b3JpbmcgcGF0Y2ggSSBoYWQgYXR0YWNoZWQgaW4KPj4+IHRoaXMgZW1h
aWw6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyNDEyMTcwMDIyNTQubHlh
a3VpYTMyamJudmE0NkBza2J1Zi8KPj4+Cj4+PiB0aGVzZSAyIGxpbmVzIGluIGV0aHRvb2xfbW1z
dl9saW5rX3N0YXRlX2hhbmRsZSgpIGRpZG4ndCBleGlzdCBhdCBhbGwuCj4+Pgo+Pj4gCX0gZWxz
ZSB7Cj4+Pj4+Pj4gCQltbXN2LT5zdGF0dXMgPSBFVEhUT09MX01NX1ZFUklGWV9TVEFUVVNfSU5J
VElBTDsKPj4+Pj4+PiAJCW1tc3YtPnZlcmlmeV9yZXRyaWVzID0gRVRIVE9PTF9NTV9NQVhfVkVS
SUZZX1JFVFJJRVM7Cj4+Pgo+Pj4gCQkvKiBObyBsaW5rIG9yIHBNQUMgbm90IGVuYWJsZWQgKi8K
Pj4+IAkJZXRodG9vbF9tbXN2X2NvbmZpZ3VyZV9wbWFjKG1tc3YsIGZhbHNlKTsKPj4+IAkJZXRo
dG9vbF9tbXN2X2NvbmZpZ3VyZV90eChtbXN2LCBmYWxzZSk7Cj4+PiAJfQo+Pj4KPj4+IEZhaXph
bCwgY291bGQgeW91IHJlbWluZCBtZSB3aHkgdGhleSB3ZXJlIGFkZGVkPyBJIGRvbid0IHNlZSB0
aGlzCj4+PiBleHBsYWluZWQgaW4gY2hhbmdlIGxvZ3MuCj4+Pgo+Pgo+PiBIaSBWbGFkaW1pciwK
Pj4KPj4gWWVhaCwgaXQgd2FzbuKAmXQgdGhlcmUgb3JpZ2luYWxseS4gSSBhZGRlZCB0aGF0IGNo
YW5nZSBiZWNhdXNlIGl0IGZhaWxlZCB0aGUKPj4gbGluayBkb3duL2xpbmsgdXAgdGVzdC4KPj4g
QWZ0ZXIgYSBzdWNjZXNzZnVsIHZlcmlmaWNhdGlvbiwgaWYgdGhlIGxpbmsgcGFydG5lciBnb2Vz
IGRvd24sIHRoZSBzdGF0dXMKPj4gc3RpbGwgc2hvd3MgRVRIVE9PTF9NTV9WRVJJRllfU1RBVFVT
X1NVQ0NFRURFRCwgd2hpY2ggaXNu4oCZdCBjb3JyZWN04oCUc28KPj4gdGhhdOKAmXMgd2h5IEkg
YWRkZWQgaXQuCj4+Cj4+IFNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBpdCBlYXJsaWVyLiBJIGFz
c3VtZWQgeW914oCZZCBjaGVjayB0aGUgZGVsdGEgYmV0d2Vlbgo+PiB0aGUgb3JpZ2luYWwgcGF0
Y2ggYW5kIHRoZSB1cHN0cmVhbSBvbmUsIG15IGJhZCwgc2hvdWxkIGhhdmUgbWVudGlvbmVkIHRo
aXMKPj4gbG9naWMgY2hhbmdlLgo+Pgo+PiBTaG91bGQgSSB1cGRhdGUgaXQgdG8gdGhlIGxhdGVz
dCBzdWdnZXN0aW9uPwo+IAo+IE5ldmVyLCBldmVyIG1vZGlmeSBsb2dpYyBpbiB0aGUgc2FtZSBj
b21taXQgYXMgeW91IGFyZSBtb3ZpbmcgY29kZS4KPiBJIHdhcyB3b25kZXJpbmcgd2hhdCdzIHdp
dGggdGhlIENvLWRldmVsb3BlZC1ieTogdGFncywgYnV0IEkgaGFkIGp1c3QKPiBhc3N1bWVkIGZp
eHVwcyB3ZXJlIG1hZGUgdG8gY29kZSBJIGhhZCBpbXByb3Blcmx5IG1vdmVkIGJlY2F1c2UgSQo+
IGRpZG4ndCBoYXZlIGhhcmR3YXJlIHRvIHRlc3QuIEFsd2F5cyBzdHJ1Y3R1cmUgcGF0Y2hlcyB0
byBiZSBvbmUgc2luZ2xlCj4gbG9naWNhbCBjaGFuZ2UgcGVyIHBhdGNoLCB3ZWxsIGp1c3RpZmll
ZCBhbmQgdHJpdmlhbGx5IGNvcnJlY3QuCgpHb3QgaXQsIHNvcnJ5IGFib3V0IHRoYXQuCgo+IEkg
aGFkIGFzc3VtZWQsIGluIGdvb2QgZmFpdGgsIGNoYW5nZXMgbGlrZSB0aGlzIHdvdWxkbid0IHNu
ZWFrIGluLCBidXQgSQo+IGd1ZXNzIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93IEkgc2hvdWxk
IGNoZWNrIG5leHQgdGltZSA6KQo+IAo+IEkgdGhpbmsgaXQncyBhIHNsaWdodGx5IG9wZW4gcXVl
c3Rpb24gd2hpY2ggc3RhdGUgc2hvdWxkIHRoZSB2ZXJpZmljYXRpb24KPiBiZSBpbiB3aGVuIHRo
ZSBsaW5rIGZhaWxzLCBidXQgaW4gYW55IGNhc2UsIHlvdXIgYXJndW1lbnQgY291bGQgYmUgbWFk
ZQo+IHRoYXQgdGhlIHN0YXRlIG9mIHRoZSBwcmV2aW91cyB2ZXJpZmljYXRpb24gc2hvdWxkIGJl
IGxvc3QuCj4gCj4gSWYgSSBsb29rIGF0IGZpZ3VyZSA5OS04IGluIHRoZSBWZXJpZnkgc3RhdGUg
ZGlhZ3JhbSwgSSBzZWUgdGhhdAo+IHdoZW5ldmVyIHRoZSBjb25kaXRpb24gImJlZ2luIHx8IGxp
bmtfZmFpbCB8fCBkaXNhYmxlVmVyaWZ5IHx8ICFwRW5hYmxlIgo+IGlzIHRydWUsIHdlIHRyYW5z
aXRpb24gdG8gdGhlIHN0YXRlIElOSVRfVkVSSUZJQ0FUSU9OLiBGcm9tIHRoZXJlLCB0aGVyZQo+
IGlzIGEgVUNUICh1bmNvbmRpdGlvbmFsIHRyYW5zaXRpb24pIHRvIFZFUklGSUNBVElPTl9JRExF
LCBhbmQgZnJvbSB0aGVyZSwKPiBhIHRyYW5zaXRpb24gdG8gc3RhdGUgU0VORF9WRVJJRlkgYmFz
ZWQgb24gInBFbmFibGUgJiYgIWRpc2FibGVWZXJpZnkiLgo+IEluIHByaW5jaXBsZSB3aGF0IHRo
aXMgaXMgdGVsbGluZyBtZSBpcyB0aGF0IGFzIGxvbmcgYXMgbWFuYWdlbWVudAo+IHNvZnR3YXJl
IGRvZXNuJ3Qgc2V0IHBFbmFibGUgKHR4X2VuYWJsZSBpbiBMaW51eCkgdG8gZmFsc2UsIHZlcmlm
aWNhdGlvbgo+IHdvdWxkIGJlIGF0dGVtcHRlZCBldmVuIHdpdGggbGluayBkb3duLCBhbmQgc2hv
dWxkIGV2ZW50dWFsbHkgZmFpbC4KPiAKPiBCdXQgdGhlIG1tc3Ygc3RhdGUgbWFjaGluZSBkb2Vz
IGNhbGwgZXRodG9vbF9tbXN2X2NvbmZpZ3VyZV90eChtbXN2LCBmYWxzZSksCj4gYW5kIGluIHRo
YXQgY2FzZSwgaWYgSSB3ZXJlIHRvIGludGVycHJldCB0aGUgc3RhbmRhcmQgc3RhdGUgbWFjaGlu
ZSB2ZXJ5Cj4gc3RyaWN0bHksIGl0IHdvdWxkIHJlbWFpbiBibG9ja2VkIGluIHN0YXRlIFZFUklG
SUNBVElPTl9JRExFIHVudGlsIGEKPiBsaW5rIHVwICh0aHVzLCB3ZSBzaG91bGQgcmVwb3J0IHRo
ZSBzdGF0ZSBhcyAidmVyaWZ5aW5nIikuCj4gCj4gQnV0LCB0byBiZSBob25lc3QsIEkgdGhpbmsg
dGhlIGV4aXN0ZW5jZSBvZiB0aGUgVkVSSUZJQ0FUSU9OX0lETEUgc3RhdGUKPiBkb2Vzbid0IG1h
a2UgYSBsb3Qgb2Ygc2Vuc2UuIFRoZSBzdGF0ZSBtYWNoaW5lIHNob3VsZCBqdXN0IHRyYW5zaXRp
b24gb24KPiAiIWxpbmtfZmFpbCAmJiAhZGlzYWJsZV92ZXJpZnkgJiYgcEVuYWJsZSIgdG8gU0VO
RF9WRVJJRlkgZGlyZWN0bHksIGFuZAo+IGZyb20gc3RhdGUgV0FJVF9GT1JfUkVTUE9OU0UgaXQg
c2hvdWxkIGN5Y2xlIGJhY2sgdG8gU0VORF9WRVJJRlkgaWYgdGhlCj4gdmVyaWZ5IHRpbWVyIGV4
cGlyZWQgYnV0IHdlIHN0aWxsIGhhdmUgcmV0cmllcywgb3IgdG8gSU5JVF9WRVJJRklDQVRJT04K
PiBpZiBsaW5rX2ZhaWwsIGRpc2FibGVWZXJpZnkgb3IgcEVuYWJsZSBjaGFuZ2UuIE9uZSBtb3Jl
IHJlYXNvbiB3aHkgSQo+IGJlbGlldmUgdGhlIFZFUklGSUNBVElPTl9JRExFIHN0YXRlIGlzIHJl
ZHVuZGFudCBhbmQgdW5kZXItc3BlY2lmaWVkIGlzCj4gYmVjYXVzZSBpdCBnaXZlcyB0aGUgdXNl
ciBubyBjaGFuY2UgdG8gZXZlbiBfc2VlXyB0aGUgImluaXRpYWwiIHN0YXRlCj4gYmVpbmcgcmVw
b3J0ZWQgZXZlciwgZ2l2ZW4gdGhlIHVuY29uZGl0aW9uYWwgdHJhbnNpdGlvbiB0byBWRVJJRklD
QVRJT05fSURMRS4KPiAKPiBTbyBpbiB0aGF0IHNlbnNlLCBJIGFncmVlIHdpdGggeW91ciBwcm9w
b3NhbCwgYW5kIGluIHRlcm1zIG9mIGNvZGUsCj4gSSB3b3VsZCByZWNvbW1lbmQganVzdCB0aGlz
Ogo+IAo+ICAgfSBlbHNlIHsKPiArCS8qIFJlc2V0IHRoZSByZXBvcnRlZCB2ZXJpZmljYXRpb24g
c3RhdGUgd2hpbGUgdGhlIGxpbmsgaXMgZG93biAqLwo+ICsJaWYgKG1tc3YtPnZlcmlmeV9lbmFi
bGVkKQo+ICsJCW1tc3YtPnN0YXR1cyA9IEVUSFRPT0xfTU1fVkVSSUZZX1NUQVRVU19JTklUSUFM
Owo+ICAgCj4gICAJLyogTm8gbGluayBvciBwTUFDIG5vdCBlbmFibGVkICovCj4gICAJZXRodG9v
bF9tbXN2X2NvbmZpZ3VyZV9wbWFjKG1tc3YsIGZhbHNlKTsKPiAgIAlldGh0b29sX21tc3ZfY29u
ZmlndXJlX3R4KG1tc3YsIGZhbHNlKTsKPiAgIH0KPiAKPiBCZWNhdXNlIHRoaXMgaXMganVzdCBm
b3IgcmVwb3J0aW5nIHRvIHVzZXIgc3BhY2UsIHJlc2V0dGluZwo+ICJtbXN2LT52ZXJpZnlfcmV0
cmllcyA9IEVUSFRPT0xfTU1fTUFYX1ZFUklGWV9SRVRSSUVTOyIgZG9lc24ndCBtYXR0ZXIsCj4g
d2UnbGwgZG8gaXQgb24gbGluayB1cCBhbnl3YXkuCj4gCj4gQWxzbyBub3RlIHRoYXQgdGhlcmUn
cyBubyB0ZXJuYXJ5IG9wZXJhdG9yIGxpa2UgaW4gdGhlIGRpc2N1c3Npb24gd2l0aAo+IEZ1cm9u
Zy4gSWYgbW1zdi0+dmVyaWZ5X2VuYWJsZWQgaXMgZmFsc2UsIHRoZSBtbXN2LT5zdGF0dXMgc2hv
dWxkCj4gYWxyZWFkeSBiZSBESVNBQkxFRCwgbm8gbmVlZCBmb3IgdXMgdG8gcmUtYXNzaWduIGl0
Lgo+IAoKV2lsbCB1cGRhdGUsIHRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
