Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rXNqEkPKVGp7TgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:21:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3D74A4C5
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=Lj2kwDTD;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58254C8F275;
	Mon, 13 Jul 2026 11:21:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51DB6C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783941697; x=1815477697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qjNurRQVSwJBiieOW9ThoUFB9rqOdoEiG35XLbhQwBc=;
 b=Lj2kwDTD1DSvIdonGO5OCt93nUtDibfaatcwOJEym0fG4r+9rzFnI1gg
 6roiuoqZckcE5Si4zbonp2GT/nSv94QhQd+0ifbKp1sPt1SXj/M/95mnv
 n/LIyxqmYwHTij7pFp1t+CvTyFTRl8R0ztc1CsuwpUE06wXnLyAE1ATch
 Ve13NtG8b+rKtShcqwcAsilAkCcBUmunsVoF3Mc9v91jRnTlaKxL8DLNC
 udQOIZ/iZQqp1CI10CfeGs3So/O9fFk6C+q3SqesXM/NLJU4gYhPrdEv1
 M3lsyvx+jFJZrozcvkU2fF+3ESGsITR/Tqa7ArAj0UyadUU6nvb7EAaEh g==;
X-CSE-ConnectionGUID: LPwP7iikQ9im7UN2tOiYhw==
X-CSE-MsgGUID: cICZCIyNSSeTn23geJD2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88372075"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88372075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:21:35 -0700
X-CSE-ConnectionGUID: FC1GeEyzSPKWMBYtZ/N88w==
X-CSE-MsgGUID: 3GNUYWrFTM6f6PsT20OzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253788205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.88])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:21:26 -0700
Date: Mon, 13 Jul 2026 14:21:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Message-ID: <alTKNEk97jkVGfML@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
 <20260710043746.GM30058@atomide.com>
 <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tony Lindgren <tony@atomide.com>, bjorn.andersson@oss.qualcomm.com,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 aniket.randive@oss.qualcomm.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
 uart_ops.pm callback
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:tony.lindgren@linux.intel.com,m:alexandre.belloni@bootlin.com,m:tony@atomide.com,m:bjorn.andersson@oss.qualcomm.com,m:claudiu.beznea@tuxon.dev,m:mukesh.savaliya@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:alim.akhtar@samsung.com,m:jacmet@sunsite.dk,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:aaro.koskinen@iki.fi,m:zhang.lyra@gmail.com,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:praveen.talari@oss.qualcomm.com,m:linux-serial@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:linux-omap@vger.kernel.org,m:michal.simek@amd.com,m:richard.genoud@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,
 m:konrad.dybcio@oss.qualcomm.com,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:zhanglyra@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,atomide.com,oss.qualcomm.com,tuxon.dev,samsung.com,sunsite.dk,kernel.org,st-md-mailman.stormreply.com,vger.kernel.org,iki.fi,gmail.com,armlinux.org.uk,linaro.org,lists.infradead.org,linux.alibaba.com,linux.intel.com,amd.com,collabora.com,alpha.franken.de,linuxfoundation.org,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ashevche-desk.local:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9A3D74A4C5

On Mon, Jul 13, 2026 at 12:29:20PM +0300, Tony Lindgren wrote:
> On Fri, Jul 10, 2026 at 07:37:46AM +0300, Tony Lindgren wrote:
> > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> > > Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> > > with that and we still have them IIRC. Tony, do you know what is the state of
> > > affairs with runtime PM for UART?
> > 
> > The RX side of things should work for hardware that can wake up to an incoming
> > event. Linux for sure needs more work to properly handle the various corner case
> > TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
> > will check my notes for more details next week.
> 
> For the TX side handling, my understanding is that at least uart_update_mctrl()
> needs to call PM runtime resume and put autosuspend. And we should assume
> uart_update_mctrl() can sleep to resume the PM runtime suspended serial port.
> 
> For drivers, the callers of uport->ops->get/set_mctrl() should be updated
> to use uart_update_mctrl() where possible. And the remaining ones that cannot
> sleep should be fixed so they can sleep or have PM runtime disabled.
> 
> Anybody have better ideas?

I don't, but the above sounds like a plan. Is it a big task? I can help with
something in that area, perhaps Ilpo also would be able to participate.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
