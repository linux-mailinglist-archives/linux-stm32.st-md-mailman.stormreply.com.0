Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561EAE9B88
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 12:35:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FDC6C36B2D;
	Thu, 26 Jun 2025 10:35:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC105C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 10:35:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA9QY8025602;
 Thu, 26 Jun 2025 12:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NV4+KoQwrrIsbeLEb3se8T07/pyaJ/I/7ykprHiqctM=; b=CXa2JDHB4uTNEMai
 2f9NWHp3xztyJ3Y6ituNRm8BfaNOHQDmcwn1mnLUaoppY3rpexlzw5toG7Yzc9Ci
 JKp9PsrWevNASEoRdbIBLdiOMsFJDxfmn0VOZOelEX57qfqL/YTOVrrSQo7TqpOp
 XFQULhMnRqcIJxyRqxAagjgJLDICpsnsdxnqBKpzhekKrxCHVoqgelkfI7OSfqh4
 U9rIhzGVL75BA+IScVOGJS3qirFCX0VVC2gBnnmLwS0h0j54WJv8vIX3I1OKfBmj
 CHPz1w0S+YKt+JKt67MkWXnKCu3uI7YwBnWLZ/dDXhh5JKuFkXjjgNYRjh+mHfVN
 u8Prkw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbx1rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 12:35:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B0064002D;
 Thu, 26 Jun 2025 12:33:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8967DB63201;
 Thu, 26 Jun 2025 12:33:03 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 12:33:02 +0200
Date: Thu, 26 Jun 2025 12:32:57 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250626103257.GA349896@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-3-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616-i2c-upstream-v1-3-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] i2c: stm32f7: support
	i2c_*_dma_safe_msg_buf APIs
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Cl=E9ment,

thanks for the patch.

On Mon, Jun 16, 2025 at 10:53:56AM +0200, Cl=E9ment Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 36 +++++++++++++++++++++++++---------=
--
>  1 file changed, 25 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index a05cac5ee9db..5be14c8a2af4 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -742,9 +742,12 @@ static void stm32f7_i2c_dma_callback(void *arg)
>  	struct stm32f7_i2c_dev *i2c_dev =3D (struct stm32f7_i2c_dev *)arg;
>  	struct stm32_i2c_dma *dma =3D i2c_dev->dma;
>  	struct device *dev =3D dma->chan_using->device->dev;
> +	struct stm32f7_i2c_msg *f7_msg =3D &i2c_dev->f7_msg;
>  =

>  	stm32f7_i2c_disable_dma_req(i2c_dev);
>  	dma_unmap_single(dev, dma->dma_buf, dma->dma_len, dma->dma_data_dir);
> +	if (!f7_msg->smbus)
> +		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
>  	complete(&dma->dma_complete);
>  }
>  =

> @@ -880,6 +883,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_d=
ev *i2c_dev,
>  {
>  	struct stm32f7_i2c_msg *f7_msg =3D &i2c_dev->f7_msg;
>  	void __iomem *base =3D i2c_dev->base;
> +	u8 *dma_buf;
>  	u32 cr1, cr2;
>  	int ret;
>  =

> @@ -929,17 +933,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c=
_dev *i2c_dev,
>  =

>  	/* Configure DMA or enable RX/TX interrupt */
>  	i2c_dev->use_dma =3D false;
> -	if (i2c_dev->dma && f7_msg->count >=3D STM32F7_I2C_DMA_LEN_MIN
> -	    && !i2c_dev->atomic) {
> -		ret =3D stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma =3D true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> +	if (i2c_dev->dma && !i2c_dev->atomic) {
> +		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
> +		if (dma_buf) {
> +			f7_msg->buf =3D dma_buf;
> +			ret =3D stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +						      msg->flags & I2C_M_RD,
> +						      f7_msg->count, f7_msg->buf,
> +						      stm32f7_i2c_dma_callback,
> +						      i2c_dev);
> +			if (ret) {
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
> +				f7_msg->buf =3D msg->buf;
> +			} else {
> +				i2c_dev->use_dma =3D true;
> +			}
> +		}
>  	}
>  =

>  	if (!i2c_dev->use_dma) {
> @@ -1624,6 +1634,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  			dmaengine_terminate_async(dma->chan_using);
>  			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  					 dma->dma_data_dir);
> +			if (!f7_msg->smbus)
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  		}
>  		f7_msg->result =3D -ENXIO;
>  	}
> @@ -1646,6 +1658,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  				dmaengine_terminate_async(dma->chan_using);
>  				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  						 dma->dma_data_dir);
> +				if (!f7_msg->smbus)
> +					i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  				f7_msg->result =3D -ETIMEDOUT;
>  			}
>  		}
> =


Looks good to me.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
