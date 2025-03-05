Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15AA4FEA6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 13:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 967C9C78037;
	Wed,  5 Mar 2025 12:34:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E89CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741178048; x=1772714048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KXz7qN+UCvg/zXe/kDPAg/cy+msMPeJPVH/lqPdGHTo=;
 b=Ce08i0hA21InQxtBRh6jEGmFmBMyTOvX6asG+Dz40ryyEUu1zdHKkr7r
 KhcorW7EkiySoPO1Qbc7+YbQJO4Ls6gkXWJvljS6m7h9bSob+hfA0hyJn
 xZPl/+Mvz+Yvzpk1JDHtgoP3B84GRtDy+WX6eEODW2pxmNy6erJTwvHHM
 Jlhevli9udu7rJHRQQW/qTyvtJiQAuxcvlquYlEF05Y2XG0xPeHgFFi9y
 RGKlyvSAJ3e21ndEjcuuUgN8anGo4B9gXL/pexHo3XH91f4ACyBhwxM82
 BXh7zbEAsaJZSLh73XAJaboP0qbmyF+c6s6uZzpnt96w6o6PgHpaoQ1Tw Q==;
X-CSE-ConnectionGUID: xw6xTdzKQjCDfvZYCl46Qw==
X-CSE-MsgGUID: sEkBx31jRwGmn+FoE2f5ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46064875"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="46064875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:34:05 -0800
X-CSE-ConnectionGUID: N7Xoy4TzQJysW2kMb1XEUQ==
X-CSE-MsgGUID: eBSnBMUbTKa2RR8mn5mMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118829798"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.123.55])
 ([10.247.123.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:33:58 -0800
Message-ID: <4882bd5b-1a64-4ac7-ba51-66143d029e8a@linux.intel.com>
Date: Wed, 5 Mar 2025 20:33:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>, ",chwee.lin.choong"@intel.com
References: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
 <20250303102658.3580232-6-faizal.abdul.rahim@linux.intel.com>
 <20250304152644.y7j7eshr4qxhmxq2@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250304152644.y7j7eshr4qxhmxq2@skbuf>
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
Subject: Re: [Linux-stm32] [PATCH iwl-next v7 5/9] igc: Add support for
 frame preemption verification
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

CgpPbiA0LzMvMjAyNSAxMToyNiBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+IE9uIE1vbiwg
TWFyIDAzLCAyMDI1IGF0IDA1OjI2OjU0QU0gLTA1MDAsIEZhaXphbCBSYWhpbSB3cm90ZToKPj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBpZ2NfZnBlX2lzX3ZlcmlmeV9vcl9yZXNwb25zZSh1bmlvbiBp
Z2NfYWR2X3J4X2Rlc2MgKnJ4X2Rlc2MsCj4+ICsJCQkJCQkgdW5zaWduZWQgaW50IHNpemUpCj4+
ICt7Cj4+ICsJdTMyIHN0YXR1c19lcnJvciA9IGxlMzJfdG9fY3B1KHJ4X2Rlc2MtPndiLnVwcGVy
LnN0YXR1c19lcnJvcik7Cj4+ICsJaW50IHNtZDsKPj4gKwo+PiArCXNtZCA9IEZJRUxEX0dFVChJ
R0NfUlhEQURWX1NUQVRfU01EX1RZUEVfTUFTSywgc3RhdHVzX2Vycm9yKTsKPj4gKwo+PiArCXJl
dHVybiAoc21kID09IElHQ19SWERfU1RBVF9TTURfVFlQRV9WIHx8IHNtZCA9PSBJR0NfUlhEX1NU
QVRfU01EX1RZUEVfUikgJiYKPj4gKwkJc2l6ZSA9PSBTTURfRlJBTUVfU0laRTsKPj4gK30KPiAK
PiBUaGUgTklDIHNob3VsZCBleHBsaWNpdGx5IG5vdCByZXNwb25kIHRvIGZyYW1lcyB3aGljaCBo
YXZlIGFuIFNNRC1WIGJ1dAo+IGFyZSBub3QgInZlcmlmeSIgbVBhY2tldHMgKDcgb2N0ZXRzIG9m
IDB4NTUgKyAxIG9jdGV0IFNNRC1WICsgNjAgb2N0ZXRzCj4gb2YgMHgwMCArIG1DUkMgLSBhcyBw
ZXIgODAyLjMgZGVmaW5pdGlvbnMpLiBTaW1pbGFybHksIGl0IHNob3VsZCBvbmx5Cj4gdHJlYXQg
U01ELVIgZnJhbWVzIHdoaWNoIGNvbnRhaW4gNyBvY3RldHMgb2YgMHg1NSArIDEgb2N0ZXQgU01E
LVIgKyA2MAo+IG9jdGV0cyBvZiAweDAwICsgbUNSQyBhcyAicmVzcG9uZCIgbVBhY2tldHMsIGFu
ZCBvbmx5IGFkdmFuY2UgaXRzCj4gdmVyaWZpY2F0aW9uIHN0YXRlIG1hY2hpbmUgYmFzZWQgb24g
dGhvc2UuCj4gCj4gU3BlY2lmaWNhbGx5LCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB5b3UgYXJlIGVu
c3VyaW5nIHRoZSBwYWNrZXQgcGF5bG9hZAo+IGNvbnRhaW5zIDYwIG9jdGV0cyBvZiB6ZXJvZXMu
IElzIHRoaXMgc29tZXRoaW5nIHRoYXQgdGhlIGhhcmR3YXJlCj4gYWxyZWFkeSBkb2VzIGZvciB5
b3UsIG9yIGlzIGl0IHNvbWV0aGluZyB0aGF0IG5lZWRzIGZ1cnRoZXIgdmFsaWRhdGlvbgo+IGFu
ZCBkaWZmZXJlbnRpYXRpb24gaW4gc29mdHdhcmU/CgpUaGUgaGFyZHdhcmUgZG9lc27igJl0IGhh
bmRsZSB0aGlzLCBzbyB0aGUgaWdjIGRyaXZlciBoYXZlIHRvIGRvIGl0IG1hbnVhbGx5LiAKSSBt
aXNzZWQgdGhpcyBoYW5kbGluZywgYW5kIENod2VlIExpbiBhbHNvIG5vdGljZWQgdGhlIGlzc3Vl
IHdoaWxlIHRlc3RpbmcgCnRoaXMgcGF0Y2ggc2VyaWVz4oCUaXQgd2FzbuKAmXQgcmVqZWN0aW5n
IFNNRC1WIGFuZCBTTUQtUiB3aXRoIGEgbm9uLXplcm8gCnBheWxvYWQuIEnigJlsbCB1cGRhdGUg
dGhpcyBwYXRjaCB0byBpbmNsdWRlIHRoZSBmaXggdGhhdCBDaHdlZSBMaW4gCmltcGxlbWVudGVk
IGFuZCB0ZXN0ZWQuIFRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
