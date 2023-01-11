Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A714665278
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jan 2023 04:45:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11DF5C6904A;
	Wed, 11 Jan 2023 03:45:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EBC0C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 03:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673408734; x=1704944734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BUvk+JooDXJ4fqkO3tc2bcOgUJc5ZVpvc/wqa5I1FIg=;
 b=kbBA9SRmtLOVhHQWNur08F5xSFyhaZ2x3QT1zuDwytQBvQMge+XAollW
 Ze3qAhTMWOxEPXsrgsV3jE4/EzMI8OfoWcGvvctYjLYscBR63WomWJvh3
 6qUblfK3z20o+QcR1U9i4a/X48hekBP1UN2SrUY7qF9/2gLXitYI/7N06
 HXdCS8pLx1YRvPfKTZ6tl7RZZ0TJZn6vOZDwbum3fdOIsfjWOENF0p2CR
 kmwls5lN5CXnqR/tdLUEpwWTYltZQVjkitBRiG5aDCnC+vX+VZEuxrd6q
 xbUDC2DBwmhuCEI/6dYqS+3qOYf5xepTjQKoEYUIhn2NA9BN1L8C6UraH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321012461"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="321012461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 19:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689642271"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="689642271"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2023 19:45:31 -0800
Received: from linux.intel.com (noorazur1-iLBPG12.png.intel.com [10.88.229.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8EBFA5807C8;
 Tue, 10 Jan 2023 19:45:27 -0800 (PST)
Date: Wed, 11 Jan 2023 11:32:03 +0800
From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20230111033202.GA893@linux.intel.com>
References: <20230109151546.26247-1-noor.azura.ahmad.tarmizi@intel.com>
 <b87cdb13baab2a02be2fb3ffc54c581d097cbe7d.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b87cdb13baab2a02be2fb3ffc54c581d097cbe7d.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Looi Hong Aun <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add aux timestamps
 fifo clearance wait
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

On Tue, Jan 10, 2023 at 11:27:47AM +0100, Paolo Abeni wrote:
> On Mon, 2023-01-09 at 23:15 +0800, Noor Azura Ahmad Tarmizi wrote:
> > Add timeout polling wait for auxiliary timestamps snapshot FIFO clear bit
> > (ATSFC) to clear. This is to ensure no residue fifo value is being read
> > erroneously.
> > 
> > Cc: <stable@vger.kernel.org> # 5.10.x
> > Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> 
> Please post a new revision of this patch including a suitable 'Fixes'
> tag, thanks!
> 
> Paolo
>

Ok Paolo, sorry i missed that out. Will send out v2 ASAP.
Thanks!

Azura
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
