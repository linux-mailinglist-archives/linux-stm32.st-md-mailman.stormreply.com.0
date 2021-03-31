Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6934FA17
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 09:31:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5304FC57B5B;
	Wed, 31 Mar 2021 07:31:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26850C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 07:31:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12V7QQ3L020854; Wed, 31 Mar 2021 09:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VQ1IfAzKcaF8aoBGfFcQIald1k/JOPDpqfP8TPZYx1c=;
 b=ApZP3RpxakmeywKr0rWxNXjcASZ2lcS292+sV6L735BMiq5OdqVvkrXjP5z7v0zTe6Lv
 eWc+qL37pDSrwBYGUkQN7bT+QeeYfFYSRCRggKxw8NGhCSW5csVZQsIE1DLnzS89AA/Q
 hOFXvcQmRIxW5SWpsqaz8EVPK9vj5PvgJZ/JHyfIC1GH9/BSnmMHwaCi8WmzlukCnzMe
 rzWTemrq2nxgz4L6lBW4p3eD8oitmMaG+4FhC7y/FlRNgNGNhsftFxAJzYsMF1hqh9k9
 4Z23owpHNgh+VpTjn0nGgRi/zsChcOvOqjM2J/zyUZzIQdj73vNMn6EJ6S1bcZQDZp5t qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37maa2jurh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 09:31:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE779100034;
 Wed, 31 Mar 2021 09:31:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BAE922321C;
 Wed, 31 Mar 2021 09:31:22 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 09:31:21 +0200
To: Rob Herring <robh@kernel.org>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
 <20210330144141.GA278273@robh.at.kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <90f39f07-a9c0-73b9-ddad-e26b155d3b32@foss.st.com>
Date: Wed, 31 Mar 2021 09:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330144141.GA278273@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_01:2021-03-30,
 2021-03-31 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: remoteproc:
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



On 3/30/21 4:41 PM, Rob Herring wrote:
> On Mon, 22 Mar 2021 10:26:50 +0100, Arnaud Pouliquen wrote:
>> Add the "detach" mailbox item, that allows to define a mailbox to
>> send a IPCC signal to the remote processor on remoteproc detach action.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update from V1:
>>
>> Fix indentation error reported by 'make dt_binding_check'.
>>
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thank Rob for the review
Since there is already a v3 that fixes the patch 2/2 , i will send a v4 to
include your reviewed-by

Regards,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
