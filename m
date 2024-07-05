Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440F928689
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 12:16:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B74ADC71282;
	Fri,  5 Jul 2024 10:16:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 357D5C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 10:16:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4658DGY1003029;
 Fri, 5 Jul 2024 12:16:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=AU9ya2EmjL7f6PRwR8NRDfqo
 EmUnZunGxzD7XLPBGBs=; b=bnyhiSE+QYmF3tQt695vMdn0f6fkli3DP/ivuOW+
 o24J4TNDbRkA27LLFyQovbrXoWXdgTtQ4a6n+N7AbQy1kFRMCKI3R+Rco0dyOnIe
 aypdVsO96BdW/Qsa7Va25jAwd8rQJuyGor/0/+FDJzz/WYibEuESvF5+3a6nHiT7
 mE8u/s5Py7DZEVpWVMuJrUXP+qL7zvH8pENOJVf5HA+ZXCCA589mk3qxn5yq+Ifi
 Gh7B63/uw8f086sEyJFUVW2ojol6+a0wtJAkdLbHHZWAD9UzuNle+w/zml4Iaz0s
 kmGJCQsL2uzQOPpu8U5WrzFMccwcO10JvwrfQDmOHTMiww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 405u9suwqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2024 12:16:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A47ED40049;
 Fri,  5 Jul 2024 12:16:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE37B220B41;
 Fri,  5 Jul 2024 12:15:49 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 12:15:49 +0200
Date: Fri, 5 Jul 2024 12:15:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <20240705101544.GA3926404@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hugues Fruchet <hugues.fruchet@st.com>,
 Linux Stable <stable@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <2dea6faf-53f6-461a-809b-ec572357ad07@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dea6faf-53f6-461a-809b-ec572357ad07@xs4all.nl>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_06,2024-07-03_01,2024-05-17_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmipp: correct error
 handling in, dcmipp_create_subdevs
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

Hi Hans,

On Wed, Jul 03, 2024 at 01:59:16PM +0200, Hans Verkuil wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> 
> Correct error handling within the dcmipp_create_subdevs by properly
> decrementing the i counter when releasing the subdevs.
> 
> Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil: correct the indices: it's [i], not [i - 1].]
> ---
> The original patch would cause a crash due to the incorrect indices in the
> statement after the while. Since 'i' can now become 0, so i - 1 would be a
> negative index access, which was obviously not the intention.
> 
> I reverted the patch once I noticed this (better to hang in an infinite
> loop than to crash), but I want to get a proper fix in. Rather than
> waiting for that, I decided to just take the original patch from Alain, with
> just the indices fixed.

sorry for the delay and this error within the patch.

Thanks a lot Hans and Sakari for noticing it and fixing it.

Alain

> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 4acc3b90d03a..7f771ea49b78 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -202,8 +202,8 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  	return 0;
> 
>  err_init_entity:
> -	while (i > 0)
> -		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
> +	while (i-- > 0)
> +		dcmipp->pipe_cfg->ents[i].release(dcmipp->entity[i]);
>  	return ret;
>  }
> 
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
