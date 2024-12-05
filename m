Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE59E5764
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 14:40:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A25C7801A;
	Thu,  5 Dec 2024 13:40:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD1FCC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 13:40:34 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tJC5q-00064N-4F; Thu, 05 Dec 2024 14:40:34 +0100
Message-ID: <e81f5b48-02e9-423c-984e-b7dfa7753f27@pengutronix.de>
Date: Thu, 5 Dec 2024 14:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "barebox@lists.infradead.org" <barebox@lists.infradead.org>,
 Oleksij Rempel <ore@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [Linux-stm32] AXI ID 0x5c8 on STM32MP13
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

After a kernel update to v6.13-rc1, we have been increasingly seeing
following occasional OP-TEE (v4.2.0) panic:

  E/TC:0   dump_fail_filter:425 Violation @0xce01b000, non-secure privileged read, AXI ID 5c8
  E/TC:0   Panic at core/arch/arm/plat-stm32mp1/plat_tzc400.c:30 <tzc_it_handler>
  E/TC:0   TEE load address @ 0xce000000

This happens at kernel boot time, when loaded by barebox. The probability that
this happens, seems to be inversely proportional to how long the system
was powered off prior to Power-on reset...

The kernel /reserved-memory entry has a no-map entry for OP-TEE, so this
looks correct.

barebox maps the OP-TEE range as uncached and with eXecute Never set.
Indeed, if we jump to the OP-TEE memory directly, we get a prefetch error
from within barebox without hitting the firewall as expected.

If the barebox MMU is disabled and we try to execute from 0xce000000, we
get an expected panic from OP-TEE:

  E/TC:0   tzc_it_handler:26 TZC permission failure
  E/TC:0   dump_fail_filter:420 Permission violation on filter 0
  E/TC:0   dump_fail_filter:425 Violation @0xce000000, non-secure privileged read, AXI ID 4c0
  E/TC:0   Panic at core/arch/arm/plat-stm32mp1/plat_tzc400.c:30 <tzc_it_handler>
  E/TC:0   TEE load address @ 0xce000000

Note that this is a different AXI ID (0x4c0) than the one we see related
to the spurious read (0x5c8).

In order to further debug this, it would be useful to know which AXI master
has ID 0x5c8. The reference manual (RM0475) has Table 20. "NSAID and AXI_ID
mapping" in RM0475 but it contains no 0x5c8. 0x4c0 is expectedly the CA7
itself.

Can someone from ST please chime in with the information what AXI master
ID 0x5c8 maps to?

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
