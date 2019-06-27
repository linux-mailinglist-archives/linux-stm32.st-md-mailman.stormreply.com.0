Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAB58839
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 19:23:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDB97C0C1AB;
	Thu, 27 Jun 2019 17:23:00 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 328B6C0C1A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 17:23:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4E1E314DB875E;
 Thu, 27 Jun 2019 10:22:57 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:22:56 -0700 (PDT)
Message-Id: <20190627.102256.1839462093915893704.davem@davemloft.net>
To: maxime.ripard@bootlin.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 27 Jun 2019 10:22:57 -0700 (PDT)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, f.fainelli@gmail.com,
 andrew@lunn.ch, antoine.tenart@bootlin.com, netdev@vger.kernel.org,
 maxime.chevallier@bootlin.com, wens@csie.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, frowand.list@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH v4 00/13] net: Add generic and Allwinner
	YAML bindings
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

From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 27 Jun 2019 17:31:42 +0200

> This is an attempt at getting the main generic DT bindings for the ethernet
> (and related) devices, and convert some DT bindings for the Allwinner DTs
> to YAML as well.
> 
> This should provide some DT validation coverage.

I don't think this should go via my tree as it's all DT stuff.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
