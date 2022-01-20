Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9715495668
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jan 2022 23:40:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65280C5F1EB;
	Thu, 20 Jan 2022 22:40:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC20FC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 22:40:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 85501836E6;
 Thu, 20 Jan 2022 23:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642718400;
 bh=nMXU4nFL9yVrMj/CnHo6j6d2jD8UXK2gYXYrCUSDAfg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qvoBCqBIApnpqjlmN+aJ8WDd6RQ2w1mZtXD22WizWcC6iE8R/He9kZqE3mo7PPyLz
 IgIw67cQ/SsQh58ik28lkfRUWTGYupRe5fnjrq7C0i7p31cY13K/K03aQcrwzMQEU6
 bcx7RrwvEnCj+2BpZK89SH8R5lXB4H9571bEH1tKiOc7eoiwpXSPqXPKMR9S+np2TS
 fhjbvRr8Dasqret3vEII56lwkeCF5tyEYoHkyeQs99EAaqZKVxiMu4a3HTbcWLaliG
 B/HuPb6JByz0ymRvnebC+BwFbghydc/7uBPSqhqWfzU0rwBvRmnJFxe2RAZtGVo9UX
 NTzCnWGtDW1Uw==
Message-ID: <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
Date: Thu, 20 Jan 2022 23:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220118202958.1840431-1-marex@denx.de>
 <20220120220356.79C3CC340E0@smtp.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220120220356.79C3CC340E0@smtp.kernel.org>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jneuhauser@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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

On 1/20/22 23:03, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-01-18 12:29:54)
>> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
>> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
>> in use, ETHCKEN gate can be turned off. Current driver does not permit
>> that, fix it.
>>
>> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
>> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
>> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
>> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
>> ETHPTP_K remain functional as before.
>>
>> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>>      Figure 83. Peripheral clock distribution for Ethernet
>>      https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> To: linux-arm-kernel@lists.infradead.org
>> ---
> 
> Any cover letter?

If there is a need for V2, I will send one. Admittedly, I forgot one here.

> What is the merge strategy of this patch series?

Clock bits 1/5 and 2/5 can go through clock tree, DT bits through Alex's 
ST tree.

> Do I need to ack the patches?

I am waiting for AB/RB from ST, then they can be merged.

If you want to review the first two patches, sure, the top half of 2/5 
is probably the most interesting part, based on your suggestion from 
almost a year ago. The rest are clock controller hardware details.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
