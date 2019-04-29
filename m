Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A0DCB9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 09:19:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DF9FC35E03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 07:19:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4FF3C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 07:19:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T7BApm016465; Mon, 29 Apr 2019 09:18:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=TykFYt9jpvTCwyKhyahs+89NrVvncrSmdvgdWwwYztk=;
 b=vpsxKVmdKayCtuheOa+LEhE9Hcpk7rlGwuMKQum+17xVVfQrvFfnO40kzSgCbA84AUwH
 L7SlOnCyZSO6lBJafRag5na2endexM3rAmXLyb+9FX1d3/Fp0Y9LXo9tCgLKmZbSVRiD
 JT3SIbLns4QyIg4IOxlefXJLcmjxlB5f+iIuKr0rglt2G9yRqur/OkXoVTvkPSgQyhbr
 nXHarlN5rFyPXEdrmmZlVsBlRfprzHc3Jfi16QGK6iYtvca8BiWCw3G/k3EuUN/JVPqV
 z2bZZIRjM0do9BmEnoL/IwY57OVi9H2q1HSY/7I0/7YQtbPw3yU/IcvISF0I/ju5oi/m KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s5u5d0g7p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 09:18:44 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9757B31;
 Mon, 29 Apr 2019 07:18:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 357AD122C;
 Mon, 29 Apr 2019 07:18:43 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 09:18:43 +0200
To: Biao Huang <biao.huang@mediatek.com>, Jose Abreu <joabreu@synopsys.com>,
 <davem@davemloft.net>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-3-git-send-email-biao.huang@mediatek.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <24f4b268-aa7f-e1f7-59fc-2bc163eb8277@st.com>
Date: Mon, 29 Apr 2019 09:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556433009-25759-3-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_04:, , signatures=0
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] net: stmmac: fix csr_clk can't be
	zero issue
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

Hi

On 4/28/19 8:30 AM, Biao Huang wrote:
> The specific clk_csr value can be zero, and
> stmmac_clk is necessary for MDC clock which can be set dynamically.
> So, change the condition from plat->clk_csr to plat->stmmac_clk to
> fix clk_csr can't be zero issue.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 818ad88..9e89b94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4376,7 +4376,7 @@ int stmmac_dvr_probe(struct device *device,
>   	 * set the MDC clock dynamically according to the csr actual
>   	 * clock input.
>   	 */
> -	if (!priv->plat->clk_csr)
> +	if (priv->plat->stmmac_clk)
>   		stmmac_clk_csr_set(priv);
>   	else
>   		priv->clk_csr = priv->plat->clk_csr;
> 

So, as soon as stmmac_clk will be declared, it is no longer possible to 
fix a CSR through the device tree ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
