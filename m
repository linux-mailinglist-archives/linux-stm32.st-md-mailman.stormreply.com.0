Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C792ADC65
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 17:49:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C0DBC35E2B;
	Tue, 10 Nov 2020 16:49:59 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F63BC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 13:25:32 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id F409180BA;
 Tue, 10 Nov 2020 13:25:34 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:25:25 +0200
From: Tony Lindgren <tony@atomide.com>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201110132525.GK26857@atomide.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-10-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-10-post@lespocky.de>
X-Mailman-Approved-At: Tue, 10 Nov 2020 16:49:56 +0000
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 09/12] ARM: dts: omap: Fix schema
	warnings for pwm-leds
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

* Alexander Dahl <post@lespocky.de> [201005 23:36]:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.

Applying into omap-for-v5.11/dt thanks.

Tony
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
