Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206B34E1ED
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 09:15:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E347C5719E;
	Tue, 30 Mar 2021 07:15:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C0EBC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 07:14:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U725Aq011137; Tue, 30 Mar 2021 09:14:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=28n/u8BRVi8Ip9vAnGkYD4wNv1dohMQPBqlvlty3efA=;
 b=0zmtnFwA8vcOjEfXyR8xLHnCBtLDg8XkKMWcTxliAr5oeE+jaejKBPhgYHeFJflzfiPK
 9DqGNnI03JxTmb2sCNbkmpCTDFyI/ZwOMuam5x+ZRuwBUlnw1JkT5rMdOk5aexl+/49o
 s7I73fdeNh1d8+wu0tWCYSd7G+ts7frOJrUr9xvVTl5Qo7FczW6U8P0Xcj91j+ZR6JIp
 7Fe+suIMJM84VEGwvVFprkjMcc6WmCQrHWZqZ6/yodrkSGdb+OlM23JXr1MAKNU1Nhpy
 L/LwjH/8hdb7E8unN5Wwu5KT4f4VZJIKZYOjQ7TbdH7AfUgFxb5wvqHfnQW/eYG4TeAH Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37kuf298v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 09:14:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C56B100034;
 Tue, 30 Mar 2021 09:14:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8016D225FC0;
 Tue, 30 Mar 2021 09:14:54 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 09:14:53 +0200
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
 <20210326094209.29750-2-arnaud.pouliquen@foss.st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b6287e27-e3ea-c2a3-6583-d16f1047c197@foss.st.com>
Date: Tue, 30 Mar 2021 09:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210326094209.29750-2-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_02:2021-03-26,
 2021-03-30 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: remoteproc:
 stm32-rproc: add new mailbox channel for detach
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

Hello Rob,

Seems I made a mistake in my mailing list, you are not in...
Please could you review the bindings?
if it is easier for you i can resend the series.

Thanks,
Arnaud

On 3/26/21 10:42 AM, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> No Update from V2.
> 
> Update from V1:
> Fix indentation error reported by 'make dt_binding_check'.
> 
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index a1171dfba024..64afdcfb613d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -65,16 +65,23 @@ properties:
>            Unidirectional channel:
>              - from local to remote, where ACK from the remote means that it is
>                ready for shutdown
> +      - description: |
> +          A channel (d) used by the local proc to notify the remote proc that it
> +          has to stop interprocessor communnication.
> +          Unidirectional channel:
> +            - from local to remote, where ACK from the remote means that communnication
> +              as been stopped on the remote side.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    mbox-names:
>      items:
>        - const: vq0
>        - const: vq1
>        - const: shutdown
> +      - const: detach
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    memory-region:
>      description:
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
