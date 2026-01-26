Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM2TFdo5d2mMdQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 10:54:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4461863F5
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 10:54:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D696C87EDC;
	Mon, 26 Jan 2026 09:54:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75797C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769421272; x=1800957272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=biNWH6Rr15jnwx8nyn4xZSAxcP4dKu8eJOtBc9tUiV4=;
 b=YWrLDVd2jQbk9JZE9oNMOOQf4i7AlJwzppxvTJe6w7Pv7bQITGpRZnmM
 ybI773/8NE0ENK3BuUn101ASM8rIx+f+Xu9BiUb+fdbwVywC02akEcit4
 jIhahrq7bXCTxrqWGeqanEh5HTSpeHMvEnS5YAejHcHExykY7LQ17YCMl
 ahl0ZosrosTY5goIUHNmHoj6e6tMNLIy/HlsO9hap0VPu7d28Mo0o4PfO
 wbUc8i92LvTM+Bm8IotupQLWw3f2WsaUem1qmHMwi1LMlBzhtBDgwauBt
 +qX9J6HLn3b8UmMC7HHqUyTjaesTlf5MzybfuDSoJBkovQg6z9/aL8GBr w==;
X-CSE-ConnectionGUID: I73QsSLDRzW4fc43NRf1Nw==
X-CSE-MsgGUID: +gcS0pR9SO+3TCUP9QoZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70564214"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70564214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:54:30 -0800
X-CSE-ConnectionGUID: /uPQCNh+TY+54SwqBmU90w==
X-CSE-MsgGUID: oOdeRaRpTx+ETctxkEpfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207242420"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.122])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:54:24 -0800
Date: Mon, 26 Jan 2026 11:54:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <aXc5zVLkSAHT55Tm@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RFC PATCH 3/4] treewide: convert hwspinlock
 users to the new consumer header file
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:linux-iio@vger.kernel.org,m:nuno.sa@analog.com,m:dakr@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,lists.infradead.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D4461863F5
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

...

> +++ b/drivers/base/regmap/regmap.c

>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/log2.h>
> -#include <linux/hwspinlock.h>
> +#include <linux/hwspinlock/consumer.h>
>  #include <linux/unaligned.h>

Can it be also moved to be a bit more ordered? (With given context like to put
it before log2.h).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
