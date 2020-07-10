Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C421B186
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2020 10:44:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD688C36B2A;
	Fri, 10 Jul 2020 08:44:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD85EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 08:44:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A8hugw023269; Fri, 10 Jul 2020 10:43:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+8RAqgZ8a6NmGd9X4MEqGphV/o8H2tk6T5fumgTJaC0=;
 b=BMa+iUzCxVZPujFHN2I4gIZj6BjgYEpeajwNDvln/iAsqeQ/6ehEXIXZSmUdpD1XZS85
 8JdK8nkqK5Kp8DfddPP1Lqk2nsZvlAEN3lEiK5RuROa2dQ47hxJPlzHyVGxa9PVgUltY
 r++upg1bRKPK1Xp5+KGYXzWxMNk3zpdNL/sT7wBimbX7KPoqW4kyjq+ayWTK4VOPwOxn
 Wn+KeOiJ4Y2ioJepy1XnM8AvooCx56rM5aYaeJRrOWCN9egwiXkx6PJ+Q+cLBYXTKwmF
 vcvqswmPoKw5Iqvih+UTh13+JBM+pUrLEXbvHeCqRum/6O2gOmpJeGHOFfYZr7BWSZd5 hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k3w237d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 10:43:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FBD710002A;
 Fri, 10 Jul 2020 10:43:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 679412AD2BB;
 Fri, 10 Jul 2020 10:43:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jul
 2020 10:43:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jul 2020 10:43:51 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Antonio BORNEO <antonio.borneo@st.com>
Thread-Topic: [PATCH v2] drm/bridge/synopsys: dsi: allow LP commands in video
 mode
Thread-Index: AQHWVTFH38ZYMkorkkKnxOYVxCrrvKkAYIgA
Date: Fri, 10 Jul 2020 08:43:51 +0000
Message-ID: <0df822a2-a6a6-0ec6-a6c2-a59b821113c3@st.com>
References: <20200708140836.32418-1-yannick.fertre@st.com>
In-Reply-To: <20200708140836.32418-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <87B46CB0E55D4F4C85FBFFD7D51061D7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_02:2020-07-10,
 2020-07-10 signatures=0
Subject: Re: [Linux-stm32] [PATCH v2] drm/bridge/synopsys: dsi: allow LP
 commands in video mode
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



On 7/8/20 4:08 PM, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code only sends LP commands in command mode.
> 
> Allows sending LP commands also in video mode by setting the
> proper flag in DSI_VID_MODE_CFG.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 1a24ea648ef8..e9a0f42ff99f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -89,6 +89,7 @@
>   #define VID_MODE_TYPE_NON_BURST_SYNC_EVENTS	0x1
>   #define VID_MODE_TYPE_BURST			0x2
>   #define VID_MODE_TYPE_MASK			0x3
> +#define ENABLE_LOW_POWER_CMD		BIT(15)
>   #define VID_MODE_VPG_ENABLE		BIT(16)
>   #define VID_MODE_VPG_HORIZONTAL		BIT(24)
>   
> @@ -376,6 +377,13 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>   
>   	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
>   	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
> +
> +	val = dsi_read(dsi, DSI_VID_MODE_CFG);
> +	if (lpm)
> +		val |= ENABLE_LOW_POWER_CMD;
> +	else
> +		val &= ~ENABLE_LOW_POWER_CMD;
> +	dsi_write(dsi, DSI_VID_MODE_CFG, val);
>   }
>   
>   static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
> 

(+ Antonio)

Hi Yannick & Antonio,

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Tested-by: Philippe Cornu <philippe.cornu@st.com>

(Tested with the 3 patches named
drm/bridge/synopsys: dsi: allow LP commands in video mode
drm/bridge/synopsys: dsi: allow sending longer LP commands
drm/bridge/synopsys: dsi: add support for non-continuous HS clock
on various dsi bridges + stm32mp157 disco board)

Many thanks
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
