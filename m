Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C305E361BB8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 10:51:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78B03C57B78;
	Fri, 16 Apr 2021 08:51:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B0FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 08:51:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B17B061107;
 Fri, 16 Apr 2021 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618563069;
 bh=G20fHV8vaPYOZuC6bTk72/oUnsXRu84bnbsf13JZmRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GnF3XUS3RhH9h9JHdtddbI5eZLxqQMnxkdnEvZx6UGHHsi8TJ81OQojgjmBIzQCEu
 1TQZmcXPt4V1rax7BxmPJVQDGB/9QtUQIxk8BhOgNfPs1SGCrIhTjnU9Oix9A7OWZO
 6Y06OecRcy1jyn3/DKFbxzbsxt6Cd/SijD1TCEFm2qkBplV+y1q+F6VGz7XXnF8gYE
 bbyMEk0Je6cYdc7z7G+jUZzIZgjFB4vqX8IoO2MAaRXOjSWJnQI7mm7rCF3yXdwknV
 Mg7zeIl0Ly6oVKzAP1FT3JNE7XBb7NXJCyCORqVds3wXizvG4IXpZtmHXbR9ORpTnF
 7Wc84BwRSOCTA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lXKBx-0001M3-Dk; Fri, 16 Apr 2021 10:51:09 +0200
Date: Fri, 16 Apr 2021 10:51:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <YHlP/SryZXr/nNLM@hovoldconsulting.com>
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
 <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
 <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
 <e17fddfb-f9b8-238f-da74-a4746f33134f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e17fddfb-f9b8-238f-da74-a4746f33134f@foss.st.com>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, jirislaby@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

[ Please avoid top-posting. ]

On Thu, Apr 15, 2021 at 07:09:14PM +0200, Erwan LE RAY wrote:
> Hi Dillon,
> 
> STM32MP151 is mono-core, but both STM32MP153 and STM32MP157 are 
> dual-core (see 
> https://www.st.com/content/st_com/en/products/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html).
> So your point is fully relevant, thanks.
> 
> ST already fixed the same issue in st-asc.c driver in the past (see 
> ef49ffd8), because a systematic deadlock was detected with RT kernel.

That's not the same issue. The above mentioned commit fixed an issue on
*RT* where local_irq_save() should be avoided.

> You proposed a first implementation in your patch, and a second one in 
> the discussion. It seems that your initial proposal (ie your V2 patch) 
> is the most standard one (implemented in 6 drivers). The second 
> implementation is implemented by only 1 company.
> 
> It looks that the solution is to avoid locking in the sysrq case and 
> trylock in the oops_in_progress case (see detailed analysis in 
> 677fe555cbfb1).
>
> So your initial patch looks to the right proposal, but it would be safer 
> if Greg could confirm it.

That would only fix the RT issue (and by making the sysrq one slightly
worse).

Using uart_unlock_and_check_sysrq() would address both issues.

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
