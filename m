Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E401A2A2B42
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 14:11:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2349C36B35;
	Mon,  2 Nov 2020 13:11:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06A0EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 13:11:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2D7b50013804; Mon, 2 Nov 2020 14:11:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3HdWeV86WFx+GNisUbqL+zoSdGCvnlJejFltoMy+vQU=;
 b=SRrw2FLjkvhTEkZ8bIGQ3gOHbhUje9oibhSup1WRLMzuu3cH4W7PetjFjlaXv4NqgK1s
 psTvk2hhdmxxn5k0PqQ4tZfuEBGS5046vAMS6Wh0tuSrC/Kgzb7O8Hqe+bt3O5XkN81Q
 2pQrxNON6XgVNMPbgozIyYChuAeJCRTLr7niEUAimNhwUiw0kfhpgZ4ol93rYn+F53F2
 IHDVRGa4IERGzSbNdIAJHl+lxCeZ1Ij6orFytzJzvhJh6N9xn/TCp/m9XKfrGAFURBa1
 f0lNjKVZCY1B4ns5116jL4g0027G10r2KwfaAkmtpUS1gkK9NBmBOhmQzbHwhMztNY6/ dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqjs82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 14:11:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2666010002A;
 Mon,  2 Nov 2020 14:11:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 180102B4D0F;
 Mon,  2 Nov 2020 14:11:41 +0100 (CET)
Received: from SFHDAG1NODE3.st.com (10.75.127.3) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 14:11:40 +0100
Received: from SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d]) by
 SFHDAG1NODE3.st.com ([fe80::ad8b:a44d:504a:670d%20]) with mapi id
 15.00.1473.003; Mon, 2 Nov 2020 14:11:40 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Martin Kaiser <martin@kaiser.cx>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH v2 3/3] mailbox: stm32-ipcc: cast void pointers to
 unsigned long
Thread-Index: AQHWsGW/jAuCDkDpAEiDXEawNcFXqam0wcUA
Date: Mon, 2 Nov 2020 13:11:40 +0000
Message-ID: <948c95e9-dcaa-fde7-05ca-e8587180f57e@st.com>
References: <20201024133154.22767-1-martin@kaiser.cx>
 <20201101154231.14250-1-martin@kaiser.cx>
 <20201101154231.14250-3-martin@kaiser.cx>
In-Reply-To: <20201101154231.14250-3-martin@kaiser.cx>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <BCBF61D4304480408F28CAC457EC1AD9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_07:2020-11-02,
 2020-11-02 signatures=0
Cc: kernel test robot <lkp@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] mailbox: stm32-ipcc: cast void
 pointers to unsigned long
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

Hi Martin


Thank you for the patch.


Fabien


On 01/11/2020 4:42 pm, Martin Kaiser wrote:
> Now that the driver can be enabled by COMPILE_TEST, we see warnings on
> 64bit platforms when void pointers are cast to unsigned int (and
> vice versa).
>
> warning: cast to smaller integer type 'unsigned int' from 'void *'
>             unsigned int chan = (unsigned int)link->con_priv;
> ...
> warning: cast to 'void *' from smaller integer type 'unsigned int'
>             ipcc->controller.chans[i].con_priv = (void *)i;
>
> Update these casts to use unsigned long variables, which are the same
> size as pointers on all platforms.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>


Reviewed-by: Fabien Dessenne<fabien.dessenne@st.com>


> ---
> changes in v2
> - added this patch to fix COMPILE_TEST warnings
>
>   drivers/mailbox/stm32-ipcc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index ab8fe56af948..b84e0587937c 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -144,11 +144,11 @@ static irqreturn_t stm32_ipcc_tx_irq(int irq, void *data)
>   
>   static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
>   {
> -	unsigned int chan = (unsigned int)link->con_priv;
> +	unsigned long chan = (unsigned long)link->con_priv;
>   	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
>   					       controller);
>   
> -	dev_dbg(ipcc->controller.dev, "%s: chan:%d\n", __func__, chan);
> +	dev_dbg(ipcc->controller.dev, "%s: chan:%lu\n", __func__, chan);
>   
>   	/* set channel n occupied */
>   	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
> @@ -163,7 +163,7 @@ static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
>   
>   static int stm32_ipcc_startup(struct mbox_chan *link)
>   {
> -	unsigned int chan = (unsigned int)link->con_priv;
> +	unsigned long chan = (unsigned long)link->con_priv;
>   	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
>   					       controller);
>   	int ret;
> @@ -183,7 +183,7 @@ static int stm32_ipcc_startup(struct mbox_chan *link)
>   
>   static void stm32_ipcc_shutdown(struct mbox_chan *link)
>   {
> -	unsigned int chan = (unsigned int)link->con_priv;
> +	unsigned long chan = (unsigned long)link->con_priv;
>   	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
>   					       controller);
>   
> @@ -206,7 +206,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	struct stm32_ipcc *ipcc;
>   	struct resource *res;
> -	unsigned int i;
> +	unsigned long i;
>   	int ret;
>   	u32 ip_ver;
>   	static const char * const irq_name[] = {"rx", "tx"};
> @@ -265,7 +265,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   						irq_thread[i], IRQF_ONESHOT,
>   						dev_name(dev), ipcc);
>   		if (ret) {
> -			dev_err(dev, "failed to request irq %d (%d)\n", i, ret);
> +			dev_err(dev, "failed to request irq %lu (%d)\n", i, ret);
>   			goto err_clk;
>   		}
>   	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
