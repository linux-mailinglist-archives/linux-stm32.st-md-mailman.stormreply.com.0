Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE87B9E5D
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 16:05:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB2DC6C835;
	Thu,  5 Oct 2023 14:05:44 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18EF0C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 14:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 516BFCE22D5;
 Thu,  5 Oct 2023 14:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FA9C433B7;
 Thu,  5 Oct 2023 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696514739;
 bh=uEs+c2evdAN1gGRELIzgOPEmlANziGZN9NaBywOLzVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q0UghGfvomUGJjKVgB7EPISuwTzykstgzqZoQQoyr1v4jQFCR2YiSIB2j4OvDki4Y
 DykfvZLOqqbKJsswerJN1NM8sWOTOKX7ppC9EVGJXh9kT745ExQgPZPu2v7NM48vYA
 bTDW5iMCXK/+i3lYYCA9KwS1U6hlunEHWLralA412S2zKG3KpYjoKgphJDRBmlUxnP
 ZwimK57Z2PrNOXkSErMA1MGAG80jh6aIHOfq64IsKTAPPjOPYOtat6/eCI3KHtYbr1
 oPXp5YVb0/1sZqrFlYetYso8MY+qeIX7enuC+TK2J94fUe8XMHBHpq8C4gWSb5owmI
 W90baIp4KOXAw==
Date: Thu, 5 Oct 2023 07:05:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20231005070538.0826bf9d@kernel.org>
In-Reply-To: <20231005121441.22916-1-rohan.g.thomas@intel.com>
References: <20231004092613.07cb393f@kernel.org>
 <20231005121441.22916-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, andriy.shevchenko@linux.intel.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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

On Thu,  5 Oct 2023 20:14:41 +0800 Rohan G Thomas wrote:
> > So the question now is whether we want Rohan to do this conversion _first_,
> > in DW QoS 5, and then add xgmac part. Or the patch should go in as is and
> > you'll follow up with the conversion?  
> 
> If agreed, this commit can go in. I can submit another patch with the
> refactoring suggested by Serge.

Did you miss the emphasis I put on the word "first" in my reply?
Cleanup first, nobody will be keeping track whether your fulfilled 
your promises or not :|
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
