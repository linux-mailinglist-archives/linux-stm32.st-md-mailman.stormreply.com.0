Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA33AE050
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Jun 2021 22:33:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35918C57B6C;
	Sun, 20 Jun 2021 20:33:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D6F3C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 20:33:35 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8C26E20006;
 Sun, 20 Jun 2021 20:33:34 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Fuzzey <martin.fuzzey@flowbird.group>,
 Alessandro Zummo <a.zummo@towertech.it>
Date: Sun, 20 Jun 2021 22:33:25 +0200
Message-Id: <162422118505.1090685.9982593447794632444.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <1623087421-19722-1-git-send-email-martin.fuzzey@flowbird.group>
References: <1623087421-19722-1-git-send-email-martin.fuzzey@flowbird.group>
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Fix unbalanced
	clk_disable_unprepare() on probe error path
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

On Mon, 7 Jun 2021 19:36:40 +0200, Martin Fuzzey wrote:
> The STM32MP1 RTC may have 2 clocks, the pclk and the rtc_ck.
> 
> If clk_prepare_enable() fails for the second clock (rtc_ck) we must only
> call clk_disable_unprepare() for the first clock (pclk) but currently we
> call it on both leading to a WARN:
> 
> [   15.629568] WARNING: CPU: 0 PID: 146 at drivers/clk/clk.c:958 clk_core_disable+0xb0/0xc8
> [   15.637620] ck_rtc already disabled
> [   15.663322] CPU: 0 PID: 146 Comm: systemd-udevd Not tainted 5.4.77-pknbsp-svn5759-atag-v5.4.77-204-gea4235203137-dirty #2413
> [   15.674510] Hardware name: STM32 (Device Tree Support)
> [   15.679658] [<c0111148>] (unwind_backtrace) from [<c010c0b8>] (show_stack+0x10/0x14)
> [   15.687371] [<c010c0b8>] (show_stack) from [<c0ab3d28>] (dump_stack+0xc0/0xe0)
> [   15.694574] [<c0ab3d28>] (dump_stack) from [<c012360c>] (__warn+0xc8/0xf0)
> [   15.701428] [<c012360c>] (__warn) from [<c0123694>] (warn_slowpath_fmt+0x60/0x94)
> [   15.708894] [<c0123694>] (warn_slowpath_fmt) from [<c053b518>] (clk_core_disable+0xb0/0xc8)
> [   15.717230] [<c053b518>] (clk_core_disable) from [<c053c190>] (clk_core_disable_lock+0x18/0x24)
> [   15.725924] [<c053c190>] (clk_core_disable_lock) from [<bf0adc44>] (stm32_rtc_probe+0x124/0x5e4 [rtc_stm32])
> [   15.735739] [<bf0adc44>] (stm32_rtc_probe [rtc_stm32]) from [<c05f7d4c>] (platform_drv_probe+0x48/0x98)
> [   15.745095] [<c05f7d4c>] (platform_drv_probe) from [<c05f5cec>] (really_probe+0x1f0/0x458)
> [   15.753338] [<c05f5cec>] (really_probe) from [<c05f61c4>] (driver_probe_device+0x70/0x1c4)
> [   15.761584] [<c05f61c4>] (driver_probe_device) from [<c05f6580>] (device_driver_attach+0x58/0x60)
> [   15.770439] [<c05f6580>] (device_driver_attach) from [<c05f6654>] (__driver_attach+0xcc/0x170)
> [   15.779032] [<c05f6654>] (__driver_attach) from [<c05f40d8>] (bus_for_each_dev+0x58/0x7c)
> [   15.787191] [<c05f40d8>] (bus_for_each_dev) from [<c05f4ffc>] (bus_add_driver+0xdc/0x1f8)
> [   15.795352] [<c05f4ffc>] (bus_add_driver) from [<c05f6ed8>] (driver_register+0x7c/0x110)
> [   15.803425] [<c05f6ed8>] (driver_register) from [<c01027bc>] (do_one_initcall+0x70/0x1b8)
> [   15.811588] [<c01027bc>] (do_one_initcall) from [<c01a1094>] (do_init_module+0x58/0x1f8)
> [   15.819660] [<c01a1094>] (do_init_module) from [<c01a0074>] (load_module+0x1e58/0x23c8)
> [   15.827646] [<c01a0074>] (load_module) from [<c01a0860>] (sys_finit_module+0xa0/0xd4)
> [   15.835459] [<c01a0860>] (sys_finit_module) from [<c01011e0>] (__sys_trace_return+0x0/0x20)

Applied, thanks!

[1/1] rtc: stm32: Fix unbalanced clk_disable_unprepare() on probe error path
      commit: 950ac33dbe6ff656a623d862022f0762ec061ba7

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
