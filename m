Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9137B8510
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 18:26:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17AF2C6C831;
	Wed,  4 Oct 2023 16:26:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC46C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 16:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E0986158A;
 Wed,  4 Oct 2023 16:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BA5C433C9;
 Wed,  4 Oct 2023 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696436775;
 bh=qcglxAxRgYQIz8E0bCy+wEqQLr5U4t9luHiOQaUV2Fo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jxa2ZLLsxGRvLwcvTQldZ96adZlICmJQJRLEB/ssJiEoxmM9MPQTVgiIQ3XkDC7fM
 bdogyPB07dsycbtlyP2aSNKv6SPPCpDh9joLzDX0roO/N1X+uFhAFmbVoW6mpAf3qx
 lVNe3tqlHYazhWBRPb641wMYKdzKEOgrLArUd7/fPhLs6VplRj54mSUps/tOf9KoXO
 0b2qnNSzPrqwl+tLXEuyhDgPH94MxcRn0W/pk/BLl985bNouApvERtFuaSgnqGOriS
 OuwBw5rcjYuoZ5+6Z2EkEHNSeIC3GKPDFMGFknU4z0Fx/sv5cNZHBttoIDdgrKtKlE
 CYTTNiuLLXwNw==
Date: Wed, 4 Oct 2023 09:26:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20231004092613.07cb393f@kernel.org>
In-Reply-To: <vwdy5d3xirgioeac3mo7ditkfxevwmwmweput3xziq6tafa3zl@vtxddkiv2tux>
References: <20230923031031.21434-1-rohan.g.thomas@intel.com>
 <xwcwjtyy5yx6pruoa3vmssnjzkbeahmfyym4e5lrq2efcwwiym@2upf4ko4mah5>
 <20231002135551.020f180c@kernel.org>
 <vwdy5d3xirgioeac3mo7ditkfxevwmwmweput3xziq6tafa3zl@vtxddkiv2tux>
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

On Tue, 3 Oct 2023 14:12:15 +0300 Serge Semin wrote:
> If I didn't miss some details after that we'll have a common EST
> module utilized for both DW QoS Eth and DW XGMAC IP-cores.

So the question now is whether we want Rohan to do this conversion
_first_, in DW QoS 5, and then add xgmac part. Or the patch should
go in as is and you'll follow up with the conversion?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
