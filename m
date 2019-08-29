Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E580DA1F83
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2019 17:45:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D108CC35E01;
	Thu, 29 Aug 2019 15:45:02 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C55C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2019 15:45:01 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 272F02CF;
 Thu, 29 Aug 2019 15:44:59 +0000 (UTC)
Date: Thu, 29 Aug 2019 09:44:58 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190829094458.590884ba@lwn.net>
In-Reply-To: <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
 <20190827074825.64a28e88@lwn.net>
 <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Gerald BAEZA <gerald.baeza@st.com>,
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

On Tue, 27 Aug 2019 17:23:30 +0200
Alexandre Torgue <alexandre.torgue@st.com> wrote:

> >> +Datasheet and reference manual are publicly available on ST website:
> >> +.. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
> >> +  
> > 
> > Adding the URL is a fine idea.  But you don't need the extra syntax to
> > create a link if you're not going to actually make a link out of it.  So
> > I'd take the ".. _STM32MP157:" part out and life will be good.
> >   
> 
> We also did it for older stm32 product. Idea was to not have the "full" 
> address but just a shortcut of the link when html file is read. It maybe 
> makes no sens ? (if yes we will have to update older stm32 overview :))

Did you actually run it through Sphinx to see what you get?  If I
understand the effect you're after, you want something like this:

  The datasheet and reference manual are publicly available on
  STM32MP157_.

  .. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html

IOW you have to actually *use* the label you are setting up.  That's a fine
way to do it, I guess, though I'm not really convinced it's better than
just putting the URL in directly.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
