Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82B8877BB
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Mar 2024 10:20:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA04BC6DD9C;
	Sat, 23 Mar 2024 09:20:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 019C1C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Mar 2024 09:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 352B7CE0959;
 Sat, 23 Mar 2024 09:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C0C433F1;
 Sat, 23 Mar 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711185636;
 bh=aGTQuZy7vZpxuhlc2uWM1FWO2cNVLUpXYHPr+30NYM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AmGkF125xegySFWAiHvPntmZ+07s8hZQPC/0IVIftdkxYeMJTqDHDoBaq087Sl4Ry
 qKx2QcAVw6S410SG7j4biAqt4/h5dTjc1vKUs5R8LJBjxtJSQyMNE1PxZTAhzLwpa+
 ZvDOHlqhfPGo+3K1JP9tq5K11rxRL31gNRIYe4fcfJjyAcpNQmozM0AzDwGqt7aAAm
 vL1bo7yWAyyXHWJXICav98Il7syCI5t9aEO0HLvfyTQ7cJVQX5WfpHiaD8JmvRG1Zm
 VmI4taBLphr2uo/nVmCk1uj3x3TE6/IYqaCXMkAcTk/3yvQe9KoaZIneVeSaGY4Thk
 hCCXd6I1k2Bcg==
Date: Sat, 23 Mar 2024 10:20:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
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

On Fri, Mar 22, 2024 at 02:24:53PM +0100, Wolfram Sang wrote:
> Okay, we need to begin somewhere...
> 
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.

yes, very good! It's clearly stated in all three documentations
that Target replaces Slave and Controller replaces Master (i3c is
at the 1.1.1 version).

> My motivation is to improve the I2C core API, in general. My motivation
> is not to clean each and every driver. I think this is impossible
> because register names based on official documentation will need to stay
> as they are. But the Linux-internal names should be updated IMO.

Also because some drivers have been written based on previous
specifications where master/slave was used.

> That being said, I worked on 62 drivers in this series beyond plain
> renames inside 'struct i2c_algorithm' because the fruits were so
> low-hanging. Before this series, 112 files in the 'busses/' directory
> contained 'master' and/or 'slave'. After the series, only 57. Why not?
> 
> Next step is updating the drivers outside the 'i2c'-folder regarding
> 'struct i2c_algorithm' so we can remove the anonymous union ASAP. To be
> able to work on this with minimal dependencies, I'd like to apply this
> series between -rc1 and -rc2.
> 
> I hope this will work for you guys. The changes are really minimal. If
> you are not comfortable with changes to your driver or need more time to
> review, please NACK the patch and I will drop the patch and/or address
> the issues separeately.
> 
> @Andi: are you okay with this approach? It means you'd need to merge
> -rc2 into your for-next branch. Or rebase if all fails.

I think it's a good plan, I'll try to support you with it.

> Speaking of Andi, thanks a lot to him taking care of the controller
> drivers these days. His work really gives me the freedom to work on I2C
> core issues again.

Thank you, Wolfram!

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
