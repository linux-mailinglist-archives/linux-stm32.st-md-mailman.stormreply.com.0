Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A0314D31
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 11:37:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA669C57B54;
	Tue,  9 Feb 2021 10:37:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B34C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:37:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id j11so2597436wmi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fk8u5Dvk8nuGkAQ52LnN3av3QmJ7bHhCRbwcV5gS5rE=;
 b=M8aC9tUhXOtOUfgJ/3OZW5btQulO8EvksaSubxTsszpbjbrjQWEQ7L2kAZU2nOu73M
 z220G527nN7m7+X4HC5yroR8FQ07E1xlZSV9m6UcvivSUavHSstFeED4lVAk5INY3z0Y
 Vu1sDew583jcXI1GVAYBltF32YaHes3y2AxrCPJvNu37wLsQhD5NiAULcyDJjcyb8rAT
 bZVuB2eQh4ema9igNShP46ZGCXOnBoD4Hzq4vxioVhTZ0Z/BMrmXYH4k6fczG+EZ5esz
 n66mOI+URav1VJrYzYN3NoGZJ1+hbV43D2fXVi0K+mG1UuplqDGuXJI2DxMzYN6EsNZg
 /9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fk8u5Dvk8nuGkAQ52LnN3av3QmJ7bHhCRbwcV5gS5rE=;
 b=iLuSB6ikDl+wYLGV5C+BUnrdCX+kihsZAlQ+E41ID5xqEE9g3gUdSV0kocqXk5h2mG
 qSJlQzpH+bS3wlDiP12oLsHjR39fjyi3FEWQPn8qh5T1yftNdgjmA7o9mW9cSPqLcYCS
 ZSRO0uzknrwR5S5CAJ5e9QQ5YV+7i2YejC+nu+xf3/LvnujpfOJpKvukL1TRrsvMarel
 O3Fp9+vqCmXmU9ustlZ4KYnGTI8YEPpfn4kmYYXvPjUjFNhsUjR0kMZin6ZLD416Yq5Z
 /TR/+STXHWCX/jiyT+nGl9UhIkgqzNEElsY3JqUl/kpMZlot54B6zvxCUXS6nDTncKLk
 WDsQ==
X-Gm-Message-State: AOAM531HNRPd0QY3U4MPJccMHmCJIOjq9bvYtx2gphj9JaIZtHJj5osf
 bRV69GwS68brR7iUsr45e9U=
X-Google-Smtp-Source: ABdhPJzEHSP6byQu9bZegN9WsajgQQpAyaKW9/qEbDRoTwEvS1+9nrYC4mmXUvdec4ELnGPviqYzAg==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr2826077wmi.148.1612867057934; 
 Tue, 09 Feb 2021 02:37:37 -0800 (PST)
Received: from ?IPv6:2003:ea:8f1f:ad00:88d8:7242:b455:4959?
 (p200300ea8f1fad0088d87242b4554959.dip0.t-ipconnect.de.
 [2003:ea:8f1f:ad00:88d8:7242:b455:4959])
 by smtp.googlemail.com with ESMTPSA id o13sm7681715wrs.45.2021.02.09.02.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 02:37:37 -0800 (PST)
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
 <20210209101528.3lf47ouaedfgq74n@mobilestation>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <a652c69b-94d3-9dc6-c529-1ebc0ed407ac@gmail.com>
Date: Tue, 9 Feb 2021 11:37:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209101528.3lf47ouaedfgq74n@mobilestation>
Content-Language: en-US
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On 09.02.2021 11:15, Serge Semin wrote:
> On Mon, Feb 08, 2021 at 09:14:02PM +0100, Heiner Kallweit wrote:
>> On 08.02.2021 15:03, Serge Semin wrote:
>>> It has been noticed that RTL8211E PHY stops detecting and reporting events
>>> when EEE is successfully advertised and RXC stopping in LPI is enabled.
>>> The freeze happens right after 3.0.10 bit (PC1R "Clock Stop Enable"
>>> register) is set. At the same time LED2 stops blinking as if EEE mode has
>>> been disabled. Notably the network traffic still flows through the PHY
>>> with no obvious problem. Anyway if any MDIO read procedure is performed
>>> after the "RXC stop in LPI" mode is enabled PHY gets to be unfrozen, LED2
>>> starts blinking and PHY interrupts happens again. The problem has been
>>> noticed on RTL8211E PHY working together with DW GMAC 3.73a MAC and
>>> reporting its event via a dedicated IRQ signal. (Obviously the problem has
>>> been unnoticed in the polling mode, since it gets naturally fixed by the
>>> periodic MDIO read procedure from the PHY status register - BMSR.)
>>>
>>> In order to fix that problem we suggest to locally re-implement the MMD
>>> write method for RTL8211E PHY and perform a dummy read right after the
>>> PC1R register is accessed to enable the RXC stopping in LPI mode.
>>>
>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>> ---
>>>  drivers/net/phy/realtek.c | 37 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
>>> index 99ecd6c4c15a..cbb86c257aae 100644
>>> --- a/drivers/net/phy/realtek.c
>>> +++ b/drivers/net/phy/realtek.c
>>> @@ -559,6 +559,42 @@ static int rtl822x_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
>>>  	return ret;
>>>  }
>>>  
>>> +static int rtl8211e_write_mmd(struct phy_device *phydev, int devnum, u16 regnum,
>>> +			      u16 val)
>>> +{
>>> +	int ret;
>>> +
>>> +	/* Write to the MMD registers by using the standard control/data pair.
>>> +	 * The only difference is that we need to perform a dummy read after
>>> +	 * the PC1R.CLKSTOP_EN bit is set. It's required to workaround an issue
>>> +	 * of a partial core freeze so LED2 stops blinking in EEE mode, PHY
>>> +	 * stops detecting the link change and raising IRQs until any read from
>>> +	 * its registers performed. That happens only if and right after the PHY
>>> +	 * is enabled to stop RXC in LPI mode.
>>> +	 */
>>> +	ret = __phy_write(phydev, MII_MMD_CTRL, devnum);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = __phy_write(phydev, MII_MMD_DATA, regnum);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = __phy_write(phydev, MII_MMD_CTRL, devnum | MII_MMD_CTRL_NOINCR);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>
> 
>> Nice analysis. Alternatively to duplicating this code piece we could
>> export mmd_phy_indirect(). But up to you.
> 
> I also considered creating a generic method to access the MMD
> registers of a generic PHY, something like phy_read()/phy_write(), but
> for MMD (alas just exporting mmd_phy_indirect() would not be enough).
> But as I see it such methods need to be created only after we get to
> have at least several places with duplicating direct MMD-read/write
> patterns. Doing that just for a single place seems redundant. Anyway it's
> up to maintainers to decide whether they want to see a generic part
> of the phy_read_mmd()/phy_write_mmd() methods being detached and
> exported as something like genphy_{read,write}_mmd() methods. I can do
> that in v2 if you ask me to.
> 
Right, adding something like a genphy_{read,write}_mmd() doesn't make
too much sense for now. What I meant is just exporting mmd_phy_indirect().
Then you don't have to open-code the first three steps of a mmd read/write.
And it requires no additional code in phylib.
But that's not at all a showstopper here.

> -Sergey
> 
>>
>>> +	ret = __phy_write(phydev, MII_MMD_DATA, val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (devnum == MDIO_MMD_PCS && regnum == MDIO_CTRL1 &&
>>> +	    val & MDIO_PCS_CTRL1_CLKSTOP_EN)
>>> +		ret =  __phy_read(phydev, MII_MMD_DATA);
>>> +
>>> +	return ret < 0 ? ret : 0;
>>> +}
>>> +
>>>  static int rtl822x_get_features(struct phy_device *phydev)
>>>  {
>>>  	int val;
>>> @@ -725,6 +761,7 @@ static struct phy_driver realtek_drvs[] = {
>>>  		.resume		= genphy_resume,
>>>  		.read_page	= rtl821x_read_page,
>>>  		.write_page	= rtl821x_write_page,
>>> +		.write_mmd	= rtl8211e_write_mmd,
>>>  	}, {
>>>  		PHY_ID_MATCH_EXACT(0x001cc916),
>>>  		.name		= "RTL8211F Gigabit Ethernet",
>>>
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
