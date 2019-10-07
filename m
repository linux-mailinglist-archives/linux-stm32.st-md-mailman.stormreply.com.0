Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A2CE796
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 17:32:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FF87C36B0C;
	Mon,  7 Oct 2019 15:32:12 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86E06C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 15:32:11 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 803B2316;
 Mon,  7 Oct 2019 15:32:09 +0000 (UTC)
Date: Mon, 7 Oct 2019 09:32:08 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Gerald BAEZA <gerald.baeza@st.com>
Message-ID: <20191007093208.757554b0@lwn.net>
In-Reply-To: <8d097a0486e94257952600bf6d20975d@SFHDAG5NODE1.st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
 <20190827074825.64a28e88@lwn.net>
 <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
 <8d097a0486e94257952600bf6d20975d@SFHDAG5NODE1.st.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

On Thu, 3 Oct 2019 10:05:46 +0000
Gerald BAEZA <gerald.baeza@st.com> wrote:

> > > Adding the URL is a fine idea.  But you don't need the extra syntax to
> > > create a link if you're not going to actually make a link out of it.
> > > So I'd take the ".. _STM32MP157:" part out and life will be good.
> > >  
> > 
> > We also did it for older stm32 product. Idea was to not have the "full"
> > address but just a shortcut of the link when html file is read. It maybe makes
> > no sens ? (if yes we will have to update older stm32 overview :))  
> 
> Example in https://www.kernel.org/doc/html/latest/arm/stm32/stm32h743-overview.html
> 
> Do you agree to continue like this ?

If you actually use the reference then it's OK, I guess; in the posted
document that wasn't happening.  I still think it might be a bit more
straightforward to just put the URL; that will make the plain-text file a
little more readable.  In the end, though, it's up to you, go with
whichever you prefer.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
