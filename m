Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6D21B195
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2020 10:47:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07694C36B2A;
	Fri, 10 Jul 2020 08:47:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64112C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 08:47:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A8gvMY019342; Fri, 10 Jul 2020 10:47:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hW99NkJO01Cohy8Gf4OtWTFT16GdgjphlWc9M91Ndb0=;
 b=ALie7Y91hIP0v34yBtcNOs7wvwnOIT/72QqC4tHooxspJoBoVHqjFYstbZlmAYuQST+H
 v0iur6QqLKBBOluT/GlS1SIu8Qp2+BNLAtE3tFptVf6/oNP9YI+okSrm2hcZna5vftud
 uoqLyCQNKdkQD6eDSBu90RrnEbcvIARBaBAJZjs8C62sMOSvPBZdyRIsTwb4eCYgsfZ6
 7oTBtyJ6Qclp/6e3mq3T5N6I3kU7Mj2KcohgKvHm9MulOwvby3Sy2fcoFaBh9zVldmLW
 iiiDJQCEXA+2SBJAMNJ9c6zUVcF0XxEKohucHxQCp8EoMHuhhdrbqtOUTvOR7Zmrc0// BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k4d241m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 10:47:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4B7B10002A;
 Fri, 10 Jul 2020 10:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9CF72A5AD2;
 Fri, 10 Jul 2020 10:47:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 Jul
 2020 10:47:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jul 2020 10:47:23 +0200
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
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: add support for non-continuous
 HS clock
Thread-Index: AQHWT9/Fw6NgLa8gK02Mjd/7Q+XhP6kAbC6A
Date: Fri, 10 Jul 2020 08:47:23 +0000
Message-ID: <8036e047-15c6-d259-66c2-c7f625faf759@st.com>
References: <20200701194234.18123-1-yannick.fertre@st.com>
In-Reply-To: <20200701194234.18123-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <EC00A6D55CBAED45991E6F0B1D92078E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_02:2020-07-10,
 2020-07-10 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: add support for
 non-continuous HS clock
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



On 7/1/20 9:42 PM, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code enables the HS clock when video mode is started or to
> send out a HS command, and disables the HS clock to send out a LP
> command. This is not what DSI spec specify.
> 
> Enable HS clock either in command and in video mode.
> Set automatic HS clock management for panels and devices that
> support non-continuous HS clock.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..979acaa90d00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -365,7 +365,6 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>   	if (lpm)
>   		val |= CMD_MODE_ALL_LP;
>   
> -	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
>   	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
>   }
>   
> @@ -541,16 +540,22 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>   static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
>   				 unsigned long mode_flags)
>   {
> +	u32 val;
> +
>   	dsi_write(dsi, DSI_PWR_UP, RESET);
>   
>   	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
>   		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
>   		dw_mipi_dsi_video_mode_config(dsi);
> -		dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
>   	} else {
>   		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
>   	}
>   
> +	val = PHY_TXREQUESTCLKHS;
> +	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> +		val |= AUTO_CLKLANE_CTRL;
> +	dsi_write(dsi, DSI_LPCLK_CTRL, val);
> +
>   	dsi_write(dsi, DSI_PWR_UP, POWERUP);
>   }
>   
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
