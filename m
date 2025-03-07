Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4248A566A0
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 12:26:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D58C78034;
	Fri,  7 Mar 2025 11:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30366C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741346779; x=1772882779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IRGd/73/547JbPgxOPTPAv9MDN91O+zWBBkgec1T5PM=;
 b=ew4jfmLbgTbMwRWauGOpnLNaEyeLY80qZXWjWUdAh/DJSarqPyZOl7ye
 4q8vSBhqyD5NyDyEQ01YPV6GTeAlgpvGzeO09Eh97NYEEOiqPwmk9CuLs
 XGrM47pMBLx1lpw4iXbVwb1udS/YjM7c6nCtYKUQZjbq3tMgX18mUm8XP
 4p6HPjf3Rhh329rhx3tDHRGYlqc3TVOgB3pdNMVgkiXvqGo05g7wshf4u
 H1TXBQ6QcXmmAo8fQH8T1aCDl2d1WY0fHrPX6OwHln3lg9jUQr3YEolRe
 ucsRMYvJm48ubwdHbsAByOzOEI34c4vt5iq1Y3sN5oaRH+QEIfT1ESzhM A==;
X-CSE-ConnectionGUID: RT/ujFrEQrW4N186bRNOSg==
X-CSE-MsgGUID: +y2LhX4LRqqMGqH/fTElCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52598957"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52598957"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:26:16 -0800
X-CSE-ConnectionGUID: MhGzflfcR5uwjOmgTHfi1w==
X-CSE-MsgGUID: RXDB3iloTN6BhM+AbCLNOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="123891784"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.100.177])
 ([10.247.100.177])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:26:08 -0800
Message-ID: <152e48f6-e68d-4de4-8170-3f35df1ddd1d@linux.intel.com>
Date: Fri, 7 Mar 2025 19:26:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-9-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-9-faizal.abdul.rahim@linux.intel.com>
 <20250306004301.evw34gqoyll36mso@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250306004301.evw34gqoyll36mso@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v8 08/11] igc: add support to set
 tx-min-frag-size
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

CgpPbiA2LzMvMjAyNSA4OjQzIGFtLCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6Cj4+IGRpZmYgLS1n
aXQgYS9uZXQvZXRodG9vbC9tbS5jIGIvbmV0L2V0aHRvb2wvbW0uYwo+PiBpbmRleCBhZDliNDAw
MzQwMDMuLjRjMzk1Y2Q5NDlhYiAxMDA2NDQKPj4gLS0tIGEvbmV0L2V0aHRvb2wvbW0uYwo+PiAr
KysgYi9uZXQvZXRodG9vbC9tbS5jCj4+IEBAIC0xNTMsNyArMTUzLDcgQEAgY29uc3Qgc3RydWN0
IG5sYV9wb2xpY3kgZXRobmxfbW1fc2V0X3BvbGljeVtFVEhUT09MX0FfTU1fTUFYICsgMV0gPSB7
Cj4+ICAgCVtFVEhUT09MX0FfTU1fVkVSSUZZX1RJTUVdCT0gTkxBX1BPTElDWV9SQU5HRShOTEFf
VTMyLCAxLCAxMjgpLAo+PiAgIAlbRVRIVE9PTF9BX01NX1RYX0VOQUJMRURdCT0gTkxBX1BPTElD
WV9NQVgoTkxBX1U4LCAxKSwKPj4gICAJW0VUSFRPT0xfQV9NTV9QTUFDX0VOQUJMRURdCT0gTkxB
X1BPTElDWV9NQVgoTkxBX1U4LCAxKSwKPj4gLQlbRVRIVE9PTF9BX01NX1RYX01JTl9GUkFHX1NJ
WkVdCT0gTkxBX1BPTElDWV9SQU5HRShOTEFfVTMyLCA2MCwgMjUyKSwKPj4gKwlbRVRIVE9PTF9B
X01NX1RYX01JTl9GUkFHX1NJWkVdCT0gTkxBX1BPTElDWV9SQU5HRShOTEFfVTMyLCA2MCwgMjU2
KSwKPiAKPiBQbGVhc2UgbWFrZSB0aGlzIGEgc2VwYXJhdGUgcGF0Y2ggd2l0aCBhIHJlYXNvbmFi
bHkgY29udmluY2luZwo+IGp1c3RpZmljYXRpb24gZm9yIGFueSByZWFkZXIsIGFuZCBhbHNvIHN0
YXRlIHdoeSBpdCBpcyBhIGNoYW5nZSB0aGF0Cj4gd2lsbCBub3QgaW50cm9kdWNlIHJlZ3Jlc3Np
b25zIHRvIHRoZSBvdGhlciBkcml2ZXJzLiBJdCBzaG93cyB0aGF0Cj4geW91J3ZlIGRvbmUgdGhl
IGR1ZSBkaWxsaWdlbmNlIG9mIGNoZWNraW5nIHRoYXQgdGhleSBhbGwgdXNlCj4gZXRodG9vbF9t
bV9mcmFnX3NpemVfbWluX3RvX2FkZCgpLCB3aGljaCBlcnJvcnMgb3V0IG9uIG5vbi1zdGFuZGFy
ZAo+IHZhbHVlcy4KPiAKPiBUbyBiZSBjbGVhciwgZXh0ZW5kaW5nIHRoZSBwb2xpY3kgZnJvbSAy
NTIgdG8gMjU2IGlzIGp1c3QgdG8gc3VwcHJlc3MKPiB0aGUgbmV0bGluayB3YXJuaW5nIHdoaWNo
IHN0YXRlcyB0aGF0IHRoZSBkcml2ZXIgcm91bmRzIHVwIHRoZSBtaW5pbXVtCj4gZnJhZ21lbnQg
c2l6ZSwgY29ycmVjdD8gQmVjYXVzZSBldmVuIGlmIHlvdSBwYXNzIDI1MiAodGhlIGN1cnJlbnQK
PiBuZXRsaW5rIG1heGltdW0pLCB0aGUgZHJpdmVyIHdpbGwgc3RpbGwgdXNlIDI1Ni4KPiAKSSBv
cmlnaW5hbGx5IGNoYW5nZWQgMjUyIHRvIDI1NiBiZWNhdXNlIG91ciBpbnRlcm5hbCB2YWxpZGF0
aW9uIGZhaWxlZCB3aGVuIApzZXR0aW5nIDI1NiB2aWEgZXRodG9vbC4gVGhlIHRlc3QgY2FzZSB3
YXMgYmFzZWQgb24gb3VyIG9sZCBrZXJuZWwgT09UIApwYXRjaGVzIGNvZGUsIGJ1dCB0aGlzIHJ1
biB3YXMgZG9uZSBvbiB0aGUgdXBzdHJlYW1lZCBGUEUgZnJhbWV3b3JrIHBsdXMgCnRoaXMgc2Vy
aWVzLiBBZnRlciB0aGlua2luZyBhYm91dCBpdCwgaXQgZG9lc27igJl0IHNlZW0gcmlnaHQgdG8g
Y2hhbmdlIHRoaXMgCmp1c3QgdG8gYWNjb21tb2RhdGUgdGhlIGkyMjYgcXVpcmsgaW4gYSBjb21t
b24gbGF5ZXIgd2hlbiB0aGUgSUVFRSBzdGFuZGFyZCAKYW5kIG90aGVyIGRldmljZXMgdXNlIDI1
Mi4KClNvLCB3ZeKAmWxsIHVwZGF0ZSBvdXIgdmFsaWRhdGlvbiB0byB1c2UgMjUyIGluc3RlYWQu
IFRoZSBkcml2ZXIgYWxyZWFkeSAKcm91bmRzIHVwIHRvIDI1NiBhbnl3YXkuIEnigJlsbCBkcm9w
IHRoaXMgY2hhbmdlIGluIHRoZSBuZXh0IHJldmlzaW9uLgoKQWxzbywgbm90ZWQgeW91ciBwb2lu
dCBhYm91dCBiZWluZyBjYXV0aW91cyB3aXRoIGNoYW5nZXMgdGhhdCBpbXBhY3Qgb3RoZXIgCmRy
aXZlcnMuCgpUaGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
