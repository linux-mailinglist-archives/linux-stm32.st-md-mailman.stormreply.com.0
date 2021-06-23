Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0CC3B10E5
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 02:05:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFE56C597AE;
	Wed, 23 Jun 2021 00:05:32 +0000 (UTC)
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [94.100.177.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89E30C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail3; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=mU2Ayn5gYoFPGauTijC+NFA1H+bS1gD6zZD3uhMdnq0=; 
 t=1624406731;x=1625012131; 
 b=W6hXN6qzJpFIz+kTRD6iKYVspjRSINoHx3c7MQ5huVyREm1iEnTMixuO8MtHQpCtfbYyGcDQRGRmVkd5DWeXj9xaIh81htpMjgKDiYaQDAU4301WqfOz5qXWRymyDSrO5WO+4fGtp0ZGaUgGJ/mhMeAZrewaTWCEukePIbhB0Xo=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from
 <cerg2010cerg2010@mail.ru>)
 id 1lvqOX-00056K-GL; Wed, 23 Jun 2021 03:05:30 +0300
Date: Wed, 23 Jun 2021 03:05:19 +0300
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <YNJ6v7DfXUFMO8YA@minibook.localdomain>
References: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
 <YNAj30vl2yGxRX4e@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNAj30vl2yGxRX4e@google.com>
Authentication-Results: smtp47.i.mail.ru;
 auth=pass smtp.auth=cerg2010cerg2010@mail.ru
 smtp.mailfrom=cerg2010cerg2010@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD954DFF1DC42D673FB0C620705B15DE32DFE392EA95FA71EAB182A05F5380850409D49A42B3DAEFD1A747001B17FDD96B4733F37DE7D0E7804F51113CE28EC3845
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76574C3D62D66A535EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8598EEFA7D2C0B3AF39201CB3FE49DD556F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7C26CFBAC0749D213D2E47CDBA5A96583C09775C1D3CA48CFA12191B5F2BB8629117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7D9442B0B5983000E8941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD2697680F9384605B9038DDEAFF2085696F27B076A6E789B0E97A8DF7F3B2552694A1E7802607F20496D49FD398EE364050F652FD71AFB96DC7DC8623B8F170C382FB3661434B16C20AC78D18283394535A9E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BD7F3427536E911FA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A2368A440D3B0F6089093C9A16E5BC824A2A04A2ABAA09D25379311020FFC8D4ADA1D348123C1DF65DCE436DEC22D88E07
X-C1DE0DAB: 0D63561A33F958A537E89769116E7D7A9891AC65CEF55E09E241BE8572CD6504D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75C4D20244F7083972410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341E2D05735FCBECD1B739B158BCC54AE74274D818876CDA4ACB0D75FB0E0BC791288F50ABA9C210BD1D7E09C32AA3244C5F30E075F0AF1E1ED204972B6BA2444D24AF4FAF06DA24FDDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojXL4lMZLpcSTBWKEz5bkzNA==
X-Mailru-Sender: 4121B63E61E70785D3806BAA2BD19524DEF24F9614A5AA65747001B17FDD96B4825871508D9F3970CAD91EC71FC00F3837D2A27E1A8065646C7A2150F6097340301919DCEDD5454186FA049C4F996C4B5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmpe-keypad - add STMPE1801
	support
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

Hello Dmitry,

On Sun, Jun 20, 2021 at 10:30:07PM -0700, Dmitry Torokhov wrote:
> Do we really need to do this swap vs. simply arranging the keymap
> differently for 1801?

Yes I thought about it, but that will break device tree writer's
assumptions of the device so I think it's better to keep the keymap
correct and not make driver's behavior confusing.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
