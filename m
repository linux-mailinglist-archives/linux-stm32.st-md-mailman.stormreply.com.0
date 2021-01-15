Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 413542F7885
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 13:15:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2741C424C0;
	Fri, 15 Jan 2021 12:15:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E5DDC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 12:15:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DHKrz2N3Pz1ryXJ;
 Fri, 15 Jan 2021 13:15:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DHKry3PQTz1tYVw;
 Fri, 15 Jan 2021 13:15:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id RIQA9dESM_Vn; Fri, 15 Jan 2021 13:15:44 +0100 (CET)
X-Auth-Info: iJ3FXQe3H4c5EUgVL6k9wP0dmqj0Ijp5uE88204o3Yk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 15 Jan 2021 13:15:44 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210106204347.475920-1-marex@denx.de>
 <20210106204347.475920-3-marex@denx.de>
 <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <73f6d2cc-8dd7-b005-7faa-db9956f46aa5@denx.de>
Date: Fri, 15 Jan 2021 13:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] [RFC] ARM: dts: stm32: Add mux for
	ETHRX clock
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/14/21 6:08 PM, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 1/6/21 9:43 PM, Marek Vasut wrote:
>> The implementation of ETH_RX_CLK/ETH_REF_CLK handling currently does not
>> permit selecting the clock input from SoC pad. To make things worse, the
>> implementation of this is partly present and is split between the clock
>> driver and dwmac4 driver. Moreover, the ETHRX clock parent is incorrect.
> 
> Sorry but I don't understand which configuration is missing. I think we 
> can handle all possible cases for RMII. At the glue layer 
> (dwmac-stm32.c) clocks gates and syscfg are set regarding device tree 
> binding (see the tab in dwmac-stm32.c). You could have a look here for 
> more details: 
> https://wiki.st.com/stm32mpu/wiki/Ethernet_device_tree_configuration
> 
> Regarding the clock parent, yes it is not at the well frequency if you 
> want to select this path. Our current "clock tree" is done to fit with 
> our ST reference boards (we have more peripherals than PLL outputs so we 
> have to make choices). So yes for customer/partners boards this clock 
> tree has to be modified to better fit with the need (either using 
> assigned-clock-parent or by modifying bootloader clock tree (tf-a or 
> u-boot)).

I don't think you handle all the configuration options, but I might also 
be confused.

See Figure 83. Peripheral clock distribution for Ethernet in the MP1 
datasheet for the below.

The current setup I have needs 50 MHz on SoC pad PA1 to drive the PHY 
clock, and uses eth_clk_fb to supply ETH_RX_CLK. However, the 50 MHz is 
sourced directly from PLL4P, which then has to run at 50 MHz and that in 
turn reduces clock frequency for other blocks connected to PLL4P (e.g. 
SDMMC, where the impact is noticable).

So, what I want to model here is this:

PLL4P = 100 MHz
MCO2 is supplied by PLL4P and set to /2 , so MCO2 = 50 MHz
SoC pad PG2 is set as MCO2 output, thus a source of 50 MHz signal
SoC pad PA1 is set as ETH_RX_CLK and connected to PG2

This works fine in practice, except it cannot be modeled using current 
DT bindings, even though it should be possible to model it.

>> First, the ETHRX clock in clk-stm32mp1.c only represents the ETHRXEN 
>> gate,
>> however it should represent also ETH_REF_CLK_SEL mux. The problem is that
>> the ETH_REF_CLK_SEL mux is currently configured in the DWMAC4 driver and
>> the ETH_REF_CLK_SEL bit is part of SYSCFG block, not the DWMAC4 or the
>> clock block.
> 
> dwmac4-stm32 doesn't contain code for dwmac4 but it contains the glue 
> around the dwmac4: syscfg, clocks ...

The problem is that dwmac4-stm32 isn't the right place to configure the 
ETHRX clock mux, that should be in the clock driver. So the stm32 clock 
driver should have SYSCFG handle and configure ETH_REF_CLK_SEL mux. The 
"st,eth-ref-clk-sel" DT prop would then not be needed at all, as the 
reference clock select would be configured using assigned-clocks in DT.

The default assigned-clocks should be eth_clk_fb , but the user can 
override it in the DT and provide another clock source (e.g. in my case, 
that would be PLL4P->MCO2->ETHRX).

>> Second, the ETHRX parent clock is either eth_clk_fb (ETHCK_K) or external
>> ETH_RX_CLK/ETH_REF_CLK_SEL, it is never CK_AXI.
> 
> Why CK_AXI ?

See drivers/clk/clk-stm32mp1.c:
   1895          PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
