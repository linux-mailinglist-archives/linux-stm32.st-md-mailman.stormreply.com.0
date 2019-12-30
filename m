Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289712CBC1
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Dec 2019 02:58:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDCE0C36B0B;
	Mon, 30 Dec 2019 01:58:26 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5B2DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:58:25 +0000 (UTC)
X-UUID: 5b596ee3d2d14837b6ce8d059778b654-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/lpQkAv3iCwWOkWgJJE5MaCHaqTpfO0sf9t+VBFhKO0=; 
 b=GTjlAmp0bUzhzZ0gAq4CejELM4MMdAWNVRWicb93uz0IRUHzH073haBzaUpl//g5fxEa2dj1cjoWyuI5HBsDgCqp26l/bZNJ75FBrDDOTBbo3qPy3NnkMs1Y7JAWjeW0pCKN1FiiFXdPhWq1oxG9zVWIXCoTiFK7kpeAHjtlTQc=;
X-UUID: 5b596ee3d2d14837b6ce8d059778b654-20191230
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1975550861; Mon, 30 Dec 2019 09:58:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 09:57:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 09:58:42 +0800
Message-ID: <1577671100.8160.0.camel@mtksdaap41>
From: CK Hu <ck.hu@mediatek.com>
To: Yangtao Li <tiny.windzz@gmail.com>
Date: Mon, 30 Dec 2019 09:58:20 +0800
In-Reply-To: <20191228183538.26189-4-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-4-tiny.windzz@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, jassisinghbrar@gmail.com, jonathanh@nvidia.com,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, rjui@broadcom.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 lftan@altera.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 nios2-dev@lists.rocketboards.org, nsaenzjulienne@suse.de
Subject: Re: [Linux-stm32] [PATCH 04/13] mailbox: mediatek: cmdq: convert to
 devm_platform_ioremap_resource
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

Hi, Yangtao:

On Sat, 2019-12-28 at 18:35 +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9a6ce9f5a7db..7f9e34b021c8 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
>  static int cmdq_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct cmdq *cmdq;
>  	int err, i;
>  
> @@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
>  	if (!cmdq)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	cmdq->base = devm_ioremap_resource(dev, res);
> +	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(cmdq->base)) {
>  		dev_err(dev, "failed to ioremap gce\n");
>  		return PTR_ERR(cmdq->base);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
