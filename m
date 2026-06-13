Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fIRAEKYL2oIDAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 08:14:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0E683B12
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 08:14:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=sakamocchi.jp (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0FECC5F1E9;
	Mon, 15 Jun 2026 06:14:24 +0000 (UTC)
Received: from flow-b6-smtp.messagingengine.com
 (flow-b6-smtp.messagingengine.com [202.12.124.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27E7EC712AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2026 02:11:36 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id F3E41130005A;
 Fri, 12 Jun 2026 22:11:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 12 Jun 2026 22:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1781316691; x=
 1781323891; bh=fh1bnzRZkfgjl9/+6Z2PA5Kxn4ZV0HU2wTlYFBWNiQ4=; b=m
 /B1Wk7purilBiKkMRVuC3Flfti1lZpKfwlt77AZHkSZhKAS8ia2z8R1CfOFuJXF6
 jqWuwBOSRldHgJLpHFlWbohi+/JgUUnflgC3sz67VmbHnHyV/qKZ4L9+/cZXwBar
 pZn5nQLmSLaeUika7jXQ35MDD5xqJYMJ+XFW0A6h82xxae3b35f+ak0pm9sP0j3o
 Rn6Oms26Dq5JaxYcd+LhJ5gGkGzHljkvR3PWQpdcFDZcrutUQ5Gw4MM7C09x5GvX
 Rm44QXSJLT+PBjHrSfnnGBG8BhkzE2o2bhAyK2kr+YrDji7XqZrfOW/mHwWthgS8
 Q8mLA82aenzF3UH78IFeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1781316691; x=1781323891; bh=fh1bnzRZkfgjl9/+6Z2PA5Kxn4ZV0HU2wTl
 YFBWNiQ4=; b=B/MO738r25kBC5W1FZEi/jo6InpT95G+oNzeSTFxbs6dD4/bHOo
 eohWxUFnm/DfWRpK+E9TtLDOCX/uuLyULx8m11eswEvzdxMrqTKhaL6Z02wKBqNd
 CwUcrPKAd4Siff0BNUrNKfyxMQnnlhIFTpMxLRKZ8xZjD0t2cTZE+U4PZ4f1VLum
 eUck3wo68eBHMIfH++HVVwfv7ri3oT2EnqWmMJLbVCz7Bgqys21n/vANfaMKmzA5
 KTcEAvxk1SZlFD9lLcLv/WXuzYzr6P0pxCDuHnQsrl+DKeZ8fmfPZHEY9ZY0Se5J
 q0LnaDPLjJpMRMgOPg+6e3HR5iqlooX1wzg==
X-ME-Sender: <xms:ULwsaqJSU3ZGUfYTfTfHvUkDGrkZoAz6knspkLRN72dkmhaAlWGU0w>
 <xme:ULwsahfpOAjeeQFoOqDeZonzxOth5iwOqocTQN665ujKaw5W4kvXENFHiPc-NQxhw
 bYtvUQNmu3jDY73PL51YmoAI2sjikN827tQNcmget20GbLVOMoBysI>
X-ME-Received: <xmr:ULwsahqjIqnco2Z3DcLoZTyMFsoOrP0wNMni9j0HG90Y9TI7BFN_QaV06BuMmbh11eW2LBxgLuuRksM5bGGMSNYbNYgx36I>
X-ME-Proxy-Cause: dmFkZTF4d5otJNSy4E5+TBrm5t4/oKNW6ZUmoxVyat81cKms57U/uBMehGj0z5o/f8U0/o
 PK70IhoMQDHia1i8CUjqCHYptK3rsgOvh6V75aLzG/qgZR8GOCrcy2g63bYzQQOxQqQZj/
 9oT1UuiKnf5HDSuvjSqxoI4qcJJc8bRoOgMhp5UWdtRrRuetAFIP6Aax0o1UXRC5743AIG
 ohTJB6VzPihRmorA3Lx8YAKhiMlL0+yMkZd8nQebbDlRgY6+OEVjhF6TdMsRENVLgOl/oT
 e9kd0DiCM7hKkG8v6/VJyviGyBIdYP/hdF4S7lGeNUOAI6uqYDfailcqU2g8IxWFbY33Iz
 +ACooa7G5aLCHNydDMqgIw/A9YbG1rRl+rnyg/YIAD4D6JdEdoAgr2XQjPH8mcmJlRbD3J
 L4/zbRcQgfwyBPi98PR4JOKtv58W0qZNGq2bo6mWTGKoyLqrpZmzB453regdcvZ8yWpZmu
 5lZqhVxLEQEMILodTD6zK1GHSSrZm7GNYXniwmQFVTJUC06+nPk5jOzXfJFTMkjFQnsTua
 s5EZutrLFiC0SlXAMx3G8OW0t7HhwPROcWEkdP0Sg/cm0K2m7YFRY8ECn2xh73b8iO9AwB
 tCQHO9fSd6RcJ4FMQt07rf5E93yDlosmA0AAxIdfE3fyuvVFOzAgwLaVB37Q
X-ME-Proxy: <xmx:ULwsaquT5SmR-xrOGgQFjoa6EFFSjj_YmJFkzvlVLH6-bw1wIgxJcA>
 <xmx:ULwsaiczRhSGXgdtKE6k3bFZWKF6E3kwyRiRHotFTZvhVr9iHcwmsg>
 <xmx:ULwsavqtUT6DHcdKXT_TCM513fG-OiPCsLUvufUASvNxvwu79-mjtQ>
 <xmx:ULwsagTJKGVgV3JEZ3ffGTuu0di_sdwXaiZGwS3tmV3GAsHXbdzfUw>
 <xmx:U7wsaqO7MfduZe3aBiVNiGj0DHVe0CuJke1_63F3DF10oo3uJ_cbzvXT>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 22:11:17 -0400 (EDT)
Date: Sat, 13 Jun 2026 11:11:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Message-ID: <20260613021115.GA130812@sakamocchi.jp>
Mail-Followup-To: Kaitao Cheng <kaitao.cheng@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?=
 <christoph.boehmwalder@linbit.com>,	Jens Axboe <axboe@kernel.dk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Eddie James <eajames@linux.ibm.com>,
 Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Boqun Feng <boqun@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Waiman Long <longman@redhat.com>, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Christian Brauner <brauner@kernel.org>,
 David Howells <dhowells@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <20260609061347.93688-3-kaitao.cheng@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609061347.93688-3-kaitao.cheng@linux.dev>
X-Mailman-Approved-At: Mon, 15 Jun 2026 06:14:24 +0000
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Howells <dhowells@redhat.com>,
 linux-tegra@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Robert Foss <rfoss@kernel.org>,
 Will Deacon <will@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kaitao Cheng <chengkaitao@kylinos.cn>,
 Ingo Molnar <mingo@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
 Waiman Long <longman@redhat.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Josh Triplett <josh@joshtriplett.org>, Maxime Ripard <mripard@kernel.org>,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux1394-devel@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 linux-sound@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 linux-spi@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/14] firewire: core: Open-code
	topology list walk
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
	DATE_IN_PAST(1.00)[52];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sakamocchi.jp : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,gmail.com,redhat.com,vger.kernel.org,amd.com,ideasonboard.com,intel.com,nvidia.com,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,suse.com,ursulin.net,kylinos.cn,bootlin.com,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,linux-foundation.org,lists.infradead.org,kernel.dk,linaro.org,linux.dev,linbit.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:lgirdwood@gmail.com,m:dhowells@redhat.com,m:linux-tegra@vger.kernel.org,m:ray.huang@amd.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:will@kernel.org,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:tursulin@ursulin.net,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:mcoquelin.stm32@gmail.com,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:mripard@kern
 el.org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:perex@perex.cz,m:andriy.shevchenko@linux.intel.com,m:linux1394-devel@lists.sourceforge.net,m:akpm@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:muchun.song@linux.dev,m:linux-sound@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ldewangan@nvidia.com,m:skomatineni@nvidia.com,m:tzimmermann@suse.de,m:lars.ellenberg@linbit.com,m:christian.koenig@amd.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[o-takashi@sakamocchi.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o-takashi@sakamocchi.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61F0E683B12

Hi,

On Tue, Jun 09, 2026 at 02:13:35PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> A later change will make list_for_each_entry() cache the next element
> before entering the loop body. for_each_fw_node() intentionally appends
> newly discovered child nodes to the temporary walk list while the list is
> being traversed.
> 
> Keep the loop open-coded so the next node is looked up only after
> children have been appended. This preserves the current breadth-first
> traversal semantics and prepares the code for the list iterator update.
> 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  drivers/firewire/core-topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks for the patch.

Last September I've realized the issue but not solved yet[1]. A pointer
array would be another candidate to store the found nodes, since IEEE 1394
bus a restriction about the maximum number of nodes up to 256. But It is
too large if put in kernel stack, while it is slightly difficult to keep
it in heap dynamically since the function is called under holding
spinning lock.

Anyway, there is no objection to your change. Let me apply it to
for-next branch so that your further work goes well with no blocks
locating in this subsystem.

[1] https://social.kernel.org/notice/AyDqvLkpwUvI5eyokK


Thanks

Takashi Sakamoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
