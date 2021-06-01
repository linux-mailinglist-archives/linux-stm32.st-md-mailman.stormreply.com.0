Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5835C397CC3
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 00:53:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C32EC57B74;
	Tue,  1 Jun 2021 22:53:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F1BC57B6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 22:53:40 +0000 (UTC)
IronPort-SDR: HnpHWW3OFj7n6TfSxwjGInNn+VQxHGTqKRvQRysfUzSXjWnLDXkkAKVUxfGo8NzYKHz/Nm3dwo
 25gY88r9QbHw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="190769232"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="190769232"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 15:53:38 -0700
IronPort-SDR: FvEmDQWzTVhQd/WWqFcCGAW6HmJXwMVVR8bLQvrSXfd4I0F6d/lz+Xf7/vbINV9W9Pm13zt9CE
 lb58nMB2c3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="399766174"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 01 Jun 2021 15:53:38 -0700
Received: from linux.intel.com (unknown [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BAB63580427;
 Tue,  1 Jun 2021 15:53:35 -0700 (PDT)
Date: Wed, 2 Jun 2021 06:53:32 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210601225332.GA28151@linux.intel.com>
References: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
 <YLawrTO4pkgc6tnb@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLawrTO4pkgc6tnb@lunn.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable platform
 specific safety features
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

On Wed, Jun 02, 2021 at 12:11:57AM +0200, Andrew Lunn wrote:
> On Tue, Jun 01, 2021 at 09:52:35PM +0800, Wong Vee Khee wrote:
> > On Intel platforms, not all safety features are enabled on the hardware.
> 
> Is it possible to read a register is determine what safety features
> have been synthesised?
>

No. The value of these registers after reset are 0x0. We need to set it
manually.

VK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
