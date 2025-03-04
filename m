Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78365A4DE9F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 14:05:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21362C7803D;
	Tue,  4 Mar 2025 13:05:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A843EC7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741093538; x=1772629538;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=kId64MTN2SwW88P18+0OurZ0XEpuA7JeJv0/MwjsJj4=;
 b=JknpjyFC2M4rzJkkYClUpvq/aSXxZvrJqIHUgboCSfQl42CJSDlTF02P
 ENFDhRjg9hfQDWz1OnnRoFtaGEVhF6xGXG/z7dyitEhqyhSUupVk13KwN
 O6/YHGVkkGTB7agt11gD0QdPgIVJAYK3ChP6GaTtenDiOBOI9aKDKxhPZ
 PCaOMY7lImhcAKBZf5rei90daDFT2DqAJ51JZUwSL7fvU8XhsPQw0S9YS
 6j8NVCtWkh8+3LDdlqHuB+f2JFWgbb495jgB4GMMTPNUD09Mooj8o+FgW
 3URm19Zer3nxGoPqSs7UNkEUOj4rwxR12D9mxopq3bo4QieMzXhh2kIwZ g==;
X-CSE-ConnectionGUID: oR2/151WQt6Bfhb0BrKXIA==
X-CSE-MsgGUID: oLH7m4JeTL6kY/Q5GP2Abw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41187700"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="41187700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 05:05:35 -0800
X-CSE-ConnectionGUID: bmwojJy2R9y2fe7aUkBKJw==
X-CSE-MsgGUID: LIenP46HT/eSa0i+DPjIHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123563998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.220])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 05:05:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 15:05:24 +0200 (EET)
To: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
Message-ID: <d8e04cf2-afb9-dead-f7c2-297c66969081@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
 <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-97556846-1741093524=:931"
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Borislav Petkov <bp@alien8.de>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/6] arch: x86: add IPC
 mailbox accessor function and add SoC register access
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-97556846-1741093524=:931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 4 Mar 2025, Paolo Abeni wrote:

> On 2/27/25 1:15 PM, Choong Yong Liang wrote:
> > From: "David E. Box" <david.e.box@linux.intel.com>
> >=20
> > - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> > - Enables the host to access specific SoC registers through the PMC
> > firmware using IPC commands. This access method is necessary for
> > registers that are not available through direct Memory-Mapped I/O (MMIO=
),
> > which is used for other accessible parts of the PMC.
> >=20
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > Signed-off-by: Chao Qin <chao.qin@intel.com>
> > Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>=20
> Hans, Ilpo, are you ok with this patch going through the netdev/net-next
> tree?

Yes, it you can merge it through netdev trees.

The function added into the header is a bit large on footprint front but=20
there are not that many callers so I guess it's okay.

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-97556846-1741093524=:931
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323328-97556846-1741093524=:931--
