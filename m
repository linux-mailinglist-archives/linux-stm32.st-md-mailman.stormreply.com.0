Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0152641F2
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 11:30:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81C71C3FAFE;
	Thu, 10 Sep 2020 09:30:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6315C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 09:30:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A9RTiE023463; Thu, 10 Sep 2020 11:30:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=xox1I5UO1epX6kVCHl56hmhohy3ktvgmviCBxGkTYTw=;
 b=Xeu5Vifb09dvU1eQoeEA5oOjNqaX8QtkfXjZkubfzpNV8+pwJ5RmvXeMI/3ZcmCZflSH
 LX8jlHQAwMGWpPnV6ECxIOTh8vdAoKLNAeeKJc2A9Xo+1ZkUrI5BsDKsOAN7y9wKG/74
 mZkEL7EfvRWHRKlND6RQBGrtdpt2s2yZyAyGNflG7+P2Cpb9oxa0+h5K7RwfffSyhNny
 /CBM+SIosSU/InH0JRN8z1JOEyznG7cc5H5t2QsDPuMLopQanCM2OrVZytUVFRvT71U3
 ARySzXTps8PN8Cp5scitbQ24ACfmDxUqLGLgsvT/xyiZd2dnedA5A4uSHXL1QO/MhcbS qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfaju0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:30:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B298010002A;
 Thu, 10 Sep 2020 11:30:23 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C807220AD7;
 Thu, 10 Sep 2020 11:30:23 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 11:30:22 +0200
Date: Thu, 10 Sep 2020 11:30:19 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Holger Assmann <h.assmann@pengutronix.de>
Message-ID: <20200910093019.GA1975@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Holger Assmann <h.assmann@pengutronix.de>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Wolfram Sang <wsa@kernel.org>,
 Etienne CARRIERE <etienne.carriere@st.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200814141355.3816-1-h.assmann@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814141355.3816-1-h.assmann@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
Cc: Etienne CARRIERE <etienne.carriere@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: remove unnecessary DMA kernel
	error log
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

Hi Holger,

Thanks for your patch.
there is an ongoing tree wide action to update all those common pattern
of checking for the -EPROBE_DEFER.

I thus propose, to first integrate the patch [i2c: stm32: Simplify with dev_err_probe()] that has been proposed few days ago, and on top of that add an
additional patch to check for the -ENODEV error case due to DMA being
optional.

I've prepared a patch for that and will post it now, could you consider it ?

Alain

On Fri, Aug 14, 2020 at 02:13:55PM +0000, Holger Assmann wrote:
> We currently print errors twice when there is an actual error
> when requesting a DMA channel, once in stm32f7_i2c_probe()
> when stm32_i2c_dma_request() fails and once more in
> stm32_i2c_dma_request() itself. stm32_i2c_dma_request() is only
> called from stm32f7_i2c_probe(), so we could drop the duplicate
> error message.
> 
> This has the effect that we no longer warn about absence of a
> DMA channel. This is intended as it is not mandatory for the
> i2c-stm32 devices to have DMA enabled.  Also, the overall number
> of DMA channels on the STM32 is limited and has to be shared
> with other peripherals. This may lead to DMA being intentionally
> off for specific devices.
> 
> This patch removes the unnecessary error message.
> 
> Fixes: e07a89775c71 ("i2c: stm32: don't print an error on probe deferral")
> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-stm32.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 3f69a3bb6119..cc05a4202559 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -26,8 +26,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	dma->chan_tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
>  		ret = PTR_ERR(dma->chan_tx);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "can't request DMA tx channel\n");
>  		goto fail_al;
>  	}
>  
> @@ -46,9 +44,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	dma->chan_rx = dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
>  		ret = PTR_ERR(dma->chan_rx);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "can't request DMA rx channel\n");
> -
>  		goto fail_tx;
>  	}
>  
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
