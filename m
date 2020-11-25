Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D502C42B8
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 16:14:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F6A8C5662F;
	Wed, 25 Nov 2020 15:14:45 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02E56C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 15:03:53 +0000 (UTC)
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ch4014WkYzQksm;
 Wed, 25 Nov 2020 23:03:29 +0800 (CST)
Received: from [127.0.0.1] (10.57.36.170) by dggeme760-chm.china.huawei.com
 (10.3.19.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Wed, 25
 Nov 2020 23:03:47 +0800
To: Antonio Borneo <antonio.borneo@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 <netdev@vger.kernel.org>, Willy Liu <willy.liu@realtek.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124230756.887925-1-antonio.borneo@st.com>
From: Yonglong Liu <liuyonglong@huawei.com>
Message-ID: <d62710c3-7813-7506-f209-fcfa65931778@huawei.com>
Date: Wed, 25 Nov 2020 23:03:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20201124230756.887925-1-antonio.borneo@st.com>
Content-Language: en-US
X-Originating-IP: [10.57.36.170]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggeme760-chm.china.huawei.com (10.3.19.106)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 25 Nov 2020 15:14:43 +0000
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: phy: realtek: read
 actual speed on rtl8211f to detect downshift
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

Tested-by: Yonglong Liu <liuyonglong@huawei.com>

On 2020/11/25 7:07, Antonio Borneo wrote:
> The rtl8211f supports downshift and before commit 5502b218e001
> ("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")
> the read-back of register MII_CTRL1000 was used to detect the
> negotiated link speed.
> The code added in commit d445dff2df60 ("net: phy: realtek: read
> actual speed to detect downshift") is working fine also for this
> phy and it's trivial re-using it to restore the downshift
> detection on rtl8211f.
>
> Add the phy specific read_status() pointing to the existing
> function rtlgen_read_status().
>
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
> To: Willy Liu <willy.liu@realtek.com>
> Cc: linuxarm@huawei.com
> Cc: Salil Mehta <salil.mehta@huawei.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-kernel@vger.kernel.org
> In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>
>
> V1 => V2
> 	move from a generic implementation affecting every phy
> 	to a rtl8211f specific implementation
> V2 => V3
> 	rebase on netdev-next, resolving minor conflict after
> 	merge of 8b43357fff61
> ---
>   drivers/net/phy/realtek.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index f71eda945c6a..99ecd6c4c15a 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -729,6 +729,7 @@ static struct phy_driver realtek_drvs[] = {
>   		PHY_ID_MATCH_EXACT(0x001cc916),
>   		.name		= "RTL8211F Gigabit Ethernet",
>   		.config_init	= &rtl8211f_config_init,
> +		.read_status	= rtlgen_read_status,
>   		.config_intr	= &rtl8211f_config_intr,
>   		.handle_interrupt = rtl8211f_handle_interrupt,
>   		.suspend	= genphy_suspend,
>
> base-commit: 1d155dfdf50efc2b0793bce93c06d1a5b23d0877

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
