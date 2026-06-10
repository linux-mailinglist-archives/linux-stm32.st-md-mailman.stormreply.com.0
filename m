Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RaqWChd4KWpVXQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 16:43:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9566A561
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 16:43:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=j73clyjw;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A58CC5F1CF;
	Wed, 10 Jun 2026 14:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF51C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781102613; x=1812638613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DPrzoI0Cic4lctVW9xW26ap2kbgPfsaWv6mpsae+kMQ=;
 b=j73clyjwArzZtbWZIN3FYfQhxJQfj8WR+pA/BLdddN3n/izqENy/im7O
 xg/y3ezX1rnuwwtg6IN4y2jK43TKlttyUH5ENiU+dh7lKMRPJV6UKglqB
 h1gNcF+ySS2aqFZy88nJ3xG1Qw8M5IiatekHx02SzK5N2I5t6zh7kQEqp
 ciCCJWx3hsyNYex3KISx0AcXUpaMfY5qWoX3FYc/bCZCZa/EV5CqHcl7m
 imzN7wJNhr/HwaHNYuoWU12B2j9DOZG4bFd9fXwjCPowQDOcmpLSYYi11
 LVtuICmyanLfYeobN5kbVV+0KZ7PpBFPraiLQW6g0DWODoJo2BoblfFWo A==;
X-CSE-ConnectionGUID: 6knlLt1ERLGLQ91QORglxw==
X-CSE-MsgGUID: P3tHzhmPTZGviiFRiY1yXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93384020"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93384020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:43:30 -0700
X-CSE-ConnectionGUID: 9i25flRDSViVTbAIRpyEPA==
X-CSE-MsgGUID: qyMNFvgnTEePAxuMiNBn1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251104880"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:43:17 -0700
Date: Wed, 10 Jun 2026 17:43:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Message-ID: <ail4AvzqAOXNaU6N@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kaito Cheng <chengkaitao@kylinos.cn>,
 Ingo Molnar <mingo@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
 Waiman Long <longman@redhat.com>, Philipp Reisner <philipp.reisner@linbit.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux1394-devel@lists.sourceforge.net,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Huang Rui <ray.huang@amd.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] list: Prepare entry iterators to
 cache cursor state
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux-bl
 ock@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:christian.koenig@amd.com,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EA9566A561

T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgMDI6MTQ6MDZQTSArMDgwMCwgS2FpdGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI2LzYvOSAxODozMywgQ2hyaXN0aWFuIEvDtm5pZyDlhpnpgZM6Cj4gPiBP
biA2LzkvMjYgMDg6MTMsIEthaXRhbyBDaGVuZyB3cm90ZToKPiA+Pgo+ID4+IFRoaXMgc2VyaWVz
IHByZXBhcmVzIGZvciwgYW5kIHRoZW4gdXBkYXRlcywgdGhlIGxpc3RfZm9yX2VhY2hfZW50cnko
KQo+ID4+IGZhbWlseSBzbyB0aGUgY29tbW9uIGVudHJ5IGl0ZXJhdG9ycyBjYWNoZSB0aGVpciBu
ZXh0IG9yIHByZXZpb3VzIGN1cnNvcgo+ID4+IGJlZm9yZSB0aGUgbG9vcCBib2R5IHJ1bnMuCj4g
PiAKPiA+IFdoeSBpbiB0aGUgd29ybGQgd291bGQgd2Ugd2FudCB0byBkbyB0aGF0Pwo+ID4gCj4g
PiBUaGUgc2FmZSBhbmQgbm9uLXNhZmUgdmFyaWFudHMgaGF2ZSB2ZXJ5IGRpc3RpbmN0IHVzZSBj
YXNlcyBhbmQgdGhhdCBpcyBjb21wbGV0ZWx5IGludGVudGlvbmFsLgo+ID4gCj4gPiBXaGF0IHdl
IGNvdWxkIGltcHJvdmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRpb24sIGZyb20gbXkgZXhwZXJp
ZW5jZSBhbiBhc3RvbmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVvcGxlIGhhdmUgbWlzY29uY2Vw
dGlvbnMgYWJvdXQgdGhlIHNhZmUgdmFyaWFudHMuCj4gPiAKPiA+PiBUaGUgZmlyc3QgMTMgcGF0
Y2hlcyBvcGVuLWNvZGUgbG9vcHMgdGhhdCBpbnRlbnRpb25hbGx5IGRlcGVuZCBvbiB0aGUKPiA+
PiBvbGQgImRlcml2ZSB0aGUgbmV4dCBlbnRyeSBmcm9tIHRoZSBjdXJyZW50IGN1cnNvciBhdCB0
aGUgZW5kIG9mIHRoZQo+ID4+IGl0ZXJhdGlvbiIgYmVoYXZpb3VyLiAgVGhlc2UgbG9vcHMgYXBw
ZW5kIHdvcmsgdG8gdGhlIGxpc3QgYmVpbmcgd2Fsa2VkLAo+ID4+IHJlc3RhcnQgdHJhdmVyc2Fs
IGFmdGVyIGRyb3BwaW5nIGEgbG9jaywgc2tpcCBhbiBlbnRyeSBjb25zdW1lZCBieSB0aGUKPiA+
PiBjdXJyZW50IGl0ZXJhdGlvbiwgb3Igb3RoZXJ3aXNlIGFkanVzdCB0aGUgY3Vyc29yIGluIHRo
ZSBsb29wIGJvZHkuCj4gPiAKPiA+IFdlbGwgSSBoYXZlIHRvIGNsZWFybHkgcmVqZWN0IHRoZSBj
aGFuZ2VzIGZvciBzdWJzeXN0ZW1zL2NvbXBvbmVudHMgSSdtIG1haW50YWluaW5nLCB0aGF0IGp1
c3QgbG9va3MgaG9ycmlibGUgdG8gbWUgYW5kIEkgY2xlYXJseSBkb24ndCBzZWUgYSBnb29kIHJl
YXNvbiBmb3IgdGhhdC4KPiAKPiBIaSBDaHJpc3RpYW4gYW5kIEFuZHkgU2hldmNoZW5rbywKPiAK
PiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2suIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSBw
b2ludCB5b3UgcmFpc2VkLgo+IAo+IFRoZSByZWFzb24gSSBzdGFydGVkIGxvb2tpbmcgYXQgdGhp
cyBpcyB0aGUgb3JpZ2luYWwgbW90aXZhdGlvbiBiZWhpbmQKPiB0aGUgX3NhZmUoKSB2YXJpYW50
cy4gIFRoZXkgZXhpc3QgYmVjYXVzZSBzb21lIHVzZXJzIG5lZWQgdG8gcmVtb3ZlLCBtb3ZlCj4g
b3Igb3RoZXJ3aXNlIGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnkgd2hpbGUgd2Fsa2luZyB0aGUg
bGlzdC4gIEluIHRoYXQKPiBjYXNlIHRoZSBuZXh0IGN1cnNvciBoYXMgdG8gYmUgcHJlc2VydmVk
IGJlZm9yZSB0aGUgbG9vcCBib2R5IGNhbiBtb2RpZnkKPiB0aGUgY3VycmVudCBlbnRyeS4KPiAK
PiBUaGUgdW5mb3J0dW5hdGUgcGFydCBpcyB0aGF0IHRoaXMgY291bGQgbm90IGJlIGV4cHJlc3Nl
ZCB3aXRoIHRoZQo+IGV4aXN0aW5nIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbnRlcmZhY2Ugd2l0
aG91dCBjaGFuZ2luZyBpdHMgY2FsbGluZwo+IGNvbnZlbnRpb24uICBUaGUgX3NhZmUoKSB2YXJp
YW50cyBoYWQgdG8gZ3JvdyBhbiBleHRyYSBhcmd1bWVudCBmb3IgdGhlCj4gdGVtcG9yYXJ5IGN1
cnNvciwgYW5kIHRoYXQgaXMgd2h5IHdlIGVuZGVkIHVwIHdpdGggYSBzZXBhcmF0ZSBmYW1pbHkg
b2YKPiBtYWNyb3MuCj4gCj4gQnV0IGNvbmNlcHR1YWxseSwgdGhlIGRpc3RpbmN0aW9uIGRvZXMg
bm90IGhhdmUgdG8gYmUgZXhwb3NlZCBhcyB0d28KPiBkaWZmZXJlbnQgaXRlcmF0b3IgZmFtaWxp
ZXMgZm9yZXZlci4gIFRoZSBkaWZmZXJlbmNlIGlzIGFuIGltcGxlbWVudGF0aW9uCj4gZGV0YWls
OiB3aGV0aGVyIHRoZSBpdGVyYXRvciBrZWVwcyB0aGUgbmV4dC9wcmV2aW91cyBjdXJzb3IgYmVm
b3JlIHRoZQo+IGJvZHkgcnVucy4gIFRoaXMgc2VyaWVzIG1ha2VzIHRoZSBjb21tb24gbGlzdF9m
b3JfZWFjaF9lbnRyeSgpIGl0ZXJhdG9ycwo+IGRvIHRoYXQgaW50ZXJuYWxseSwgc28gdGhlIHNh
ZmUgYW5kIG5vbi1zYWZlIGZvcm1zIGNhbiBlZmZlY3RpdmVseSBiZQo+IGZvbGRlZCB0b2dldGhl
ciwgb3IgYXQgbGVhc3QgdGhlIG5lZWQgZm9yIGEgc2VwYXJhdGUgcHVibGljIF9zYWZlKCkKPiBp
bnRlcmZhY2UgYmVjb21lcyBtdWNoIHdlYWtlci4KPiAKPiBUaGVyZSBpcyBhbHNvIGEgdXNhYmls
aXR5IGlzc3VlIHdpdGggdGhlIGN1cnJlbnQgX3NhZmUoKSBpbnRlcmZhY2UuICBUaGUKPiBjYWxs
ZXIgaXMgZm9yY2VkIHRvIGRlZmluZSBhIHRlbXBvcmFyeSBjdXJzb3Igb3V0c2lkZSB0aGUgbWFj
cm8gYW5kIHBhc3MKPiBpdCBpbiwgZXZlbiB0aG91Z2ggYWxtb3N0IGFsbCB1c2VycyBuZXZlciB1
c2UgdGhhdCBjdXJzb3IgZGlyZWN0bHkuICBJdCBpcwo+IGp1c3QgYm9pbGVycGxhdGUgcmVxdWly
ZWQgYnkgdGhlIG1hY3JvIGltcGxlbWVudGF0aW9uLiAgSSBmaW5kIHRoYXQKPiByZWR1bmRhbnQg
YW5kIGF3a3dhcmQ6IHRoZSB0ZW1wb3JhcnkgY3Vyc29yIGlzIGFuIGludGVybmFsIGRldGFpbCBv
ZiB0aGUKPiBpdGVyYXRpb24sIGJ1dCBldmVyeSBjYWxsZXIgaGFzIHRvIHNwZWxsIGl0IG91dC4K
CkFoLCBJIHRoaW5rIHRoZSBkaXN0aW5jdCBtYWNybyBmYW1pbGllcyBpcyB0aGF0IHdoYXQgd2Ug
d2FudC4KQnV0IHRoZSBoaWRpbmcgb2YgdGhlIHBhcmFtZXRlciBjYW4gYmUgZG9uZSBpbnNpZGUg
bGlzdF9mb3JfZWFjaF8qX3NhZmUoKS4KWW91IGNhbiBkbyBhIHRyZWV3aWRlIGNoYW5nZSB3aXRo
IGNvY2NpbmVsbGUuCgpTb3JyeSBpZiBJIGRpZG4ndCBnZXQgdGhlIHdob2xlIGlkZWEgZnJvbSB5
b3VyIHByZXZpb3VzIGNvbnRyaWJ1dGlvbnMuCgpOb3RlLCBldmVuIGNhc2VzIHRoYXQgd291bGQg
bmVlZCBhIHRlbXBvcmFyeSBjdXJzb3IgbWF5IGJlIHN3aXRjaGVkIHRvCm5ldyBsaXN0X2Zvcl9l
YWNoXypfc2FmZSgpLCBzZWUgaG93IFBDSSBtYWNyb3MgZm9yIGl0ZXJhdGluZyBvdmVyIHJlc291
cmNlcwphcmUgaW1wbGVtZW50ZWQgKGluY2x1ZGUvbGludXgvcGNpLmgpLgoKPiBXaXRoIHRoZSB1
cGRhdGVkIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbXBsZW1lbnRhdGlvbiwgdGhhdCBleHRyYSBj
dXJzb3IKPiBjYW4gYmUga2VwdCBpbnNpZGUgdGhlIGl0ZXJhdG9yIGl0c2VsZi4gIENhbGxlcnMg
dGhhdCBvbmx5IHdhbnQgdG8gd2Fsawo+IHRoZSBsaXN0LCBpbmNsdWRpbmcgY2FsbGVycyB0aGF0
IGRlbGV0ZSBvciBjb25zdW1lIHRoZSBjdXJyZW50IGVudHJ5LCBubwo+IGxvbmdlciBuZWVkIHRv
IGNhcnJ5IGFuIG90aGVyd2lzZS11bnVzZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGp1c3QgdG8gbWFr
ZQo+IHRoZSBtYWNybyB3b3JrLgo+IAo+ID4+IFRoZSBmaW5hbCBwYXRjaCBjaGFuZ2VzIGluY2x1
ZGUvbGludXgvbGlzdC5oIHRvIGtlZXAgYSBwcml2YXRlIGN1cnNvciBpbgo+ID4+IHRoZSBjb21t
b24gZW50cnkgaXRlcmF0b3JzIHdoaWxlIHByZXNlcnZpbmcgdGhlIHB1YmxpYyBtYWNybyBpbnRl
cmZhY2UuCj4gPj4gVGhlIHNhZmUgdmFyaWFudHMgcmVtYWluIGF2YWlsYWJsZSB3aGVuIGNhbGxl
cnMgbmVlZCB0aGUgdGVtcG9yYXJ5Cj4gPj4gY3Vyc29yIGV4cGxpY2l0bHkgb3IgaGF2ZSBzdHJv
bmdlciBtdXRhdGlvbiByZXF1aXJlbWVudHMuCgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5
IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
