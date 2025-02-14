Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9FA35C5A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 12:20:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9BA7C78F8C;
	Fri, 14 Feb 2025 11:20:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10111C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739532027; x=1771068027;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bsMoByqwV8q04F4BIn7mVkZvxnRBIcre3Xld+Gy6r0M=;
 b=CGd61MBj/+CZV8MSi3LTRAwvuL1OVv5X48C9FK312pWeEF4THX3aujVq
 MkDC1wg14vJb72+blF9X3vqoMq+AAoPzGHAwJ3w8xaZ7IS/npuopXeU8F
 unDb+uUEmz0NTyJJzlwD0OhFEPGd5YYIf0kS5YZUI9A+XpBzQ7bp9c7Ht
 v3gLk+JHPdxMZ2Xp5BIypy1wYftopk8SCDDX5SNHgwV8HefcnrwsqVAxN
 5+IibT8o+h4/DVrgrbL46KnArJHSG3p9e5GSCw+Vt4gzHkHIPS9VGm7Rp
 k6PmKcu9G6IygupP19rlbM1mKAHaG2oXdHeOjSRQyMAVjEkq0O3QonFMj g==;
X-CSE-ConnectionGUID: y1CdCyQJQie1kzIhQHlRZQ==
X-CSE-MsgGUID: OmBzSdiiTkiybseBRFZppA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50921235"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="50921235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:20:19 -0800
X-CSE-ConnectionGUID: y7/+bKRnQVCJqHfK1+vedw==
X-CSE-MsgGUID: e3HzIYJQSCC/jYLkKMQc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113624859"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.89.75])
 ([10.247.89.75])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:20:11 -0800
Message-ID: <afa50e3a-914b-46b6-8401-0589b6099f68@linux.intel.com>
Date: Fri, 14 Feb 2025 19:20:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
 <874j0wrjk2.fsf@kurt.kurt.home>
 <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
 <20250214102206.25dqgut5tbak2rkz@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250214102206.25dqgut5tbak2rkz@skbuf>
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
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

CgpPbiAxNC8yLzIwMjUgNjoyMiBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3RlOgo+IEZhaXphbCwK
PiAKPiBPbiBGcmksIEZlYiAxNCwgMjAyNSBhdCAwNTo0MzoxOVBNICswODAwLCBBYmR1bCBSYWhp
bSwgRmFpemFsIHdyb3RlOgo+Pj4+IEhpIEt1cnQgJiBWbGFkaW1pciwKPj4+Pgo+Pj4+IEFmdGVy
IHJlYWRpbmcgVmxhZGltaXIncyByZXBseSBvbiB0YywgaHcgcXVldWUsIGFuZCBzb2NrZXQgcHJp
b3JpdHkgbWFwcGluZwo+Pj4+IGZvciBib3RoIHRhcHJpbyBhbmQgbXFwcmlvLCBJIGFncmVlIHRo
ZXkgc2hvdWxkIGZvbGxvdyB0aGUgc2FtZSBwcmlvcml0eQo+Pj4+IHNjaGVtZSBmb3IgY29uc2lz
dGVuY3nigJRib3RoIGluIGNvZGUgYW5kIGNvbW1hbmQgdXNhZ2UgKGkuZS4sIHRhcHJpbywKPj4+
PiBtcXByaW8sIGFuZCBmcGUgaW4gYm90aCBjb25maWd1cmF0aW9ucykuIFNpbmNlIGlnY190c25f
dHhfYXJiKCkgZW5zdXJlcyBhCj4+Pj4gc3RhbmRhcmQgbWFwcGluZyBvZiB0Yywgc29ja2V0IHBy
aW9yaXR5LCBhbmQgaGFyZHdhcmUgcXVldWUgcHJpb3JpdHksIEknbGwKPj4+PiBlbmFibGUgdGFw
cmlvIHRvIHVzZSBpZ2NfdHNuX3R4X2FyYigpIGluIGEgc2VwYXJhdGUgcGF0Y2ggc3VibWlzc2lv
bi4KPj4+Cj4+PiBUaGVyZSdzIG9uZSBwb2ludCB0byBjb25zaWRlciBoZXJlOiBpZ2NfdHNuX3R4
X2FyYigpIGNoYW5nZXMgdGhlIG1hcHBpbmcKPj4+IGJldHdlZW4gcHJpb3JpdGllcyBhbmQgVHgg
cXVldWVzLiBJIGhhdmUgbm8gaWRlYSBob3cgbWFueSBwZW9wbGUgcmVseSBvbgo+Pj4gdGhlIGZh
Y3QgdGhhdCBxdWV1ZSAwIGhhcyBhbHdheXMgdGhlIGhpZ2hlc3QgcHJpb3JpdHkuIEZvciBleGFt
cGxlLCBpdAo+Pj4gd2lsbCBjaGFuZ2UgdGhlIFR4IGJlaGF2aW9yIGZvciBzY2hlZHVsZXMgd2hp
Y2ggb3BlbiBtdWx0aXBsZSB0cmFmZmljCj4+PiBjbGFzc2VzIGF0IHRoZSBzYW1lIHRpbWUuIFVz
ZXJzIG1heSBub3RpY2UuCj4+Cj4+IFllYWgsIEkgd2FzIGNvbnNpZGVyaW5nIHRoZSBpbXBhY3Qg
b24gZXhpc3RpbmcgdXNlcnMgdG9vLiBJIGhhZG7igJl0IGdpdmVuIGl0Cj4+IG11Y2ggdGhvdWdo
dCBpbml0aWFsbHkgYW5kIGZpZ3VyZWQgdGhleeKAmWQganVzdCBuZWVkIHRvIGFkYXB0IHRvIHRo
ZSBjaGFuZ2VzLAo+PiBidXQgbm93IHRoYXQgSSB0aGluayBhYm91dCBpdCwgcHJvcGVybHkgY29t
bXVuaWNhdGluZyB0aGlzIHdvdWxkIGJlIHRvdWdoLgo+PiB0YXByaW8gb24gaWdjIChpMjI1LCBp
MjI2KSBoYXMgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUsIHNvIGEgbG90IG9mIHVzZXJzCj4+IHdv
dWxkIGJlIGFmZmVjdGVkLgo+Pgo+Pj4gT1RPSCBjaGFuZ2luZyBtcXByaW8gdG8gdGhlIGJyb2tl
bl9tcXByaW8gbW9kZWwgaXMgZWFzeSwgYmVjYXVzZSBBRkFJSwo+Pj4gdGhlcmUncyBvbmx5IG9u
ZSBjdXN0b21lciB1c2luZyB0aGlzLgo+Pj4KPj4KPj4gSG1tbW0sIG5vdyBJ4oCZbSBsZWFuaW5n
IHRvd2FyZCBrZWVwaW5nIHRhcHJpbyBhcyBpcyAoaHcgcXVldWUgMCBoaWdoZXN0Cj4+IHByaW9y
aXR5KSBhbmQgaGF2aW5nIG1xcHJpbyBmb2xsb3cgdGhlIGRlZmF1bHQgcHJpb3JpdHkgc2NoZW1l
IChha2EKPj4gYnJva2VuX21xcHJpbykuIEV2ZW4gdGhvdWdoIGl04oCZcyBub3QgdGhlIG5vcm0s
IHRoZSBpbXBhY3QgZG9lc27igJl0IHNlZW0gd29ydGgKPj4gdGhlIGdhaW4uIE9wZW4gdG8gaGVh
cmluZyBvdGhlcnMnIHRob3VnaHRzLgo+IAo+IEt1cnQgaXMgcmlnaHQsIHlvdSBuZWVkIHRvIHRo
aW5rIGFib3V0IHlvdXIgdXNlcnMsIGJ1dCBpdCBpc24ndCBvbmx5IHRoYXQuCj4gSW50ZWwgcHV0
cyBvdXQgYSBsb3Qgb2YgdXNlci1mYWNpbmcgVFNOIHRlY2huaWNhbCBkb2N1bWVudGF0aW9uIGZv
ciBMaW51eCwKPiBhbmQgY3VycmVudGx5LCB0aGV5IGhhdmUgYSBoYXJkIHRpbWUgYWRhcHRpbmcg
aXQgdG8gb3RoZXIgdmVuZG9ycywgYmVjYXVzZQo+IG9mIEludGVsIHNwZWNpZmljIHBlY3VsaWFy
aXRpZXMgc3VjaCBhcyB0aGlzIG9uZS4gSSB3b3VsZCBhcmd1ZSB0aGF0IGZvcgo+IGJlaW5nIG9u
ZSBvZiB0aGUgbW9zdCB2aXNpYmxlIHZlbmRvcnMgZnJvbSB0aGUgTGludXggVFNOIHNwYWNlLCB5
b3UgYWxzbwo+IGhhdmUgYSBkdXR5IHRvIHRoZSByZXN0IG9mIHRoZSBjb21tdW5pdHkgb2Ygbm90
IHB1c2hpbmcgdXNlcnMgYXdheSBmcm9tCj4gZXN0YWJsaXNoZWQgY29udmVudGlvbnMuCj4gCj4g
SXQncyB1bmZhaXIgdGhhdCBhIHBhc3QgZGVzaWduIG1pc3Rha2Ugd291bGQgc3RpZmxlIGZ1cnRo
ZXIgZXZvbHV0aW9uIG9mCj4gdGhlIGRyaXZlciBpbiB0aGUgY29ycmVjdCBkaXJlY3Rpb24sIHNv
IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGxldCB0aGF0Cj4gaGFwcGVuLiBJIHdhcyB0aGlua2lu
ZyB0aGUgaWdjIGRyaXZlciBzaG91bGQgaGF2ZSBhIGRyaXZlci1zcGVjaWZpYwo+IG9wdC1pbiBm
bGFnIHdoaWNoIHVzZXJzIGV4cGxpY2l0bHkgaGF2ZSB0byBzZXQgaW4gb3JkZXIgdG8gZ2V0IHRo
ZQo+IGNvbnZlbnRpb25hbCBUWCBzY2hlZHVsaW5nIGJlaGF2aW9yIGluIHRhcHJpbyAodGhlIG9u
ZSBmcm9tIG1xcHJpbykuCj4gUHVibGljIEludGVsIGRvY3VtZW50YXRpb24gd291bGQgYmUgdXBk
YXRlZCB0byBwcmVzZW50IHRoZSBkaWZmZXJlbmNlcwo+IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBtb2RlLCBhbmQgdG8gcmVjb21tZW5kIG9wdGluZyBpbnRvIHRoZSBuZXcKPiBtb2RlLiBC
eSBkZWZhdWx0LCB0aGUgY3VycmVudCBiZWhhdmlvciBpcyBtYWludGFpbmVkLCB0aHVzIG5vdCBi
cmVha2luZwo+IGFueSB1c2VyLiAgU29tZXRoaW5nIGxpa2UgYW4gZXRodG9vbCBwcml2IGZsYWcg
c2VlbXMgYWRlcXVhdGUgZm9yIHRoaXMuCj4gCj4gVW5kZXJzdGFuZGFibHksIG1hbnkgbmV0d29y
ayBtYWludGFpbmVycyB3aWxsIGluaXRpYWxseSBkaXNsaWtlIHRoaXMsCj4gYnV0IHlvdSB3aWxs
IGhhdmUgdG8gYmUgcGVyc2lzdGVudCBhbmQgZXhwbGFpbiB0aGUgd2F5cyBpbiB3aGljaCBoYXZp
bmcKPiB0aGlzIHByaXYgZmxhZyBpcyBiZXR0ZXIgdGhhbiBub3QgaGF2aW5nIGl0LiBOb3JtYWxs
eSB0aGV5IHdpbGwgcmVzcGVjdAo+IHRob3NlIHJlYXNvbnMgbW9yZSB0aGFuIHRoZXkgZGlzbGlr
ZSBkcml2ZXItc3BlY2lmaWMgcHJpdiBmbGFncywgd2hpY2gsCj4gbGV0J3MgYmUgaG9uZXN0LCBh
cmUgd2F5IHRvbyBvZnRlbiBhYnVzZWQgZm9yIGFkZGluZyBjdXN0b20gYmVoYXZpb3IuCj4gSGVy
ZSB0aGUgc2l0dWF0aW9uIGlzIGRpZmZlcmVudCwgdGhlIGN1c3RvbSBiZWhhdmlvciBhbHJlYWR5
IGV4aXN0cywgaXQKPiBqdXN0IGRvZXNuJ3QgaGF2ZSBhIG5hbWUgYW5kIHRoZXJlJ3Mgbm8gd2F5
IG9mIHR1cm5pbmcgaXQgb2ZmLgoKT2theS4gSSBjYW4gbG9vayBpbnRvIHRoaXMgaW4gYSBzZXBh
cmF0ZSBwYXRjaCBzdWJtaXNzaW9uLCBidXQganVzdCBhbiAKRllJ4oCUdGhpcyBhZGRzIGFub3Ro
ZXIgZGVwZW5kZW5jeSB0byB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGlnYyBmcGUgCnN1Ym1pc3Np
b24gKHByZWVtcHRpYmxlIHRjIG9uIHRhcHJpbyArIG1xcHJpbykuIFRoaXMgbmV3IHBhdGNoIAoo
ZHJpdmVyLXNwZWNpZmljIHByaXYgZmxhZyB0byBjb250cm9sIDIgZGlmZmVyZW50IHByaW9yaXR5
IHNjaGVtZSkgd291bGQgCm5lZWQgdG8gYmUgYWNjZXB0ZWQgZmlyc3QgYmVmb3JlIHRoZSBzZWNv
bmQgcGFydCBvZiBpZ2MgZnBlIGNhbiBiZSBzdWJtaXR0ZWQuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
