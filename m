Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ERSjLAy3J2oc1AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 08:47:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBA65CECF
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 08:47:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=jCopkThF;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD8ADC5F1F9;
	Tue,  9 Jun 2026 06:47:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A25CC5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780987658; x=1812523658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JtgXQ+CUhI8fqj7NEQN4vNa7+C8S/fPck+oJyjJdK2k=;
 b=jCopkThFyY+OaQW/87e7/bAyPHLGLSxhpzHWABA7TUEuyFmBqrBsvIxK
 W6ZhlsA9xtb6j58+fUHOoflVwJRsb4f+xGJQE2UlHNTam5VXocGWDp2TX
 W3WucqqoK0jQOM2AWM6Ov7KQX/MqY/PLrwiDuMyqTiyBKLU3azCT2uM+5
 eq69OzvBY4LrWll31ucdPkNGYqV/9PPDdE/PB1GWJEJruJx0wzyA/MCdK
 HFm0cRipBwXQ7ro5Sy+o7gd2WwKHjTAnRB9J3KFT5iYQ3TUaB3kJGAMfI
 YwhCUuGJYSqqlmNWNoXxFrAPjG6JA5/AWMa+vGi4Iq0gEKIJ6OeT5rXC2 w==;
X-CSE-ConnectionGUID: uO5PhVizR66LcDl8YYNZ4g==
X-CSE-MsgGUID: vUI+a8AiRz2YhqIfwqw+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81783730"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81783730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:47:34 -0700
X-CSE-ConnectionGUID: +shHRdOKTfGiz+VFC8i6ig==
X-CSE-MsgGUID: c7oiHZEDR2ikmK04/uJN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250060711"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:47:22 -0700
Date: Tue, 9 Jun 2026 09:47:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Message-ID: <aie299WveL1utNya@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609061347.93688-1-kaitao.cheng@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Howells <dhowells@redhat.com>,
 Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Robert Foss <rfoss@kernel.org>,
 Will Deacon <will@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, linux-spi@vger.kernel.org,
 Kaito Cheng <chengkaitao@kylinos.cn>, Ingo Molnar <mingo@redhat.com>,
 Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Josh Triplett <josh@joshtriplett.org>, Maxime Ripard <mripard@kernel.org>,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux1394-devel@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 linux-sound@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christian Koenig <christian.koenig@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:lgirdwood@gmail.com,m:dhowells@redhat.com,m:ray.huang@amd.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:will@kernel.org,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:mcoquelin.stm32@gmail.com,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:mripard@kernel
 .org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:akpm@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:muchun.song@linux.dev,m:linux-sound@vger.kernel.org,m:philipp.reisner@linbit.com,m:o-takashi@sakamocchi.jp,m:christoph.boehmwalder@linbit.com,m:ldewangan@nvidia.com,m:skomatineni@nvidia.com,m:tzimmermann@suse.de,m:lars.ellenberg@linbit.com,m:christian.koenig@amd.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,gmail.com,redhat.com,amd.com,ideasonboard.com,intel.com,nvidia.com,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,suse.com,ursulin.net,vger.kernel.org,kylinos.cn,bootlin.com,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,linux-foundation.org,lists.infradead.org,kernel.dk,linaro.org,linux.dev,linbit.com,sakamocchi.jp,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38BBA65CECF

On Tue, Jun 09, 2026 at 02:13:33PM +0800, Kaitao Cheng wrote:
> 
> This series prepares for, and then updates, the list_for_each_entry()
> family so the common entry iterators cache their next or previous cursor
> before the loop body runs.
> 
> The first 13 patches open-code loops that intentionally depend on the
> old "derive the next entry from the current cursor at the end of the
> iteration" behaviour.  These loops append work to the list being walked,
> restart traversal after dropping a lock, skip an entry consumed by the
> current iteration, or otherwise adjust the cursor in the loop body.
> 
> The final patch changes include/linux/list.h to keep a private cursor in
> the common entry iterators while preserving the public macro interface.
> The safe variants remain available when callers need the temporary
> cursor explicitly or have stronger mutation requirements.

Something is really wrong with the patch series email chaining.
Patches 3, 10, and 13 start the subthreads. Please, check your
tools and fix them accordingly.

Note, `git format-patch ...` should not have this "side-effect"
when used correctly.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
