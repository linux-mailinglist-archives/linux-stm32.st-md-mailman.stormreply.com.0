Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 394EF21B193
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2020 10:47:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBCCBC36B2A;
	Fri, 10 Jul 2020 08:47:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52CEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 08:47:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A8hvsN023297; Fri, 10 Jul 2020 10:47:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PrN5kBt2TadyKgoLOcW355tH8MFDlyPGhVCqGnwYIbg=;
 b=AahgDr6fLSVPD+7/zRFJ8QQLDZR7z0NW7fZM9JnEqlBUB7gyBtdN0pGO4jucEMCDrx2x
 4Vnus3hjNObAWTrO2BONsmcw0AcGXZGauvAoix0ns47r0oKRd4ybLrY3xSTPTaelkd3k
 xLWyDgjQaA/dHqOxmKGwoDbVKhYShJveMlgZkaaKWByuk+XAX5A39pghRfoySOqPxdIa
 NvuKWv8Km57ROUT+dzicTN74USqKUe/EO1u4KqhqS0UwUEDBwnkR3JIqZw3DrYYGsEFN
 jTyLFDyRj6j98feg6edaZHugHZeYlmc5XX4vnTZmcO1odjW4FUpxeNerIdM8Gz/bDGSR gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k3w23uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 10:47:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC776100038;
 Fri, 10 Jul 2020 10:47:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93B8B2AD2C5;
 Fri, 10 Jul 2020 10:47:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jul
 2020 10:47:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jul 2020 10:47:15 +0200
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
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: allow sending longer LP
 commands
Thread-Index: AQHWT7RR56+kk8DFkkudT5fcfOVJRKkAbGUA
Date: Fri, 10 Jul 2020 08:47:14 +0000
Message-ID: <4947d7a1-5816-5789-dfcd-e802a9463ffa@st.com>
References: <20200701143131.841-1-yannick.fertre@st.com>
In-Reply-To: <20200701143131.841-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <03D6A15FFFB854438405B991F3EA5C68@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_02:2020-07-10,
 2020-07-10 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: allow sending
 longer LP commands
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



On 7/1/20 4:31 PM, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code does not properly computes the max length of LP
> commands that can be send during H or V sync, and rely on static
> values.
> Limiting the max LP length to 4 byte during the V-sync is overly
> conservative.
> 
> Relax the limit and allows longer LP commands (16 bytes) to be
> sent during V-sync.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..1a24ea648ef8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -360,6 +360,15 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>   	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
>   	u32 val = 0;
>   
> +	/*
> +	 * TODO dw drv improvements
> +	 * largest packet sizes during hfp or during vsa/vpb/vfp
> +	 * should be computed according to byte lane, lane number and only
> +	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> +	 */
> +	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(16)
> +		  | INVACT_LPCMD_TIME(4));
> +
>   	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
>   		val |= ACK_RQST_EN;
>   	if (lpm)
> @@ -611,14 +620,6 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
>   	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel));
>   	dsi_write(dsi, DSI_DPI_COLOR_CODING, color);
>   	dsi_write(dsi, DSI_DPI_CFG_POL, val);
> -	/*
> -	 * TODO dw drv improvements
> -	 * largest packet sizes during hfp or during vsa/vpb/vfp
> -	 * should be computed according to byte lane, lane number and only
> -	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> -	 */
> -	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
> -		  | INVACT_LPCMD_TIME(4));
>   }
>   
>   static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
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
