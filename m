Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF202AE98D6
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 10:47:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48532C30883;
	Thu, 26 Jun 2025 08:47:01 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B1FBC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 08:47:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8QZdB017581;
 Thu, 26 Jun 2025 10:46:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Z+WFXiMHrbFi5myLnpSlkgNB4wfedeybYq3HvVadoNA=; b=ROmOa28CQ7QT6T4H
 yPb/toDBTMiHFUjR2+NHvFgYqxbMb4ItBsUhGpA160WrKh5Imb6EsR3pdlGHFqS5
 rGr5q5tf/+OmXSkGai+RNE4CoY3jSGZbuto/YWLTBLmDeBUrWQfdPHdHrZ7gEovO
 hdeopXmpdQ0I7ZUUL8pHhBRRMcl6YEIavXVeB+m29jLjO2dx5IhN+nK2g0g8SqUW
 8n0fsBVvGlf3RlnPFeGohawRwglMHedkzO2L5w2QAUdEncQidvHH8dAdi+9Lgmz/
 sPeSXpqTxr0LKVcgJZc7uuGFWPbOpd0nRst8hImbh3tihedqUAW1aOFluWLA1M+7
 I+olow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7ppjvwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 10:46:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 460384002D;
 Thu, 26 Jun 2025 10:44:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8048DB288A0;
 Thu, 26 Jun 2025 10:43:58 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:43:57 +0200
Date: Thu, 26 Jun 2025 10:43:56 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250626084356.GB348766@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
 <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
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
Subject: Re: [Linux-stm32] [PATCH 1/3] i2c: stm32: fix the device used for
	the DMA map
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

Oups, I was too fast.

there might be another place to correct in the driver, dma_unmap_single
within the error handling of the function stm32_i2c_prep_dma_xfer.

   err:
            dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
                             dma->dma_data_dir);

Could you also correct this one as well ?

Alain


On Thu, Jun 26, 2025 at 10:37:51AM +0200, Alain Volmat wrote:
> Hi Cl=E9ment,
> =

> On Mon, Jun 16, 2025 at 10:53:54AM +0200, Cl=E9ment Le Goffic wrote:
> > If the DMA mapping failed, it produced an error log with the wrong
> > device name:
> > "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memor=
y"
> > Fix this issue by replacing the dev with the I2C dev.
> =

> Indeed, nice catch ! Thanks a lot !
> =

> > =

> > Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> > Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> > ---
> >  drivers/i2c/busses/i2c-stm32.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-st=
m32.c
> > index 157c64e27d0b..5e0b31aed774 100644
> > --- a/drivers/i2c/busses/i2c-stm32.c
> > +++ b/drivers/i2c/busses/i2c-stm32.c
> > @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, str=
uct stm32_i2c_dma *dma,
> >  	dma->dma_len =3D len;
> >  	chan_dev =3D dma->chan_using->device->dev;
> >  =

> > -	dma->dma_buf =3D dma_map_single(chan_dev, buf, dma->dma_len,
> > +	dma->dma_buf =3D dma_map_single(dev, buf, dma->dma_len,
> >  				      dma->dma_data_dir);
> >  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
> >  		dev_err(dev, "DMA mapping failed\n");
> > =

> > -- =

> > 2.43.0
> >
> =

> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> =

> Regards,
> Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
