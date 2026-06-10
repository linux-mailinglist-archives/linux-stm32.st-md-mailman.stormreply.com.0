Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aw2bCKV8KWr7XgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 17:03:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C551F66A868
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 17:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=kgnDePde;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C3BEC5F1CF;
	Wed, 10 Jun 2026 15:02:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 342A0C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781103771; x=1812639771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wdD+yxiW9aVoMld4LMPC1DWLru4HtTsU9EmgfMnk6eg=;
 b=kgnDePdeDPb1LwjobBjojUSbnuGypAv0JrP1NNrnTE/4HqMN+kIZMaRp
 P0Gspp1MiYejXoQt3GuMPTBvvSci+NzI+kvdrtFAzCM2CD1jsAchBpYpT
 DTpl1vZgFIIgDx7vvxmSf8jna8rdhu2rzIjtc+ATpPF2kC8HMz40AhSwl
 UWJ6MApmF+Vd7R1Ov+5BpG0DpxD59AXC1wpDuyXBrUF9D93qTlC0/tfLV
 b/bod6aQXLttiv4A/qX1aiUZEqJ1orHCht7q2oz5jTCl38DodItw+ft1z
 Smw2N9oWsdBFa3AIochoOlb+IvjP18pv9HgU+TagTUudk8T3rv8KkSNIB Q==;
X-CSE-ConnectionGUID: FZMSlis6SEKpzwGyKile2Q==
X-CSE-MsgGUID: UirbVmrtS/ubwRdmSxH6Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107334599"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="107334599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:02:48 -0700
X-CSE-ConnectionGUID: vFiAK4i9TuuPvjj1ruVuyA==
X-CSE-MsgGUID: yPzj5/7BTy26oZg8/7CqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251275772"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:02:35 -0700
Date: Wed, 10 Jun 2026 18:02:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <ail8iNvPrJnE7p58@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
 <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
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
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:kaitao.cheng@linux.dev,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula
 @linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[intel.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-stm32.st-md-mailman.stormreply.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C551F66A868

T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgMTE6MTE6MzRBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBPbiA2LzEwLzI2IDEwOjE4LCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4gPiDlnKgg
MjAyNi82LzEwIDE2OjA3LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKCi4uLgoKPiA+IFNob3Vs
ZCB3ZSByZXZlcnQgdG8gdjEsIG9yIGtlZXAgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGFuZAo+ID4g
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkgYXMgdGhleSBhcmUsIGNsb3NlIHRoaXMgdGhyZWFk
LCBhbmQgbWFrZSBubwo+ID4gY2hhbmdlcz8KPiA+IAo+ID4gTGluayB0byB2MToKPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyOTA4MjE0OS43Njc2NC0xLWthaXRhby5jaGVu
Z0BsaW51eC5kZXYvCj4gPiAKPiA+IE9yIGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlv
bnM/Cj4gCj4gdjEgbG9va3MgcGVyZmVjdGx5IHJlYXNvbmFibGUgdG8gbWUuCgpCdXQgd2h5IG5v
dCBqdXN0IGhpZGluZyB0aGF0IG9uY2UgZm9yIGFsbCAoaW4gY2FzZSB0aGV5IGRvbid0IHVzZSB0
aGUgdGVtcG9yYXJ5Cml0ZXJhdG9yKT8gRWFzeSB0byBhdXRvbWF0ZSwgcm9idXN0IOKAlCBldmVy
eW9uZSBpcyBoYXBweT8KCj4gWW91IHNob3VsZCBqdXN0IGluY2x1ZGUgc29tZSBwYXRjaGVzIGlu
IHRoZSBzYW1lIHBhdGNoIHNldCB0byBhY3R1YWxseSB1c2UKPiB0aGUgbmV3IG1hY3Jvcy4KPiAK
PiBJZiB5b3UgbW9kaWZ5IHRoZSBmaWxlcyB1bmRlciBkcml2ZXJzL2RtYS1idWYgb3IgZHJpdmVy
cy9ncHUvZHJtL2FtZCB0byB1c2UKPiB0aGUgbmV3IG1hY3JvIEknbSBoYXBweSB0byByZXZpZXcg
dGhhdC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
