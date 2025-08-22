Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0730B3120E
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 10:44:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A816C3F95A;
	Fri, 22 Aug 2025 08:44:16 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D42BC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=YcyCpXC//LwKFU9yjAyJNXfcojjXsbo2azge4YgyYVc=;
 b=Mrr/ECZ13cJlTtArHixXMkiu25wJJaamvKcsqFEDchBndXLXXtYkoq3en9d4SI
 Ai7V6QkKTRYiNwm/SIhGD9mCkpNJOqGJlhody5pzkemMje/TdILct0kEEwQcH4CN
 9S1FzV2e314/87B9dGhuPfnVdRH362k4EdTMeE9QxzQMk=
Received: from dragon (unknown [])
 by gzsmtp3 (Coremail) with SMTP id M88vCgCnZW9sLahoW3sVAw--.14819S3;
 Fri, 22 Aug 2025 16:42:23 +0800 (CST)
Date: Fri, 22 Aug 2025 16:42:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <aKgtbDHjU6Ldku5T@dragon>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-4-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-4-joy.zou@nxp.com>
X-CM-TRANSID: M88vCgCnZW9sLahoW3sVAw--.14819S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUorcfUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQSxZWioHpAnjAAAs0
Cc: imx@lists.linux.dev, peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
 catalin.marinas@arm.com, Frank.Li@nxp.com, edumazet@google.com,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, festevam@gmail.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, ulf.hansson@linaro.org,
 pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, linux-pm@vger.kernel.org,
 othacehe@gnu.org, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v8 03/11] arm64: dts: freescale: move
 aliases from imx93.dtsi to board dts
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

On Wed, Aug 06, 2025 at 07:41:11PM +0800, Joy Zou wrote:
> The aliases is board level property rather than soc property, so move
> these to each boards.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Joy,

Could you resend those DTS patches with a rebase, as they do not apply
any more?

Shawn 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
