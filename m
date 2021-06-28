Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D29403B5CA1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 12:44:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84184C57B53;
	Mon, 28 Jun 2021 10:44:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1912DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 10:44:38 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A59B982DB6;
 Mon, 28 Jun 2021 12:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624877078;
 bh=0p+ciJ3zZIm3RfWSsuWqScKsXBw8wD1FfIDDMY6qp9c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eeqNb6K6aKIQXF2CNYgemrJgBrNZ4uQqIFoRpsJUDWL4nXPTCaDnM7PISUELhZ5LX
 QhFKBy8J7SBSnWOumYfHWevQ8WkN0DO0f1zX/VcknMwD1uCQ4WOQuUBrIDlb6owWg7
 6/H/j2I3DQIKewY1pc2/e6yu36JFDC0QcsBbYqlWMsG1lTwCfEFVPkObzxw7TBVjYv
 prlVPrmaSqWFdGc40mivYPCkYyMcfhvVzlmzcV99LM8hV8BPjFaJnvuJ/NynKAA5v2
 Xi9V/BZ5X5lfXMe9DqeatYLmXGrCC9JKudbnENzh+dZ170Q6L/YTTC4PiidAMNzYM7
 vtje0R8rRpaYQ==
To: linux-arm-kernel@lists.infradead.org, linux-stable <stable@vger.kernel.org>
References: <20210408230001.310215-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <47597d13-e6ec-ccd2-c34b-eb65896cdd70@denx.de>
Date: Mon, 28 Jun 2021 12:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210408230001.310215-1-marex@denx.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Sasha Levin <sashal@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rework LAN8710Ai PHY
	reset on DHCOM SoM
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

On 4/9/21 1:00 AM, Marek Vasut wrote:
> The Microchip LAN8710Ai PHY requires XTAL1/CLKIN external clock to be
> enabled when the nRST is toggled according to datasheet Microchip
> LAN8710A/LAN8710Ai DS00002164B page 35 section 3.8.5.1 Hardware Reset:

[...]

> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")

Adding stable to CC.

Patch is now part of Linux 5.13 as commit

1cebcf9932ab ("ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM")

It would be nice to pick it into stable, since it fixes ethernet 
stability issues on the device.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
