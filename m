Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF5xMPWq+Wky+wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 10:31:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB734C8AF9
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 10:31:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99B06C87ED0;
	Tue,  5 May 2026 08:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49B8BC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777969907; x=1809505907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hwDIJ7pMtHCCustNvs0AAaepY8/PftFzyLYey8zGy4c=;
 b=Abur1n2K7pL8BqFs2Ca8hvZqqu1GKFCrDCHGf1iad+/gnTFFIqWyhQc8
 ZMEM/e7CVRF2CKCHsp7RbkkqD6724q9h/v3cU75gp20cLGrLS1ah7w+lv
 7i6T22j/sv08HJyloQAtZsu6tFhU2BcsZ075dQamtZP1kLAplL59iMUdG
 8/dtyLP+Ez4YpGNRdhR162TRsimkTGgbRpR0ebqrHjDQf9FiQpI/ZFqes
 2nJBlk72fPwVS18IKmePSiX1Fc5V+rXAiJzsUWEYkr5ELP92aCcPxS5Hq
 xv0Siw1lQtbADROSoALkTbS2cub4QJlz9IMq7QhtkoRuNxmnni3giRjz3 w==;
X-CSE-ConnectionGUID: xpSLUq6hS8SIaQMZbBbrDQ==
X-CSE-MsgGUID: oG/BJ1YzQzOj8z35/MmH2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78933486"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78933486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:31:45 -0700
X-CSE-ConnectionGUID: tuc2W5dZQyOeHu5cjmszog==
X-CSE-MsgGUID: S21AuqnmTmuWUCuhw4jPkA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:31:41 -0700
Date: Tue, 5 May 2026 11:31:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <angelo@kernel-space.org>
Message-ID: <afmq6-AfomfKtX7c@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Steven King <sfking@fdwdc.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 08/10] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: 5BB734C8AF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angelo@kernel-space.org,m:andy@kernel.org,m:adureghello@baylibre.com,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.805];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]

On Mon, May 04, 2026 at 07:16:46PM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> +static struct resource dspi_dac0_resource[] = {
> +	[0] = {
> +		.start = MCFDAC_BASE0,
> +		.end   = MCFDAC_BASE0 + 0xFF,
> +		.flags = IORESOURCE_MEM,
> +	},
> +};

ioport.h has a lot of DEFINE_RES() macros. Please, choose the best fit in each
case and use them.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
