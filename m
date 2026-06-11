Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SU0mEepxKmrHpQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:29:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE866FDC8
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=mGn6iukO;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27EC0C424DD;
	Thu, 11 Jun 2026 08:29:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A49A8C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781166568; x=1812702568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PQrdG7EV4quhX26AHkiaOyDqMWYsaSvMsUL42rw95G8=;
 b=mGn6iukO1VrWrQgJCvk9QAAr1e1I+q8b0sJLo3z6YLp8uTgab0ChRqt5
 6/TqlKu78GzPCGQVS0AcenDv3ooY2LZiA/1yC6z6d7EVWUjTHPIv9htk+
 6T+IWfPjGhlO2Xu9xBPmA3yqjO3nFsO65WQWxV7Pm/H538RnLjX6Qq5yQ
 heHpORvHYSrY+MMY2IOU1ERz+NMZq6chSuB/fZwev2C5z3vJGcqNzecqP
 exRVtiZUXybVbABn+HadSfkqndoE3Xo+wygdRsUmuO3jJhweGqx1CuvIE
 VW//DHVE3uHfHvKO37xRORIDmf6dv2MULVQR2JbSmp7ubodqGrEq+Jgdk A==;
X-CSE-ConnectionGUID: /7oUXLmbTQiZB/dcDCR2fg==
X-CSE-MsgGUID: liE4uQzPTq6SoiU2wgAV7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81953815"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81953815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:29:25 -0700
X-CSE-ConnectionGUID: ZG4MT08iQHe6mEq2035+wQ==
X-CSE-MsgGUID: s/GNAqCUTJqY9+1lZtgZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="240074812"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.123])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:29:13 -0700
Date: Thu, 11 Jun 2026 11:29:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <aipx1goKIsk40vrF@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
 <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
 <ail8iNvPrJnE7p58@ashevche-desk.local>
 <92683537-8404-47fe-a4ba-160e54870f0b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92683537-8404-47fe-a4ba-160e54870f0b@amd.com>
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
 Ingo Molnar <mingo@redhat.com>, Kaitao Cheng <kaitao.cheng@linux.dev>,
 Waiman Long <longman@redhat.com>, Philipp Reisner <philipp.reisner@linbit.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:kaitao.cheng@linux.dev,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula
 @linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AAE866FDC8

T24gVGh1LCBKdW4gMTEsIDIwMjYgYXQgMTA6MDE6MjVBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBPbiA2LzEwLzI2IDE3OjAyLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBP
biBXZWQsIEp1biAxMCwgMjAyNiBhdCAxMToxMTozNEFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+ID4+IE9uIDYvMTAvMjYgMTA6MTgsIEthaXRhbyBDaGVuZyB3cm90ZToKPiA+Pj4g
5ZyoIDIwMjYvNi8xMCAxNjowNywgQ2hyaXN0aWFuIEvDtm5pZyDlhpnpgZM6CgouLi4KCj4gPj4+
IFNob3VsZCB3ZSByZXZlcnQgdG8gdjEsIG9yIGtlZXAgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGFu
ZAo+ID4+PiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoKSBhcyB0aGV5IGFyZSwgY2xvc2UgdGhp
cyB0aHJlYWQsIGFuZCBtYWtlIG5vCj4gPj4+IGNoYW5nZXM/Cj4gPj4+Cj4gPj4+IExpbmsgdG8g
djE6Cj4gPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyOTA4MjE0OS43Njc2
NC0xLWthaXRhby5jaGVuZ0BsaW51eC5kZXYvCj4gPj4+Cj4gPj4+IE9yIGRvIHlvdSBoYXZlIGFu
eSBiZXR0ZXIgc3VnZ2VzdGlvbnM/Cj4gPj4KPiA+PiB2MSBsb29rcyBwZXJmZWN0bHkgcmVhc29u
YWJsZSB0byBtZS4KPiA+IAo+ID4gQnV0IHdoeSBub3QganVzdCBoaWRpbmcgdGhhdCBvbmNlIGZv
ciBhbGwgKGluIGNhc2UgdGhleSBkb24ndCB1c2UgdGhlIHRlbXBvcmFyeQo+ID4gaXRlcmF0b3Ip
PyBFYXN5IHRvIGF1dG9tYXRlLCByb2J1c3Qg4oCUIGV2ZXJ5b25lIGlzIGhhcHB5Pwo+IAo+IEFz
IGZhciBhcyBJIGNhbiBzZWUgdGhhdCBpcyBhbiBleHRyZW1lbHkgYmFkIGlkZWEuCj4gCj4gVGhl
IGRpc3RpbmN0aW9uIGJldHdlZW4gdGhlIHVzZSBjYXNlcyBvZiAnaXRlcmF0aW5nIHRoZSBsaXN0
JyBhbmQgJ2l0ZXJhdGluZwo+IHRoZSBsaXN0IHdoaWxlIHlvdSBtb2RpZnkgaXQnIGlzIGNvbXBs
ZXRlbHkgaW50ZW50aW9uYWwuCgpXaGF0IEkgbWVhbnQgaXMgdG8ga2VlcCB0aGUgbmFtZSwganVz
dCBkcm9wIHRoZSBwYXJhbWV0ZXIgKG1ha2UgaXQgaGlkZGVuIGFuZApiZWluZyBkZWZpbmVkIGlu
c2lkZSBsaXN0X2Zvcl9lYWNoXypfc2FmZSgpIGNhc2VzKS4KCj4gU2VlIHRoZSBib29sIHR5cGUg
Y2FuIGJlIGltcGxlbWVudGVkIGJ5IGludCBhcyB3ZWxsLCBidXQgaXQgaXMganVzdCBhCj4gZGlm
ZmVyZW50IHVzZSBjYXNlLgoKPiA+PiBZb3Ugc2hvdWxkIGp1c3QgaW5jbHVkZSBzb21lIHBhdGNo
ZXMgaW4gdGhlIHNhbWUgcGF0Y2ggc2V0IHRvIGFjdHVhbGx5IHVzZQo+ID4+IHRoZSBuZXcgbWFj
cm9zLgo+ID4+Cj4gPj4gSWYgeW91IG1vZGlmeSB0aGUgZmlsZXMgdW5kZXIgZHJpdmVycy9kbWEt
YnVmIG9yIGRyaXZlcnMvZ3B1L2RybS9hbWQgdG8gdXNlCj4gPj4gdGhlIG5ldyBtYWNybyBJJ20g
aGFwcHkgdG8gcmV2aWV3IHRoYXQuCj4gPiAKPiAKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5k
eSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
