Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33517A058E8
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 11:58:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D61CFC78031;
	Wed,  8 Jan 2025 10:58:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9974BC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736333925; x=1767869925;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JAru+JCMinYwvPV/IOHYvgN8V7XoWvB4jQe0QBv0C0s=;
 b=EPsGtsbA6Xwm4vHjBS0zDPv5HO/vVTS2IyaAg9OIi5SRmStqei4kQHQQ
 T2MH47mU1aVWuSV6nYblDqadnPnz5UFogjPqfFXqCjA5I/hicFInBiHmT
 ZdtYhlhjMJy/LnbGAPteTSY/xWCA8o2J8FvsRPuFdjlKONfpnSCSTLdq+
 OWamGtg4qnGnE7umGYNq+1e10nk7tbCRF0RwnxESzOSN009Usq+PVIWMv
 o8g4oIlZnwyqemS5btjFrVLxl2B70zsHgi0oAx0/nQn3+QOepdJ+ugRyS
 mgXx5slWyxz8ulXu/Rydq2/aucY5p3iX9/JPrrXdJ3mFwVpKJTYFxLj+V g==;
X-CSE-ConnectionGUID: tP5iymlkQ16gr2dlgkbDYw==
X-CSE-MsgGUID: dQSEWOkQTQ25Dc/LJHBx4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47970587"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="47970587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:58:37 -0800
X-CSE-ConnectionGUID: nm4SBxDATruaz+8W47XtvA==
X-CSE-MsgGUID: Uj7pV1SWSdqWs7QCL2E5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="133900895"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73])
 ([10.247.39.73])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:58:33 -0800
Message-ID: <3ddc0625-15ea-4010-a830-21020569d685@linux.intel.com>
Date: Wed, 8 Jan 2025 18:58:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
 <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
 <Z35WKDhVGMvPIi7d@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z35WKDhVGMvPIi7d@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 02/18] net: stmmac: move
 tx_lpi_timer tracking to phylib
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 8/1/2025 6:40 pm, Russell King (Oracle) wrote:
> Hi,
> 
> On Wed, Jan 08, 2025 at 03:36:57PM +0800, Choong Yong Liang wrote:
>> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> Please let me know if this is for the entire series.
> 
> Thanks.
> 

Yes, the test is for the entire series.

The only issue that was discovered is that during the initial state, the 
"tx_lpi_timer" is not set correctly.
The "tx_lpi_timer" with a value of 0 causes the EEE to be unable to enter 
LPI mode.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
