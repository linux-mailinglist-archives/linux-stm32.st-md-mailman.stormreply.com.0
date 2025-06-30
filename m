Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E91AED633
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 09:54:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 384ADC32E8F;
	Mon, 30 Jun 2025 07:54:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EC1FC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 07:54:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7PgYh007537;
 Mon, 30 Jun 2025 09:53:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wU4b/pQnY6PfcV136ZndGUeB/WVMZpBJ2uNidSqaKfU=; b=XlvFYBUJ8zEm1NxJ
 yzZ22zCKffPVgXkJ+VhVlfnzkcGwKwp2RXG6msNcfNt2RVkLFqgImggp5Xlrt26D
 AAusboM74tBSL59bIRlaaKwv0Sfkcg8VkLEvrmAxz64MGRl+QSrgxa+qWjQ/ZeTU
 ooDY7Ts9YmirFsH+Yr6SXInWj3RmQwqUDQCwgiul0n5DaIY1SwkWGjxJBOmYkmCN
 tHuwSanEJJ7Otem91wMMGH8SzYzVRFn+FkXKr5nPbtjq9fa5lF81lRcpLD8+u9Ug
 G7ax+VAlGFCfr2vlRecVN1KxRKqBS2lzAp2HzGz0M839Tqt4kA9hMgF8iqCBeRqw
 gSkRxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4ku6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 09:53:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 62F6840054;
 Mon, 30 Jun 2025 09:52:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 000385C2DE5;
 Mon, 30 Jun 2025 09:51:40 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 09:51:40 +0200
Date: Mon, 30 Jun 2025 09:51:38 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250630075138.GB396213@gnbcxd0016.gnb.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
 <20250627-i2c-upstream-v2-2-8c14523481dc@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-i2c-upstream-v2-2-8c14523481dc@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
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
Subject: Re: [Linux-stm32] [PATCH v2 2/3] i2c: stm32f7: unmap DMA mapped
	buffer
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

Hello Cl=E9ment,

On Fri, Jun 27, 2025 at 12:12:57PM +0200, Cl=E9ment Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.
> =

> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index e4aaeb2262d0..042386b4cabe 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(stru=
ct stm32f7_i2c_dev *i2c_dev,
>  	if (i2c_dev->use_dma) {
>  		stm32f7_i2c_disable_dma_req(i2c_dev);
>  		dmaengine_terminate_async(dma->chan_using);
> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
>  	}
>  =

>  	i2c_dev->master_mode =3D false;
> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result =3D -ENXIO;
>  	}
> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);
>  				f7_msg->result =3D -ETIMEDOUT;
>  			}
>  		}
> =


Thanks for the update. Looks good to me.

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
