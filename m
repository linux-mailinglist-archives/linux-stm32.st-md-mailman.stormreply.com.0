Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YgAgJN5OT2pLeAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:33:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D272DC21
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=LbDd9jPg;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4066C8F284;
	Thu,  9 Jul 2026 07:33:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CC8CC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783582428; x=1815118428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z7l+gvXk3JDQmEUoKIVr9+b9SPFOlR8x569miOzasGQ=;
 b=LbDd9jPgTyJI2hCaHPxrtlBZyJK9YfTgcrcI7RkfAZMh6Ld3F2m5bBtF
 rgW5W1adFbbPW8UBvPLdyNwSrvvHLB5dpYnkCsGAV9RBx4RKkiMRV1bSL
 By2tG5r1G6PNqBKurkm84Cktq0USfIHfkkgZnYaQvYKbNHkxZRCb4xy67
 6s9MV0w+V/EkakIofzedrxoGHl4eyw5lMZ1hDqEjz0emM8JTNRyW2fsBv
 YO75XVKko1WF+erHN+/HwjSsWz9baruMgTGu4ggntV0CnIWIdMR2x6LrV
 Tmbcd0BN4Kpl6GAU1JiCazbb8OMsgSJU56Ji8RB+xmAHbe3OFbHGdISbt w==;
X-CSE-ConnectionGUID: Ew3PrvATQhuNJOASM8U8Tw==
X-CSE-MsgGUID: +x6QFnH6QdunsEabXmjcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83367138"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83367138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:33:46 -0700
X-CSE-ConnectionGUID: EN5Bw27PRyOtBsvhIkOV8A==
X-CSE-MsgGUID: zHTCZuw2SR6j4VFc8OGiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254024272"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:33:43 -0700
Date: Thu, 9 Jul 2026 10:33:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Message-ID: <ak9O1eHHS60r15nU@ashevche-desk.local>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <20260709023048.599150-17-panchuang@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709023048.599150-17-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 16/18] thermal/drivers/st: Remove
	redundant dev_err()
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:panchuang@vivo.com,m:rafael@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:lukasz.luba@arm.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,gmail.com,intel.com,st-md-mailman.stormreply.com,arm.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,linux.intel.com:from_mime,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 159D272DC21

On Thu, Jul 09, 2026 at 10:30:19AM +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() calls that previously printed generic messages.

Correct.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
