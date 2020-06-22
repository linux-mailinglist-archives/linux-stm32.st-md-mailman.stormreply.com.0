Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D330203C66
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2020 18:21:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49537C36B0C;
	Mon, 22 Jun 2020 16:21:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD820C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 16:21:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MGIkVi024038
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 22 Jun 2020 18:21:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=d7g190ueT3AVSLRAlNaQ4wU53M6xiNchtZJqjpLSFQo=;
 b=x41EJhZXV+/XCOYpwZctWUUxvbiZPMNqgffrSdCT6V9gTsD6/8OPo9gTmGQU5A/3hVa0
 03hxHXIZMlZxRKRdXUmpuwd23bV6oqnx+vaM5PFPO1JIEvAzPXG4bBsy0q7gRpJ5QBl8
 0i/doFiyhfcwVvj9MFJnIvpxaUzS8WINx+EBQLaB9r9M/+hwOblPMoC/X9Svsmum2C1V
 fjoPO6cY/764X5lKCQx2DbNbwbC0ZWqsZ3Dnbnb3V+jChaCt4vNGGKt7lr+eyHqQ2ila
 gpEO+5tbLzljr2XPzyvGeUOAB5frx+pz6EcTzf4/8BQFwsOpyOEXhKV99cXcH4rB9Gfj Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31s7x1jnyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 22 Jun 2020 18:21:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6633010002A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 18:21:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B1772B27E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 18:21:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 18:21:37 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jun 2020 18:21:37 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Antonio BORNEO <antonio.borneo@st.com>, Yannick FERTRE
 <yannick.fertre@st.com>
Thread-Topic: [PATCH 0/1] [Kontron] [URGENT]: drm/bridge/synopsys/dsi: fix
 activation sequence
Thread-Index: AQHWSJH41ZiUcoz0FUmnZj3MqIB4gKjkyg8w
Date: Mon, 22 Jun 2020 16:21:37 +0000
Message-ID: <564eb888e98b4cdca00afc1d2555c652@SFHDAG6NODE3.st.com>
References: <20200622123642.1196964-1-antonio.borneo@st.com>
In-Reply-To: <20200622123642.1196964-1-antonio.borneo@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_09:2020-06-22,
 2020-06-22 signatures=0
Cc: Bernard PUEL <bernard.puel@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Valere DELONG <valere.delong@st.com>
Subject: Re: [Linux-stm32] [PATCH 0/1] [Kontron] [URGENT]:
 drm/bridge/synopsys/dsi: fix activation sequence
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

Hi Antonio,

And thank you for the patch.

If it helps a customer, I have nothing more to say except that it's a great patch!

You're pointing to a real complex problem. You may have seen that a first tentative to solve it has been done by Matt Redfearn on the bridge side (here the adv7511/7533 RGB to DSI bridge, controlled by I2C, https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/bridge/adv7511?id=83f35bc3a852f1c3892c7474998c5cec707c7ba3) and 2 months after, Rob Clarke revert this patch, explaining how it will be complex to find a proper fix due to the legacy and the complexity (https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/bridge/adv7511?id=2472518e44eee3a45bd436a4162046790b74767a).

Note that in our internal baseline, we are still using the Matt Redfearn patch for the adv7533, this is of course not perfect, but easier for the moment to enable the adv7533 use case.

DSI probing dynamic is very complex: panels & bridges dynamics are different, but also "direct" probing (stm) vs "bind/unbind" (hisilicon) strategies add more complexity...

Your patch looks good and if you have done enough tests on both MP15x eval and disco boards, then I think you can share it with the customer (of course please warn the customer that this fix will probably not be the final one in future kernel versions). 

Nevertheless, I wonder if a patch in the SN65DSI84 bridge driver like the one we use for the adv7533 may also help to enable the use case.

Somehow, your patch could be used to precisely start these complex discussions with the drm community and the users of the dsi designware bridge.

Best regards,
Philippe :-)

-----Original Message-----
From: Antonio BORNEO <antonio.borneo@st.com> 
Sent: Monday, June 22, 2020 14:37
To: Yannick FERTRE <yannick.fertre@st.com>; Philippe CORNU <philippe.cornu@st.com>
Cc: Bernard PUEL <bernard.puel@st.com>; Valere DELONG <valere.delong@st.com>; Antonio BORNEO <antonio.borneo@st.com>; linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/1] [Kontron] [URGENT]: drm/bridge/synopsys/dsi: fix activation sequence

Customer is waiting for this patch, but I don't want to send it out without the approval of the experts.

Background:
Kontron is connecting a dsi-to-lvds bridge TI sn65dsi83 to MP15x.
The driver for the bridge is not mainline, but taken from
https://github.com/varigit/linux-imx/tree/imx_4.14.98_2.0.0_ga_var01/drivers/gpu/drm/bridge/sn65dsi83
and rebased by customer.

Note: I do not have the bridge above, so I have hacked the driver to skip all the I2C transfer. My target is to get it loaded and to get the DSI signal out.

Kontron reports:
| we want to connect a LVDS display on the DSI port of the MP157.
| The DSI2LVDS bridge chip is an SN65DSI84 chip on i2c bus. I've 
| configured the connectors in the following way:
|
| ltdc@ep1 -> dsi@ep0, dsi@ep1 -> lvds@ep0
|
| The documentation mentions that a panel or bridge node must be 
| available in the DSI part. So for a panel this works. But what must be 
| the entry for a bridge?
| My bridge must be located on the i2c bus because of the configuration 
| interface. The display parameters are configured in the bridge node.
|
| When the DSI node doesn't contain a panel node, DRM/modetest doesn't 
| even recognize the DSI-1 connector. When the node contains a panel, 
| the DSI-1 is created, but no framebuffer can be created. Seems this is 
| not the right way, else i have to> configure the display twice (in the 
| dsi node and in the bridge).

Verified on my side. If there is no panel as subnode of DSI, the DSI does not start and also LTDC fails the probe.

This case would be common for each bridge that is not initialized through DSI but through e.g. I2C.

The bug is schematized in the activation sequence of current code:

LTDC driver:
 .probe
	stm_drm_platform_probe()
		drv_load()
			ltdc_load()
				drm_of_find_panel_or_bridge()

The call drm_of_find_panel_or_bridge() returns -EPROBE_DEFER if the driver of DSI has not registered the bridge (rgb to dsi) by calling drm_bridge_add().

DSI driver:
 .probe
	dw_mipi_dsi_stm_probe()
		dw_mipi_dsi_probe()
			mipi_dsi_host_register()

As you can see, the probe of DSI does not call drm_bridge_add() directly.
If as subnode of DSI there is a "panel", mipi_dsi_host_register() will cause the probe() of the panel.
At least for the panels we use today with MP15x, their probe() terminates by attaching the panel to the DSI by calling
mipi_dsi_attach() that, in turn, calls the .attach() method of the DSI driver, reported below:

 .attach
	dw_mipi_dsi_host_attach()
		drm_bridge_add()

If the DSI has no subnodes, the .attach method will never get called, the DSI does not declare itself as a DRM bridge, the ltdc will defer forever its own probe.

This patch moves the relevant part of the attach method in probe.
Of course, the corresponding detach part goes in remove.

The binding document in v5.4 reports that the DSI subnode is mandatory. But from v5.5 the yaml document drops the mandatory requirement.

I have tested that on EV1 we do not have regressions.
Test on DK2 on-going.
Do you approve sending this out to customer?

By the way, I highlighted with FIXME another bug in the code.
I will check it later.

Antonio Borneo (1):
  drm/bridge/synopsys: fix activation sequence

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 72 ++++++++++---------
 1 file changed, 37 insertions(+), 35 deletions(-)

--
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
