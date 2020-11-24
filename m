Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F72C2AA9
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:03:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D6F4C56630;
	Tue, 24 Nov 2020 15:03:48 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38114C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:03:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c198so2711331wmd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=HFdlhJaaYtVAHZoZx+O2cfNnd2v0cgIEGMNjYfyBtsM=;
 b=ZeuxxeGJizVrTQ8/+drC2BXOjRHNr8TNITrPHM54Kju6SErP4aUNRGzd2no43NToYD
 GdUOSa+9BSjoQiP7X9sNWQ1giuNJPUv72hBAZXSCVj4MRdTf0HYgdM+tAR3fMuYvagD9
 aOs6Dsgc8B7gcIHIz3Fenf0FpsxsbUQ4dR0YImjAtUWhpYyJJHznwBpsjgiP7MmQvPtH
 j2bxpkbKc3T6wGJ6ono2W6k/NDP5bzUzFG9wyD4fI0ps2BZ5QDv73Q4CHF3bZz4iUKSy
 Cw58Ivn2TvJpbCBhBu+BUT66wspodlZlJu6QPslG71dFXtiDQ10NrADNfnNilXlL8kQS
 LlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=HFdlhJaaYtVAHZoZx+O2cfNnd2v0cgIEGMNjYfyBtsM=;
 b=X8vmcGTRjm33qDt02c56cHJZXbM1BmYJuEPEkOOijcboE5HZgFWHSJ4ZtCNupHWdne
 pXS7/ww4i4+J2JAuMtwFcsLwuWi+mDE/sxUze3g51HUsAwaagXh2NFr9wMJYee6qgtvy
 /LNpJQwnnN0JYF2SaCCh193Rk2wQJlJiMQk/01slV6mVpNROXgl+nuFHNxeKnIwE3Iwt
 zPpIAGkB6KxlCEh2LgxLDPUyqkapNe/HE1nrMenUYi68juES+/T6eJfCrJuABuhmRUxv
 URcHHhZx4/W0v9Y4wFTQ+v1YEVQUoOo4QgZamFlz1PmpMMN9EFlGjiJn0EQOJOxmLTfF
 PeRQ==
X-Gm-Message-State: AOAM533+LDF2AoX2Nn9ILoN7Dvljn82aialTTHJZrkXctDTPhnL851fJ
 tz5jiKYmp/WzLx4RCuiHcCs=
X-Google-Smtp-Source: ABdhPJww+D+Kpjg5W65A9K3BrPYYERd+hjbvhkiesPVWAgqYd7TEqnJVbB08jzGFXDLnyziJPgEzhQ==
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr5093414wma.151.1606230225625; 
 Tue, 24 Nov 2020 07:03:45 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:4cf3:cdf5:5d2a:5c8c?
 (p200300ea8f2328004cf3cdf55d2a5c8c.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:4cf3:cdf5:5d2a:5c8c])
 by smtp.googlemail.com with ESMTPSA id u5sm5669309wml.13.2020.11.24.07.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 07:03:44 -0800 (PST)
To: Antonio Borneo <antonio.borneo@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Yonglong Liu <liuyonglong@huawei.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <4684304a-37f5-e0cd-91cf-3f86318979c3@gmail.com>
Date: Tue, 24 Nov 2020 16:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

Am 24.11.2020 um 15:38 schrieb Antonio Borneo:
> If the auto-negotiation fails to establish a gigabit link, the phy
> can try to 'down-shift': it resets the bits in MII_CTRL1000 to
> stop advertising 1Gbps and retries the negotiation at 100Mbps.
> 
I see that Russell answered already. My 2cts:

Are you sure all PHY's supporting downshift adjust the
advertisement bits? IIRC an Aquantia PHY I dealt with does not.
And if a PHY does so I'd consider this problematic:
Let's say you have a broken cable and the PHY downshifts to
100Mbps. If you change the cable then the PHY would still negotiate
100Mbps only.

Also I think phydev->advertising reflects what the user wants to
advertise, as mentioned by Russell before.


>>From commit 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode
> in genphy_read_status") the content of MII_CTRL1000 is not checked
> anymore at the end of the negotiation, preventing the detection of
> phy 'down-shift'.
> In case of 'down-shift' phydev->advertising gets out-of-sync wrt
> MII_CTRL1000 and still includes modes that the phy have already
> dropped. The link partner could still advertise higher speeds,
> while the link is established at one of the common lower speeds.
> The logic 'and' in phy_resolve_aneg_linkmode() between
> phydev->advertising and phydev->lp_advertising will report an
> incorrect mode.
> 
> Issue detected with a local phy rtl8211f connected with a gigabit
> capable router through a two-pairs network cable.
> 
> After auto-negotiation, read back MII_CTRL1000 and mask-out from
> phydev->advertising the modes that have been eventually discarded
> due to the 'down-shift'.
> 
> Fixes: 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")
> Cc: stable@vger.kernel.org # v5.1+
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Link: https://lore.kernel.org/r/478f871a-583d-01f1-9cc5-2eea56d8c2a7@huawei.com
> ---
> To: Andrew Lunn <andrew@lunn.ch>
> To: Heiner Kallweit <hkallweit1@gmail.com>
> To: Russell King <linux@armlinux.org.uk>
> To: "David S. Miller" <davem@davemloft.net>
> To: Jakub Kicinski <kuba@kernel.org>
> To: netdev@vger.kernel.org
> To: Yonglong Liu <liuyonglong@huawei.com>
> Cc: linuxarm@huawei.com
> Cc: Salil Mehta <salil.mehta@huawei.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-kernel@vger.kernel.org
> Cc: Antonio Borneo <antonio.borneo@st.com>
> 
>  drivers/net/phy/phy_device.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 5dab6be6fc38..5d1060aa1b25 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -2331,7 +2331,7 @@ EXPORT_SYMBOL(genphy_read_status_fixed);
>   */
>  int genphy_read_status(struct phy_device *phydev)
>  {
> -	int err, old_link = phydev->link;
> +	int adv, err, old_link = phydev->link;
>  
>  	/* Update the link, but return if there was an error */
>  	err = genphy_update_link(phydev);
> @@ -2356,6 +2356,14 @@ int genphy_read_status(struct phy_device *phydev)
>  		return err;
>  
>  	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
> +		if (phydev->is_gigabit_capable) {
> +			adv = phy_read(phydev, MII_CTRL1000);
> +			if (adv < 0)
> +				return adv;
> +			/* update advertising in case of 'down-shift' */
> +			mii_ctrl1000_mod_linkmode_adv_t(phydev->advertising,
> +							adv);
> +		}
>  		phy_resolve_aneg_linkmode(phydev);
>  	} else if (phydev->autoneg == AUTONEG_DISABLE) {
>  		err = genphy_read_status_fixed(phydev);
> 
> base-commit: d549699048b4b5c22dd710455bcdb76966e55aa3
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
