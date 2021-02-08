Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E62314019
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 21:14:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E153C5718A;
	Mon,  8 Feb 2021 20:14:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A6BC57188
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 20:14:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id m13so18682917wro.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Feb 2021 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OUh/84sIyniswzX8ah1LDDp71Tfd3ZoLrA0XAN17eZU=;
 b=rOBlwegdw+wasDBf6XqUsr7z8cAF4XwNo4YBJhPomGCHLaAx8dI9yXJ6FOZRHIruw2
 mUhpT1Y7RAhVooVYFKanYan6pZaRSJ0ALGceKovNVZX+Vaym5VgqzBIwVoFTyQjgcu9Y
 iN/+ftTaVmpIcKcRwbyOyL4jlJILklEpfev42bFOruz/B4/G+8hfYSpgpWJ/7srLXAsj
 NQLGXGSVUIVqRXSg5m+A+EdQ/S01L3zDTEQZeUvrHhF+2ES+IPNLK/y/zcl8vMy+kpH2
 yeMMvYPIumFGm58eav/LAWdPmTNOhr68Fs2rlbzzsSvrk7ZUo7EYaOQvFqNYPMobwxd4
 boeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OUh/84sIyniswzX8ah1LDDp71Tfd3ZoLrA0XAN17eZU=;
 b=eR78FzPbZh0z7RfK2dkkaXLjbkjWNeil25xW5gwJuybVwjtuUDvys44JXEb85KNOdy
 Kynk4KEvpv1MVq35voFQFfx1eGJrlI0/RgeW/VGbFpuv0pW3PySY6VL06/5TYfTqt6uz
 zGfwimaMvgomebUSfb0QIu1CDCs+BbD5id/p/PWvp13UOkuS1XzCF8YFsNXLp2wXoKek
 VDt96xqvh+0JjNCxEVxROHnJ3pJa6GH/dIz63nic9FUVGzZEneWkmZsfhaaW3s1xEh2o
 HfTBZ7W2gp2n+6ZuUQiQJSljk2G+2C0DJgB6yOVtaXeBxfPgGJsTDdXXgglFmGL+nJa3
 2hhg==
X-Gm-Message-State: AOAM531tJPX/p6Uesj8XwRSbK4obFzNUBQHjlLi6a91F9exMl+ai/5Co
 1rpSCRyUog8kXDdfRWbszcc=
X-Google-Smtp-Source: ABdhPJzKlwzMStUUKKnjrHt7O1icNkl7L0iRGnE9pd6UFl4QxImBc3lc3ymv/8dEALTTipgSSMBoqg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr1768118wrm.39.1612815253875;
 Mon, 08 Feb 2021 12:14:13 -0800 (PST)
Received: from ?IPv6:2003:ea:8f1f:ad00:f9e7:a381:9de9:80df?
 (p200300ea8f1fad00f9e7a3819de980df.dip0.t-ipconnect.de.
 [2003:ea:8f1f:ad00:f9e7:a381:9de9:80df])
 by smtp.googlemail.com with ESMTPSA id o9sm33181629wrw.81.2021.02.08.12.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 12:14:12 -0800 (PST)
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
Date: Mon, 8 Feb 2021 21:14:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/20] net: phy: realtek: Fix events
 detection failure in LPI mode
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

On 08.02.2021 15:03, Serge Semin wrote:
> It has been noticed that RTL8211E PHY stops detecting and reporting events
> when EEE is successfully advertised and RXC stopping in LPI is enabled.
> The freeze happens right after 3.0.10 bit (PC1R "Clock Stop Enable"
> register) is set. At the same time LED2 stops blinking as if EEE mode has
> been disabled. Notably the network traffic still flows through the PHY
> with no obvious problem. Anyway if any MDIO read procedure is performed
> after the "RXC stop in LPI" mode is enabled PHY gets to be unfrozen, LED2
> starts blinking and PHY interrupts happens again. The problem has been
> noticed on RTL8211E PHY working together with DW GMAC 3.73a MAC and
> reporting its event via a dedicated IRQ signal. (Obviously the problem has
> been unnoticed in the polling mode, since it gets naturally fixed by the
> periodic MDIO read procedure from the PHY status register - BMSR.)
> 
> In order to fix that problem we suggest to locally re-implement the MMD
> write method for RTL8211E PHY and perform a dummy read right after the
> PC1R register is accessed to enable the RXC stopping in LPI mode.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/net/phy/realtek.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index 99ecd6c4c15a..cbb86c257aae 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -559,6 +559,42 @@ static int rtl822x_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
>  	return ret;
>  }
>  
> +static int rtl8211e_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
> +			      u16 val)
> +{
> +	int ret;
> +
> +	/* Write to the MMD registers by using the standard control/data pair.
> +	 * The only difference is that we need to perform a dummy read after
> +	 * the PC1R.CLKSTOP_EN bit is set. It's required to workaround an issue
> +	 * of a partial core freeze so LED2 stops blinking in EEE mode, PHY
> +	 * stops detecting the link change and raising IRQs until any read from
> +	 * its registers performed. That happens only if and right after the PHY
> +	 * is enabled to stop RXC in LPI mode.
> +	 */
> +	ret = __phy_write(phydev, MII_MMD_CTRL, devnum);
> +	if (ret)
> +		return ret;
> +
> +	ret = __phy_write(phydev, MII_MMD_DATA, regnum);
> +	if (ret)
> +		return ret;
> +
> +	ret = __phy_write(phydev, MII_MMD_CTRL, devnum | MII_MMD_CTRL_NOINCR);
> +	if (ret)
> +		return ret;
> +

Nice analysis. Alternatively to duplicating this code piece we could
export mmd_phy_indirect(). But up to you.

> +	ret = __phy_write(phydev, MII_MMD_DATA, val);
> +	if (ret)
> +		return ret;
> +
> +	if (devnum == MDIO_MMD_PCS && regnum == MDIO_CTRL1 &&
> +	    val & MDIO_PCS_CTRL1_CLKSTOP_EN)
> +		ret =  __phy_read(phydev, MII_MMD_DATA);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
>  static int rtl822x_get_features(struct phy_device *phydev)
>  {
>  	int val;
> @@ -725,6 +761,7 @@ static struct phy_driver realtek_drvs[] = {
>  		.resume		= genphy_resume,
>  		.read_page	= rtl821x_read_page,
>  		.write_page	= rtl821x_write_page,
> +		.write_mmd	= rtl8211e_write_mmd,
>  	}, {
>  		PHY_ID_MATCH_EXACT(0x001cc916),
>  		.name		= "RTL8211F Gigabit Ethernet",
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
