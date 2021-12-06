Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343C46917A
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 09:29:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4113DC5F1E5;
	Mon,  6 Dec 2021 08:29:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D73C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 08:29:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B641GlM010420;
 Mon, 6 Dec 2021 09:29:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7dw5R5/FK9LuNdO5hgpabaKMusyc01qO1lYQBujU+TM=;
 b=FnMw9A7tSgCl3z59RZaPD3wp5cQcGGcg+WromuhUTmwRcomG+0M7vrXNO+2aFPOmFTh+
 HbcNYxd617kUOFO3At+3+6qPG55LHxAyzUq7cvf5M09dC+gV1sed0DPMsbY5eoWrKabd
 rgOn2B54dxH0Ldf820aVlAMEyAjfKSTmLJo7RrBgJwKskzbJnYmM21UWH1iQUpX+xd9V
 /S50NrAhY9SZ5JC+cAUfyBiWWqy7akQ186qSkIdjz1+WWetaGuIl3Ap6yeOJxUVcHPtN
 tSc1Yk1YfuLsYLWCTZg5BTQ8eEoIQttJKZSLvnffEiv5i1bfxhbuk+ev9MHfqSXuL3Tp zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csb4j12uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:29:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F80910002A;
 Mon,  6 Dec 2021 09:29:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 776942239B2;
 Mon,  6 Dec 2021 09:29:30 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec
 2021 09:29:29 +0100
To: Colin Ian King <colin.i.king@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <dmaengine@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211204140032.548066-1-colin.i.king@gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <6ddc679f-c6d4-c0b7-5e1c-ef156a392488@foss.st.com>
Date: Mon, 6 Dec 2021 09:29:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211204140032.548066-1-colin.i.king@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: Remove redundant
 initialization of pointer hwdesc
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

Hi,

On 12/4/21 3:00 PM, Colin Ian King wrote:
> The pointer hwdesc is being initialized with a value that is never
> read, it is being updated later in a for-loop. The assignment is
> redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/dma/stm32-mdma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
> index d30a4a28d3bf..805a449ff301 100644
> --- a/drivers/dma/stm32-mdma.c
> +++ b/drivers/dma/stm32-mdma.c
> @@ -1279,7 +1279,7 @@ static size_t stm32_mdma_desc_residue(struct stm32_mdma_chan *chan,
>   				      u32 curr_hwdesc)
>   {
>   	struct stm32_mdma_device *dmadev = stm32_mdma_get_dev(chan);
> -	struct stm32_mdma_hwdesc *hwdesc = desc->node[0].hwdesc;
> +	struct stm32_mdma_hwdesc *hwdesc;
>   	u32 cbndtr, residue, modulo, burst_size;
>   	int i;
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
