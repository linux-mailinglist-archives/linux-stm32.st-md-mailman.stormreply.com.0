Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9kTxJGtpKmrJowMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 09:53:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74966F966
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 09:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=QiTQRxmg;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4CC8C424DD;
	Thu, 11 Jun 2026 07:53:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FE30C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164394; x=1812700394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WodgeCwMhxs/nQa2II6pfVewJYMMJPHkCdCGsJ449YA=;
 b=QiTQRxmgHqcNJeqnUs7mZgVV1apspXKII0vedxxT2hvk8IjWEQjVTep+
 Ac555HyHmILIrpepZoq27+1tynU/fp0vc6W0W9XBMGa2NvTIQ8DRDjjU3
 S5TmK1Rx9FF11ld4M93ouRLUXYi8VuAYSxVT5wWYF0Zt2RNvdi0rZTMyf
 HClNhg5kgf57vkMpOf8sScyKT0KlSfcXwCLV6fkCwhOc2AeL7blnFRmn4
 IYxjO+Cwc6ZrM+j+SLd9XLU3V2ayYaPl1uX08cjtvIphW1hPjvj/4CxRW
 KzS7i9vtrW3PtEMva17aiuQq5FKY5xUvO7Dq55aDgFujjVcha3SMbwdvf Q==;
X-CSE-ConnectionGUID: DrKtbPPBQtGcDP++mR0Ssw==
X-CSE-MsgGUID: Td9FI7XKRACfV7VfwxyWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80986614"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="80986614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:53:09 -0700
X-CSE-ConnectionGUID: 7kx+48t4ShyPZDKBg37+Vg==
X-CSE-MsgGUID: bmL7KCWdSnqhurymMySuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250689566"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.123])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:52:54 -0700
Date: Thu, 11 Jun 2026 10:52:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Message-ID: <aippVAj83dCzscTN@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <ail4AvzqAOXNaU6N@ashevche-desk.local>
 <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
 <aipbojSeMH-usARY@ashevche-desk.local>
 <83ba73d8-27d3-4ee9-a143-7dfe4cb827be@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83ba73d8-27d3-4ee9-a143-7dfe4cb827be@linux.dev>
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux-bl
 ock@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:christian.koenig@amd.com,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	ARC_NA(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F74966F966

T24gVGh1LCBKdW4gMTEsIDIwMjYgYXQgMDM6MzY6MDFQTSArMDgwMCwgS2FpdGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI2LzYvMTEgMTQ6NTQsIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4gPiBP
biBUaHUsIEp1biAxMSwgMjAyNiBhdCAxMjo0MjowMlBNICswODAwLCBLYWl0YW8gQ2hlbmcgd3Jv
dGU6Cj4gPj4g5ZyoIDIwMjYvNi8xMCAyMjo0MywgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiA+
Pj4gT24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgMDI6MTQ6MDZQTSArMDgwMCwgS2FpdGFvIENoZW5n
IHdyb3RlOgo+ID4+Pj4g5ZyoIDIwMjYvNi85IDE4OjMzLCBDaHJpc3RpYW4gS8O2bmlnIOWGmemB
kzoKPiA+Pj4+PiBPbiA2LzkvMjYgMDg6MTMsIEthaXRhbyBDaGVuZyB3cm90ZToKPiA+IAo+ID4+
Pj4+PiBUaGlzIHNlcmllcyBwcmVwYXJlcyBmb3IsIGFuZCB0aGVuIHVwZGF0ZXMsIHRoZSBsaXN0
X2Zvcl9lYWNoX2VudHJ5KCkKPiA+Pj4+Pj4gZmFtaWx5IHNvIHRoZSBjb21tb24gZW50cnkgaXRl
cmF0b3JzIGNhY2hlIHRoZWlyIG5leHQgb3IgcHJldmlvdXMgY3Vyc29yCj4gPj4+Pj4+IGJlZm9y
ZSB0aGUgbG9vcCBib2R5IHJ1bnMuCj4gPj4+Pj4KPiA+Pj4+PiBXaHkgaW4gdGhlIHdvcmxkIHdv
dWxkIHdlIHdhbnQgdG8gZG8gdGhhdD8KPiA+Pj4+Pgo+ID4+Pj4+IFRoZSBzYWZlIGFuZCBub24t
c2FmZSB2YXJpYW50cyBoYXZlIHZlcnkgZGlzdGluY3QgdXNlIGNhc2VzIGFuZCB0aGF0IGlzIGNv
bXBsZXRlbHkgaW50ZW50aW9uYWwuCj4gPj4+Pj4KPiA+Pj4+PiBXaGF0IHdlIGNvdWxkIGltcHJv
dmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRpb24sIGZyb20gbXkgZXhwZXJpZW5jZSBhbiBhc3Rv
bmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVvcGxlIGhhdmUgbWlzY29uY2VwdGlvbnMgYWJvdXQg
dGhlIHNhZmUgdmFyaWFudHMuCj4gPj4+Pj4KPiA+Pj4+Pj4gVGhlIGZpcnN0IDEzIHBhdGNoZXMg
b3Blbi1jb2RlIGxvb3BzIHRoYXQgaW50ZW50aW9uYWxseSBkZXBlbmQgb24gdGhlCj4gPj4+Pj4+
IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhlIGN1cnJlbnQgY3Vyc29yIGF0IHRo
ZSBlbmQgb2YgdGhlCj4gPj4+Pj4+IGl0ZXJhdGlvbiIgYmVoYXZpb3VyLiAgVGhlc2UgbG9vcHMg
YXBwZW5kIHdvcmsgdG8gdGhlIGxpc3QgYmVpbmcgd2Fsa2VkLAo+ID4+Pj4+PiByZXN0YXJ0IHRy
YXZlcnNhbCBhZnRlciBkcm9wcGluZyBhIGxvY2ssIHNraXAgYW4gZW50cnkgY29uc3VtZWQgYnkg
dGhlCj4gPj4+Pj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndpc2UgYWRqdXN0IHRoZSBj
dXJzb3IgaW4gdGhlIGxvb3AgYm9keS4KPiA+Pj4+Pgo+ID4+Pj4+IFdlbGwgSSBoYXZlIHRvIGNs
ZWFybHkgcmVqZWN0IHRoZSBjaGFuZ2VzIGZvciBzdWJzeXN0ZW1zL2NvbXBvbmVudHMgSSdtIG1h
aW50YWluaW5nLCB0aGF0IGp1c3QgbG9va3MgaG9ycmlibGUgdG8gbWUgYW5kIEkgY2xlYXJseSBk
b24ndCBzZWUgYSBnb29kIHJlYXNvbiBmb3IgdGhhdC4KPiA+Pj4+Cj4gPj4+PiBIaSBDaHJpc3Rp
YW4gYW5kIEFuZHkgU2hldmNoZW5rbywKPiA+Pj4+Cj4gPj4+PiBUaGFua3MgZm9yIHRha2luZyBh
IGxvb2suIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSBwb2ludCB5b3UgcmFpc2VkLgo+ID4+
Pj4KPiA+Pj4+IFRoZSByZWFzb24gSSBzdGFydGVkIGxvb2tpbmcgYXQgdGhpcyBpcyB0aGUgb3Jp
Z2luYWwgbW90aXZhdGlvbiBiZWhpbmQKPiA+Pj4+IHRoZSBfc2FmZSgpIHZhcmlhbnRzLiAgVGhl
eSBleGlzdCBiZWNhdXNlIHNvbWUgdXNlcnMgbmVlZCB0byByZW1vdmUsIG1vdmUKPiA+Pj4+IG9y
IG90aGVyd2lzZSBjb25zdW1lIHRoZSBjdXJyZW50IGVudHJ5IHdoaWxlIHdhbGtpbmcgdGhlIGxp
c3QuICBJbiB0aGF0Cj4gPj4+PiBjYXNlIHRoZSBuZXh0IGN1cnNvciBoYXMgdG8gYmUgcHJlc2Vy
dmVkIGJlZm9yZSB0aGUgbG9vcCBib2R5IGNhbiBtb2RpZnkKPiA+Pj4+IHRoZSBjdXJyZW50IGVu
dHJ5Lgo+ID4+Pj4KPiA+Pj4+IFRoZSB1bmZvcnR1bmF0ZSBwYXJ0IGlzIHRoYXQgdGhpcyBjb3Vs
ZCBub3QgYmUgZXhwcmVzc2VkIHdpdGggdGhlCj4gPj4+PiBleGlzdGluZyBsaXN0X2Zvcl9lYWNo
X2VudHJ5KCkgaW50ZXJmYWNlIHdpdGhvdXQgY2hhbmdpbmcgaXRzIGNhbGxpbmcKPiA+Pj4+IGNv
bnZlbnRpb24uICBUaGUgX3NhZmUoKSB2YXJpYW50cyBoYWQgdG8gZ3JvdyBhbiBleHRyYSBhcmd1
bWVudCBmb3IgdGhlCj4gPj4+PiB0ZW1wb3JhcnkgY3Vyc29yLCBhbmQgdGhhdCBpcyB3aHkgd2Ug
ZW5kZWQgdXAgd2l0aCBhIHNlcGFyYXRlIGZhbWlseSBvZgo+ID4+Pj4gbWFjcm9zLgo+ID4+Pj4K
PiA+Pj4+IEJ1dCBjb25jZXB0dWFsbHksIHRoZSBkaXN0aW5jdGlvbiBkb2VzIG5vdCBoYXZlIHRv
IGJlIGV4cG9zZWQgYXMgdHdvCj4gPj4+PiBkaWZmZXJlbnQgaXRlcmF0b3IgZmFtaWxpZXMgZm9y
ZXZlci4gIFRoZSBkaWZmZXJlbmNlIGlzIGFuIGltcGxlbWVudGF0aW9uCj4gPj4+PiBkZXRhaWw6
IHdoZXRoZXIgdGhlIGl0ZXJhdG9yIGtlZXBzIHRoZSBuZXh0L3ByZXZpb3VzIGN1cnNvciBiZWZv
cmUgdGhlCj4gPj4+PiBib2R5IHJ1bnMuICBUaGlzIHNlcmllcyBtYWtlcyB0aGUgY29tbW9uIGxp
c3RfZm9yX2VhY2hfZW50cnkoKSBpdGVyYXRvcnMKPiA+Pj4+IGRvIHRoYXQgaW50ZXJuYWxseSwg
c28gdGhlIHNhZmUgYW5kIG5vbi1zYWZlIGZvcm1zIGNhbiBlZmZlY3RpdmVseSBiZQo+ID4+Pj4g
Zm9sZGVkIHRvZ2V0aGVyLCBvciBhdCBsZWFzdCB0aGUgbmVlZCBmb3IgYSBzZXBhcmF0ZSBwdWJs
aWMgX3NhZmUoKQo+ID4+Pj4gaW50ZXJmYWNlIGJlY29tZXMgbXVjaCB3ZWFrZXIuCj4gPj4+Pgo+
ID4+Pj4gVGhlcmUgaXMgYWxzbyBhIHVzYWJpbGl0eSBpc3N1ZSB3aXRoIHRoZSBjdXJyZW50IF9z
YWZlKCkgaW50ZXJmYWNlLiAgVGhlCj4gPj4+PiBjYWxsZXIgaXMgZm9yY2VkIHRvIGRlZmluZSBh
IHRlbXBvcmFyeSBjdXJzb3Igb3V0c2lkZSB0aGUgbWFjcm8gYW5kIHBhc3MKPiA+Pj4+IGl0IGlu
LCBldmVuIHRob3VnaCBhbG1vc3QgYWxsIHVzZXJzIG5ldmVyIHVzZSB0aGF0IGN1cnNvciBkaXJl
Y3RseS4gIEl0IGlzCj4gPj4+PiBqdXN0IGJvaWxlcnBsYXRlIHJlcXVpcmVkIGJ5IHRoZSBtYWNy
byBpbXBsZW1lbnRhdGlvbi4gIEkgZmluZCB0aGF0Cj4gPj4+PiByZWR1bmRhbnQgYW5kIGF3a3dh
cmQ6IHRoZSB0ZW1wb3JhcnkgY3Vyc29yIGlzIGFuIGludGVybmFsIGRldGFpbCBvZiB0aGUKPiA+
Pj4+IGl0ZXJhdGlvbiwgYnV0IGV2ZXJ5IGNhbGxlciBoYXMgdG8gc3BlbGwgaXQgb3V0Lgo+ID4+
Pgo+ID4+PiBBaCwgSSB0aGluayB0aGUgZGlzdGluY3QgbWFjcm8gZmFtaWxpZXMgaXMgdGhhdCB3
aGF0IHdlIHdhbnQuCj4gPj4+IEJ1dCB0aGUgaGlkaW5nIG9mIHRoZSBwYXJhbWV0ZXIgY2FuIGJl
IGRvbmUgaW5zaWRlIGxpc3RfZm9yX2VhY2hfKl9zYWZlKCkuCj4gPj4+IFlvdSBjYW4gZG8gYSB0
cmVld2lkZSBjaGFuZ2Ugd2l0aCBjb2NjaW5lbGxlLgo+ID4+Pgo+ID4+PiBTb3JyeSBpZiBJIGRp
ZG4ndCBnZXQgdGhlIHdob2xlIGlkZWEgZnJvbSB5b3VyIHByZXZpb3VzIGNvbnRyaWJ1dGlvbnMu
Cj4gPj4+Cj4gPj4+IE5vdGUsIGV2ZW4gY2FzZXMgdGhhdCB3b3VsZCBuZWVkIGEgdGVtcG9yYXJ5
IGN1cnNvciBtYXkgYmUgc3dpdGNoZWQgdG8KPiA+Pj4gbmV3IGxpc3RfZm9yX2VhY2hfKl9zYWZl
KCksIHNlZSBob3cgUENJIG1hY3JvcyBmb3IgaXRlcmF0aW5nIG92ZXIgcmVzb3VyY2VzCj4gPj4+
IGFyZSBpbXBsZW1lbnRlZCAoaW5jbHVkZS9saW51eC9wY2kuaCkuCj4gPj4KPiA+PiBUaGFua3Mg
Zm9yIHlvdXIgc3VnZ2VzdGlvbnMuIEkndmUgd3JpdHRlbiBhIGRlbW8gYmFzZWQgb24geW91ciBm
ZWVkYmFjay4KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBpdCBhbmQgc2hhcmUgeW91ciB0
aG91Z2h0cyBvbiB0aGlzIGFwcHJvYWNoPwo+ID4gCj4gPiBIYXZlIHlvdSBjaGVja2VkIGhvdyBt
YW55IHVzZXJzIGFjdHVhbGx5IG5lZWQgdGhlIHRlbXBvcmFyeSBzdG9yYWdlPwo+IAo+IEluIE11
Y2h1bidzIHJlcGx5LCBoZSBtZW50aW9uZWQgdGhlIGZvbGxvd2luZzoKPiAKPiBUaGVyZSBhcmUg
OSw5MjUgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGNhbGwgc2l0ZXMgaW4gdG90YWwuIEFtb25nIHRo
ZW0sCj4gOSw5MTkgZG8gbm90IHJlcXVpcmUgYW55IGFkYXB0YXRpb24sIGFuZCBvbmx5IDYgbmVl
ZCB0byBiZSByZWZhY3RvcmVkOgo+IAo+IEFzIGZvciBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
KSwgdGhlcmUgYXJlIDQsNTcyIGNhbGxlcnMuIDQsNTUwIG9mIHRoZW0KPiBjYW4gYmUgZGlyZWN0
bHkgcmVwbGFjZWQgYnkgdGhlIG5ldyBsaXN0X2Zvcl9lYWNoX2VudHJ5KCksIHdoaWxlIDIyIGNh
bm5vdAo+IGJlIHJlcGxhY2VkCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzJCM0JG
QTFFLTA4QjgtNDJBQi04N0Q2LUEyOEJGMTVFNUM1OEBsaW51eC5kZXYvCj4gCj4gSSBvbmx5IHVz
ZWQgQ29jY2luZWxsZSB0byBzY2FuIGZvciBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgY2FsbCBzaXRl
cywgYW5kCj4gZm91bmQgdGhlIDEzIGNhbGwgc2l0ZXMgc2hvd24gaW4gdGhlIGN1cnJlbnQgcGF0
Y2ggc2VyaWVzLCB3aGljaCBjb3Zlcgo+IHRoZSA2IGNhc2VzIG1lbnRpb25lZCBpbiBNdWNodW4n
cyBlbWFpbC4gSSBoYXZlIG5vdCB5ZXQgcnVuIHRoZSBDb2NjaW5lbGxlCj4gc2NhbiBmb3IgbGlz
dF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkuCj4gCj4gSWYgd2UgbmVlZCB0byBoYW5kbGUgYWxsIDks
OTI1IGxpc3RfZm9yX2VhY2hfZW50cnkoKSBjYWxsIHNpdGVzIG9yIGFsbCA0LDU3Mgo+IGxpc3Rf
Zm9yX2VhY2hfZW50cnlfc2FmZSgpIGNhbGwgc2l0ZXMgaW4gb25lIGdvLCB3b3VsZCBzdWNoIGEg
Y2hhbmdlIGJlIHRvbwo+IGxhcmdlPyBJIGV4cGVjdCBpdCB3b3VsZCBhZmZlY3QgYWxtb3N0IGV2
ZXJ5IGtlcm5lbCBzdWJzeXN0ZW0uCgpJZiBpdCdzIGRvbmUgYnkgTGludXMgaGltc2VsZiBkdXJp
bmcgdGhlIGRheSB3aGVuIGhlIHByZXBhcmVzIC1yYzEsIGl0J3MgZmluZS4KWW91IHdvdWxkIG5l
ZWQgdG8gcHJvdmlkZSBhIGdvb2QganVzdGlmaWNhdGlvbiBmb3IgdGhlIGNoYW5nZSwgdGhvdWdo
LgoKQnV0IGluIHRoZSBhYm92ZSBzdGF0aXN0aWNzIHRoZSA0NTcyIHZzIDQ1NTAsIHNvIHRoZSBm
aXJzdCBzdGVwIGlzIHRvIGludmVzdGlnYXRlCndoeSB0ZW1wb3JhcnkgY3Vyc29yIGlzIHVzZWQg
aW4gdGhvc2UgMjIgY2FzZXMgYW5kIHdoYXQgd2UgY2FuIGRvIHRvIGF2b2lkIHRoYXQuCgo+IEkg
d29uZGVyIHdoZXRoZXIgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZpcnN0IHByb3ZpZGUgdGhlIG5l
Y2Vzc2FyeQo+IGNvbXBhdGliaWxpdHkgQVBJcywgYW5kIHRoZW4gbGV0IGVhY2ggc3Vic3lzdGVt
IG93bmVyIHVwZGF0ZSB0aGVpciBjb2RlIGFzCj4gYXBwcm9wcmlhdGUuIFRoYXQgd291bGQgbWFr
ZSB0aGUgaW1wYWN0IG1vcmUgY29udHJvbGxlZCwgc2ltaWxhciB0byBob3cKPiB0aGUgY3VycmVu
dCBmb2xpbyByZXBsYWNlbWVudCBvZiBwYWdlIGlzIGJlaW5nIGhhbmRsZWQuCj4gCj4gPj4+PiBX
aXRoIHRoZSB1cGRhdGVkIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbXBsZW1lbnRhdGlvbiwgdGhh
dCBleHRyYSBjdXJzb3IKPiA+Pj4+IGNhbiBiZSBrZXB0IGluc2lkZSB0aGUgaXRlcmF0b3IgaXRz
ZWxmLiAgQ2FsbGVycyB0aGF0IG9ubHkgd2FudCB0byB3YWxrCj4gPj4+PiB0aGUgbGlzdCwgaW5j
bHVkaW5nIGNhbGxlcnMgdGhhdCBkZWxldGUgb3IgY29uc3VtZSB0aGUgY3VycmVudCBlbnRyeSwg
bm8KPiA+Pj4+IGxvbmdlciBuZWVkIHRvIGNhcnJ5IGFuIG90aGVyd2lzZS11bnVzZWQgdGVtcG9y
YXJ5IHZhcmlhYmxlIGp1c3QgdG8gbWFrZQo+ID4+Pj4gdGhlIG1hY3JvIHdvcmsuCj4gPj4+Pgo+
ID4+Pj4+PiBUaGUgZmluYWwgcGF0Y2ggY2hhbmdlcyBpbmNsdWRlL2xpbnV4L2xpc3QuaCB0byBr
ZWVwIGEgcHJpdmF0ZSBjdXJzb3IgaW4KPiA+Pj4+Pj4gdGhlIGNvbW1vbiBlbnRyeSBpdGVyYXRv
cnMgd2hpbGUgcHJlc2VydmluZyB0aGUgcHVibGljIG1hY3JvIGludGVyZmFjZS4KPiA+Pj4+Pj4g
VGhlIHNhZmUgdmFyaWFudHMgcmVtYWluIGF2YWlsYWJsZSB3aGVuIGNhbGxlcnMgbmVlZCB0aGUg
dGVtcG9yYXJ5Cj4gPj4+Pj4+IGN1cnNvciBleHBsaWNpdGx5IG9yIGhhdmUgc3Ryb25nZXIgbXV0
YXRpb24gcmVxdWlyZW1lbnRzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVu
a28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
