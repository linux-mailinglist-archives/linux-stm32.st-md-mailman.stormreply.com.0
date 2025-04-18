Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D9A95F54
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C3C5C78F90;
	Tue, 22 Apr 2025 07:27:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44CEFC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:10:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMvALq013110;
 Fri, 18 Apr 2025 12:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gnj9zyq/0nt1uavrCh/EJH373gTM2j2MUhc1HuK/Cmw=; b=ocElkma4te0ayMG7
 U9HswTJUg1vZlzL7zpEdKfUgUfxrWGbQ2kOKMeyHSJ6UWmh2lacWZO3woZXHIu+i
 5mfMzTL8JJe8VramdbHkxvrr05Vg1tne5sLL5WmYZMEYe5WVFf7KQ+GWhgGzEJhr
 Sk2PRpBaOHRveet7CH2wWGmWTYBNcpEX1mCd2mJxjQPdbnSbKJBM/AMuxpiDggkv
 M2HwlpAEsixsKmXucrqyzsA9tNHXOp80R5dad7PALmB8Iq6eZzHHdV/HXdepYfu/
 7DMNcurea2N4rECTLlyPN/C8bBX0pLkBooLJRCp4Ck2OGyTWXUf6QV5fB2dMrVJM
 Ko5+dg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqj2rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 12:09:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IC9uM3019677
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 12:09:56 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 05:09:53 -0700
Message-ID: <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Date: Fri, 18 Apr 2025 17:39:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ALN6EHSkm0hBo3TgySFp18EK9VHox7fV
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68024115 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=O8aqTkAXavC4eiQugfUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ALN6EHSkm0hBo3TgySFp18EK9VHox7fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180089
X-Mailman-Approved-At: Tue, 22 Apr 2025 07:27:00 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix an error handling
 path in stm32_ospi_probe()
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



On 4/18/2025 4:57 PM, Christophe JAILLET wrote:
[...]
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 668022098b1e..9ec9823409cc 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>   err_pm_enable:
>   	pm_runtime_force_suspend(ospi->dev);
>   	mutex_destroy(&ospi->lock);
> +	if (ospi->dma_chtx)
> +		dma_release_channel(ospi->dma_chtx);
why can't you move to devm_dma_request_chan ? No need to cleanup.
> +	if (ospi->dma_chrx)
> +		dma_release_channel(ospi->dma_chrx);
>   
>   	return ret;
>   }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
