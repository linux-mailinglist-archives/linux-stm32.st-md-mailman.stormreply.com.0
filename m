Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB83606564
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 18:07:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3790FC64106;
	Thu, 20 Oct 2022 16:07:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 363F5C55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 16:07:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KC83fS025984;
 Thu, 20 Oct 2022 18:07:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G+3mjplxdTbOgvMkscnMjCjJb5mxC78D/8xQhmfa+Io=;
 b=iLxHEZUdAAhPZfN6OHrYEruw2TTaGuAaBMgONvo3rZP/M3Pv9Lc4nnCV9mwknLPiAQH0
 yr3vGo+FYt/EkcWsH27+6nqoW96oV3xPTLPoFY4TmflmUHyaNu5vtkkQw1/ID4hY+XYK
 7WTbOxf8FTxf6R6Im2TYUfLTVtXUwqIsmIbb+mVb8yP25y8IyxOgvRQuDmgySE61dI2d
 3Yn/mEhP6ipJE/uYrWnvnHZy5TvvKZ/NkUouusZhOyyGTwmiq3mGXF+Z72poxIggSr8R
 Awee+NWag21WCiskUMKl1X63pKYVqDkF8islhmyxpx6YXVPWzn6RtDHCdVecmdlHWaz3 TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kaegran84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 18:07:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDCA010002A;
 Thu, 20 Oct 2022 18:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA09B23D3EE;
 Thu, 20 Oct 2022 18:07:34 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 18:07:33 +0200
Message-ID: <141eb579-3fbc-7582-36be-a803160ad939@foss.st.com>
Date: Thu, 20 Oct 2022 18:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220926224437.546566-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220926224437.546566-1-marex@denx.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_07,2022-10-20_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename mdio0 to mdio
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

Hi

On 9/27/22 00:44, Marek Vasut wrote:
> Replace "mdio0" node with "mdio" to match mdio.yaml DT schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi     | 2 +-
>   arch/arm/boot/dts/stm32mp157c-ev1.dts                | 2 +-
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts            | 2 +-
>   arch/arm/boot/dts/stm32mp157c-odyssey.dts            | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi         | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi   | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi               | 2 +-
>   8 files changed, 8 insertions(+), 8 deletions(-)
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
