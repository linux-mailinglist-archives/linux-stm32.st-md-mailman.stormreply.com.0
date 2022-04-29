Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076F5141F4
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 07:50:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEF7AC6047D;
	Fri, 29 Apr 2022 05:50:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A776C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 05:50:19 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1nkJWE-00063u-9m; Fri, 29 Apr 2022 07:50:18 +0200
References: <20220414100700.1733914-1-s.trumtrar@pengutronix.de>
 <20220414100700.1733914-3-s.trumtrar@pengutronix.de>
 <625d4510-e390-49d0-e6b8-2456d22b4c00@foss.st.com>
User-agent: mu4e 1.4.13; emacs 29.0.50
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Fri, 29 Apr 2022 07:45:02 +0200
In-reply-to: <625d4510-e390-49d0-e6b8-2456d22b4c00@foss.st.com>
Message-ID: <87sfpwwi8y.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: add STM32MP1-based
	Phytec board
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


Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:

> [1. text/plain]
> On 4/14/22 12:07, Steffen Trumtrar wrote:
>> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
>> up to 16 MB QSPI and up to 128 GB NAND flash.
>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   3 +-
>>   .../dts/stm32mp157-phyboard-stm32mp1.dtsi     | 283 +++++++++++++
>>   .../dts/stm32mp157c-phycore-stm32mp1-3.dts    |  57 +++
>>   ...stm32mp157c-phycore-stm32mp15-pinctrl.dtsi | 318 +++++++++++++++
>>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 373 ++++++++++++++++++
>>   5 files changed, 1033 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm/boot/dts/stm32mp157-phyboard-stm32mp1.dtsi
>>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
>>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
>>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
>
> Can you split a bit those patches please ?
>

I can split it into the SOM and the board part.

(...)

>> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-pinctrl.dtsi
>
>
> Why create a new file pinctrl file for your board ? All groups are differents
> than existing ones ?
>

Exactly. Those groups overwrite the existing ones.
I could put them directly into
arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi, if you think
it aids readability.


Best regards,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
