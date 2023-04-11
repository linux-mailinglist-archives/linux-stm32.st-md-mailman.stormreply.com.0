Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DB6DD314
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 08:44:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14B98C62EFE;
	Tue, 11 Apr 2023 06:44:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52BC3C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 06:44:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1pm7jV-0005aT-Kz; Tue, 11 Apr 2023 08:44:01 +0200
References: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
 <20230330050408.3806093-10-s.trumtrar@pengutronix.de>
 <dda2a928-dbdd-e8e7-fb5e-2bb062a3b2b9@foss.st.com>
User-agent: mu4e 1.8.14; emacs 28.2
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Tue, 11 Apr 2023 08:42:50 +0200
In-reply-to: <dda2a928-dbdd-e8e7-fb5e-2bb062a3b2b9@foss.st.com>
Message-ID: <87cz4a5368.fsf@pengutronix.de>
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
Subject: Re: [Linux-stm32] [PATCH v7 09/10] ARM: dts: stm32: add
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
>> +		gpu_reserved: gpu@f8000000 {
>> +			reg = <0xf8000000 0x8000000>;
>> +			no-map;
>> +		};
>
> It seems that this region is not used. Furthermore if you plan to use it to GPU
> note that it doesn't respect YAMl verification. So please remove it.
>

Ack. Will remove.

>> +&ethernet0 {
>> +	pinctrl-0 = <&ethernet0_rgmii_pins_d>;
>> +	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_d>;
>> +	pinctrl-names = "default", "sleep";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;
>> +	phy-handle = <&phy0>;
>> +	st,eth-clk-sel;
>> +	clock-names = "stmmaceth",
>> +		      "mac-clk-tx",
>> +		      "mac-clk-rx",
>> +		      "eth-ck",
>> +		      "syscfg-clk",
>> +		      "ethstp";
>> +	clocks = <&rcc ETHMAC>,
>> +		 <&rcc ETHTX>,
>> +		 <&rcc ETHRX>,
>> +		 <&rcc ETHCK_K>,
>> +		 <&rcc SYSCFG>,
>> +		 <&rcc ETHSTP>;
>
> Why do you re define those clocks ? They are all already defined in
> stm32mp151.dtsi
>

Just an oversight :( Will remove.


Thanks,
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
