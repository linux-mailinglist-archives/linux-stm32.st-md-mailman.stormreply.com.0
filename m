Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKZqIzHNBmrynwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 09:37:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BA54AAC5
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 09:37:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5FAEC8F271;
	Fri, 15 May 2026 07:37:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B0CDC87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778830636; x=1810366636;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=vNeDJZqrvT2j2rRlp/BEtuA+HNSXejvJ2vRYm+fgkOU=;
 b=NGnGBmP6QNFpf4Q2/1tqjCiQS26fdmJfMJLkkZ8MMVAxasFLJCPy3S3x
 1WcQryIe/9jCy7rOkN7rMCLcwLSZxugl1i78lQ+MeTojJDJDMXOsA0CKo
 XHqoxBhB9IVS26WK3SuvmZArFSHQ/Rq/HF482yw2fGh0AXKAdKO80TLeT
 atXwgDgZMLSZ2bisdlnFp1Ml1R1wfFgMOFKJHa0p9ThglZVkmbc/Sx6Lt
 yrLY0ae8uoe8ErIDSMrG0yACyUBNr41FunmsmkfdhP3cKYUpFUlsdsfpp
 GkP7ZW8GgMZlVp6fhcEvdLdrBPdKN6G67K3zlwmxQnpBjqS8v3WtWCpfF Q==;
X-CSE-ConnectionGUID: 82wlWgp0QN6088G+6Mmmfg==
X-CSE-MsgGUID: 3aQ/k+sRRS+qSjqh9oULzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97212638"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97212638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:37:13 -0700
X-CSE-ConnectionGUID: nFREjJbdTEKf9kDYhKUDQQ==
X-CSE-MsgGUID: ZIy/Yzj7Ta+BOv/Jd0QFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="268965588"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:37:10 -0700
Date: Fri, 15 May 2026 10:37:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Message-ID: <agbNIye6ZfERYeHD@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
 <agTcEECgJvBydhe2@ashevche-desk.local>
 <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Subject: Re: [Linux-stm32] [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC
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
X-Rspamd-Queue-Id: 424BA54AAC5
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
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com,uclinux.org,lists.linux-m68k.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:gerg@uclinux.org,m:linux-m68k@lists.linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-iio@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,ashevche-desk.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:15:09AM +0200, Angelo Dureghello wrote:
> On 13.05.2026 23:16, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:

...

> > Same for the rest. But I haven't seen the followups and don't know if those
> > structures are going to be expanded. The commit message doesn't say anything
> > about that. So I assume my suggestion valid.
> 
> no. They are not going to be expanded, anyway, is there a real gain
> using an hardcoded 1 there ?

The 1 is a side-effect the whole point is to avoid array of 1 element.

> Would not reissue a v3 for this honestly.

Seems you will need to have a v3 based on other comments. Indeed, for its own
it's not needed to reissue a new version.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
