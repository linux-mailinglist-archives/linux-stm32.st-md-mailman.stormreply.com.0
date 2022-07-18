Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E8578A65
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 21:13:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B42AAC0D2B9;
	Mon, 18 Jul 2022 19:13:26 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DDE4C04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658171605; x=1689707605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jfpGMUuM81j/VW9iWBnOI0YIldx7GwCl3+DCAYabqc4=;
 b=DYIz6190igDMgcCqKAE88usF2lyOQ7oiqCj8M4h2yF+HMt9MoeZ4WFSC
 0yBjZ+4BzV/PPSobYgNXoo5q6+srQ1+9NiirAlbVuifEXwP1oXcsGLkgx
 ctV9nOB6SqLlP83AeLgmmWPI8k0ERBHprGVbvsixovPpyYvTtym9y3h1C
 sZZvCXc4O6evDkDxOsn+dNZ0/HXNA3r2TQ0sMzD2ox4v68kMjoFUh+/QH
 Ub2+dtAof9jwpACLsRyn/GL/jycp4ubCfZlpHPOMclH7H16FelhhflKUU
 Tm9TCMx27B0tBCVkiV15vWkbfl71fayrOHq2LXM85ALR1+PmnRiXemEMt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350262052"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="350262052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 12:13:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="630037408"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 12:13:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oDWBB-001OPS-1s; Mon, 18 Jul 2022 22:13:17 +0300
Date: Mon, 18 Jul 2022 22:13:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <YtWwzW/Cou3/aia1@smile.fi.intel.com>
References: <20220715205203.82591-1-andriy.shevchenko@linux.intel.com>
 <87sfn14cns.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sfn14cns.wl-maz@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] irqchip/stm32-exti: Use
	INVALID_HWIRQ definition
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

On Sat, Jul 16, 2022 at 10:41:59AM +0100, Marc Zyngier wrote:
> On Fri, 15 Jul 2022 21:52:03 +0100,
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > Use specific definition for invalid IRQ. It makes the
> > code uniform in respect to the constant used for that.
> > No functional change intended.

...

> > -#define EXTI_INVALID_IRQ       U8_MAX
> > +#define EXTI_INVALID_IRQ       ((u8)INVALID_HWIRQ)
> 
> This looks like a terrible idea. It gives the impression that you can
> now rely on comparing the internal data structure field to
> INVALID_HWIRQ. Which is of course bound to fail.

I don't know how one can go to that conclusion, but okay, I understood you.

> To be honest, I'd rather *kill* INVALID_HWIRQ, because apart from
> cherryview, nobody even *checks* for this value by that name. So much
> for the "code uniformity"...

It's used by two or three, I don't remember by heart.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
