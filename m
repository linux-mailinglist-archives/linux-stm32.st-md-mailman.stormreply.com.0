Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E314C69720
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 13:42:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF009C628CF;
	Tue, 18 Nov 2025 12:42:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49238C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763469752; x=1795005752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=omW4v+Tc3Le2QAQshFJbpuP+L60KdBKt3nR18RcALXs=;
 b=Roo3jEIoBV0SJ/mZM+TKCiWvS+RjLzhIT6l5dtE252589Ng4NGmFpP3S
 PXLqghfKbodR9WY16L5ZHiIz3ZWOtQzgr6ScJfbTjsjVA9iRji65a52qJ
 NW9NzEAJynd4GvuABxlVhIKOs3aG/toSuY44yy5RxOz9ewXMJIUt0265p
 iMlDAFLq/nLPf9xyKUqIRkLuBS7MPmR0Lc8nnGqtPE1oF1jOM5MtDHiER
 F84e8cOa8FJEhGTC1IQ46q9HknlAMA8McSt/CFdyLBnSiYTIns74ILlnk
 /JiCW5YnqMRsN06Gakph82HTroAK99H+WYZwnOo8EkT7yxH9u09cSsNhk Q==;
X-CSE-ConnectionGUID: a7LjBDYzQzqYRtsLaJUR/Q==
X-CSE-MsgGUID: EbrE2vP0RmijMNi7fyLE4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65369812"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65369812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:42:29 -0800
X-CSE-ConnectionGUID: O+PKAPd1TESN5U62SXzP0A==
X-CSE-MsgGUID: EmcXUBzwSMyUDkqlVl+y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221655749"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2025 04:42:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 78E0098; Tue, 18 Nov 2025 13:42:25 +0100 (CET)
Date: Tue, 18 Nov 2025 13:42:25 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Message-ID: <aRxpsc02hGW1w_hu@black.igk.intel.com>
References: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
 <20251117204348.GA2522408@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117204348.GA2522408@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] PCI: stm32: Don't use "proxy"
	headers
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Nov 17, 2025 at 02:43:48PM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 14, 2025 at 07:52:01PM +0100, Andy Shevchenko wrote:
> > Update header inclusions to follow IWYU (Include What You Use)
> > principle.
> > =

> > In particular, replace of_gpio.h, which is subject to remove by the GPI=
OLIB
> > subsystem, with the respective headers that are being used by the drive=
r.
> =

> Thanks, Andy!  It looks like a lot of work to figure this out by hand.

True.

> Is there a tool to figure this out?  Maybe something I could run when
> reviewing patches?

I have a d=E9j=E0 vu answering this question. Was it you last time who asked
the same?

The tool is iwyu which is heavily tuned for the kernel use by Jonathan (Cc'=
ed).
But I do it manually.

> IWYU seems like a nice principle but I couldn't find any mention in
> Documentation/.  Should it be covered there somehow?

Perhaps. Maybe we can start with IIO, where it's a highly recommended thing
for the new code submissions.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
