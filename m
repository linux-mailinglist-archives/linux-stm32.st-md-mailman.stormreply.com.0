Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55A366F06
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 17:22:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A508CC58D5C;
	Wed, 21 Apr 2021 15:22:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30D3DCFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 15:22:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A64561456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619018548;
 bh=pvwwIu6oOHIsP+uwY3IwgDLl3PrH3VYKaxq41zQERIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mxrkJDWFajcdJkMkO/LHztz8ks3AjaLyO+kErwkzxuJe9/rvdT/arWXfl2ZM3628U
 HybiEqTzByh0teBcXDYccsY3Y1h7jbSKOrEjjBc9zzI+/3/ELHJIDqsXfqNPnLobK5
 oIlV2GjV5Jjwr73W2G2rqLLh0MlrpIUzf6k/N6SFQXO+FwNbYEcUXlBZE9cyho4iTY
 88CVE7gATKBwQNYeF59ankLolFwhgqiprQolhRNG5Wql6xPJhugizyRnKGqZ3lXtT8
 EQey4lhsEDkUW/YkbxG+s/vxaz34nkl4ibRVzA/r24v401kX4cJnU+jkw2kJ6KNthq
 JSkk+8bIO5M2w==
Received: by mail-wr1-f54.google.com with SMTP id p6so35100002wrn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 08:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM531NgsTl1Ly/xTWEb8Z5yzxgriFNzUrFb3hZlZB0RKySm5uBHYcJ
 hycP7CORCEctoj27C7viPFwuBA+Iit03+qWUh9s=
X-Google-Smtp-Source: ABdhPJzPbFIC/rM6E4UNiWQK3iEIDF5w3ubpT3CeNfAbpx0+eskNOiNKpuxyllSes8uq+p5xavAE44qb+Jqma+R21QY=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr28310682wrg.165.1619018547041; 
 Wed, 21 Apr 2021 08:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210421140653.3964725-1-arnd@kernel.org>
 <20210421150510.GA36785@sirena.org.uk>
In-Reply-To: <20210421150510.GA36785@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Apr 2021 17:22:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CWp_H-tm2QcZyH1FDXwzMgxY_9dc1Y8pA28MQKT-q=A@mail.gmail.com>
Message-ID: <CAK8P3a0CWp_H-tm2QcZyH1FDXwzMgxY_9dc1Y8pA28MQKT-q=A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: fix debug format string
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

On Wed, Apr 21, 2021 at 5:05 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Apr 21, 2021 at 04:06:48PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Printing size_t needs a special %zd format modifier to avoid a
> > warning like:
>
> This doesn't apply against current code, please check and resend.

It appears that you just applied 1b8a7d4282c0 ("spi: stm32-qspi:
Fix compilation warning in ARM64") after today's linux-next was
cut.

I suspect Patrice's patch now causes a warning on all architectures
on which size_t is defined as 'unsigned int'.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
