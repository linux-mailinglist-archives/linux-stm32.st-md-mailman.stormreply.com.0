Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72288B62D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 01:36:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E6CC6B45B;
	Tue, 26 Mar 2024 00:36:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF094C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 00:36:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7113611D1;
 Tue, 26 Mar 2024 00:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84803C433C7;
 Tue, 26 Mar 2024 00:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711413405;
 bh=r6ja1S3WkmxWys+sE3KabUy5bKAQKHZGyKXel35g+zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RFOy9SckrUmOjcVY80p+Bpxbe+5dpDJq+JeaQvIywXepTed1YRXnEepoqUkHhDLDv
 KZQ8orGHJmcfhxU4yqXzvKwkkh03GuDsm5VknrzWZxwAeC8moegodFxeAFmHcguP3V
 MvMXRlBgmBX55pjBPgOUTWQbK7zrjPHUR7Ivk7miBmPv+gpyP5Ja8S02vD6UZnj61n
 CqfQ4NXy/CKPT7KniveufUJdSfosIbl7mM5+gISfC65C9eTYs21OyRMfhMeYTy9MAj
 ov2d24lOwn4Oj/ZJVUPrXNuEHsLe2pES4uVY1T8XSrKZegQunB7Zn3qmkn816MOaQo
 yZPbuVAYSRHAg==
Date: Tue, 26 Mar 2024 01:36:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, virtualization@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 00/64] i2c: reword i2c_algorithm according
 to newest specification
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

Hi Wolfram,

> > @Andi: are you okay with this approach? It means you'd need to merge
> > -rc2 into your for-next branch. Or rebase if all fails.
> 
> I think it's a good plan, I'll try to support you with it.

Do you feel more comfortable if I take the patches as soon as
they are reviewd?

So far I have tagged patch 1-4 and I can already merge 2,3,4 as
long as you merge patch 1.

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
