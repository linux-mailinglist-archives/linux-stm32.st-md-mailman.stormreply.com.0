Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C56BA3F5F0
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 14:30:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325A0C7A839;
	Fri, 21 Feb 2025 13:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DDFCC7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740144625; x=1771680625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yrgPSzS1iVpcnrrmsNx/lFzIbzwcOZjCNokDJvcWQ3s=;
 b=V5qj6kjT89I4ikTT/G+elFHhaQaKPIm5xRrNpxNj52O/sRd/v8UBvE32
 cseNNRy59htiMrbbzdbL9tmYIi9EoYLPOEFoOd0EF9a6k4ohIaL+v9of3
 UfTF84D7kRMw2F/U5zH58Ov6ple3HzXOYNKCp0KmUTez3iSvy6+Mnl9p3
 Bc5+vjpJEvu/vzp5Nm6jttSxu3NJ/colBaFUmjb1aO15ROLxryUeZVD39
 xLF0LeOEC4wdsvqgiujXLgUAhWd4nmENu118TZ2ekW84+xlv81m5df+p4
 EEJ52Og3n5f/6HslMz3goIHOJhZJVQ6sgpUBC/66QyUoRucTrU7cxn5hj A==;
X-CSE-ConnectionGUID: raJ73YHsRAifLvcamYTTTw==
X-CSE-MsgGUID: WSSQR5iMSqGUEljuzlc2Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58510785"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="58510785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:30:22 -0800
X-CSE-ConnectionGUID: Yyg/CP+UTXO0VBzS4RNfow==
X-CSE-MsgGUID: k5Pn0+0ERjyzbmGZjjCwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120614996"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.60.175])
 ([10.247.60.175])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:30:11 -0800
Message-ID: <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
Date: Fri, 21 Feb 2025 21:30:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Furong Xu <0x1207@gmail.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com> <20250221095651.npjpkoy2y6nehusy@skbuf>
 <20250221182409.00006fd1@gmail.com> <20250221104333.6s7nvn2wwco3axr3@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250221104333.6s7nvn2wwco3axr3@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
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

CgpPbiAyMS8yLzIwMjUgNjo0MyBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+IE9uIEZyaSwg
RmViIDIxLCAyMDI1IGF0IDA2OjI0OjA5UE0gKzA4MDAsIEZ1cm9uZyBYdSB3cm90ZToKPj4gWW91
ciBmaXggaXMgYmV0dGVyIHdoZW4gbGluayBpcyB1cC9kb3duLCBzbyBJIHZvdGUgdmVyaWZ5X2Vu
YWJsZWQuCj4gCj4gSG1tbS4uLiBJIHRob3VnaHQgdGhpcyB3YXMgYSBidWcgaW4gc3RtbWFjIHRo
YXQgd2FzIGNhcnJpZWQgb3ZlciB0bwo+IGV0aHRvb2xfbW1zdiwgYnV0IGl0IGxvb2tzIGxpa2Ug
aXQgaXNuJ3QuCj4gCj4gSW4gZmFjdCwgbG9va2luZyBhdCB0aGUgb3JpZ2luYWwgcmVmYWN0b3Jp
bmcgcGF0Y2ggSSBoYWQgYXR0YWNoZWQgaW4KPiB0aGlzIGVtYWlsOgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL25ldGRldi8yMDI0MTIxNzAwMjI1NC5seWFrdWlhMzJqYm52YTQ2QHNrYnVmLwo+
IAo+IHRoZXNlIDIgbGluZXMgaW4gZXRodG9vbF9tbXN2X2xpbmtfc3RhdGVfaGFuZGxlKCkgZGlk
bid0IGV4aXN0IGF0IGFsbC4KPiAKPiAJfSBlbHNlIHsKPj4+Pj4gCQltbXN2LT5zdGF0dXMgPSBF
VEhUT09MX01NX1ZFUklGWV9TVEFUVVNfSU5JVElBTDsKPj4+Pj4gCQltbXN2LT52ZXJpZnlfcmV0
cmllcyA9IEVUSFRPT0xfTU1fTUFYX1ZFUklGWV9SRVRSSUVTOwo+IAo+IAkJLyogTm8gbGluayBv
ciBwTUFDIG5vdCBlbmFibGVkICovCj4gCQlldGh0b29sX21tc3ZfY29uZmlndXJlX3BtYWMobW1z
diwgZmFsc2UpOwo+IAkJZXRodG9vbF9tbXN2X2NvbmZpZ3VyZV90eChtbXN2LCBmYWxzZSk7Cj4g
CX0KPiAKPiBGYWl6YWwsIGNvdWxkIHlvdSByZW1pbmQgbWUgd2h5IHRoZXkgd2VyZSBhZGRlZD8g
SSBkb24ndCBzZWUgdGhpcwo+IGV4cGxhaW5lZCBpbiBjaGFuZ2UgbG9ncy4KPiAKCkhpIFZsYWRp
bWlyLAoKWWVhaCwgaXQgd2FzbuKAmXQgdGhlcmUgb3JpZ2luYWxseS4gSSBhZGRlZCB0aGF0IGNo
YW5nZSBiZWNhdXNlIGl0IGZhaWxlZCB0aGUgCmxpbmsgZG93bi9saW5rIHVwIHRlc3QuCkFmdGVy
IGEgc3VjY2Vzc2Z1bCB2ZXJpZmljYXRpb24sIGlmIHRoZSBsaW5rIHBhcnRuZXIgZ29lcyBkb3du
LCB0aGUgc3RhdHVzIApzdGlsbCBzaG93cyBFVEhUT09MX01NX1ZFUklGWV9TVEFUVVNfU1VDQ0VF
REVELCB3aGljaCBpc27igJl0IGNvcnJlY3TigJRzbyAKdGhhdOKAmXMgd2h5IEkgYWRkZWQgaXQu
CgpTb3JyeSBmb3Igbm90IG1lbnRpb25pbmcgaXQgZWFybGllci4gSSBhc3N1bWVkIHlvdeKAmWQg
Y2hlY2sgdGhlIGRlbHRhIApiZXR3ZWVuIHRoZSBvcmlnaW5hbCBwYXRjaCBhbmQgdGhlIHVwc3Ry
ZWFtIG9uZSwgbXkgYmFkLCBzaG91bGQgaGF2ZSAKbWVudGlvbmVkIHRoaXMgbG9naWMgY2hhbmdl
LgoKU2hvdWxkIEkgdXBkYXRlIGl0IHRvIHRoZSBsYXRlc3Qgc3VnZ2VzdGlvbj8KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
