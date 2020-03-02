Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24415175835
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 11:19:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED73C36B0B;
	Mon,  2 Mar 2020 10:19:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB434C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 10:18:41 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j8i9o-000400-Pk; Mon, 02 Mar 2020 11:18:40 +0100
Message-ID: <fbba971d7501c774ce0081f22dcff4ef74002a4d.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@st.com>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, 
 mcoquelin.stm32@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Mon, 02 Mar 2020 11:18:39 +0100
In-Reply-To: <244a4502-03e0-836c-2ce2-7fa6cef3c188@st.com>
References: <20200226143826.1146-1-a.fatoum@pengutronix.de>
 <20200226143826.1146-2-a.fatoum@pengutronix.de>
 <244a4502-03e0-836c-2ce2-7fa6cef3c188@st.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add STM32MP1-based
 Linux Automation MC-1 board
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

On Mo, 2020-03-02 at 11:06 +0100, Alexandre Torgue wrote:
> Hi Ahmad
> 
> Thanks for adding a new STM32 board. Some minor comments.
> 
> On 2/26/20 3:38 PM, Ahmad Fatoum wrote:
> > The Linux Automation MC-1 is a SBC built around the Octavo Systems
> > OSD32MP15x SiP. The SiP features up to 1 GB DDR3 RAM, EEPROM and
> > a PMIC. The board has eMMC and a SD slot for storage and GbE
> > for both connectivity and power.
> > 
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de
> > ---
[...]
> > +
> > +&gpu {
> > +	status = "okay";
> > +};

This question is more to the ST guys than this specific DT: Why is the
GPU marked as disabled in the SoC dtsi file? This device is always
present on the SoC and AFAICS there are no board level dependencies, so
there is no reason to have it disabled by default, right? Removing the
status property from the dtsi would remove the need for this override
on the board DT.

Regards,
Lucas

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
