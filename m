Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF65D9F7890
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 10:31:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE6AC78027;
	Thu, 19 Dec 2024 09:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9974C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 09:31:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ8p3br024853;
 Thu, 19 Dec 2024 10:31:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WmGBp6Jz4nXDnKrhsKtK5WI9Ke0a+8w8SkZRoc2M1nA=; b=sBMq9/SB9yLoCwZP
 V8U7mKt5eXGedyPPkpqqVvIL0pPA5BrabXv8o9A9vwa60x9zx9DLiSW2L8RVKAlX
 1gI/GZikEuzTpTArtQxrBEC9O1lXnMG3NgsFmzYpe4jup1T65tD8jh/AM43Mfaom
 Mb+UVwfYWrB0MpLVvFWzhWzkalWkmoAyJg4N6VcmZg5iNlvTE5iA1IihpB+fftMF
 8/C5o2z8hP0ESLXEa9jRD/6GnZiClmlZX+JjS4pd4iIaWR6xyqEXjZL/+7H3Q/9k
 WW/Ceujv7KDfUjwa1LCTo/fcO3mhI4WrotAEu5ot/3uxqjwcJ3nbfhbO4aOMpD7l
 ZS+i4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43m03s3ecr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 10:31:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 21ADB4004A;
 Thu, 19 Dec 2024 10:29:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E72A25CBE0;
 Thu, 19 Dec 2024 10:28:40 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 10:28:39 +0100
Message-ID: <b6d92560-1bcc-4c9f-be1e-a5b7056f788a@foss.st.com>
Date: Thu, 19 Dec 2024 10:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 00/15] media: stm32: introduction of
 CSI / DCMIPP for STM32MP25
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Alain

On 12/12/24 10:17, Alain Volmat wrote:
> This series introduces the camera pipeline support for the
> STM32MP25 SOC.  The STM32MP25 has 3 pipelines, fed from a
> single camera input which can be either parallel or csi.
> 
> This series adds the basic support for the 1st pipe (dump)
> which, in term of features is same as the one featured on
> the STM32MP13 SOC.  It focuses on introduction of the
> CSI input stage for the DCMIPP, and the CSI specific new
> control code for the DCMIPP.
> One of the subdev of the DCMIPP, dcmipp_parallel is now
> renamed as dcmipp_input since it allows to not only control
> the parallel but also the csi interface.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Changes in v4:
> * stm32-dcmipp: correct patch 13/15 with clk error handling in
>    dcmipp_runtime_resume function
> - Link to v3: https://lore.kernel.org/r/20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com
> 
> Changes in v3:
> * stm32-csi: use clk_bulk api
> * stm32-csiL perform reset control within the probe
> - Link to v2: https://lore.kernel.org/r/20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com
> 
> ---
> Alain Volmat (15):
>        media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
>        dt-bindings: media: add description of stm32 csi
>        media: stm32: csi: addition of the STM32 CSI driver
>        media: stm32: dcmipp: use v4l2_subdev_is_streaming
>        media: stm32: dcmipp: replace s_stream with enable/disable_streams
>        media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
>        media: stm32: dcmipp: add support for csi input into dcmipp-input
>        media: stm32: dcmipp: add bayer 10~14 bits formats
>        media: stm32: dcmipp: add 1X16 RGB / YUV formats support
>        media: stm32: dcmipp: avoid duplicated format on enum in bytecap
>        media: stm32: dcmipp: fill media ctl hw_revision field
>        dt-bindings: media: add the stm32mp25 compatible of DCMIPP
>        media: stm32: dcmipp: add core support for the stm32mp25
>        arm64: dts: st: add csi & dcmipp node in stm32mp25
>        arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

DT patches applied on stm32-next (as drivers and dt-bindings patches are 
in linux-next branch).

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
