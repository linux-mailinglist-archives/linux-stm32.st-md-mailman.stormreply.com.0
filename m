Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBCA340D8
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 14:54:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D17C78F6D;
	Thu, 13 Feb 2025 13:54:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E6D1C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739454861; x=1770990861;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g5HGHBuqAjMQOceJtIfxFmXU57w01hrdcPk8EKvjSzU=;
 b=Xu3eCIroyvw4UZ+Ate15tulujboi4R9CS+5+7Pla/a4MqP9XYV1Txj2Z
 K5hVJSy7PbYJ1HXspcvpSEjG9cuD5OhmJKunosPXXbJcGN9lbbsssysKd
 zQianfwGiGcvnkKDnlX4+1fzZzcm0zohU8+C4uhD5fk9jXT75Ul/UHcHS
 qSbv6r5JoBObffSLCvSOiNyQ4NtfK8rfTQcvVDPGAyQbADcrvKzyaloeu
 UEbihgaVReBmOY/Cm9DvXa6oDfYGKD2d6N+PMXBWH40tgDSZxQU7FELwX
 gGXZreMGfNskYJL9kdHDdLcVbbRVRRSDuSDzTm/22lms2LgsYKrzotLyE g==;
X-CSE-ConnectionGUID: uYnJiTjdTVivNlIOwmlPLw==
X-CSE-MsgGUID: zGxbD+xgQ4GOaTRT9fPRAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40019857"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40019857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:54:12 -0800
X-CSE-ConnectionGUID: Va5fv8RuSjiYMn+k3238nA==
X-CSE-MsgGUID: 1CjFB4TaT2qSpWMyGvwtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118080787"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.42.34])
 ([10.247.42.34])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:54:04 -0800
Message-ID: <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
Date: Thu, 13 Feb 2025 21:54:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250213130003.nxt2ev47a6ppqzrq@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
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

CgpPbiAxMy8yLzIwMjUgOTowMCBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+IE9uIFRodSwg
RmViIDEzLCAyMDI1IGF0IDA4OjU0OjE4UE0gKzA4MDAsIEFiZHVsIFJhaGltLCBGYWl6YWwgd3Jv
dGU6Cj4+PiBXZWxsLCBteSBpZGVhIHdhcyB0byBtb3ZlIHRoZSBjdXJyZW50IG1xcHJpbyBvZmZs
b2FkIGltcGxlbWVudGF0aW9uIGZyb20KPj4+IGxlZ2FjeSBUU04gVHggbW9kZSB0byB0aGUgbm9y
bWFsIFRTTiBUeCBtb2RlLiBUaGVuLCB0YXByaW8gYW5kIG1xcHJpbwo+Pj4gY2FuIHNoYXJlIHRo
ZSBzYW1lIGNvZGUgKHdpdGggb3Igd2l0aG91dCBmcGUpLiBJIGhhdmUgYSBkcmFmdCBwYXRjaAo+
Pj4gcmVhZHkgZm9yIHRoYXQuIFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0Pwo+Pgo+PiBIaSBL
dXJ0LAo+Pgo+PiBJ4oCZbSBva2F5IHdpdGggaW5jbHVkaW5nIGl0IGluIHRoaXMgc2VyaWVzIGFu
ZCB0ZXN0aW5nIGZwZSArIG1xcHJpbywgYnV0IEnigJltCj4+IG5vdCBzdXJlIGlmIG90aGVycyBt
aWdodCBiZSBjb25jZXJuZWQgYWJvdXQgYWRkaW5nIGRpZmZlcmVudCBmdW5jdGlvbmFsCj4+IGNo
YW5nZXMgaW4gdGhpcyBmcGUgc2VyaWVzLgo+Pgo+PiBIaSBWbGFkaW1pciwKPj4gQW55IHRob3Vn
aHRzIG9uIHRoaXMgPwo+IAo+IFdlbGwsIHdoYXQgZG8geW91IHRoaW5rIG9mIG15IHNwbGl0IHBy
b3Bvc2FsIGZyb20gaGVyZSwgZXNzZW50aWFsbHkKPiBkcmF3aW5nIHRoZSBsaW5lIGZvciB0aGUg
Zmlyc3QgcGF0Y2ggc2V0IGF0IGp1c3QgZXRodG9vbCBtbT8KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9uZXRkZXYvMjAyNTAyMTMxMTA2NTMuaXF5NW1hZ24yN2p5Zm53aEBza2J1Zi8KPiAKCkhv
bmVzdGx5LCBhZnRlciByZWNvbnNpZGVyaW5nLCBJ4oCZZCBwcmVmZXIgdG8ga2VlcCB0aGUgY3Vy
cmVudCBzZXJpZXMgYXMgaXMgCih3aXRob3V0IEt1cnTigJlzIHBhdGNoKSwgYXNzdW1pbmcgeW91
4oCZcmUgb2theSB3aXRoIGVuYWJsaW5nIG1xcHJpbyArIGZwZSAKbGF0ZXIgcmF0aGVyIHRoYW4g
YXQgdGhlIHNhbWUgdGltZSBhcyB0YXByaW8gKyBmcGUuIFRoZXJlIGxpa2VseSB3b27igJl0IGJl
IAphbnkgYWRkaXRpb25hbCB3b3JrIG5lZWRlZCBmb3IgbXFwcmlvICsgZnBlIGFmdGVyIEt1cnTi
gJlzIHBhdGNoIGlzIGFjY2VwdGVkLCAKc2luY2UgaXQgd2lsbCBtb3N0bHkgcmV1c2UgdGhlIHRh
cHJpbyBjb2RlIGZsb3cuCgpJZiBJIHdlcmUgdG8gc3BsaXQgaXQsIHRoZSBzdHJ1Y3R1cmUgd291
bGQgbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOgpGaXJzdCBwYXJ0IG9mIGZwZSBzZXJpZXM6Cmln
YzogQWRkIHN1cHBvcnQgdG8gZ2V0IGZyYW1lIHByZWVtcHRpb24gc3RhdGlzdGljcyB2aWEgZXRo
dG9vbAppZ2M6IEFkZCBzdXBwb3J0IHRvIGdldCBNQUMgTWVyZ2UgZGF0YSB2aWEgZXRodG9vbApp
Z2M6IEFkZCBzdXBwb3J0IHRvIHNldCB0eC1taW4tZnJhZy1zaXplCmlnYzogQWRkIHN1cHBvcnQg
Zm9yIGZyYW1lIHByZWVtcHRpb24gdmVyaWZpY2F0aW9uCmlnYzogU2V0IHRoZSBSWCBwYWNrZXQg
YnVmZmVyIHNpemUgZm9yIFRTTiBtb2RlCmlnYzogT3B0aW1pemUgdGhlIFRYIHBhY2tldCBidWZm
ZXIgdXRpbGl6YXRpb24KaWdjOiBSZW5hbWUgeGRwX2dldF90eF9yaW5nKCkgZm9yIG5vbi1YRFAg
dXNhZ2UKbmV0OiBldGh0b29sOiBtbTogRXh0cmFjdCBzdG1tYWMgdmVyaWZpY2F0aW9uIGxvZ2lj
IGludG8gYSBjb21tb24gbGlicmFyeQoKU2Vjb25kIHBhcnQgb2YgZnBlOgppZ2M6IEFkZCBzdXBw
b3J0IGZvciBwcmVlbXB0aWJsZSB0cmFmZmljIGNsYXNzIGluIHRhcHJpbwoKSSBkb27igJl0IHRo
aW5rIEt1cnTigJlzIHBhdGNoIHNob3VsZCBiZSBpbmNsdWRlZCBpbiBteSBzZWNvbmQgcGFydCBv
ZiBmcGUsIGFzIAppdOKAmXMgbm90IGxvZ2ljYWxseSByZWxhdGVkLiBBbm90aGVyIGFwcHJvYWNo
IHdvdWxkIGJlIHRvIHdhaXQgZm9yIEt1cnTigJlzIApwYXRjaCB0byBiZSBhY2NlcHRlZCBmaXJz
dCwgdGhlbiBzdWJtaXQgdGhlIHNlY29uZCBwYXJ0IGFuZCB2ZXJpZnkgYm90aCAKdGFwcmlvICsg
bXFwcmlvLiBIb3dldmVyLCB0aGF0IHdvdWxkIGRlbGF5IGkyMjYgZnJvbSBoYXZpbmcgYSBiYXNp
YyBmcGUgCmZlYXR1cmUgd29ya2luZyBhcyBhIHdob2xlLCB3aGljaCBJJ2QgcmVhbGx5IGxpa2Ug
dG8gYXZvaWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
