Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2C1A645F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2020 10:56:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65217C36B0B;
	Mon, 13 Apr 2020 08:56:57 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE3E9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2020 08:56:55 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CBBEC035F;
 Mon, 13 Apr 2020 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586768214; bh=1jIVRQoRrabhE8xDRa79uNiMv0EEEFimV9+XvP7bPh8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=M7n8344LdYyT6NyyMgGPbeMfjuKNsIsM4fdGYmdCHBi0y9SA7OhOX6CEA1Wz1nQNZ
 5JR/OAvK+o5Klt8mHfG1DISCNVHOmHqnL6JApKYFhouF37BbpmxN8njZ1ufhwDjxpY
 7b6r3UfB5OxZMyLc7iCcQAx9a/E7p41eMv54nIN4sNLFbr+brYUAGJbm79LeKyZ0tB
 H48FtlL9D2KJVuXMil0JAbrk1fnlpzwpR6SFo3qF0i72fYHVZAaJlCLbbz35pzs9iP
 ezmS1hWaUnjaRVZTggyRG/9N0HU3mnQx5rFNRc/rE3NcOnkG5h1OE6a5DHYbuBThnD
 wXUpIBvK+MdXA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E832CA0083;
 Mon, 13 Apr 2020 08:56:52 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Apr 2020 01:56:52 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Apr 2020 01:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx/l64YlBhIh3c1eYohsv6NTGNfugP5vGiN//DDZktaExOF7Rjxtx8pXOqNkMFqfio97lIRFoAWF4sddlx2uRgdq2YO9EzT7v0Ddp1T3ppyB4yaB7F9jDMl5WaByzMjfWidl8i1FEzFEW5YVzCJLK2eh/F6jXoTlD0Xibs8Xa3wvGciollcWNwytWWf7Q439MugATfSwq++gyLSorvypCK8INn8acUx7u8pjg5+baJuvKrC79D2vl4LHLvMfdqD3zd3pZl/Li9GrR9YqlShIU+8O4O3mpTaQlNCoAgG80NFqaOcIxWITsCJ8m4pw67iGV4R3fbv9QT8OtGSV2aDaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jIVRQoRrabhE8xDRa79uNiMv0EEEFimV9+XvP7bPh8=;
 b=VkRWwrgORMUXaV9YCp3YOcSer28R8mPjrENfY1itFFA4KVyLOl2DbZiFRLgwM8nQDGKkHc0UEp5F4DdU2mW/brvYmZjjM3N5yZdcMmM3VAPPVv+JcGGzpQGsVMPAHfv/4ccVmQfYGYW4YsJ2NkEKVGGDd6nx3ryEHloqBNvfShKfW83agx+++SJgoJg8Db7owUAL+IhqDhjoaDriv+C3wh9dfVU+glsAt9anyuLowVr55G4kvzmje5f8wQ7vBjMX5QKpBqWVX1h3cLFETxH1fgyBq0jTne1lqJDstcIph6PgzfrwqkK5p+Nin8DeQGAV5yjUOy7Ps9gRyFd1TZdYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jIVRQoRrabhE8xDRa79uNiMv0EEEFimV9+XvP7bPh8=;
 b=wM3hWir8sp3JriNTcYd2MvaosMfUfZYGU6Q/rq87grqZi9tk6tLid5Vf1w5XO/+ra0HrgiDur4eE1nsmr8YhdgPBTCvbG8r1OEMnp+eoDRPn7jnZFCinLjequCXqBSxX5WNTnRVBz68lqTHy7AGLmImIKBzW7mLcs5t5kuj+Hbo=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2381.namprd12.prod.outlook.com (2603:10b6:802:2f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 08:56:30 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.026; Mon, 13 Apr 2020
 08:56:30 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Thread-Topic: [PATCH] usb: dwc2: only prevent new request when power_down is
 possible
Thread-Index: AQHWD0T0RdlAD7M2/EyORKo3wzI3V6h2xE2A
Date: Mon, 13 Apr 2020 08:56:30 +0000
Message-ID: <bb4e2781-4c4a-9a6b-c8d9-9cbe22269ab2@synopsys.com>
References: <1586529114-25211-1-git-send-email-fabrice.gasnier@st.com>
In-Reply-To: <1586529114-25211-1-git-send-email-fabrice.gasnier@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec6ec8f5-ec06-463e-6cc1-08d7df888eed
x-ms-traffictypediagnostic: SN1PR12MB2381:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB23819F4D2FDB833C577EC87BA7DD0@SN1PR12MB2381.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(346002)(136003)(366004)(39850400004)(396003)(4326008)(6512007)(2906002)(6506007)(53546011)(6916009)(81156014)(8676002)(54906003)(8936002)(316002)(66446008)(66556008)(64756008)(66476007)(5660300002)(26005)(91956017)(31696002)(76116006)(66946007)(2616005)(31686004)(86362001)(478600001)(36756003)(6486002)(71200400001)(186003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: doNUNBTgdye9nz2D/ALwrfMwipGOe81hNJ/1Y91XnA2SxvrzCELdsLdHbHgC9W3lUUM29ZMRt0/otDVvlqSr5txw7Ak6/jXtiSKV8CTVs+uys1+ERuhk5TgVxkmPsq1/33OH0yo429xcyDyc1EG0Kl/0AyD63hW1wBDLaNJOcV5NFyO/xuAYdlXASK1KVaASOblJiU6rSvTSSaTrbONLoaskGZnD6+n6y2HtT9SzD/Q9HuKE7H6WcTBtIeo26y2K5C26ClZR4a7wkgewYdg6qPCj1WWjaTr5iE1BBqOa0qQSEEPZUBohMGrW/n0CHob4a5YgWCHk4Rz0axUGjHmoayZJC3Ze1gZVgA3aronQ5iYL5XtAku3Lga0+Npn50l6qc3EC3wJm3/A8zzXZ588e1yx51zMYBMmyOwTsPPV4khWltco7bqJctFI6fxauHNjW
x-ms-exchange-antispam-messagedata: SJmWjO+BJxIG6dtWJ0Eix1nLtcp+m42Y3471Cv4Z3jD2ZzevjoO7HZBdAnX3gbwPpRXSkexmUdHYtq3uvYbWKeTvQZJo/xKgj1jsIvlgSHpcPgjvZOLGdM8TNoQQA7m+lA6BTkysi9xliZx+8BaMmg==
Content-ID: <49563AF64B715C4BB27E2B7F178CF042@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6ec8f5-ec06-463e-6cc1-08d7df888eed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 08:56:30.1406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1E+TAEuDH+FtEWyTDcihTWiagLa6sgJQmTGTvNwFefqloZjCDVOJL4skd/bfQwLZeZsTc+2JdUtj5MCNUKCT+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2381
X-OriginatorOrg: synopsys.com
Cc: "gregory.herrero@intel.com" <gregory.herrero@intel.com>,
 "Grigor.Tovmasyan@synopsys.com" <Grigor.Tovmasyan@synopsys.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "balbi@ti.com" <balbi@ti.com>, John Youn <John.Youn@synopsys.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: only prevent new request when
 power_down is possible
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

On 4/10/2020 6:31 PM, Fabrice Gasnier wrote:
> When controller is suspended, registers mustn't be touched. This is not
> the case when 'power_down' is set to none. In this case, power saving
> routines are skipped.

If core in suspend mode even with any enabled power saving modes then 
lx_state = DWC2_L2. If power_down != DWC2_POWER_DOWN_PARAM_NONE it 
doesn't mean that core in suspend state (DWC2_L2) and declining request 
is wrong. So, additional checking of params.power_dowm here is not correct.

> 
> This fixes a case where gadget driver (f_acm) gets opened (cat /dev/ttyGS0)
> but the bus has been suspended by the host:
> - configfs-gadget gadget: acm ttyGS0 can't notify serial state, -11
> 
> Fixes: 7ababa926c66 ("usb: dwc2: gadget: prevent new request submission during suspend")
> Fixes: 88b02f2cb1e1 ("usb: dwc2: Add core state checking")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   drivers/usb/dwc2/gadget.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 92ed32e..45a8782 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -1375,7 +1375,8 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
>   		req->zero, req->short_not_ok);
>   
>   	/* Prevent new request submission when controller is suspended */
> -	if (hs->lx_state != DWC2_L0) {
> +	if (hs->params.power_down != DWC2_POWER_DOWN_PARAM_NONE &&
> +	    hs->lx_state != DWC2_L0) {
>   		dev_dbg(hs->dev, "%s: submit request only in active state\n",
>   			__func__);
>   		return -EAGAIN;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
