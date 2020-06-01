Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D443D1EA0A3
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 11:14:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FCBC36B22;
	Mon,  1 Jun 2020 09:14:02 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4472C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 09:13:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 52E552A1629
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Philippe CORNU <philippe.cornu@st.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
In-Reply-To: <4acc09e8-0610-01f6-b18d-3ffc390c45a3@st.com>
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
 <20200427081952.3536741-9-adrian.ratiu@collabora.com>
 <4acc09e8-0610-01f6-b18d-3ffc390c45a3@st.com>
Date: Mon, 01 Jun 2020 12:15:02 +0300
Message-ID: <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Heiko Stuebner <heiko@sntech.de>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v8 08/10] drm: stm: dw-mipi-dsi: let the
 bridge handle the HW version check
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

On Fri, 29 May 2020, Philippe CORNU <philippe.cornu@st.com> wrote:
> Hi Adrian, and thank you very much for the patchset.  Thank you 
> also for having tested it on STM32F769 and STM32MP1.  Sorry for 
> the late response, Yannick and I will review it as soon as 
> possible and we will keep you posted.  Note: Do not hesitate to 
> put us in copy for the next version  (philippe.cornu@st.com, 
> yannick.fertre@st.com) Regards, Philippe :-) 

Hi Philippe,

Thank you very much for your previous and future STM testing, 
really appreciate it! I've CC'd Yannick until now but I'll also CC 
you sure :)

It's been over a month since I posted v8 and I was just gearing up 
to address all feedback, rebase & retest to prepare v9 but I'll 
wait a little longer, no problem, it's no rush.

Have an awesome day,
Adrian

>
>
> On 4/27/20 10:19 AM, Adrian Ratiu wrote:
>> The stm mipi-dsi platform driver added a version test in
>> commit fa6251a747b7 ("drm/stm: dsi: check hardware version")
>> so that HW revisions other than v1.3x get rejected. The rockchip
>> driver had no such check and just assumed register layouts are
>> v1.3x compatible.
>> 
>> Having such tests was a good idea because only v130/v131 layouts
>> were supported at the time, however since adding multiple layout
>> support in the bridge, the version is automatically checked for
>> all drivers, compatible layouts get picked and unsupported HW is
>> automatically rejected by the bridge, so there's no use keeping
>> the test in the stm driver.
>> 
>> The main reason prompting this change is that the stm driver
>> test immediately disabled the peripheral clock after reading
>> the version, making the bridge read version 0x0 immediately
>> after in its own probe(), so we move the clock disabling after
>> the bridge does the version test.
>> 
>> Tested on STM32F769 and STM32MP1.
>> 
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
>> Tested-by: Adrian Pop <pop.adrian61@gmail.com>
>> Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> ---
>> New in v6.
>> ---
>>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> index 2e1f2664495d0..7218e405d7e2b 100644
>> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> @@ -402,15 +402,6 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   		goto err_dsi_probe;
>>   	}
>>   
>> -	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
>> -	clk_disable_unprepare(pclk);
>> -
>> -	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>> -		ret = -ENODEV;
>> -		DRM_ERROR("bad dsi hardware version\n");
>> -		goto err_dsi_probe;
>> -	}
>> -
>>   	dw_mipi_dsi_stm_plat_data.base = dsi->base;
>>   	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
>>   
>> @@ -423,6 +414,9 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   		goto err_dsi_probe;
>>   	}
>>   
>> +	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
>> +	clk_disable_unprepare(pclk);
>> +
>>   	return 0;
>>   
>>   err_dsi_probe:
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
