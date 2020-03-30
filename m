Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 127321971FA
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 03:24:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A765EC36B0B;
	Mon, 30 Mar 2020 01:24:55 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD5BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 01:24:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rFBD6LBGz1qrFS;
 Mon, 30 Mar 2020 03:24:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rFBD42WBz1r0bl;
 Mon, 30 Mar 2020 03:24:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Fvub03wl5HIX; Mon, 30 Mar 2020 03:24:51 +0200 (CEST)
X-Auth-Info: od+I4xl5ut2Q/YmRdmMDkY5JVWT6qwkF+EZ0I+fyrGA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 03:24:51 +0200 (CEST)
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
Date: Mon, 30 Mar 2020 03:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
	controller driver
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

On 3/23/20 3:58 PM, Christophe Kerello wrote:
> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
> 

On DH STM32MP1 SoM in PDK2 carrier board,
Tested-by: Marek Vasut <marex@denx.de>

btw. it seems this sets BTRx DATLAT and CLKDIV to 0xf , it's "Don't
care" in the datasheet for Muxed mode, but then it should probably be
set to 0.

The bindings I used are below:

&fmc {
        pinctrl-names = "default", "sleep";
        pinctrl-0 = <&fmc_pins_b>;
        pinctrl-1 = <&fmc_sleep_pins_b>;
        status = "okay";
        #address-cells = <1>;
        #size-cells = <1>;
        /delete-property/interrupts;
        /delete-property/dmas;
        /delete-property/dma-names;
        reg = <0x58002000 0x1000>;
        ranges;

        ebi {
                #address-cells = <2>;
                #size-cells = <1>;
                compatible = "st,stm32mp1-fmc2-ebi";
                ranges = <0 0 0x60000000 0x4000000>,
                         <1 0 0x64000000 0x4000000>,
                         <2 0 0x68000000 0x4000000>,
                         <3 0 0x6c000000 0x4000000>;

                ksz8851: ks8851mll@0,0 {
                        compatible = "micrel,ks8851-mll";
                        reg = <1 0x0 0x2 1 0x2 0x20000>;
                        interrupt-parent = <&gpioc>;
                        interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
                        bank-width = <2>;

                        /* Timing values are in nS */
                        st,fmc2_ebi_cs_mux_enable;
                        st,fmc2_ebi_cs_transaction_type = <4>;
                        st,fmc2_ebi_cs_buswidth = <16>;
                        st,fmc2_ebi_cs_address_setup = <6>;
                        st,fmc2_ebi_cs_address_hold = <6>;
                        st,fmc2_ebi_cs_data_setup = <127>;
                        st,fmc2_ebi_cs_bus_turnaround = <9>;
                        st,fmc2_ebi_cs_data_hold = <9>;
                };

                sram@3,0 {
                        compatible = "mtd-ram";
                        reg = <3 0x0 0x80000>;
                        bank-width = <2>;

                        /* Timing values are in nS */
                        st,fmc2_ebi_cs_mux_enable;
                        st,fmc2_ebi_cs_transaction_type = <4>;
                        st,fmc2_ebi_cs_buswidth = <16>;
                        st,fmc2_ebi_cs_address_setup = <6>;
                        st,fmc2_ebi_cs_address_hold = <6>;
                        st,fmc2_ebi_cs_data_setup = <127>;
                        st,fmc2_ebi_cs_bus_turnaround = <9>;
                        st,fmc2_ebi_cs_data_hold = <9>;
                };
        };
};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
