Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 292222761D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 08:40:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82372C6EB0C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 06:40:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85B00C6333D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 06:40:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4N6W1if012749; Thu, 23 May 2019 08:39:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ho0xlKX03HhiHuuMo5Fyh6gxLhNZqkg4on/Piy7I8/k=;
 b=AzI25pdKMW2AjCHGniSJK4KsArt6w16MeGtqNv6ySWJN2y0Ga0RgV0gy8isVaQha347W
 n4ULpsYM+oEedpcpSY4Rl+bGtGcT3yLYp66/J7BZQjPur1ovG2hA2mgDkhrbTO/P3doy
 mt0kdlnD4Y1KZxOW0q+eLLlJCRQcMCDPF3XRG5vc07okdJAsEsGvXXgfLmraX2JjB1Fp
 JD8q79MZieR23MMkiXznPys1uVASw4p2yhHODeAqpZGAuQ5JWdrVERKhQ8U8eb/XoUU1
 Q2VTIVzkW1W718PwZNueBENTv//afmBYzun3loTA5DIQyrpACZB/pWokAWKgGAbiq2n3 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7tucwk2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 23 May 2019 08:39:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB7B034;
 Thu, 23 May 2019 06:39:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B933614C9;
 Thu, 23 May 2019 06:39:56 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 May
 2019 08:39:56 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Thu, 23 May 2019 08:39:56 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
Thread-Topic: [PATCH] mailbox: stm32_ipcc: add spinlock to fix channels
 concurrent access
Thread-Index: AQHVEHf3zLD2dpF4NEGX8BuhDUErpqZ4IjCA
Date: Thu, 23 May 2019 06:39:56 +0000
Message-ID: <7a0352eb-41ea-4d81-4a22-ba9df2c72148@st.com>
References: <1558513535-16736-1-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1558513535-16736-1-git-send-email-arnaud.pouliquen@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <12B83101779F314AADBBE24BC168E7AC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-23_06:, , signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mailbox: stm32_ipcc: add spinlock to fix
 channels concurrent access
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

Hi Arnaud,


Thank you for the patch.


On 22/05/2019 10:25 AM, Arnaud Pouliquen wrote:
> Add spinlock protection on IPCC register update to avoid race condition.
> Without this fix, stm32_ipcc_set_bits and stm32_ipcc_clr_bits can be
> called in parallel for different channels. This results in register
> corruptions.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Reviewed-by: Fabien Dessenne <fabien.dessenne@st.com>


> ---
>   drivers/mailbox/stm32-ipcc.c | 37 +++++++++++++++++++++++++++----------
>   1 file changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index f91dfb1327c7..5c2d1e1f988b 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -50,6 +50,7 @@ struct stm32_ipcc {
>   	void __iomem *reg_base;
>   	void __iomem *reg_proc;
>   	struct clk *clk;
> +	spinlock_t lock; /* protect access to IPCC registers */
>   	int irqs[IPCC_IRQ_NUM];
>   	int wkp;
>   	u32 proc_id;
> @@ -58,14 +59,24 @@ struct stm32_ipcc {
>   	u32 xmr;
>   };
>   
> -static inline void stm32_ipcc_set_bits(void __iomem *reg, u32 mask)
> +static inline void stm32_ipcc_set_bits(spinlock_t *lock, void __iomem *reg,
> +				       u32 mask)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(lock, flags);
>   	writel_relaxed(readl_relaxed(reg) | mask, reg);
> +	spin_unlock_irqrestore(lock, flags);
>   }
>   
> -static inline void stm32_ipcc_clr_bits(void __iomem *reg, u32 mask)
> +static inline void stm32_ipcc_clr_bits(spinlock_t *lock, void __iomem *reg,
> +				       u32 mask)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(lock, flags);
>   	writel_relaxed(readl_relaxed(reg) & ~mask, reg);
> +	spin_unlock_irqrestore(lock, flags);
>   }
>   
>   static irqreturn_t stm32_ipcc_rx_irq(int irq, void *data)
> @@ -92,7 +103,7 @@ static irqreturn_t stm32_ipcc_rx_irq(int irq, void *data)
>   
>   		mbox_chan_received_data(&ipcc->controller.chans[chan], NULL);
>   
> -		stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XSCR,
> +		stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
>   				    RX_BIT_CHAN(chan));
>   
>   		ret = IRQ_HANDLED;
> @@ -121,7 +132,7 @@ static irqreturn_t stm32_ipcc_tx_irq(int irq, void *data)
>   		dev_dbg(dev, "%s: chan:%d tx\n", __func__, chan);
>   
>   		/* mask 'tx channel free' interrupt */
> -		stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
> +		stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
>   				    TX_BIT_CHAN(chan));
>   
>   		mbox_chan_txdone(&ipcc->controller.chans[chan], 0);
> @@ -141,10 +152,12 @@ static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
>   	dev_dbg(ipcc->controller.dev, "%s: chan:%d\n", __func__, chan);
>   
>   	/* set channel n occupied */
> -	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XSCR, TX_BIT_CHAN(chan));
> +	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
> +			    TX_BIT_CHAN(chan));
>   
>   	/* unmask 'tx channel free' interrupt */
> -	stm32_ipcc_clr_bits(ipcc->reg_proc + IPCC_XMR, TX_BIT_CHAN(chan));
> +	stm32_ipcc_clr_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
> +			    TX_BIT_CHAN(chan));
>   
>   	return 0;
>   }
> @@ -163,7 +176,8 @@ static int stm32_ipcc_startup(struct mbox_chan *link)
>   	}
>   
>   	/* unmask 'rx channel occupied' interrupt */
> -	stm32_ipcc_clr_bits(ipcc->reg_proc + IPCC_XMR, RX_BIT_CHAN(chan));
> +	stm32_ipcc_clr_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
> +			    RX_BIT_CHAN(chan));
>   
>   	return 0;
>   }
> @@ -175,7 +189,7 @@ static void stm32_ipcc_shutdown(struct mbox_chan *link)
>   					       controller);
>   
>   	/* mask rx/tx interrupt */
> -	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
> +	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
>   			    RX_BIT_CHAN(chan) | TX_BIT_CHAN(chan));
>   
>   	clk_disable_unprepare(ipcc->clk);
> @@ -208,6 +222,8 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	if (!ipcc)
>   		return -ENOMEM;
>   
> +	spin_lock_init(&ipcc->lock);
> +
>   	/* proc_id */
>   	if (of_property_read_u32(np, "st,proc-id", &ipcc->proc_id)) {
>   		dev_err(dev, "Missing st,proc-id\n");
> @@ -259,9 +275,10 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	}
>   
>   	/* mask and enable rx/tx irq */
> -	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
> +	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
>   			    RX_BIT_MASK | TX_BIT_MASK);
> -	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XCR, XCR_RXOIE | XCR_TXOIE);
> +	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XCR,
> +			    XCR_RXOIE | XCR_TXOIE);
>   
>   	/* wakeup */
>   	if (of_property_read_bool(np, "wakeup-source")) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
