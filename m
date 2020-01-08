Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C5133E84
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 10:46:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38910C36B0B;
	Wed,  8 Jan 2020 09:46:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7982DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 09:43:07 +0000 (UTC)
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr
 [90.65.102.129]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A72C020007;
 Wed,  8 Jan 2020 09:43:04 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Yangtao Li <tiny.windzz@gmail.com>, jassisinghbrar@gmail.com,
 nsaenzjulienne@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org
In-Reply-To: <20191228183538.26189-13-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-13-tiny.windzz@gmail.com>
Date: Wed, 08 Jan 2020 10:43:04 +0100
Message-ID: <87imlmb7x3.fsf@FE-laptop>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 09:46:55 +0000
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 13/13] mailbox: armada-37xx-rwtm: convert
	to devm_platform_ioremap_resource
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

Hi Yangtao Li,

> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Applied on mvebu/drivers

Thanks,

Gregory

> ---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> index 19f086716dc5..02b7b28e6969 100644
> --- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> +++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> @@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
>  static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  {
>  	struct a37xx_mbox *mbox;
> -	struct resource *regs;
>  	struct mbox_chan *chans;
>  	int ret;
>  
> @@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  	if (!chans)
>  		return -ENOMEM;
>  
> -	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base)) {
>  		dev_err(&pdev->dev, "ioremap failed\n");
>  		return PTR_ERR(mbox->base);
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
