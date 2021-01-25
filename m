Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF6302531
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 13:58:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8826AC5663B;
	Mon, 25 Jan 2021 12:58:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEB81C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 12:58:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PCv4wB016352; Mon, 25 Jan 2021 13:58:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=flzvt0A8NWOCN0z5OXHpUHz7Tl0U61lPJm1sLeszyqE=;
 b=SYlmEWAiMKoFjwsYvhdZr3+OwaNeY/bcxjBH7RF53RyVycupAbTgH7vv2j3KZr4YNR+M
 LCci4flCKlzuxIDP8TCUsZpDE/6vA5kUnb++Pr6mwbtvhz6WwgnaaSBtWdtrx4bl7DWN
 ZF1WqcWd+22G8PjA4ihy+VzhTmulYVJwZNVCpm0dV/2bGpFbdl10v3ppEtssvnHEeC40
 6jbxfrXeCs+wIFYY8fLUI45ni5UnvSlfIw451TcOHR2rPfN/r9NGTfPwv0NDZje6GLhN
 EoQ1wtpGrb3EEl8XXahLg6OENuh8bhhBr/4yZTeL+q34o4lLdiA27NsXACyfKH9bh5d5 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368a56b1v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 13:58:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0A15100034;
 Mon, 25 Jan 2021 13:58:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B57732C38D4;
 Mon, 25 Jan 2021 13:58:23 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 13:58:23 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>, Linus
 Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20210124170337.32917-1-marex@denx.de>
From: Yann GAUTIER <yann.gautier@foss.st.com>
Message-ID: <eb8c62eb-87c1-0011-49ae-260239daf79e@foss.st.com>
Date: Mon, 25 Jan 2021 13:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210124170337.32917-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2] ARM: dts: stm32: Rename mmc controller
 nodes to mmc@
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

On 1/24/21 6:03 PM, Marek Vasut wrote:
> Per mmc-controller.yaml, the node pattern is"^mmc(@.*)?$"  ,
> so adjust the node.
> 
> Signed-off-by: Marek Vasut<marex@denx.de>
> Cc: Alexandre Torgue<alexandre.torgue@st.com>
> Cc: Ludovic Barre<ludovic.barre@st.com>
> Cc: Ulf Hansson<ulf.hansson@linaro.org>
> Cc:linux-stm32@st-md-mailman.stormreply.com
> Cc:devicetree@vger.kernel.org

Hi Marek,

Acked-by: Yann Gautier <yann.gautier@foss.st.com>


Do you know if similar patches are planned for other platform using this 
IP (Qualcom, ST-Ericsson, Arm vexpress...)?
I found issues with them when running this command:
make -k dtbs_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/arm,pl18x.yaml

Maybe Linus already sent the info?
Adding those other platforms maintainers.


Regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
