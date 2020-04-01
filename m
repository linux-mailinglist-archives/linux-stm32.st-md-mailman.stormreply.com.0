Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5919A844
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 11:07:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 785DFC36B0B;
	Wed,  1 Apr 2020 09:07:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DECFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 09:07:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03192xIJ005415; Wed, 1 Apr 2020 11:06:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=pUAdDfLled6exIm4UEQprNwjkf9bN4q2badOB4c9Qto=;
 b=L8xIjD8MknhHPdT0rYy8MHIoHmlmI1rzGA91bzR/kSpQLIGCIB++70TZcLOkQUAL/5f0
 wqt3IXVbg6WG2RPqtp3KtS1Weiv5FeWtwBXDcAUFCHKxaU9l9sjyUyL6W7l+ZllirYON
 liszlxjdtfxgpQ7kykCuFWC68Nxmh4YOlO6EL/Bijt0jcEGi9nvT1YfRw99xQlGZBceR
 hmpxZnTGkwAiQ/joABX5oyyc/z57neg/RZClbtgP2xzrA/pmufv0AsHXxBGWu/UOGA4a
 yPqmudtlIVqLZ87RjHjqjpYfNcxtAzTclnzgSNos+qbSaV6yeuSx2Tz/RcNxWZm34uz+ RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmm2xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 11:06:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7597310002A;
 Wed,  1 Apr 2020 11:06:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5871221D6FA;
 Wed,  1 Apr 2020 11:06:44 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 11:06:39 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20200326220213.28632-1-a.fatoum@pengutronix.de>
 <20200326220213.28632-8-a.fatoum@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c0be1d2f-8e89-6786-86be-0f851e8b3441@st.com>
Date: Wed, 1 Apr 2020 11:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326220213.28632-8-a.fatoum@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 8/8] dt-bindings: arm: stm32: document
 lxa, stm32mp157c-mc1 compatible
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

Hi Ahmad

On 3/26/20 11:02 PM, Ahmad Fatoum wrote:
> Document the STM32MP157 based Linux Automation MC-1 device tree
> compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Sorry my mailer has lost the cover-letter mail, so consider I respond to 
to the whole series.

Thanks for adding a new stm32 board and more importantly to have 
standardize pins name, I appreciate it.

Series applied on stm32-next.

Regards
Alex


>   v1 -> v2:
>   - Added Rob's Ack
> ---
>   Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 1fcf306bd2d1..71ea3f04ab9c 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -38,6 +38,7 @@ properties:
>         - items:
>             - enum:
>                 - arrow,stm32mp157a-avenger96 # Avenger96
> +              - lxa,stm32mp157c-mc1
>                 - st,stm32mp157c-ed1
>                 - st,stm32mp157a-dk1
>                 - st,stm32mp157c-dk2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
