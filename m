Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9F1BE072
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 16:15:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06345C36B0D;
	Wed, 29 Apr 2020 14:15:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B74C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 14:15:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TECkSd012368; Wed, 29 Apr 2020 16:15:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=KqESSlTcD9ep4XnUlD+lwpTAnY9V9M5Pb1fKaGdwF+E=;
 b=q2fqv5Tvp2oHUASZ/Ov0TGv3/QmZn2wqRg4Nr+OyQeOvnaLUYzQw+FTZK44HRr/DZpg5
 99oc1sn5jnjkI/k+9t+k5A8HthlcWvDqhRxn3LtNLslE2OJOQIo+y9Odaa9+vyhoaGFX
 B9GtlssCs3Zrj50GOv158zmXPi9oXIzZpSzPWn11lV9dQBMyRKnpzG2WoZwRDh8b9n26
 TpT2JdBjZZQquwAN/L3IXEP/GqJ77PnRU9v0sEGg4C7I5qxL8ei/Cv9W6nX9JxQ3cXCr
 NDBQzNOw7Hfr7iKEa2kFep09P3b19u6diZXjtQyIacMsrLSrIZxSNR7kc7H+ycWlKS93 Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j62ys2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 16:15:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D954D10002A;
 Wed, 29 Apr 2020 16:15:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4C522A4D69;
 Wed, 29 Apr 2020 16:15:14 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 16:15:14 +0200
Date: Wed, 29 Apr 2020 16:15:13 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200429141513.GB31498@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel-janitors@vger.kernel.org, wsa@the-dreams.de,
 linux-arm-kernel@lists.infradead.org
References: <20200429132323.GB815283@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429132323.GB815283@mwanda>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_07:2020-04-29,
 2020-04-29 signatures=0
Cc: wsa@the-dreams.de, kernel-janitors@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: prevent array underflow in
 stm32f7_get_lower_rate()
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

Hi Dan,

indeed, thanks a lot.

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Alain

On Wed, Apr 29, 2020 at 04:23:23PM +0300, Dan Carpenter wrote:
> We want to break with "i" set to zero whether we find the rate we want
> or not.  In the current code, if we don't find the rate we want then it
> exits the loop with "i" set to -1 and results in an array underflow.
> 
> Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 9c9e10ea91991..bff3479fe122a 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -607,7 +607,7 @@ static u32 stm32f7_get_lower_rate(u32 rate)
>  {
>  	int i = ARRAY_SIZE(stm32f7_i2c_specs);
>  
> -	while (i--)
> +	while (--i)
>  		if (stm32f7_i2c_specs[i].rate < rate)
>  			break;
>  
> -- 
> 2.26.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
