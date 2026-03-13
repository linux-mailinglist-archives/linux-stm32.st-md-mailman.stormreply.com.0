Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNxPNJvZs2mzbgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 10:32:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C728089B
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 10:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26DF8C8F299;
	Fri, 13 Mar 2026 09:32:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62D7FC87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394330; x=1804930330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nppF1ad9T9XazH1yCnKiKJ8QR0oAlqI2g7/jhh/8t+U=;
 b=Dwp85++zNQ+dZZDgsuaGyExccdG/tadOu+Am3bwGSXmdKXixRb88f6jD
 wfWbx3Xm9iVOq461D3qXRbzuzXWmqdcKrYtPtB+TSRh15LLh3my+25Sp6
 n5POO8hG4wOx6sLeKxM+hJONT23eC74E0uA5gkJKbSk45ZRUKvpR2yS1H
 4kcEAd8/RGnS/eb8FexSCeE5MtBf1Ugaf2bOgQc+dEOb6iDWscLRhotaz
 Z34wBV8YB4C2Z4jGbCofARhQMbGOQUtG07rhfgilHK2tcO9nzXDOQsihB
 xrjKSIVzJzrWbS2nr3IidTgVnvUr+bLjsUnJQxOTaDvQeLv8mrFMNFEQN Q==;
X-CSE-ConnectionGUID: Jwhn2Tm1QQa3gmpZZoGXIQ==
X-CSE-MsgGUID: uciEhNOeRWO2+WRESSNNSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74394799"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74394799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:08 -0700
X-CSE-ConnectionGUID: NP6vg9yORXaGSdK0VshM0w==
X-CSE-MsgGUID: gAA72zLVTO2mDXcG1uOzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="217135271"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.246])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:31:58 -0700
Date: Fri, 13 Mar 2026 11:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Message-ID: <abPZjEE82AIxSgB6@ashevche-desk.local>
References: <20260313013435.25731-1-tomasborquez13@gmail.com>
 <20260313071014.2102-1-tomasborquez13@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313071014.2102-1-tomasborquez13@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: linux-iio@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Ariana Lazar <ariana.lazar@microchip.com>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alisa-Dariana Roman <alisa.roman@analog.com>, chrome-platform@lists.linux.dev,
 Lars-Peter Clausen <lars@metafoo.de>, Erikas Bitovtas <xerikasxx@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Kurt Borja <kuurtb@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Waqar Hameed <waqar.hameed@axis.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>,
 Shi Hao <i.shihao.999@gmail.com>, chuguangqing <chuguangqing@inspur.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Gwendal Grignou <gwendal@chromium.org>,
 Benson Leung <bleung@chromium.org>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Jyoti Bhayana <jbhayana@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Janani Sunil <janani.sunil@analog.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Peter Rosin <peda@axentia.se>,
 Kim Seer Paller <kimseer.paller@analog.com>
Subject: Re: [Linux-stm32] [PATCH v2] iio: cleanup: uintptr_t to unsigned
	long
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomasborquez13@gmail.com,m:linux-iio@vger.kernel.org,m:nuno.sa@analog.com,m:antoniu.miclaus@analog.com,m:giorgitchankvetadze1997@gmail.com,m:ariana.lazar@microchip.com,m:groeck@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:alisa.roman@analog.com,m:chrome-platform@lists.linux.dev,m:lars@metafoo.de,m:xerikasxx@gmail.com,m:dixitparmar19@gmail.com,m:kuurtb@gmail.com,m:dlechner@baylibre.com,m:waqar.hameed@axis.com,m:Mariel.Tinaco@analog.com,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:Michael.Hennerich@analog.com,m:mazziesaccount@gmail.com,m:marten.lindahl@axis.com,m:i.shihao.999@gmail.com,m:chuguangqing@inspur.com,m:tzungbi@kernel.org,m:gwendal@chromium.org,m:bleung@chromium.org,m:matteomartelli3@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:jbhayana@google.com,m:gustavoars@kernel.org,m:linux-kernel@vger.kernel.org,m:janani.sunil@analog.com,m:marius.cristea@microchip.com,m:jic23@kernel.org,m:mcoquelin.stm32@gmail.com,m
 :peda@axentia.se,m:kimseer.paller@analog.com,m:ishihao999@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,gmail.com,microchip.com,chromium.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,baylibre.com,axis.com,jmondi.org,linux.intel.com,inspur.com,kernel.org,lists.infradead.org,google.com,axentia.se];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,ashevche-desk.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6C1C728089B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:10:14AM -0300, Tomas Borquez wrote:
> Linus has been explicit that uintptr_t should not be used in the kernel.
> 
> The iio_chan_spec_ext_info struct uses uintptr_t for the private field
> and in its read/write function pointer signatures. Jonathan Cameron noted
> this should be cleaned up in one go across all users [1].
> 
> Update the struct definition in iio.h and backend.h, along with all
> drivers implementing or using iio_chan_spec_ext_info callbacks.
> 
> No functional change intended.
> 
> [1] https://lore.kernel.org/linux-iio/20260111122034.174c754c@jic23-huawei/
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>

Please, really, take your time and study process documentation!
No new version, especially that SPAMS so many people, in less
than 24h. You must give a chance other people to review.

This version effectively ignores all my comments I just gave against v1.
So big NAK again!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
