Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D325F6C2BCF
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 08:59:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D23C6A603;
	Tue, 21 Mar 2023 07:59:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA20C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 07:59:48 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1peWuF-00037K-8t; Tue, 21 Mar 2023 08:59:43 +0100
References: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
 <20230320132755.2150384-10-s.trumtrar@pengutronix.de>
 <a37db3a8-a3e6-8755-2b7c-c33a1fdca469@foss.st.com>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Tue, 21 Mar 2023 08:14:52 +0100
In-reply-to: <a37db3a8-a3e6-8755-2b7c-c33a1fdca469@foss.st.com>
Message-ID: <87o7omedqr.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 09/10] ARM: dts: stm32: add
	STM32MP1-based Phytec SoM
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


Hi Alexandre,

Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:

> [1. text/plain]
> Hi Steffen
>
> On 3/20/23 14:27, Steffen Trumtrar wrote:
>> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB
>> eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>> ---
>> Notes:
>>      checkpatch warns about un-documented binding
>>           According to checkpatch the binding for "winbond,w25q128"
>>      used in this dtsi is un-documented.
>>      However, 'jedec,spi-nor.yaml' defines the pattern
>>               (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
>>           so, this should be good!?
>
> We recently added some yaml fixes and we continue to send others (i.e., GPU yaml
> error fix is under review) so please don't add new ones. Some of follownig
> errors are directly linked to your board so please fix them.
>

sorry about that, seems like I wasn't using dt_binding_check correctly :(
However, how did you generate these?

> arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb:
> /soc/i2c@40012000/touch@44: failed to match any schema with compatible:
> ['st,stmpe811']
> arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb:
> /soc/i2c@40012000/touch@44/touchscreen: failed to match any schema with
> compatible: ['st,stmpe-ts']
> arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dtb: /soc/i2c@40012000/leds@62:
> failed to match any schema with compatible: ['nxp,pca9533']

The bindings are there and if I explicitly run dt_bindings_check with
e.g. Documentation/devicetree/bindings/leds there is no warning/error.

I will fixup the rest.

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
