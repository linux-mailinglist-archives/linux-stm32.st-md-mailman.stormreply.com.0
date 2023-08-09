Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F9776721
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 20:24:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB8F2C6B472;
	Wed,  9 Aug 2023 18:24:56 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B96BC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 18:24:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C83A5C0069;
 Wed,  9 Aug 2023 14:24:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 09 Aug 2023 14:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1691605494; x=1691691894; bh=hB
 sRqPsdDyKhBWx869nPPrv7yqHSzjT8V/8SgiQ7D3k=; b=gdrzpKYpBd0IjkR7x4
 FysFuHh2rJMWsseUxCHohxKjODlWUnUy+xSGCho/5LmbKi4n6yPrUuXk9TA/s4gQ
 FVTXeyNIW2n3qTCFSgw4UkN8eH4syZwM+hR0Hyx+EVcNTz03EDzK/p5Fho4LEpr5
 w4u1meLp47qXO8cxcVqcr6SKeEarteECB04il1mpjPznIeqbSuGkIgQ5S7/clObI
 NMSur8HXCgfIWB/0Iw5dGh+xlELcIWJgDapqwbzmmB3R0Uum3ixBLkjY8CcsgOMe
 xUBd8/4xc/3tlMPSvsSqMusOraUyqq/QeGW604fCmJNxGyB7KWe5NwNjsDOHv3bz
 FwWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1691605494; x=1691691894; bh=hBsRqPsdDyKhB
 Wx869nPPrv7yqHSzjT8V/8SgiQ7D3k=; b=ZhdSS16o6u/8hEv8wV/Czd+XPRMkM
 Y10HEEe//DcvI6L2A1DYxDMoC9ZiHd/Q2aOuKjRZSsJOtOE/e3FcJuhvGhOsYIMZ
 SnGplUCMJUMJgAoonBfyx+GneCPJdvLRnKbftGJdhbvzldCFdWpJQLE3j2qaLKC+
 09IIRynlbNeQVDzchyTg75hwfZL9QQX5Y5xBFqPDx8x62JCZKZhpQvFqJ/wWakml
 OPlIuKg1zRpOWynMeQnrD0eNbQ2lGdxXRD6xoVCx/T6XSQawgpNpCooZjYoj4g0s
 84lbCxQy28SVL8wM1ZLv65kvffLjNBKCWOGK+9pVfn/+X4ML6ceoZgOOA==
X-ME-Sender: <xms:9dnTZB9VcLzE1qw3rBnBe4nWPHtlPmurmPE_j9KjzFS-wQpSSnwyXQ>
 <xme:9dnTZFs02MrhEiQeG9f_2clS12zhYBPElcGJIWvriKT_AhJhw42KZUCjoa8OddTVL
 To9-zNex9nixVuZe40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeggdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
 hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:9dnTZPBkXML9WVuCCAUu77SYKQ-xH4M1Ux20ZvIbKyGwEXYcLLM7JQ>
 <xmx:9dnTZFcGKjbwZeO49TELBm2r3fJmunN3vQdamHaoFevvWindOLV5GQ>
 <xmx:9dnTZGOhDlgao8OgGmtjkgHfl_ICZFRk-QhMC-9y7C4sVppYozHOCQ>
 <xmx:9tnTZAu0xKXoOd6mU2anH1qjeSuQgUTaskkzHnsI34a_Jw2Kz0tLnQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A0CC3B6008D; Wed,  9 Aug 2023 14:24:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <106a93ae-90f1-45fb-ae0a-034eb2d6faea@app.fastmail.com>
In-Reply-To: <202308100045.WeVD1ttk-lkp@intel.com>
References: <20230801105932.3738430-1-arnd@kernel.org>
 <202308100045.WeVD1ttk-lkp@intel.com>
Date: Wed, 09 Aug 2023 20:24:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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

On Wed, Aug 9, 2023, at 18:36, kernel test robot wrote:
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202308100045.WeVD1ttk-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/rtc/rtc-stm32.c:903:12: warning: 'stm32_rtc_resume' defined but not used [-Wunused-function]
>      903 | static int stm32_rtc_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~
>>> drivers/rtc/rtc-stm32.c:893:12: warning: 'stm32_rtc_suspend' defined but not used [-Wunused-function]
>      893 | static int stm32_rtc_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~

This is the warning you get if my patch is applied but the
fb9a7e5360dc8 ("rtc: stm32: change PM callbacks to "_noirq()"")
commit is not. If that patch is applied, mine is needed to address
the other warning.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
