Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D728F39A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 15:48:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF25C3FADE;
	Thu, 15 Oct 2020 13:48:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F97C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 13:48:00 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kT3br-00075B-HV; Thu, 15 Oct 2020 15:47:59 +0200
To: Marek Vasut <marex@denx.de>, Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
 <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
Date: Thu, 15 Oct 2020 15:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: hardware@linux-automation.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

Hello,

On 10/15/20 3:40 PM, Marek Vasut wrote:
>>> Currently the
>>> stm32mp15-pinmux.dtsi is not consistent in that aspect. I am not arguing
>>> about any one single board, but about the dtsi, I suspect by default the
>>> pull ups should be enabled, and possibly on board-DT-level they should
>>> be disabled if not needed instead ?
>>
>> I think this is a good idea. But existing boards should be fixed up so that
>> their old behavior is maintained.
> 
> So, which boards do we fix. The automation-1 board and the ST ones ?

fixed up, not fixed. I don't know if ST is fine with the changes, for
the MC-1, please do:

-------------- 8< -------------
diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 5700e6b700d3..7134466256b3 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -208,6 +208,14 @@ pins2 {
        };
 };

+&sdmmc2_d47_pins_b {
+       /* board already has external 47K pull-ups */
+
+       pins {
+               /delete-property/ bias-pull-up;
+               bias-disable;
+       };
+};
+
 &sdmmc2 {
        pinctrl-names = "default", "opendrain", "sleep";
        pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
