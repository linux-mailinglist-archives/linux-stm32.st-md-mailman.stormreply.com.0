Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A582327A8B8
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 09:36:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 546E3C3FAD3;
	Mon, 28 Sep 2020 07:36:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BB44C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 07:36:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08S7WEUW023843; Mon, 28 Sep 2020 09:36:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bmWZg1imqAg7aGfoNL/JguR7NrLHXxFP6oBzs89LewE=;
 b=P4fiwDWswvUbqa/SwVjlNhzH8TkjUvOJYPjf2UP9EwSNbVoolcPWF2eP3sm6vMGWaKyt
 nGy49MKYtgHosMVCMObcGhytKeeHPMfLNbbeTHH9hGmTXG7Zmc3feKo58vBx4bOHPzGh
 UMs5F9yseJQ4G71OfCAMBgUCM3OFHUai2zM8NJmw4eA35mSg1YJ8OsZGwKnZ6W9kzd06
 c626YhsnID4T+HNG59v1GC8mDaa94l+wtl8GWMlLPK+pJnaMZmuGMYKq/wHZ0pmpgib4
 B2OrvxWzMdjH6EwsNrUxKngfQyogqc1paB+5RJTKvXbCmYSEkaBJiYoETUzYhrwMb2Nc XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts7hfqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 09:36:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFFEC10002A;
 Mon, 28 Sep 2020 09:36:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A33CD21E686;
 Mon, 28 Sep 2020 09:36:01 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Sep
 2020 09:36:01 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Mon, 28 Sep 2020 09:36:01 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Joe Perches <joe@perches.com>, Philippe CORNU <philippe.cornu@st.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Vincent ABRIOU
 <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] drm/stm: dsi: Use dev_ based logging
Thread-Index: AQHWkyXKfX9abUar20eb4rtFyqzMOal5H6aAgARsjoA=
Date: Mon, 28 Sep 2020 07:36:01 +0000
Message-ID: <0f034258-c0b7-4739-ddea-b7abe9589504@st.com>
References: <20200925102233.18016-1-yannick.fertre@st.com>
 <c28eae83c4297e14ed039eb00154d3a7e0fddaaa.camel@perches.com>
In-Reply-To: <c28eae83c4297e14ed039eb00154d3a7e0fddaaa.camel@perches.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D6EE5DFB51C631478802CC95F60C7892@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_07:2020-09-24,
 2020-09-28 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: Use dev_ based logging
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



On 9/25/20 2:02 PM, Joe Perches wrote:
> On Fri, 2020-09-25 at 12:22 +0200, Yannick Fertre wrote:
>> Standardize on the dev_ based logging and drop the include of drm_print.h.
>> Remove useless dsi_color_from_mipi function.
> []
>> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> []
>> -	DRM_DEBUG_DRIVER("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
>> -			 pll_in_khz, pll_out_khz, *lane_mbps);
>> +	dev_dbg(dsi->dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n", pll_in_khz, pll_out_khz,
>> +		*lane_mbps);
> 
> The line wrapping change here is pretty pointless and IMO
> makes the code harder to read.

Hi,
ok, I will restore the line wrapping.

Best regards

Yannick
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
