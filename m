Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21123649F36
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 13:59:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE004C69042;
	Mon, 12 Dec 2022 12:59:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15F8DC69040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 12:59:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 985018539F;
 Mon, 12 Dec 2022 13:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670849984;
 bh=VE3imvG7deG0JUgjoXPnooJn1vL7bSWBEABq2i2i02M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m0klc4rDE9mJ8SwWDc3g7AO6u3KRKoUDk1OlCwmIJGBMeKaHkSJbfrR12wSJWHt8F
 +7QlnLnzp6G6SqKY/mE1mn2+GsavgrXKrXH2CsNh06KUVMEbPRxLo/rV5dXK+Ygztu
 Kwr+cHNWJuvkekL9q5YUIdKrU/Xo7iibIABG66j7n/wKlNwkfF8wQ1MtqGmikj1N0Z
 ZyfkmEqMgTSN6BXaO1othCKYv0Qs5df02GMYu8asrT3OYFX3eWSE+lhTA15i6Gyzt9
 vCBgUTcPUVPp4vO01/6pFtKQt3Cv4FypyZyIb005dxduOJ/zGDfC9BiKNlUwDze5AB
 TBDJZOAjuL7Lg==
Message-ID: <11bcaf2e-864b-0f86-645e-5a1a619865a6@denx.de>
Date: Mon, 12 Dec 2022 13:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: patrice.chotard@foss.st.com, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alexandre.torgue@foss.st.com
References: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Oleksij Rempel <o.rempel@pengutronix.de>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Fix qspi pinctrl phandle for stm3mp15
	based boards
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

On 12/12/22 09:51, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> qspi_bk1_pins_a and qspi_bk2_pins_a pinctrl phandle has been splitted in
> 2 parts. Only stm32mp157c-ev1.dts has been updated properly.
> 
> Fix qspi pinctrl phandle for other boards which are based on stm32mp15x SoC.

Typo in $SUBJECT, s@stm3mp@stm32mp@ . That's in all the patches.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
