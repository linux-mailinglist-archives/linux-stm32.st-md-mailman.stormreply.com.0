Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5C6BDD47
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 01:01:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B05DC69067;
	Fri, 17 Mar 2023 00:01:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80BE3C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 00:01:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8FEEDCE1D32;
 Fri, 17 Mar 2023 00:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D02DC433EF;
 Fri, 17 Mar 2023 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679011288;
 bh=hTYgEnMkyE64wnXsk3avUA5GCBJ8kbqVBwnmO0El23w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mypInJB7USBxQTN7HvThfy/CAw1zfzkM+ju9mTokOdz/uj0tuVPYUCuC+Y5HM3AWi
 Ar+wZyMFzHVje5vIzYY79u0DpGUqhKOkETv6ZGZb80uT+dGLD3wZcvf9B/rOMjIUrG
 HbAwQWFw2Yh4V3bu/vDt7XAgb3kJZzUtpNGrheUjeCco69BP9N/QRSFXeDSV6P0Xmd
 EHlmapHbhpWZbGBo7HJdrRbP3HIIGeJBJUI8HFU61wrTzwQsERKXGSs1XMXza4ULqH
 lzv8gDeATgqg9E0sHBOOOZ3fQtNSdnpY7ZRUrxWjzFb2hKmMEdwQDBAXJJ3iRCCIdZ
 SJY7Sq6DgwSWQ==
Date: Thu, 16 Mar 2023 17:01:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>
Message-ID: <20230316170127.5bbd559d@kernel.org>
In-Reply-To: <20230314070208.3703963-3-michael.wei.hong.sit@intel.com>
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
X-Topics: 
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: move fixed-link
 support fixup code
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

On Tue, 14 Mar 2023 15:02:08 +0800 Michael Sit Wei Hong wrote:
> xpcs_an_inband value is updated in the speed_mode_2500 function
> which turns on the xpcs_an_inband mode.
> 
> Moving the fixed-link fixup code to right before phylink setup to
> ensure no more fixup will affect the fixed-link mode configurations.
> 
> Fixes: 72edaf39fc65 ("stmmac: intel: add phy-mode and fixed-link ACPI _DSD setting support")
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

Ong Boon, since you added the code which gets moved - could we get 
an ack/review tag from you? Helps increase the confidence in the change.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
