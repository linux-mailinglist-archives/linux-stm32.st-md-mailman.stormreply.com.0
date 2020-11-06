Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF12A9152
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 09:34:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E02BC3FAD4;
	Fri,  6 Nov 2020 08:34:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E13BFC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 08:33:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A68S9GS003573; Fri, 6 Nov 2020 09:33:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=a335JwVUPK1cFyrEFD0jZvrG1Powtrjh0dqnCUL5i08=;
 b=c79gTtiUTFeHfJll+DvYix9m9t9PfQVpwh8VJhYAor4xs69hJkeQbgLkxIfiXL+Jru7B
 ABCkyFIqwP8iHAXVEU4jE/EKDaXEl5nf+t/tvm5HgSnm3dThvjYyPWqR4QvrHygFozKF
 sO/ZRfE7JqViulsHMqxAI9CQBm++4akZifS54gAgz5mFODrZKL9TVtcOeFcpjDljhQoE
 gtec/OoHlnnZo/JJZ5THIO6eE0QlIUqmpK/3LW3NR7DbxP77uVWzWP2hBnFw3rAtInLa
 HE0MGwuhj5DObxGU3SFuPr5f7/DnWG9Riuu90nbmfWnKeuULAaXwE2IU27fhYavqhzHh lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00etynj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 09:33:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6099310002A;
 Fri,  6 Nov 2020 09:33:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E33A22C216;
 Fri,  6 Nov 2020 09:33:45 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 09:32:52 +0100
Date: Fri, 6 Nov 2020 09:32:47 +0100
From: Alain Volmat <alain.volmat@st.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Message-ID: <20201106083247.GA9484@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Zhang Qilong <zhangqilong3@huawei.com>,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20201106015217.140476-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106015217.140476-1-zhangqilong3@huawei.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_03:2020-11-05,
 2020-11-06 signatures=0
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix reference leak in
	stm32_spi_resume
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

Hi Zhang,

thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Alain

On Fri, Nov 06, 2020 at 09:52:17AM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to pm_runtime_put_noidle will result in
> reference leak in stm32_spi_resume, so we should fix it.
> 
> Fixes: db96bf976a4fc ("spi: stm32: fixes suspend/resume management")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/spi/spi-stm32.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 2cc850eb8922..471dedf3d339 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2062,6 +2062,7 @@ static int stm32_spi_resume(struct device *dev)
>  
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
>  		dev_err(dev, "Unable to power device:%d\n", ret);
>  		return ret;
>  	}
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
