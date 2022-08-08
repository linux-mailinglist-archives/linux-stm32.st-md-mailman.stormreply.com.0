Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E558CBDC
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 18:10:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68FD7C04000;
	Mon,  8 Aug 2022 16:10:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB78C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 16:10:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278CCwwb015734;
 Mon, 8 Aug 2022 18:09:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x3NJSzf6vrhocflx9JNFnZ5iqH3k6ZuksvSVGkGyX08=;
 b=y9wNcQLrVxBALNMpBmPsn1Swn8u4UKcjgIZO8rq+dlbKG4dS7jSnOn8jT6O5Nd7DSWGC
 5dCBiXbE0t7/gaP2aLvfEL9knkoxhoV+Bx09RGv00qCIsy7dWOiY5OMp50FzxpXT0KJJ
 tLpw2eczpsce1N5N53DCiyivH99Qpb7PEwX4z0HHjPf+Dmsu9AH/CIiTF3bEPD/SkYi0
 kuUSD6cnKJ7YlAtBFHk7ZcKNTqqFJMqebzksxNNJE1RHxDHX9mFvywwFhDnDeW763G6J
 WlelOpEwfi0XxOLnfcb3lraF07+uZbs5Tdxga3lpmXJ2Xd53tr62K9Nv+CEYSxZU7QFk aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hsf6gkm81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 18:09:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 541EA10002A;
 Mon,  8 Aug 2022 18:09:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F2DA257ABB;
 Mon,  8 Aug 2022 18:09:53 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 8 Aug
 2022 18:09:52 +0200
Message-ID: <bbe8f91e-35f4-fe80-4b6e-25d21a6547fc@foss.st.com>
Date: Mon, 8 Aug 2022 18:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-3-patrice.chotard@foss.st.com>
 <YvEP15/7KmQGyPgL@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <YvEP15/7KmQGyPgL@sirena.org.uk>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_10,2022-08-08_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] spi: stm32_qspi: Add
 transfer_one_message() spi callback
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

Hi Mark

On 8/8/22 15:29, Mark Brown wrote:
> On Mon, Aug 08, 2022 at 09:40:50AM +0200, patrice.chotard@foss.st.com wrote:
> 
>> +	ret = pm_runtime_get_sync(qspi->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(qspi->dev);
>> +		return ret;
>> +	}
> 
> Use the core runtime PM, there should be no need to open code.

Right, i will use pm_runtime_resume_and_get() instead.

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
