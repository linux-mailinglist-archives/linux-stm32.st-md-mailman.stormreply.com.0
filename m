Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0FC4B48EE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 11:12:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91388C5F1F2;
	Mon, 14 Feb 2022 10:12:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A3BC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 10:12:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21E86urF026746;
 Mon, 14 Feb 2022 11:11:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MpTqBNhX+HIyoyjXnQ6/DBGf/cO04PKi4xy5WrWMQtM=;
 b=55UHFt0xRaAGpxn2Pr8CS2hOQbO5daWb1jFg7gbjWrrTxF8SuQ8Fr5X4YLwUJ18r0iG+
 a05X2ZlAldKYLmZDICq/fH6FuipuQBmWduzK52C1XKBDkQagpQHZiDLR2PiXJKAO8n6H
 B1WVk9i5XcVranVUk+W43HboAlMqmSqrGQ99Qdly5zkSfP0Y16cfNJNdCBDXObFLTJ9z
 PuoTnKNH9lgi14OtayFnvMc/QeAHCsLWEQf2olS4s3nxcF22yucBEYez0a7N0fYOZ9YP
 GBFsDQdNumGCo9FjFnB0y3vTjfY/ySiJeXmUBrRswVJ5USVkxDs4Y0Wv7eTNz4SL8BnB Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e74c3bs05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:11:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9646910002A;
 Mon, 14 Feb 2022 11:11:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C004219DED;
 Mon, 14 Feb 2022 11:11:57 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Feb
 2022 11:11:57 +0100
Message-ID: <c3c1d310-19f0-889b-04b5-f3628e09b3bf@foss.st.com>
Date: Mon, 14 Feb 2022 11:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <robh+dt@kernel.org>
References: <1644403729-22665-1-git-send-email-fabrice.gasnier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <1644403729-22665-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: remove timer
 duplicate unit-address on stm32f7 series
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

Hi Fabrice

On 2/9/22 11:48, Fabrice Gasnier wrote:
> Remove a series of warnings seen when building with W=1, like:
> Warning (unique_unit_address): /soc/timer@40000c00: duplicate unit-address
> (also used in node /soc/timers@40000c00)
> 
> This approach is based on some discussions[1], to restructure the dtsi
> and dts files.
> [1] https://lore.kernel.org/linux-arm-kernel/Yaf4jiZIp8+ndaXs@robh.at.kernel.org/
> 
>   arch/arm/boot/dts/stm32746g-eval.dts  | 12 +++++++++
>   arch/arm/boot/dts/stm32f746-disco.dts | 12 +++++++++
>   arch/arm/boot/dts/stm32f746.dtsi      | 47 -----------------------------------
>   arch/arm/boot/dts/stm32f769-disco.dts | 12 +++++++++
>   4 files changed, 36 insertions(+), 47 deletions(-)
> 

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
