Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43469962744
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 14:38:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E23EBC6C855;
	Wed, 28 Aug 2024 12:38:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17EF2C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 12:37:54 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wv3l016Drz6H7RN;
 Wed, 28 Aug 2024 20:34:36 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 5A9B7140447;
 Wed, 28 Aug 2024 20:37:52 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 13:37:51 +0100
Date: Wed, 28 Aug 2024 13:37:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <20240828133750.00007963@Huawei.com>
In-Reply-To: <20240828032343.1218749-5-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-5-ruanjinjie@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: andrew@lunn.ch, linus.walleij@linaro.org, justin.chen@broadcom.com,
 edumazet@google.com, krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 04/13] net: dsa: realtek: Use
 __free() to simplify code
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

On Wed, 28 Aug 2024 11:23:34 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Avoid need to manually handle of_node_put() by using __free(), which
> can simplfy code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
One suggestion inline.

> ---
> v2
> - Split into 2 patches.
> ---
>  drivers/net/dsa/realtek/rtl8366rb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/realtek/rtl8366rb.c b/drivers/net/dsa/realtek/rtl8366rb.c
> index 7001b8b1c028..0acdcdd93ea2 100644
> --- a/drivers/net/dsa/realtek/rtl8366rb.c
> +++ b/drivers/net/dsa/realtek/rtl8366rb.c
> @@ -1009,7 +1009,6 @@ static int rtl8366rb_setup_all_leds_off(struct realtek_priv *priv)
>  
>  static int rtl8366rb_setup_leds(struct realtek_priv *priv)
>  {
> -	struct device_node *leds_np;
>  	struct dsa_switch *ds = &priv->ds;
>  	struct dsa_port *dp;
>  	int ret = 0;
> @@ -1018,7 +1017,8 @@ static int rtl8366rb_setup_leds(struct realtek_priv *priv)
>  		if (!dp->dn)
>  			continue;
>  
> -		leds_np = of_get_child_by_name(dp->dn, "leds");
> +		struct device_node *leds_np __free(device_node) =
> +			of_get_child_by_name(dp->dn, "leds");
>  		if (!leds_np) {
>  			dev_dbg(priv->dev, "No leds defined for port %d",
>  				dp->index);
> @@ -1032,7 +1032,6 @@ static int rtl8366rb_setup_leds(struct realtek_priv *priv)
>  				break;
>  		}
>  
> -		of_node_put(leds_np);
>  		if (ret)
>  			return ret;

Move this return up to the only place it can come from which is
inside the loop where the break is.

You can then avoid initializing ret and indeed could bring it's
scope into the loop

		for_each_child_of_node(leds_np, led_np) {
			int ret = rtl8366rb_setup_led(priv, dp,
						      of_fwnode_handle(led_np));
			if (ret)
				return ret;
		}	

>  	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
