Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5476BD685
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 17:59:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0FCDC6904C;
	Thu, 16 Mar 2023 16:59:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B5A7C65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 12:57:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GCPAKF025396; Thu, 16 Mar 2023 13:57:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=O4MdXESRMuHAJnY5G9urN+vgVaPGITnoAbij57Bawls=;
 b=2C/7vQ64dcEtkrQRaFGoGdlrdDs4aSmUvsbiiefM5bYo9zD3oGRGMiDqNFWbMCqxM8yD
 jR6YVg4RRWCxWD4Lj4hgJ4XVNYFIFIdqWlYgRZQgW5XvnOBPQN1AJC2SPDa7dplFsZZh
 zpYZ5MTq2sPUKBoP78Yo2SVL5jLEnqdxKXqRZHGOvlwyH4Z8lS48JL1eaavr42JyrgaE
 bxZuUXltVZaXQhxQuxwUlP2K9Q5SC83eFi08DkEnoA2kdfKA+rrLZsjkagS4pmPWgaLN
 R6d3QHU/HWVLJ1mUc2TVaM2/MlicQZOCX1aSgVJuPpbvLLm2Skibv2xYmbiG03T7MqcJ 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pbpwqvg2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 13:57:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2A66100038;
 Thu, 16 Mar 2023 13:57:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB22D2171F4;
 Thu, 16 Mar 2023 13:57:36 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Mar
 2023 13:57:36 +0100
Date: Thu, 16 Mar 2023 13:57:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Message-ID: <20230316125729.GA3495627@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>, 
 Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@pengutronix.de, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230310092053.1006459-1-l.goehrs@pengutronix.de>
 <20230310092053.1006459-2-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310092053.1006459-2-l.goehrs@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_08,2023-03-16_01,2023-02-09_01
X-Mailman-Approved-At: Thu, 16 Mar 2023 16:59:04 +0000
X-Topics: 
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] spi: stm32: split large transfers
 based on word size instead of bytes
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

Hi Leonard,

thanks for your patch.  I agree with this patch and tested it ok
as well on my side.

On Fri, Mar 10, 2023 at 10:20:53AM +0100, Leonard G=F6hrs wrote:
> The TSIZE register in CR2, to which the number of words to transfer
> is written, is only 16 Bit. This limits transfers to 65535 SPI
> _words_ at a time. The existing code uses spi_split_transfers_maxsize
> to limit transfers to 65535 _bytes_ at a time.
> =

> This breaks large transfers with bits_per_word > 8, as they are
> split inside of a word boundary by the odd size limit.
> =

> Split transfers based on the number of words instead.
> This has the added benefit of not artificially limiting the maximum
> length of bpw > 8 transfers to half or a quarter of the actual limit.
> =

> The combination of very large transfers and bits_per_word =3D 16 is trigg=
ered
> e.g. by MIPI DBI displays when updating large parts of the screen.
> =

> Signed-off-by: Leonard G=F6hrs <l.goehrs@pengutronix.de>
> ---
>  drivers/spi/spi-stm32.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index def09cf0dc14..d2e16f16fae6 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -984,9 +984,9 @@ static int stm32_spi_prepare_msg(struct spi_master *m=
aster,
>  	if (spi->cfg->set_number_of_data) {
>  		int ret;
>  =

> -		ret =3D spi_split_transfers_maxsize(master, msg,
> -						  STM32H7_SPI_TSIZE_MAX,
> -						  GFP_KERNEL | GFP_DMA);
> +		ret =3D spi_split_transfers_maxwords(master, msg,
> +						   STM32H7_SPI_TSIZE_MAX,
> +						   GFP_KERNEL | GFP_DMA);
>  		if (ret)
>  			return ret;
>  	}

Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> -- =

> 2.30.2
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
