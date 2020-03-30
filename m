Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4077198654
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 23:19:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 955A4C36B0B;
	Mon, 30 Mar 2020 21:19:40 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51553C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 21:19:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 027AC296467
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
 <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
Date: Tue, 31 Mar 2020 00:20:42 +0300
Message-ID: <87a73x35g5.fsf@collabora.com>
MIME-Version: 1.0
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Martyn Welch <martyn.welch@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, linux-rockchip@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host
	platform driver
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

On Mon, 30 Mar 2020, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Adrian, 
> 
> On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu 
> <adrian.ratiu@collabora.com> wrote: 
>> 
>> This adds support for the Synopsis DesignWare MIPI DSI v1.01 
>> host controller which is embedded in i.MX 6 SoCs. 
>> 
>> Based on following patches, but updated/extended to work with 
>> existing support found in the kernel: 
>> 
>> - drm: imx: Support Synopsys DesignWare MIPI DSI host 
>> controller 
>>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com> 
>> 
>> - ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller 
>>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com> 
> 
> This one looks like a devicetree patch, but this patch does not 
> touch devicetree. 
> 
>> +       ret = clk_prepare_enable(dsi->pllref_clk); +       if 
>> (ret) { +               dev_err(dev, "%s: Failed to enable 
>> pllref_clk\n", __func__); +               return ret; +       } 
>> + +       dsi->mux_sel = 
>> syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr"); + 
>> if (IS_ERR(dsi->mux_sel)) { +               ret = 
>> PTR_ERR(dsi->mux_sel); +               dev_err(dev, "%s: Failed 
>> to get GPR regmap: %d\n", +                       __func__, 
>> ret); +               return ret; 
> 
> You should disable the dsi->pllref_clk clock prior to returning 
> the error. 
> 
>> +       dsi->mipi_dsi = dw_mipi_dsi_probe(pdev, pdata); + 
>> if (IS_ERR(dsi->mipi_dsi)) { +               ret = 
>> PTR_ERR(dsi->mipi_dsi); +               dev_dbg(dev, "%s: 
>> Unable to probe DW DSI host device: %d\n", + 
>> __func__, ret); +               return -ENODEV; 
> 
> Same here. You should disable the clock. Shouldn't you return 
> 'ret' here instead of -ENODEV? 
> 
>> +module_platform_driver(imx_mipi_dsi_driver); + 
>> +MODULE_DESCRIPTION("i.MX6 MIPI DSI host controller driver"); 
>> +MODULE_AUTHOR("Liu Ying <Ying.Liu@freescale.com>"); 
> 
> The freescale.com domain is no longer functional. 
> 
> Ying Liu's NXP address is victor.liu@nxp.com. You could probably 
> add your entry as well. 

Hi Fabio,

All the issues you pointed out are valid and will be addressed in 
v6 (including the device tree ones).

Thank you, much appreciated,
Adrian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
