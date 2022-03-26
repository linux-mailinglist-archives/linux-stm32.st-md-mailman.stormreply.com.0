Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 410234E800C
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Mar 2022 09:41:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E754BC6046B;
	Sat, 26 Mar 2022 08:41:35 +0000 (UTC)
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161D5C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Mar 2022 08:41:34 +0000 (UTC)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru DA04E20A8247
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
Date: Sat, 26 Mar 2022 11:41:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 5/5] pinctrl: armada-37xx: Replace
 custom code by gpiochip_count() call
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

Hello!

On 3/25/22 11:03 PM, Andy Shevchenko wrote:

> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 24 +++++++++------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 08cad14042e2..ba94125f6566 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -728,22 +728,18 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  	struct gpio_irq_chip *girq = &gc->irq;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
> -	int ret = -ENODEV, i, nr_irq_parent;
> +	unsigned int nr_child_nodes, i;
> +	int ret;
>  
>  	/* Check if we have at least one gpio-controller child node */
> -	for_each_child_of_node(dev->of_node, np) {
> -		if (of_property_read_bool(np, "gpio-controller")) {
> -			ret = 0;
> -			break;
> -		}
> -	}
> -	if (ret)
> -		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
> +	nr_child_nodes = gpiochip_count(dev);
> +	if (!nr_child_nodes)
> +		return dev_err_probe(dev, -ENODEV, "no gpio-controller child node\n");
>  
> -	nr_irq_parent = of_irq_count(np);
>  	spin_lock_init(&info->irq_lock);
>  
> -	if (!nr_irq_parent) {
> +	nr_child_nodes = of_irq_count(np);

   Mhm, 'np' is no longer assigned to at this point...

> +	if (!nr_child_nodes) {
>  		dev_err(dev, "invalid or no IRQ\n");
>  		return 0;
>  	}
[...]

MBR, Sergey
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
