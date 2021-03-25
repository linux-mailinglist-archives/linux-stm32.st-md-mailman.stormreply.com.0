Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD83348A56
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 08:45:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62DA2C57B5E;
	Thu, 25 Mar 2021 07:45:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A647CC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 07:45:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P7hJef029069; Thu, 25 Mar 2021 08:43:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=w7J5GsMUoBcuIgOX9vwjz/nfL+HUwedcW3KIkb1nR+8=;
 b=y4LP/QuIKgKp6GDw4Ly2DXBx5cuPTQcgDzpgZL7ejUhoj4VgVIkNn+KsxHIZf/6GhOGF
 fhmf228EAq3PxTWzgyBd+tihPhIDNW91ACtADy7NhipuzZLtPsV0RPBstBXPtlbTBQWI
 R/N9m/zlEPH2fix7LEC6d6CoiuqTZc79p8xosEkEC1XYEsUymSqBXd5PPyD18XqO/Bgt
 13jtm7VkgpUE+xE56feaIcs8uZajHRXm+Z0+EDPcv4+wx2khTCn9Fi5KDNDDW9ODlCmM
 aS4PoWlfoch30XTpQbXbEDbOhW5ZXG527W6aDLh8RSCKM5uKRpoiPIW5D3dQ//AYfAGk 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37fb17ndhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 08:43:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1AC910002A;
 Thu, 25 Mar 2021 08:43:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BF2B21E685;
 Thu, 25 Mar 2021 08:43:15 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 08:43:15 +0100
Date: Thu, 25 Mar 2021 08:43:10 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Message-ID: <20210325074310.GA17918@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, p.zabel@pengutronix.de,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_01:2021-03-24,
 2021-03-25 signatures=0
Cc: mcoquelin.stm32@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH] i2c-stm32f4: Mundane typo fix
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

On Wed, Mar 24, 2021 at 07:36:10PM +0530, Bhaskar Chowdhury wrote:
> 
> s/postion/position/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 937c2c8fd349..4933fc8ce3fd 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
>  	default:
>  		/*
>  		 * N-byte reception:
> -		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
> +		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
>  		 * In that way, ACK will be sent as soon as the current byte
>  		 * will be received in the shift register
>  		 */

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

> --
> 2.30.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
