Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807110C86E
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2019 13:14:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12B7AC36B0B;
	Thu, 28 Nov 2019 12:14:53 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB4F9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2019 12:14:50 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48CA0C04AE;
 Thu, 28 Nov 2019 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574943289; bh=qF35AoPifrNvTf/YUouYMmvjQrozsmfqvabl0+mCjUs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PihxpMA3ItCzn4aHjAd7lI3H5Clj1cg+AivuK8lSk7mdp5Jiqht13bxz0DarRxgB+
 WWPMBcf4nYkFlYdWuCnwcG6moE4gMD+EHm/Idw2cHf48iJmFJn0MHHGu5AT1HFmYCt
 co6NYZ6Uo5QNtEn5VRSFPkQtSw9+sG/RKwtzW2ixDdxTxL5ns4EEopWVIQYHXr/Ccx
 fu/GlZNEJl1P+oLG9F8VzLh30mM8XnSDi3gLO5PKFDYMgCMvC2OCyd6IZBbxqgcOUh
 Z3x7nT+jL1JD2DvNq2g8YAR77kJB7uG7LQZmQm+iAT5X7Yto2kI7mZ8YvDTtLM948G
 KDKgG/ctl4l2Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6C6BEA0079;
 Thu, 28 Nov 2019 12:14:47 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 28 Nov 2019 04:14:27 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 28 Nov 2019 04:14:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRI1xkzIsutrVaMMywdakGIOjH/9S/etq37+g/hUOrofR6YGoSDv/Awd36nJFqa8iBvqetmql/yCyPtsj5sNR3qEq+4bgX35BHOVUgtQM+eEGQ7j8cw9WZpT+tp1cqveARV6ifAxm1KvF1kpcHZfeZtKuedxR8P4nQ3OUFvje1njn8h1iQ4Qi1Loy8BFSHnY0qyXE9gLABAwtg6aW65p5P6zMAJbTjR6/Shgg1X8aBIcllGSJ6DruyIHJ02whRPQUVkuuYPiSJ+5n0xkn9ESDZHnAqElPljHMBUib0ShD2874Tlknzistyvugg7Zw0QiZxBkCCvxBwd37CMzGPeIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF35AoPifrNvTf/YUouYMmvjQrozsmfqvabl0+mCjUs=;
 b=b0PIbDIW4NPHvo6shFdlN8WTgM55mbE+6d/yP6ANRkYojsR5CAlvWjHm9iy0y49tFqLY/CkvjKSngNpqPUnH3t8wdODfdAaOD5ajjTTPzrvF2ysZdogbMkScq+Tu8y3kQvA3jQTvfqYGdIA/WbkZOty6lrNjJE4qeD1a9XX56iyrjIekkz2CvUTtdeYKVYUBJ38F+e5vq9nrwvKvzWSeBOe7YC/9Gi3zG0+j12/S/LGQgDxoQJBXMfxNZ5Te7cfyREM7ixUO5fchrIzD7sYOIA5fDzJlOzCE1ktkqcQa5ObydPlMj/ye4HIQ2Wyl6o8QhXqbpOi5JaEn+CUntNunfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF35AoPifrNvTf/YUouYMmvjQrozsmfqvabl0+mCjUs=;
 b=ChLYCgLQmeIEK2Kn/WKON6q6mutzB0PQ3m6nNyrRGTmF0Irx85K7DzKZ0DGssV+061RauYQzgKYOrlYxQRDDPMdLON4dFjxxz5OV5+3T3MJ2orVgCSZ0OU0k+Cco/DQDW+pqBr5dcvH2G6JLwWunK/1qDWg2AQYMVxAEWPDq3Ew=
Received: from CH2PR12MB4088.namprd12.prod.outlook.com (20.180.5.200) by
 CH2PR12MB4214.namprd12.prod.outlook.com (20.180.7.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 28 Nov 2019 12:14:25 +0000
Received: from CH2PR12MB4088.namprd12.prod.outlook.com
 ([fe80::281c:344a:980f:e54e]) by CH2PR12MB4088.namprd12.prod.outlook.com
 ([fe80::281c:344a:980f:e54e%2]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 12:14:25 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@st.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Thread-Topic: [PATCH 2/2] usb: dwc2: add support for STM32MP15 SoCs USB OTG HS
 and FS
Thread-Index: AQHVo3r1peZjYZz6/UmbWub1TSvuGaegg8gA
Date: Thu, 28 Nov 2019 12:14:25 +0000
Message-ID: <9c30067d-0c38-b5a3-9aa1-ddf6ae68268d@synopsys.com>
References: <20191125102659.22853-1-amelie.delaunay@st.com>
 <20191125102659.22853-3-amelie.delaunay@st.com>
In-Reply-To: <20191125102659.22853-3-amelie.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 157e16df-6d81-46be-8a7d-08d773fc828d
x-ms-traffictypediagnostic: CH2PR12MB4214:
x-microsoft-antispam-prvs: <CH2PR12MB421423628EAD55525DE83D38A7470@CH2PR12MB4214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(6029001)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(189003)(76116006)(91956017)(66556008)(26005)(66476007)(66946007)(81166006)(14454004)(5660300002)(102836004)(6506007)(66446008)(76176011)(64756008)(110136005)(316002)(99286004)(71190400001)(53546011)(71200400001)(305945005)(2616005)(58126008)(7416002)(54906003)(7736002)(65956001)(3846002)(14444005)(256004)(31686004)(186003)(6512007)(66066001)(36756003)(478600001)(65806001)(86362001)(8936002)(6116002)(31696002)(11346002)(6246003)(4326008)(8676002)(6486002)(2906002)(25786009)(81156014)(229853002)(446003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4214;
 H:CH2PR12MB4088.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qUo3dAxcWKcKboXZD1qRvtu3SA5b8jum3DIByggo6yFNZ6us5wQumTjkvYSfzENwPlxBX2oDiP0MdbLc38Ary/Ws/wNJWVYQc5U08O+G53y2vx3+nqtyRHiI6rHghxPRkGCNTX4HI+QKrK0uy0UEPouHbya+etFlIVJogZK0uT6PLLX/LS0yDfWeMryFWLhpMKDYGlIX/229Yt0BZ1CG9XgBtIbv4nrJ12s2pTnmlWi1zyKmitVXtdcZf6XDP/qly45JybUxehyYJpNy3/uajD02KAHgLXJcgHFMAcvtnwYPsHFyTKgUha6iy5++IPwnrcMLWg6Qa6x0ylhHaY8/AcSElFnwdqc4mB+cVdAARJ2V94MTrWIl//oZXlUgOgZl2sAnsT9LSjoNkixFR7QKsGcdD8gf68q4zOynjgGcNn5NtCWfg2YnKiyVnGo5Rj/t
x-ms-exchange-transport-forked: True
Content-ID: <59B8B9FF7082B84CA16F1A32B675B1E8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 157e16df-6d81-46be-8a7d-08d773fc828d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 12:14:25.3948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H20J5YWV5YzEbypUgMP4Ix53dW7NltNyeWHwaXjxWwB8LrzSlUP2B42/NNae1MLOMkn0GceKUYxkSFw/O1OaBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
X-OriginatorOrg: synopsys.com
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] usb: dwc2: add support for STM32MP15
 SoCs USB OTG HS and FS
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

Hi,

On 11/25/2019 2:26 PM, Amelie Delaunay wrote:
> This patch introduces a new parameter to activate external ID pin and valid
> vbus level detection, required on STM32MP15 SoC to support dual role,
> either in HS or FS.
> The STM32MP15 SoC uses the GGPIO register to enable the level detection.
> The level detector requires to be powered.
> Also adds the params structures for STM32MP15 OTG HS and STM32MP1 OTG FS.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
>   drivers/usb/dwc2/core.h     |  8 ++++
>   drivers/usb/dwc2/hw.h       |  8 ++++
>   drivers/usb/dwc2/params.c   | 33 +++++++++++++
>   drivers/usb/dwc2/platform.c | 94 ++++++++++++++++++++++++++++++++++++-
>   4 files changed, 141 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index d08d070a0fb6..687fefcd5706 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -411,6 +411,10 @@ enum dwc2_ep0_state {
>    *			register.
>    *			0 - Deactivate the transceiver (default)
>    *			1 - Activate the transceiver
> + * @activate_stm_id_vb_detection: Activate external ID pin and Vbus level
> + *			detection using GGPIO register.
> + *			0 - Deactivate the external level detection (default)
> + *			1 - Activate the external level detection
>    * @g_dma:              Enables gadget dma usage (default: autodetect).
>    * @g_dma_desc:         Enables gadget descriptor DMA (default: autodetect).
>    * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
> @@ -481,6 +485,7 @@ struct dwc2_core_params {
>   	bool service_interval;
>   	u8 hird_threshold;
>   	bool activate_stm_fs_transceiver;
> +	bool activate_stm_id_vb_detection;
>   	bool ipg_isoc_en;
>   	u16 max_packet_count;
>   	u32 max_transfer_size;
> @@ -874,6 +879,8 @@ struct dwc2_hregs_backup {
>    *                      removed once all SoCs support usb transceiver.
>    * @supplies:           Definition of USB power supplies
>    * @vbus_supply:        Regulator supplying vbus.
> + * @usb33d:		Optional 3.3v regulator used on some stm32 devices to
> + *			supply ID and VBUS detection hardware.
>    * @lock:		Spinlock that protects all the driver data structures
>    * @priv:		Stores a pointer to the struct usb_hcd
>    * @queuing_high_bandwidth: True if multiple packets of a high-bandwidth
> @@ -1061,6 +1068,7 @@ struct dwc2_hsotg {
>   	struct dwc2_hsotg_plat *plat;
>   	struct regulator_bulk_data supplies[DWC2_NUM_SUPPLIES];
>   	struct regulator *vbus_supply;
> +	struct regulator *usb33d;
>   
>   	spinlock_t lock;
>   	void *priv;
> diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
> index 510e87ec0be8..c4027bbcedec 100644
> --- a/drivers/usb/dwc2/hw.h
> +++ b/drivers/usb/dwc2/hw.h
> @@ -54,6 +54,12 @@
>   #define GOTGCTL_HSTSETHNPEN		BIT(10)
>   #define GOTGCTL_HNPREQ			BIT(9)
>   #define GOTGCTL_HSTNEGSCS		BIT(8)
> +#define GOTGCTL_BVALOVAL		BIT(7)
> +#define GOTGCTL_BVALOEN			BIT(6)
> +#define GOTGCTL_AVALOVAL		BIT(5)
> +#define GOTGCTL_AVALOEN			BIT(4)
> +#define GOTGCTL_VBVALOVAL		BIT(3)
> +#define GOTGCTL_VBVALOEN		BIT(2)
>   #define GOTGCTL_SESREQ			BIT(1)
>   #define GOTGCTL_SESREQSCS		BIT(0)
>   
> @@ -227,6 +233,8 @@
>   #define GPVNDCTL			HSOTG_REG(0x0034)
>   #define GGPIO				HSOTG_REG(0x0038)
>   #define GGPIO_STM32_OTG_GCCFG_PWRDWN	BIT(16)
> +#define GGPIO_STM32_OTG_GCCFG_VBDEN	BIT(21)
> +#define GGPIO_STM32_OTG_GCCFG_IDEN	BIT(22)
>   
>   #define GUID				HSOTG_REG(0x003c)
>   #define GSNPSID				HSOTG_REG(0x0040)
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 31e090ac9f1e..8ccc83f7eb3f 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -163,6 +163,35 @@ static void dwc2_set_stm32f7_hsotg_params(struct dwc2_hsotg *hsotg)
>   	p->host_perio_tx_fifo_size = 256;
>   }
>   
> +static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->speed = DWC2_SPEED_PARAM_FULL;
> +	p->host_rx_fifo_size = 128;
> +	p->host_nperio_tx_fifo_size = 96;
> +	p->host_perio_tx_fifo_size = 96;
> +	p->max_packet_count = 256;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_FS;
> +	p->i2c_enable = false;
> +	p->activate_stm_fs_transceiver = true;
> +	p->activate_stm_id_vb_detection = true;
> +	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
> +}
> +
> +static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->activate_stm_id_vb_detection = true;
> +	p->host_rx_fifo_size = 440;
> +	p->host_nperio_tx_fifo_size = 256;
> +	p->host_perio_tx_fifo_size = 256;
> +	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
> +}
> +
>   const struct of_device_id dwc2_of_match_table[] = {
>   	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
>   	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params  },
> @@ -186,6 +215,10 @@ const struct of_device_id dwc2_of_match_table[] = {
>   	{ .compatible = "st,stm32f4x9-hsotg" },
>   	{ .compatible = "st,stm32f7-hsotg",
>   	  .data = dwc2_set_stm32f7_hsotg_params },
> +	{ .compatible = "st,stm32mp15-fsotg",
> +	  .data = dwc2_set_stm32mp15_fsotg_params },
> +	{ .compatible = "st,stm32mp15-hsotg",
> +	  .data = dwc2_set_stm32mp15_hsotg_params },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 3c6ce09a6db5..8368d6d66d64 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -312,6 +312,9 @@ static int dwc2_driver_remove(struct platform_device *dev)
>   	if (hsotg->gadget_enabled)
>   		dwc2_hsotg_remove(hsotg);
>   
> +	if (hsotg->params.activate_stm_id_vb_detection)
> +		regulator_disable(hsotg->usb33d);
> +
>   	if (hsotg->ll_hw_enabled)
>   		dwc2_lowlevel_hw_disable(hsotg);
>   
> @@ -464,10 +467,35 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   	if (retval)
>   		goto error;
>   
> +	if (hsotg->params.activate_stm_id_vb_detection) {
> +		u32 ggpio;
> +
> +		hsotg->usb33d = devm_regulator_get(hsotg->dev, "usb33d");
> +		if (IS_ERR(hsotg->usb33d)) {
> +			retval = PTR_ERR(hsotg->usb33d);
> +			if (retval != -EPROBE_DEFER)
> +				dev_err(hsotg->dev,
> +					"failed to request usb33d supply: %d\n",
> +					retval);
> +			goto error;
> +		}
> +		retval = regulator_enable(hsotg->usb33d);
> +		if (retval) {
> +			dev_err(hsotg->dev,
> +				"failed to enable usb33d supply: %d\n", retval);
> +			goto error;
> +		}
> +
> +		ggpio = dwc2_readl(hsotg, GGPIO);
> +		ggpio |= GGPIO_STM32_OTG_GCCFG_IDEN;
> +		ggpio |= GGPIO_STM32_OTG_GCCFG_VBDEN;
> +		dwc2_writel(hsotg, ggpio, GGPIO);
> +	}
> +
>   	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
>   		retval = dwc2_gadget_init(hsotg);
>   		if (retval)
> -			goto error;
> +			goto error_init;
>   		hsotg->gadget_enabled = 1;
>   	}
>   
> @@ -493,7 +521,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   		if (retval) {
>   			if (hsotg->gadget_enabled)
>   				dwc2_hsotg_remove(hsotg);
> -			goto error;
> +			goto error_init;
>   		}
>   		hsotg->hcd_enabled = 1;
>   	}
> @@ -509,6 +537,9 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   
>   	return 0;
>   
> +error_init:
> +	if (hsotg->params.activate_stm_id_vb_detection)
> +		regulator_disable(hsotg->usb33d);
>   error:
>   	dwc2_lowlevel_hw_disable(hsotg);
>   	return retval;
> @@ -523,6 +554,37 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
>   	if (is_device_mode)
>   		dwc2_hsotg_suspend(dwc2);
>   
> +	if (dwc2->params.activate_stm_id_vb_detection) {
> +		unsigned long flags;
> +		u32 ggpio, gotgctl;
> +
> +		/*
> +		 * Need to force the mode to the current mode to avoid Mode
> +		 * Mismatch Interrupt when ID detection will be disabled.
> +		 */
> +		dwc2_force_mode(dwc2, !is_device_mode);
> +
> +		spin_lock_irqsave(&dwc2->lock, flags);
> +		gotgctl = dwc2_readl(dwc2, GOTGCTL);
> +		/* bypass debounce filter, enable overrides */
> +		gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
> +		gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN;
> +		/* Force A / B session if needed */
> +		if (gotgctl & GOTGCTL_ASESVLD)
> +			gotgctl |= GOTGCTL_AVALOVAL;
> +		if (gotgctl & GOTGCTL_BSESVLD)
> +			gotgctl |= GOTGCTL_BVALOVAL;
> +		dwc2_writel(dwc2, gotgctl, GOTGCTL);
> +		spin_unlock_irqrestore(&dwc2->lock, flags);
> +
> +		ggpio = dwc2_readl(dwc2, GGPIO);
> +		ggpio &= ~GGPIO_STM32_OTG_GCCFG_IDEN;
> +		ggpio &= ~GGPIO_STM32_OTG_GCCFG_VBDEN;
> +		dwc2_writel(dwc2, ggpio, GGPIO);
> +
> +		regulator_disable(dwc2->usb33d);
> +	}
> +
>   	if (dwc2->ll_hw_enabled &&
>   	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
>   		ret = __dwc2_lowlevel_hw_disable(dwc2);
> @@ -544,6 +606,34 @@ static int __maybe_unused dwc2_resume(struct device *dev)
>   	}
>   	dwc2->phy_off_for_suspend = false;
>   
> +	if (dwc2->params.activate_stm_id_vb_detection) {
> +		unsigned long flags;
> +		u32 ggpio, gotgctl;
> +
> +		ret = regulator_enable(dwc2->usb33d);
> +		if (ret)
> +			return ret;
> +
> +		ggpio = dwc2_readl(dwc2, GGPIO);
> +		ggpio |= GGPIO_STM32_OTG_GCCFG_IDEN;
> +		ggpio |= GGPIO_STM32_OTG_GCCFG_VBDEN;
> +		dwc2_writel(dwc2, ggpio, GGPIO);
> +
> +		/* ID/VBUS detection startup time */
> +		usleep_range(5000, 7000);
> +
> +		spin_lock_irqsave(&dwc2->lock, flags);
> +		gotgctl = dwc2_readl(dwc2, GOTGCTL);
> +		gotgctl &= ~GOTGCTL_DBNCE_FLTR_BYPASS;
> +		gotgctl &= ~(GOTGCTL_BVALOEN | GOTGCTL_AVALOEN |
> +			     GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL);
> +		dwc2_writel(dwc2, gotgctl, GOTGCTL);
> +		spin_unlock_irqrestore(&dwc2->lock, flags);
> +	}
> +
> +	/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
> +	dwc2_force_dr_mode(dwc2);
> +
>   	if (dwc2_is_device_mode(dwc2))
>   		ret = dwc2_hsotg_resume(dwc2);
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
