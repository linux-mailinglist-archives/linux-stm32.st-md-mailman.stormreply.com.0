Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345EB7B5C4C
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 22:56:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D96ADC6B474;
	Mon,  2 Oct 2023 20:56:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B8E2C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 20:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B277CE1276;
 Mon,  2 Oct 2023 20:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B0C433C8;
 Mon,  2 Oct 2023 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696280157;
 bh=3SUjHS1R/+k33+41I8df1OAaO4gb+JCavb+GatMXfr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ts6e8OPAXbwJSqbHZh7OB/J5bL/OHFILZtb1yBVm7HXPB1PZk/XGQ7AuIW4n29dj+
 ecoBTO+7hrPW8Q6xuPPASkVTEUpIET4SQ0Jsvd2gVlk1zyw1YTaRy14t4smDjHCbYx
 Ip/BJuo0W6EjA2rvCbaan0iEIW+cj78pq0AqAEptDJPl392/1LNQKv84du3Y6mEcD5
 kLx5VdsMxdIHgNASSD2ZmOJqOflab/gjsH9hwidf2wGhMgu6x7m8pUtG4MO1ahLvP5
 y4L8a3M2ByHooguBVfjxXHjB0K4VvDBx4MXBRBHPNchRHELaiLL3HcPvunO0YVRUT/
 sMrIc2mpMLNtQ==
Date: Mon, 2 Oct 2023 13:55:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20231002135551.020f180c@kernel.org>
In-Reply-To: <xwcwjtyy5yx6pruoa3vmssnjzkbeahmfyym4e5lrq2efcwwiym@2upf4ko4mah5>
References: <20230923031031.21434-1-rohan.g.thomas@intel.com>
 <xwcwjtyy5yx6pruoa3vmssnjzkbeahmfyym4e5lrq2efcwwiym@2upf4ko4mah5>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: EST
 interrupts handling
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

On Tue, 26 Sep 2023 14:25:56 +0300 Serge Semin wrote:
> On Sat, Sep 23, 2023 at 11:10:31AM +0800, Rohan G Thomas wrote:
> > Enabled the following EST related interrupts:
> >   1) Constant Gate Control Error (CGCE)
> >   2) Head-of-Line Blocking due to Scheduling (HLBS)
> >   3) Head-of-Line Blocking due to Frame Size (HLBF)
> >   4) Base Time Register error (BTRE)
> >   5) Switch to S/W owned list Complete (SWLC)
> > Also, add EST errors into the ethtool statistic.
> > 
> > The commit e49aa315cb01 ("net: stmmac: EST interrupts handling and
> > error reporting") and commit 9f298959191b ("net: stmmac: Add EST
> > errors into ethtool statistic") add EST interrupts handling and error
> > reporting support to DWMAC4 core. This patch enables the same support
> > for XGMAC.  
> 
> So, this is basically a copy of what was done for the DW QoS Eth
> IP-core (DW GMAC v4.x/v5.x). IMO it would be better to factor it out
> into a separate module together with the rest of the setup methods
> like it's done for TC or PTP. But since it implies some much more work
> I guess we can leave it as is for now...

I think we can push back a little harder. At the very least we should
get a clear explanation why this copy'n'paste is needed, i.e. what are
the major differences. No?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
