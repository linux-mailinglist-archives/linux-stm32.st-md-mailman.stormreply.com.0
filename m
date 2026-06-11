Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FP38D7hbKmpVoAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 08:54:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A266F2F7
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 08:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=OLQRrURE;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05859C5F1CF;
	Thu, 11 Jun 2026 06:54:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0693C5F1C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781160885; x=1812696885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CFowTlceAGT8bJGLRrhVxOnbTokjR6+XQ9kWSeerCo0=;
 b=OLQRrURETmjS6lfuWTv0WxmjUNqNRuAd3RLNWgXD/e6VeEwDzdy9ZKn6
 hXkHdCiLUNUXS7J70ztyluJYDuyIdgzWCimV2s/IAwa1PrNn4tzBoIuSV
 nJuLsX19r9AxG8cOzIkRM/FqtDoFJHCj+nOwPHnv5/q2f0XXreu1t1bNp
 IywwHuANOWnoptDXULm4ro0JN90EpksHARTVxgKWTLAbS4j5xStvUZWLV
 tf0G7YPbNJPpLxW9FwEVqyR8HqfqrJB+2qCmwVWAnWCzWGzgHZV1oNt1+
 TSQdW76tedGaHqSyvgc9XF+oBFhX6VX7JleYinRw9nWIMWnWUkJbAB5Ly w==;
X-CSE-ConnectionGUID: cR/1+SrTTyOgM5ppzM2QPQ==
X-CSE-MsgGUID: vk2vnVKYTBajAv4vih3mPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81101241"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81101241"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 23:54:42 -0700
X-CSE-ConnectionGUID: Iu2FGfWER0CTkX31t1P0qw==
X-CSE-MsgGUID: yMX5BnmDSEy1/50OFUSSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250674708"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.123])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 23:54:28 -0700
Date: Thu, 11 Jun 2026 09:54:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Message-ID: <aipbojSeMH-usARY@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <ail4AvzqAOXNaU6N@ashevche-desk.local>
 <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 585A266F2F7

T24gVGh1LCBKdW4gMTEsIDIwMjYgYXQgMTI6NDI6MDJQTSArMDgwMCwgS2FpdGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI2LzYvMTAgMjI6NDMsIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4gPiBP
biBXZWQsIEp1biAxMCwgMjAyNiBhdCAwMjoxNDowNlBNICswODAwLCBLYWl0YW8gQ2hlbmcgd3Jv
dGU6Cj4gPj4g5ZyoIDIwMjYvNi85IDE4OjMzLCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPiA+
Pj4gT24gNi85LzI2IDA4OjEzLCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cgo+ID4+Pj4gVGhpcyBzZXJp
ZXMgcHJlcGFyZXMgZm9yLCBhbmQgdGhlbiB1cGRhdGVzLCB0aGUgbGlzdF9mb3JfZWFjaF9lbnRy
eSgpCj4gPj4+PiBmYW1pbHkgc28gdGhlIGNvbW1vbiBlbnRyeSBpdGVyYXRvcnMgY2FjaGUgdGhl
aXIgbmV4dCBvciBwcmV2aW91cyBjdXJzb3IKPiA+Pj4+IGJlZm9yZSB0aGUgbG9vcCBib2R5IHJ1
bnMuCj4gPj4+Cj4gPj4+IFdoeSBpbiB0aGUgd29ybGQgd291bGQgd2Ugd2FudCB0byBkbyB0aGF0
Pwo+ID4+Pgo+ID4+PiBUaGUgc2FmZSBhbmQgbm9uLXNhZmUgdmFyaWFudHMgaGF2ZSB2ZXJ5IGRp
c3RpbmN0IHVzZSBjYXNlcyBhbmQgdGhhdCBpcyBjb21wbGV0ZWx5IGludGVudGlvbmFsLgo+ID4+
Pgo+ID4+PiBXaGF0IHdlIGNvdWxkIGltcHJvdmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRpb24s
IGZyb20gbXkgZXhwZXJpZW5jZSBhbiBhc3RvbmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVvcGxl
IGhhdmUgbWlzY29uY2VwdGlvbnMgYWJvdXQgdGhlIHNhZmUgdmFyaWFudHMuCj4gPj4+Cj4gPj4+
PiBUaGUgZmlyc3QgMTMgcGF0Y2hlcyBvcGVuLWNvZGUgbG9vcHMgdGhhdCBpbnRlbnRpb25hbGx5
IGRlcGVuZCBvbiB0aGUKPiA+Pj4+IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhl
IGN1cnJlbnQgY3Vyc29yIGF0IHRoZSBlbmQgb2YgdGhlCj4gPj4+PiBpdGVyYXRpb24iIGJlaGF2
aW91ci4gIFRoZXNlIGxvb3BzIGFwcGVuZCB3b3JrIHRvIHRoZSBsaXN0IGJlaW5nIHdhbGtlZCwK
PiA+Pj4+IHJlc3RhcnQgdHJhdmVyc2FsIGFmdGVyIGRyb3BwaW5nIGEgbG9jaywgc2tpcCBhbiBl
bnRyeSBjb25zdW1lZCBieSB0aGUKPiA+Pj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndp
c2UgYWRqdXN0IHRoZSBjdXJzb3IgaW4gdGhlIGxvb3AgYm9keS4KPiA+Pj4KPiA+Pj4gV2VsbCBJ
IGhhdmUgdG8gY2xlYXJseSByZWplY3QgdGhlIGNoYW5nZXMgZm9yIHN1YnN5c3RlbXMvY29tcG9u
ZW50cyBJJ20gbWFpbnRhaW5pbmcsIHRoYXQganVzdCBsb29rcyBob3JyaWJsZSB0byBtZSBhbmQg
SSBjbGVhcmx5IGRvbid0IHNlZSBhIGdvb2QgcmVhc29uIGZvciB0aGF0Lgo+ID4+Cj4gPj4gSGkg
Q2hyaXN0aWFuIGFuZCBBbmR5IFNoZXZjaGVua28sCj4gPj4KPiA+PiBUaGFua3MgZm9yIHRha2lu
ZyBhIGxvb2suIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSBwb2ludCB5b3UgcmFpc2VkLgo+
ID4+Cj4gPj4gVGhlIHJlYXNvbiBJIHN0YXJ0ZWQgbG9va2luZyBhdCB0aGlzIGlzIHRoZSBvcmln
aW5hbCBtb3RpdmF0aW9uIGJlaGluZAo+ID4+IHRoZSBfc2FmZSgpIHZhcmlhbnRzLiAgVGhleSBl
eGlzdCBiZWNhdXNlIHNvbWUgdXNlcnMgbmVlZCB0byByZW1vdmUsIG1vdmUKPiA+PiBvciBvdGhl
cndpc2UgY29uc3VtZSB0aGUgY3VycmVudCBlbnRyeSB3aGlsZSB3YWxraW5nIHRoZSBsaXN0LiAg
SW4gdGhhdAo+ID4+IGNhc2UgdGhlIG5leHQgY3Vyc29yIGhhcyB0byBiZSBwcmVzZXJ2ZWQgYmVm
b3JlIHRoZSBsb29wIGJvZHkgY2FuIG1vZGlmeQo+ID4+IHRoZSBjdXJyZW50IGVudHJ5Lgo+ID4+
Cj4gPj4gVGhlIHVuZm9ydHVuYXRlIHBhcnQgaXMgdGhhdCB0aGlzIGNvdWxkIG5vdCBiZSBleHBy
ZXNzZWQgd2l0aCB0aGUKPiA+PiBleGlzdGluZyBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgaW50ZXJm
YWNlIHdpdGhvdXQgY2hhbmdpbmcgaXRzIGNhbGxpbmcKPiA+PiBjb252ZW50aW9uLiAgVGhlIF9z
YWZlKCkgdmFyaWFudHMgaGFkIHRvIGdyb3cgYW4gZXh0cmEgYXJndW1lbnQgZm9yIHRoZQo+ID4+
IHRlbXBvcmFyeSBjdXJzb3IsIGFuZCB0aGF0IGlzIHdoeSB3ZSBlbmRlZCB1cCB3aXRoIGEgc2Vw
YXJhdGUgZmFtaWx5IG9mCj4gPj4gbWFjcm9zLgo+ID4+Cj4gPj4gQnV0IGNvbmNlcHR1YWxseSwg
dGhlIGRpc3RpbmN0aW9uIGRvZXMgbm90IGhhdmUgdG8gYmUgZXhwb3NlZCBhcyB0d28KPiA+PiBk
aWZmZXJlbnQgaXRlcmF0b3IgZmFtaWxpZXMgZm9yZXZlci4gIFRoZSBkaWZmZXJlbmNlIGlzIGFu
IGltcGxlbWVudGF0aW9uCj4gPj4gZGV0YWlsOiB3aGV0aGVyIHRoZSBpdGVyYXRvciBrZWVwcyB0
aGUgbmV4dC9wcmV2aW91cyBjdXJzb3IgYmVmb3JlIHRoZQo+ID4+IGJvZHkgcnVucy4gIFRoaXMg
c2VyaWVzIG1ha2VzIHRoZSBjb21tb24gbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGl0ZXJhdG9ycwo+
ID4+IGRvIHRoYXQgaW50ZXJuYWxseSwgc28gdGhlIHNhZmUgYW5kIG5vbi1zYWZlIGZvcm1zIGNh
biBlZmZlY3RpdmVseSBiZQo+ID4+IGZvbGRlZCB0b2dldGhlciwgb3IgYXQgbGVhc3QgdGhlIG5l
ZWQgZm9yIGEgc2VwYXJhdGUgcHVibGljIF9zYWZlKCkKPiA+PiBpbnRlcmZhY2UgYmVjb21lcyBt
dWNoIHdlYWtlci4KPiA+Pgo+ID4+IFRoZXJlIGlzIGFsc28gYSB1c2FiaWxpdHkgaXNzdWUgd2l0
aCB0aGUgY3VycmVudCBfc2FmZSgpIGludGVyZmFjZS4gIFRoZQo+ID4+IGNhbGxlciBpcyBmb3Jj
ZWQgdG8gZGVmaW5lIGEgdGVtcG9yYXJ5IGN1cnNvciBvdXRzaWRlIHRoZSBtYWNybyBhbmQgcGFz
cwo+ID4+IGl0IGluLCBldmVuIHRob3VnaCBhbG1vc3QgYWxsIHVzZXJzIG5ldmVyIHVzZSB0aGF0
IGN1cnNvciBkaXJlY3RseS4gIEl0IGlzCj4gPj4ganVzdCBib2lsZXJwbGF0ZSByZXF1aXJlZCBi
eSB0aGUgbWFjcm8gaW1wbGVtZW50YXRpb24uICBJIGZpbmQgdGhhdAo+ID4+IHJlZHVuZGFudCBh
bmQgYXdrd2FyZDogdGhlIHRlbXBvcmFyeSBjdXJzb3IgaXMgYW4gaW50ZXJuYWwgZGV0YWlsIG9m
IHRoZQo+ID4+IGl0ZXJhdGlvbiwgYnV0IGV2ZXJ5IGNhbGxlciBoYXMgdG8gc3BlbGwgaXQgb3V0
Lgo+ID4gCj4gPiBBaCwgSSB0aGluayB0aGUgZGlzdGluY3QgbWFjcm8gZmFtaWxpZXMgaXMgdGhh
dCB3aGF0IHdlIHdhbnQuCj4gPiBCdXQgdGhlIGhpZGluZyBvZiB0aGUgcGFyYW1ldGVyIGNhbiBi
ZSBkb25lIGluc2lkZSBsaXN0X2Zvcl9lYWNoXypfc2FmZSgpLgo+ID4gWW91IGNhbiBkbyBhIHRy
ZWV3aWRlIGNoYW5nZSB3aXRoIGNvY2NpbmVsbGUuCj4gPiAKPiA+IFNvcnJ5IGlmIEkgZGlkbid0
IGdldCB0aGUgd2hvbGUgaWRlYSBmcm9tIHlvdXIgcHJldmlvdXMgY29udHJpYnV0aW9ucy4KPiA+
IAo+ID4gTm90ZSwgZXZlbiBjYXNlcyB0aGF0IHdvdWxkIG5lZWQgYSB0ZW1wb3JhcnkgY3Vyc29y
IG1heSBiZSBzd2l0Y2hlZCB0bwo+ID4gbmV3IGxpc3RfZm9yX2VhY2hfKl9zYWZlKCksIHNlZSBo
b3cgUENJIG1hY3JvcyBmb3IgaXRlcmF0aW5nIG92ZXIgcmVzb3VyY2VzCj4gPiBhcmUgaW1wbGVt
ZW50ZWQgKGluY2x1ZGUvbGludXgvcGNpLmgpLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0
aW9ucy4gSSd2ZSB3cml0dGVuIGEgZGVtbyBiYXNlZCBvbiB5b3VyIGZlZWRiYWNrLgo+IENvdWxk
IHlvdSBwbGVhc2UgcmV2aWV3IGl0IGFuZCBzaGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMgYXBw
cm9hY2g/CgpIYXZlIHlvdSBjaGVja2VkIGhvdyBtYW55IHVzZXJzIGFjdHVhbGx5IG5lZWQgdGhl
IHRlbXBvcmFyeSBzdG9yYWdlPwoKPiA+PiBXaXRoIHRoZSB1cGRhdGVkIGxpc3RfZm9yX2VhY2hf
ZW50cnkoKSBpbXBsZW1lbnRhdGlvbiwgdGhhdCBleHRyYSBjdXJzb3IKPiA+PiBjYW4gYmUga2Vw
dCBpbnNpZGUgdGhlIGl0ZXJhdG9yIGl0c2VsZi4gIENhbGxlcnMgdGhhdCBvbmx5IHdhbnQgdG8g
d2Fsawo+ID4+IHRoZSBsaXN0LCBpbmNsdWRpbmcgY2FsbGVycyB0aGF0IGRlbGV0ZSBvciBjb25z
dW1lIHRoZSBjdXJyZW50IGVudHJ5LCBubwo+ID4+IGxvbmdlciBuZWVkIHRvIGNhcnJ5IGFuIG90
aGVyd2lzZS11bnVzZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGp1c3QgdG8gbWFrZQo+ID4+IHRoZSBt
YWNybyB3b3JrLgo+ID4+Cj4gPj4+PiBUaGUgZmluYWwgcGF0Y2ggY2hhbmdlcyBpbmNsdWRlL2xp
bnV4L2xpc3QuaCB0byBrZWVwIGEgcHJpdmF0ZSBjdXJzb3IgaW4KPiA+Pj4+IHRoZSBjb21tb24g
ZW50cnkgaXRlcmF0b3JzIHdoaWxlIHByZXNlcnZpbmcgdGhlIHB1YmxpYyBtYWNybyBpbnRlcmZh
Y2UuCj4gPj4+PiBUaGUgc2FmZSB2YXJpYW50cyByZW1haW4gYXZhaWxhYmxlIHdoZW4gY2FsbGVy
cyBuZWVkIHRoZSB0ZW1wb3JhcnkKPiA+Pj4+IGN1cnNvciBleHBsaWNpdGx5IG9yIGhhdmUgc3Ry
b25nZXIgbXV0YXRpb24gcmVxdWlyZW1lbnRzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5
IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
