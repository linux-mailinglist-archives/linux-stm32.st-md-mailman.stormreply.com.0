Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A5E471107
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Dec 2021 03:55:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 199FBC5F1EB;
	Sat, 11 Dec 2021 02:55:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF01DC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 02:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3BEC0CE2E94;
 Sat, 11 Dec 2021 02:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B0FC00446;
 Sat, 11 Dec 2021 02:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639191318;
 bh=RY84ZI2kloyXVIY567DWStXfiiZPq0O0dF+oSlOguCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TdiT8ipkwcoqGEKluX2HgCMrOopAjmu6G8/vxg3TTrwj6VOP/Zz/2hPJCqumwFjUb
 vgyDqwZNxztJ8GlDFQGTDTN3xfW53R79RS0q9DdilTVzbLqBNkEO7PHpy616WxYfWX
 5agexy8rOxd+eU2tXjErKY8fRoH/vy9WyGHBNU7xvW8kFvlZDKuc3JTept0fB7d3OA
 MGRrOESTgI9NHfXAW0UmSw0iqSONPPoWsz52jthVhE4+YTJYxMLO3f1XXkZ04cbk3z
 /tUiQFPpZK4UdWrssXv4IQP28AyoDZieBloCmhdhfIGEZc/kA1OIcSU137olg1vwtl
 iomFQl2DcK+ug==
Date: Fri, 10 Dec 2021 18:55:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Nambiar, Amritha" <amritha.nambiar@intel.com>
Message-ID: <20211210185517.30d27cfd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <MWHPR11MB1293030F02EDACD0A7C25425F1719@MWHPR11MB1293.namprd11.prod.outlook.com>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
 <20211210115730.bcdh7jvwt24u5em3@skbuf>
 <20211210113821.522b7c00@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <MWHPR11MB1293030F02EDACD0A7C25425F1719@MWHPR11MB1293.namprd11.prod.outlook.com>
MIME-Version: 1.0
Cc: "linux-stm32@st-md-mailman.stormreply.com\"       <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," Alexandre Torgue <alexandre.torgue@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Sridhar@stm-ict-prod-mailman-01.stormreply.prv,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	<linux-arm-kernel@lists.infradead.org>, ,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Kanzenbach,  Kurt" <kurt.kanzenbach@linutronix.de>,
	"Ong,  Boon Leong" <boon.leong.ong@intel.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: add EthType Rx
	Frame steering
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

On Fri, 10 Dec 2021 23:57:50 +0000 Nambiar, Amritha wrote:
> ethtool did not support directing flows to a queue-group, but only a specific individual
> queue

Just to clarify - not sure how true that part is, ethtool rules can
direct to RSS contexts since March 2018, your presentation is from 2020.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
