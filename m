Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BB5A4D03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 15:07:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C31DC04003;
	Mon, 29 Aug 2022 13:07:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B4AEC03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 13:07:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TBVokw024363;
 Mon, 29 Aug 2022 15:07:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kFN563/htO00YSWSczHT7h2YRN2q3KxV5ulrfM6zaNE=;
 b=nS5exY86rtDWFvqgjx2UMQ+KgvghYdFFwIMtg22plqUDpKe6js70yXjU271MVFc8W8RC
 /QetJw6k6m9JzCMukP0UJxl13Y2FZbZTf5TfCconRFfdCaxoub/CnoUn4+wzrx2G0IdQ
 uEM9t3g6IdG6/bq4eAd4Bsvqiey8G4VPaqMYQP9i3NxeMIMDoOqkH/qzIOLQHU1/+FZX
 66U9RgypPCPXv2SKnUjkrbTyAxBTwZsaKLXxL57MaU8IhUphnA5Y2SOVNckKWASdfG+s
 s1URLAwcOU6xtOG7KB8L4tXTyyuahahWLNP3Rp3juDzniR6SU8CZwTI0wPbmO8oaJduH Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j78d9a3xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 15:07:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B123710002A;
 Mon, 29 Aug 2022 15:07:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34B7D22A6F5;
 Mon, 29 Aug 2022 15:07:10 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Mon, 29 Aug
 2022 15:07:09 +0200
Message-ID: <59015cf7-65f0-e376-2b42-b650faa22a9b@foss.st.com>
Date: Mon, 29 Aug 2022 15:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
 <Ywy2WUIc7YxJv1Eo@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <Ywy2WUIc7YxJv1Eo@sirena.org.uk>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix pm_runtime
 management in stm32_qspi_transfer_one_message()
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

On 8/29/22 14:51, Mark Brown wrote:
> On Mon, Aug 29, 2022 at 02:32:50PM +0200, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> ctrl->auto_runtime_pm was wrongly set to true when adding
>> transfer_one_message() callback.
>> As explained in commit 6e6ccb3d4cdc ("spi: stm32-qspi: Add pm_runtime support")
>> the expected behavior is to prevent runtime suspends between each transfer.
> 
> This doesn't apply against current code (the for-6.0 branch) -
> please check and resend.

This patch is not dedicated for the spi/for-6.0 branch but for the spi/for-6.1 one,
as this patch is fixing commit a557fca630cc which is merged in spi/for-6.1.

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
