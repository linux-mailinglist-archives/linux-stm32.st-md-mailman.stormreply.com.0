Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D941E366E5D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 16:38:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92025C58D5C;
	Wed, 21 Apr 2021 14:38:31 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4F7CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 14:38:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-279-E_LjFz9SPlSA_JZbVKloyw-1; Wed, 21 Apr 2021 15:38:28 +0100
X-MC-Unique: E_LjFz9SPlSA_JZbVKloyw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 21 Apr 2021 15:38:27 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 21 Apr 2021 15:38:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Thread-Topic: [PATCH] [net-next] net: stmmac: fix gcc-10 -Wrestrict warning
Thread-Index: AQHXNrT6fDpLRbOb4EudX81jJF2zvaq/CRyw
Date: Wed, 21 Apr 2021 14:38:27 +0000
Message-ID: <caa29114659049e584b9fa7fbb6226c8@AcuMS.aculab.com>
References: <20210421134743.3260921-1-arnd@kernel.org>
In-Reply-To: <20210421134743.3260921-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>,
 Fugang Duan <fugang.duan@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Voon
 Weifeng <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Thierry Reding <treding@nvidia.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] [net-next] net: stmmac: fix gcc-10
	-Wrestrict warning
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

From: Arnd Bergmann
> Sent: 21 April 2021 14:47
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-10 and later warn about a theoretical array overrun when
> accessing priv->int_name_rx_irq[i] with an out of bounds value
> of 'i':
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_request_irq_multi_msi':
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3528:17: error: 'snprintf' argument 4 may overlap
> destination object 'dev' [-Werror=restrict]
>  3528 |                 snprintf(int_name, int_name_len, "%s:%s-%d", dev->name, "tx", i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3404:60: note: destination object referenced by
> 'restrict'-qualified argument 1 was declared here
>  3404 | static int stmmac_request_irq_multi_msi(struct net_device *dev)
>       |                                         ~~~~~~~~~~~~~~~~~~~^~~
> 
> The warning is a bit strange since it's not actually about the array
> bounds but rather about possible string operations with overlapping
> arguments, but it's not technically wrong.
> 
> Avoid the warning by adding an extra bounds check.
> 
> Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d1ca07c846e6..aadac783687b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3498,6 +3498,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
> 
>  	/* Request Rx MSI irq */
>  	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
> +		if (i > MTL_MAX_RX_QUEUES)
> +			break;
>  		if (priv->rx_irq[i] == 0)
>  			continue;

It might be best to do:
	num_queues = min(priv->plat->rx_queues_to_use, MTL_MAX_RX_QUEUES);
	if (i = 0; i < num_queues; i++) {
		...

Or just give up - if rx_queues_to_use is too big it's all
gone horribly wrong already.

The compile must be smoking weed again.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
