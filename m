Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF673DBF35
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 21:47:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5CF8C57B6F;
	Fri, 30 Jul 2021 19:47:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58A62C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 19:47:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEE9960F26;
 Fri, 30 Jul 2021 19:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627674437;
 bh=3qD7KHz51ikHdJzZw6xNwaTXnr9esYUOrmU39Ter0So=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=H3aoXHqJ9ib3+RjLjQudivlC/ijcHZ3qsw9J8YxqpTiEDbIlHDqOpxsKfxnFnhRH5
 AZMNElFddQFoml7BxHYZ/oO3oYXuI0J5umY4o8Y+MaMDfTKBW2E1pczCqa7pF7IYiR
 GSd+OcYKDKjopHz/aWmkSKpXwBYsv4t6Y5Pxzpj5QFbt3UhKrSKZ1AHIRr6Z2C8Ti5
 X6SczuEHTfZkmhVq8Vp6T0BxJ5biO8MKil7O7Q6GcFzXF7EaAYkZo94zaB05XDs6ZN
 i5U+9VgjObOsk2KDjx6u+xwxJzIVPweBYRQqDjAW4TuVekbOOv3bUdq3yQNr2pzecp
 I4b65s86POILw==
MIME-Version: 1.0
In-Reply-To: <1926284813.753014.1627553002984@mail1.libero.it>
References: <20210725160725.10788-1-dariobin@libero.it>
 <CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com>
 <1926284813.753014.1627553002984@mail1.libero.it>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dariobin@libero.it>, Dillon Hua <dillonhua@gmail.com>
Date: Fri, 30 Jul 2021 12:47:16 -0700
Message-ID: <162767443658.714452.1239845779696330360@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v4] clk: stm32f4: fix post divisor
	setup for I2S/SAI PLLs
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

Quoting Dario Binacchi (2021-07-29 03:03:22)
> Hi Dillon,
> 
> > Il 28/07/2021 12:03 Dillon Hua <dillonhua@gmail.com> ha scritto:
> > 
> >  
> > Hi Dario,
> > 
> > I have a similar patch [1] submitted last year.
> > Unfortunately, it did not get accepted by the maintainer.
> > 
> > Just a reminder here for you, should remove
> > 
> > { STM32F4_RCC_APB2ENR, 26, "ltdc", "apb2_div" },
> 
> Thank you for your suggestion.
> While testing the patch on the stm32f469-disco board I didn't
> notice the white screen issue. I'll try to run the tests again. 
> I will let you know.
> 

Ok, I'll drop this from the tree.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
