Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B89501B47AB
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 16:49:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 758EEC36B0B;
	Wed, 22 Apr 2020 14:49:04 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 267A9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 14:49:03 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC6C6C0B87;
 Wed, 22 Apr 2020 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587566941; bh=38TA8zEJ2eQQzm3e3PrgiAixNlTw7edM3oLvlFL5vLA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GhZrAiHg4gDQdL44m3Qk6ZI53cbxXkXdsPFiD70dRSWRJM2iFOvaIgR/bURVgJKvB
 i9wpeY01UJ/GWxXgPZ+ENb9c43EEVWuXlljF32JTs2Wj1dvGBM0ap1b1c3CeBk1Rss
 P640doklJqDNC3OalpJrh+Kc23XtlUNR2hB7mIl02ZBWiraST/hNqAiC2MZre52gQ/
 ZuHIGjHTnWFV6IHVhxX59NdwPjFTPCjpsFkCjw389DSqEg2ucOeglslHGIAm6DaOeJ
 KIQejdM/c94prJdURtaMO38u6/Pe3f5sffnPH1c64lot4L4BsDBL2PaMGvv5lLJXgv
 rZOPe6j1kG1wg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 49E4BA00D4;
 Wed, 22 Apr 2020 14:49:00 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 22 Apr 2020 07:48:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 22 Apr 2020 07:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQq4X4cZCh+F3uwBaHGWD8mZ0KdLqDqa5dh67PTe1fqZYoJIpQcGTdEAiNSvFvqWsKtLTNZArPSBXf8P1WcNFiSKAzQ1gtwUHbgR1LEBQCo7Hz4LGH8+d+H5xXG60be+S8TZVWYVDko7UXIMC552KZjp92KC7mtijCZn+mXoDwVWU9Lh0TY5uc9F+rUW0iZyZYZWJKB0NT5QJ61qb0CVnEgYyEMhDePcBOSNL9IgfnHfKs4D5n4x10k70qo0uOwFXjxEC9azdxeHHo43Q+cQLXCU25kP4dQLrc7kgkzg27+ObgMhmr0Jsoh4OFldbx5yEcL73vMjrm0TaAJnwt9Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38TA8zEJ2eQQzm3e3PrgiAixNlTw7edM3oLvlFL5vLA=;
 b=E1lQX+5By5JL1R8bulsyIiYP83KVS/l4ocmQFEwiZSQ87QYYMrGVluCI9AH0zLNIAAxRG+Gmn9tekGBwa8Bj/DFqVNBTnuVLlAut2vdqhS2+g3PwyeBJ7cblXA2GdSW6twZIPTSiDDRghzF1FXpirb/QLOCgyS//Ith7v+9vomySRdFLE1XlagYvQhiVrc6hSPzDwIveWluyJ1dOZ11QuZoVxk0p2SUD364IyOQ5x6dfp97NY31ZNZBVDBjoyzyF/ZZR6vjA+WC5pM4BS+2Hs8Oa/j5cbFS4tofRFdWtVaWrTbrkvCj5iXakDBli9DvaZshPFr9UrDPIfH7s0T45zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38TA8zEJ2eQQzm3e3PrgiAixNlTw7edM3oLvlFL5vLA=;
 b=eRYzu79ii8jSzomKSCoUPzPYPa93Mqn/2UJX8bWmybpKdukcuLDkFLXqga57otFAH6p3RGUO5j61si8d5ryG6QbfVLQLC2wgpjBtL2tg34xbloLCt1Lkf0KSPpkxIhHqQpPLiDDUihGrNolkqFOrHI0bTI5DPIE2SwrnDcT3l+w=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2574.namprd12.prod.outlook.com (2603:10b6:802:26::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Wed, 22 Apr
 2020 14:48:52 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 14:48:52 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, "balbi@kernel.org"
 <balbi@kernel.org>
Thread-Topic: [PATCH 1/4] usb: dwc2: gadget: move gadget resume after the core
 is in L0 state
Thread-Index: AQHWF9kltb5ivodInUCMhTw1JrJADqiFOpOA
Date: Wed, 22 Apr 2020 14:48:52 +0000
Message-ID: <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
 <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
In-Reply-To: <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88aa6a9-9df8-43e5-7881-08d7e6cc46a1
x-ms-traffictypediagnostic: SN1PR12MB2574:
x-microsoft-antispam-prvs: <SN1PR12MB2574F6399FB0C5CD5853016FA7D20@SN1PR12MB2574.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(396003)(346002)(39860400002)(376002)(366004)(8676002)(53546011)(31686004)(6506007)(110136005)(316002)(54906003)(2616005)(86362001)(81156014)(31696002)(478600001)(186003)(4326008)(71200400001)(8936002)(36756003)(26005)(91956017)(6512007)(66556008)(64756008)(66946007)(66476007)(66446008)(5660300002)(6486002)(76116006)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J4OLJ5PiRHKX3s/6wpY1JCKp9+/ZdJN0oaeqjkrtrDZZWMWa+1qYU/qrkLRAtBg/VWBeXv9MTrWCUDESws8Ofhwfr9iecgzU7MiWvOxEZ/tbJdMd65B25i5yREDPqcm+a1qb+3VtZ4KlUEGDKErYYWmuIrm+3PxYR8n3rbZZdfMXgnmzk7zf43eb8xrXIvm5OA/4j89K0Ay6uRyd9syAoBV4V/HUuNwVjx31SbLY7ffIni2hMqk1rp0S+w2r9qh/arzcwUzCGftQ5M8AIqP8Xls5I8NLMv8Os79TFEerCk0VwRUkWZOmg6SrCm4AlVMeb7D7GoM/jaAb90/VPys/JfBk0hU5iBcQlm8MN7Jh3/iSdk+kjZPZZ+pbSgrDDBjKaSu3yTt/xBXTrDQcDcWlM92oenIp9EaT66cnOor/gFflTzh3vZEyGKRHrOJdL3sj
x-ms-exchange-antispam-messagedata: E0t0i/JSmyD5/Kmy+Y64lWC1yRsGF5EHCfqJT7gGE/d0qEWPhNlWHcBIu4IZ1K4iGsjp0p/cGwN6mxsiu2J3yxoeuduNwXqWV/HiadQtndelpkcpXWW9rfcUNZm0JDmu2lXCB0t1NPHVphWmhzX77g==
x-ms-exchange-transport-forked: True
Content-ID: <44B65D7E0EC7F24DB7E0461B4EFC89C7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d88aa6a9-9df8-43e5-7881-08d7e6cc46a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 14:48:52.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cE5tO3O/59GpLnGUDvMO9VckQE/G04wCYkv+OBPLf7ZxJMfoIQUEzh9MZjJDbhHQXxgLdieKLB3IaYVCxHrdHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2574
X-OriginatorOrg: synopsys.com
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] usb: dwc2: gadget: move gadget resume
 after the core is in L0 state
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

Hi Fabrice,

On 4/21/2020 4:32 PM, Fabrice Gasnier wrote:
> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
> to L0 state. But when the gadget resume is called, lx_state is still L2.
> This prevents the resume callback to queue any request. Any attempt
> to queue a request from resume callback will result in:
> - "submit request only in active state" debug message to be issued
> - dwc2_hsotg_ep_queue() returns -EAGAIN
> 
> Move the call to resume gadget after the core is put in DWC2_L0 state.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   drivers/usb/dwc2/core_intr.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 876ff31..b8ebda5 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>   	}
>   
>   	if (dwc2_is_device_mode(hsotg)) {
> +		enum dwc2_lx_state lx_state = hsotg->lx_state;
> +
>   		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
>   			dwc2_readl(hsotg, DSTS));
> -		if (hsotg->lx_state == DWC2_L2) {
> +		if (lx_state == DWC2_L2) {
>   			u32 dctl = dwc2_readl(hsotg, DCTL);
>   
>   			/* Clear Remote Wakeup Signaling */
> @@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>   			ret = dwc2_exit_partial_power_down(hsotg, true);
>   			if (ret && (ret != -ENOTSUPP))
>   				dev_err(hsotg->dev, "exit power_down failed\n");
> -
> -			call_gadget(hsotg, resume);
>   		}
>   		/* Change to L0 state */
>   		hsotg->lx_state = DWC2_L0;
> +
> +		/* Gadget may queue new requests upon resume to L0 state */
> +		if (lx_state == DWC2_L2)
> +			call_gadget(hsotg, resume);
>   	} else {
>   		if (hsotg->params.power_down)
>   			return;
> 

What about below patch without introducing additional variable.

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 876ff31261d5..543865e31c72 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -416,6 +416,8 @@ static void dwc2_handle_wakeup_detected_intr(struct 
dwc2_hsotg *hsotg)
                         if (ret && (ret != -ENOTSUPP))
                                 dev_err(hsotg->dev, "exit power_down 
failed\n");

+                       /* Change to L0 state */
+                       hsotg->lx_state = DWC2_L0;
                         call_gadget(hsotg, resume);
                 }
                 /* Change to L0 state */


Thanks,
Minas

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
