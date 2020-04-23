Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D336D1B5C1F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 15:06:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 787E6C36B0B;
	Thu, 23 Apr 2020 13:06:51 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25EBEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 13:06:50 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 049B9C009B;
 Thu, 23 Apr 2020 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587647208; bh=YAKACk9peFjLASh1n+EbNmnqOngfTZeDVMnvYNCdLMQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VHUsVj3JhqwvS8dHkZO02dYPRoJLjinLH1ws0C+ccxcMx7XOLfrlSNK+izXgI3aa1
 o8uM4rFC97NxITvTcqn1hUHV6OtlmwsOHPQoAWFUYuzkJW4zps/4eWHwH5MfmY8aGD
 gf6bUKCZabvCxXOd4JCtBIj6JHtvleKLm3yDnJN3y1efqbFQ4ql8hmzaSXl7tx4XMS
 FtBrdh0OB+h7v1Zf9kQkwXCYe9jvO6bSTmEN0QaDga1AMBGHIY4lMA4HZuQtE73ZgR
 QIX6/obE7sS52yRkSCAOgwnzMbyTcEb8TKiUDHGxKMUw4SewFSJyEC4Bah0dTc/zAG
 zigNrop+huBmQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 82AC0A00CA;
 Thu, 23 Apr 2020 13:06:47 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 23 Apr 2020 06:06:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 23 Apr 2020 06:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzK7IeR9I4RuwgPDAktSG20ndc7slgiwfLDVzUDEBhC8OhZR2P62f9AsFlow09jQfszaSPN/pjZrQKTbSlP3LrN6IUBJqT4vZFFr9BruMLd6sP/6itBlP3B14iXxS7510Fwrr8XN9upFmTj3otYW6zeAFQy1DU9y1HMaxo31fiNx7wSwdKmFauRCwSu+wrZwKu359TlCI05TxmkQZR6NL4CoCLCscmKf6J6jYq+f4Ylwcfx2oXxaC8BiiOW0h53QamqlTyBlSv3NXo/2RR4sIXkKtPNIVdl6UFEoCG//EQsKb98KUaImtt/ZomGTmLX8RPDfumYmv6VdqNEBS0+MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAKACk9peFjLASh1n+EbNmnqOngfTZeDVMnvYNCdLMQ=;
 b=AaWnlkDIQQryySMBOzfIUa5xmLHGXaeQlyEzSEsYjCg07M0Ej6e22lsuHCeu7jK1KlRSmpsqRXkkqhoeygwcLRH5i4bkEpnpBwizzZ4boDu5Lbirohp9f9RylMLyIHknjBBuUmmZBTottsFBeIShwXq+WDL0c9n4NrK9DrRsaJazNds7hMJsze2F+WOKjUCrNNFD++A8yhXGpALALJUeoxuUgQsgUBeZuVn26B1xBU1+rSY4FKVEw0mg7hN0jaxTxmBjCvFnYmsnfO/h07RgNJCs/Bag9tgAvCBIeVlpC4rjAyFy09FQMWQD62+/iP6kdP5cOSsvkoPWQuvyuYa7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAKACk9peFjLASh1n+EbNmnqOngfTZeDVMnvYNCdLMQ=;
 b=PS2TOO2222BWnL+vfLjmkhKkpXXLGfstot7tnmzWcr2+QGEK0buqvgI9FwuVmpOl2M8eIhKlV/VropQUtg9MxxBCH8lvDW0u8f1Ztljz5brWFy6UNLBro4boDao+QPrNIU/6PVEJhxEpH/imXrSXAnt1NQxIaL5LApH58pZE/6M=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2366.namprd12.prod.outlook.com (2603:10b6:802:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 23 Apr
 2020 13:06:22 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 13:06:22 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "balbi@kernel.org" <balbi@kernel.org>
Thread-Topic: [PATCH v2 1/4] usb: dwc2: gadget: move gadget resume after the
 core is in L0 state
Thread-Index: AQHWGWZMfx42yC6umE2yal3pGaWhlqiGrSqA
Date: Thu, 23 Apr 2020 13:06:21 +0000
Message-ID: <d8ed6262-110b-b77c-40d2-2e9408986c36@synopsys.com>
References: <1587642956-8157-1-git-send-email-fabrice.gasnier@st.com>
 <1587642956-8157-2-git-send-email-fabrice.gasnier@st.com>
In-Reply-To: <1587642956-8157-2-git-send-email-fabrice.gasnier@st.com>
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
x-ms-office365-filtering-correlation-id: 6eb1dbf2-0edc-471a-7d0d-08d7e7871edc
x-ms-traffictypediagnostic: SN1PR12MB2366:
x-microsoft-antispam-prvs: <SN1PR12MB23666B40A60426C8D8F58296A7D30@SN1PR12MB2366.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(396003)(376002)(136003)(39860400002)(66446008)(186003)(4326008)(8936002)(76116006)(86362001)(66476007)(64756008)(26005)(66556008)(478600001)(36756003)(71200400001)(66946007)(91956017)(31696002)(6506007)(2906002)(5660300002)(53546011)(6486002)(6512007)(31686004)(316002)(81156014)(2616005)(54906003)(110136005)(8676002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jf3uFU8JRN1QFliddLN9b1EmfwkLsQnZGchB/fCpoA5L6HbYHycdXv7PiexoiFaDi6UEubFF/JxXjTKjRHPU6c93+9eV9bDgLtYAPZUyea/X6AHCVdOvR0ZIDHdHPyMGd+DgtSBUFXIUQ1CnuZc8Gj4+Pmo/VZFPfj8XTXcpLR9AKCUmAzlmL0Bfjbnr/pRWtdifa0R4ah99grien08iXGFKqfKXG0ZDBsA0Amv6+uTagfpuH4SilwQzdL/CtpBXGxPpatbATFOhgvhXMPYhSh+ZFwSid2Z030xhto7uKqVjxnHDUfTFeWrLUylAqQ2Hsl7BzLpNV3KhrWSTi3LbfTelKWThLu9GCJrW1TDixOlcYllVtBhg0fsLvBzxgVVuuJf4YECWWT09LqrA3mN3bGWPcj3YWPHjdSy0GpdTNodnYt5ElTKZajLAW42tH/UQ
x-ms-exchange-antispam-messagedata: VrmnCzX3ZaEF8aCMicfmS0p8jJtkUB/e7gg43cWwrfKxmyK2KZGopxpexDM2NkMugOZMEtwqAATzSZQPj6+IP+3iH7pDsOEkXd/9NtxOtMBeG+wob5bIhdMJPhTr3cPeuul9HdHjCnQvdf6yK+kuMg==
x-ms-exchange-transport-forked: True
Content-ID: <AD12BA6B9EABD049881F5A1DF3308AE0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb1dbf2-0edc-471a-7d0d-08d7e7871edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 13:06:21.9003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+0qzSJICd3iYtX0/AVTkXjv4/OkKDFmwz9Nf7L7tOcSWVQxOSTJukvnFRrKa8/Fqp3PwKfj/W8SoezHe8YHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2366
X-OriginatorOrg: synopsys.com
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/4] usb: dwc2: gadget: move gadget
 resume after the core is in L0 state
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



On 4/23/2020 3:55 PM, Fabrice Gasnier wrote:
> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
> to L0 state. But when the gadget resume is called, lx_state is still L2.
> This prevents the resume callback to queue any request. Any attempt
> to queue a request from resume callback will result in:
> - "submit request only in active state" debug message to be issued
> - dwc2_hsotg_ep_queue() returns -EAGAIN
> 
> Call the gadget resume routine after the core is in L0 state.
> 
> Fixes: f81f46e1f530 ("usb: dwc2: implement hibernation during bus suspend/resume")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
> Changes in v2:
> - Minor update to follow Minas suggestions
> ---
>   drivers/usb/dwc2/core_intr.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 876ff31..55f1d14 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -416,10 +416,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>   			if (ret && (ret != -ENOTSUPP))
>   				dev_err(hsotg->dev, "exit power_down failed\n");
>   
> +			/* Change to L0 state */
> +			hsotg->lx_state = DWC2_L0;
>   			call_gadget(hsotg, resume);
> +		} else {
> +			/* Change to L0 state */
> +			hsotg->lx_state = DWC2_L0;
>   		}
> -		/* Change to L0 state */
> -		hsotg->lx_state = DWC2_L0;
>   	} else {
>   		if (hsotg->params.power_down)
>   			return;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
