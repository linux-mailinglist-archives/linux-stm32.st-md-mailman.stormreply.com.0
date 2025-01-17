Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8009FA17864
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 08:10:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06616C78F65;
	Tue, 21 Jan 2025 07:10:32 +0000 (UTC)
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45A84C78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 08:57:09 +0000 (UTC)
X-QQ-mid: Yeas8t1737104195t105t50410
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com
 [36.24.187.167])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 13642672395322382177
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>,
 "'Andrew Lunn'" <andrew@lunn.ch>,
 "'Heiner Kallweit'" <hkallweit1@gmail.com>, <mengyuanlou@net-swift.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
Date: Fri, 17 Jan 2025 16:56:34 +0800
Message-ID: <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJuuL6961zeRYLpn6fcQniPsxo8VLH0BglA
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NfPsrf/HTJYA0FB+FKFb+twO+nReN9JwUckHktUCQiiqU8jhsDc10wky
 XT22GKLtNkX1+oGYVbKqm/GtNzNKMQhsR6BE1DEGtmIvHVp2kw+5KFzzq1ch9VFT/xDcZxM
 MDoPayJKQRfMQBts7Shr8bFBTl6mXgLEIgQcd4ZrrofFLnbJD+xRjqKXHfrtBF757+QBRbc
 SLLfhMGyvlHNL8YdDxyGRf3aCZkaN6BwZTi11pk3cC6n+HqND/nOCeiXO8AYoZlIUA2WgmL
 xBWPhpJNb8Wj38o+7APUvlx5iX9qKi5G4dQZNaWA8fKmxuJOFma3L2yTbq+IdHEW5F9Ft49
 tP6M+ICnSqRdRhMlVZyvJTIFHJ6g9xun5WDT+xvkJMCs9GG2UiAQuErGNI+78B8X4/hepEl
 vPeYOlcQUOcXM5bhRpXTahXyfmDu9OgyiD1Y8ynPJxeCE+tm/oxurjeORusHO5t+vRWliUD
 3pRyxrtfVzt0ORvDfS6SOH8FJb0k8x0oO1XoMsdPIn1NH02x4gZVsU03QwCoSHlbYEkoOPf
 tjiD5QvoWCD1NfJAi1XW0NBFVKssLEkb6Y/rjmoRoNifFipFOfZy5P8ecTXVbR8yLw6iErN
 mO+dQktVBtxSdspY7nSfehSafxTghd4FICZ/oShxC+pQPfQ41jAjOHhQ2loQ/wlGkblPdMd
 EWZTKWtd45gkM9qTFbRWOOiQ9Gxy4qCHq7pgFAM6xIK01fb6QTBZKDSr8VT9hIG8Q38ZXef
 JPw7a9siCy4bPrarGgorATuqmoDHkHQGP3GqRpUaDQvp2GJAAkZccBr33civBy9kJQvqLaT
 1DHC4rY61pwa4lsthufv5B0GgX3PgNNzZaiahcxzT+4z4Z5r8R5tRLjQoSwGGBANWgZUz4X
 LTfSx6NgiXbeIxpJZ96QBc/hbSO50jT2LKtYZWUDnU1aUmwhpDh8v6of3XTf1a8kz2lvD4C
 ibm61ao7eaRLeweSGx28KvoS5q+lyXCkRLDFT+SeKntEZZBfz3Kj0ANPW2GfmOaRqzSM=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Tue, 21 Jan 2025 07:10:30 +0000
Cc: 'Marcin Wojtas' <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 'Bryan Whitehead' <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 'Andrew Lunn' <andrew+netdev@lunn.ch>, 'Eric Dumazet' <edumazet@google.com>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 'Jakub Kicinski' <kuba@kernel.org>, 'Paolo Abeni' <pabeni@redhat.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: add phylink managed EEE
	support
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

> Hi,
> 
> Adding managed EEE support to phylink has been on the cards ever since
> the idea in phylib was mooted. This overly large series attempts to do
> so. I've included all the patches as it's important to get the driver
> patches out there.
> 
> Patch 1 adds a definition for the clock stop capable bit in the PCS
> MMD status register.
> 
> Patch 2 adds a phylib API to query whether the PHY allows the transmit
> xMII clock to be stopped while in LPI mode. This capability is for MAC
> drivers to save power when LPI is active, to allow them to stop their
> transmit clock.
> 
> Patch 3 extracts a phylink internal helper for determining whether the
> link is up.
> 
> Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
> added, to enable and disable LPI. The enable method is passed the LPI
> timer setting which it is expected to program into the hardware, and
> also a flag ehther the transmit clock should be stopped.
> 
> I have taken the decision to make enable_tx_lpi() to return an error
> code, but not do much with it other than report it - the intention
> being that we can later use it to extend functionality if needed
> without reworking loads of drivers.
> 
> I have also dropped the validation/limitation of the LPI timer, and
> left that in the driver code prior to calling phylink_ethtool_set_eee().
> 
> The remainder of the patches convert mvneta, lan743x and stmmac, and
> add support for mvneta.
> 
> Since yesterday's RFC:
> - fixed the mvpp2 GENMASK()
> - dropped the DSA patch
> - changed how phylink restricts EEE advertisement, and the EEE support
>   reported to userspace which fixes a bug.
> 
>  drivers/net/ethernet/marvell/mvneta.c             | 107 ++++++++++------
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h        |   5 +
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   |  86 +++++++++++++
>  drivers/net/ethernet/microchip/lan743x_ethtool.c  |  21 ---
>  drivers/net/ethernet/microchip/lan743x_main.c     |  46 ++++++-
>  drivers/net/ethernet/microchip/lan743x_main.h     |   1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  57 +++++++--
>  drivers/net/phy/phy.c                             |  20 +++
>  drivers/net/phy/phylink.c                         | 149 ++++++++++++++++++++--
>  include/linux/phy.h                               |   1 +
>  include/linux/phylink.h                           |  45 +++++++
>  include/uapi/linux/mdio.h                         |   1 +
>  12 files changed, 446 insertions(+), 93 deletions(-)

Hi Russell,

Since merging these patches, phylink_connect_phy() can no longer be
invoked correctly in ngbe_open(). The error is returned from the function
phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.

How should I modify the ngbe driver to meet this change?

Thanks.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
