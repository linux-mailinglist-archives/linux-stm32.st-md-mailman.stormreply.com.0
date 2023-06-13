Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C472DEC0
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 12:08:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4198DC6A617;
	Tue, 13 Jun 2023 10:08:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 012D8C6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 10:05:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DA4NpX000354; Tue, 13 Jun 2023 12:05:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cRX+auEkIEZ1xY8U2wyEZt0TGCmMuO7kC2MF/5cWd/M=;
 b=DX2MIeJP2wYVKOV/Ib9YUiFVxLuweMCh5S5XG883IheVH9jsQwCdrDWJr3b7OyEx9BYw
 r2+qcOjLUJThmE56Y4RjyjoxcOM3Lk4cg0wX31b4p1WMw2V4EPPOeQl+mxs+VRuNC7KM
 KvmmMNUQffmNZdvR9jWafmKltWAxDMz0X3h7/jM8ejsX3g5k+5GuZQIBEYJYdcJdOYYO
 EDkU0aIIWHqTY/Apv2Aq3Ae+1g6XzTS6OMRaM0eLTS49fYlEz1IW36QPfoLFsr2YgPb6
 Sy90IUJdY5kDeHlvErdGaLDaqoUaVsQu2x3K9burj91ZKZs30d3hViQothSwECLtH/ry Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6pcrr07t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 12:05:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF893100045;
 Tue, 13 Jun 2023 12:05:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3E6721ADD8;
 Tue, 13 Jun 2023 12:05:26 +0200 (CEST)
Received: from [10.252.6.14] (10.252.6.14) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 12:05:24 +0200
Message-ID: <1ec74263-085c-68ab-3490-56172f11b7c1@foss.st.com>
Date: Tue, 13 Jun 2023 12:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230609120546.3937821-1-arnd@kernel.org>
 <7846c69b-5c2d-16d3-6079-d11a60171a69@foss.st.com>
 <ba58f0cb-3683-4aae-8c10-2fad2e701501@app.fastmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ba58f0cb-3683-4aae-8c10-2fad2e701501@app.fastmail.com>
X-Originating-IP: [10.252.6.14]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Mailman-Approved-At: Tue, 13 Jun 2023 10:08:22 +0000
Cc: Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ben Levinsky <ben.levinsky@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: use correct format
	strings on 64-bit
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



On 6/12/23 16:17, Arnd Bergmann wrote:
> On Mon, Jun 12, 2023, at 16:10, Arnaud POULIQUEN wrote:
> 
>>>  	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
>>>  	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
>>> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
>>> +		dev_err(dev, "Unable to map memory region: %pa+%x\n",
>>>  			&rsc_pa, RSC_TBL_SIZE);
>>
>> What about cast the RSC_TBL_SIZE define instead to ensure to be independent from
>> the arch and to match with the use of RSC_TBL_SIZE?
>>
>> #define RSC_TBL_SIZE		((size_t)1024)
> 
> I have no objection to that, but I don't see it doing anything good either,
> as this is a constant value that will always work.
> 
>      Arnd

It was just to avoid to have the constant used with different types in the code
But that's nitpicking, let's keep your proposal.

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
