Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E31B4A07
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 18:16:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DDC2C36B0B;
	Wed, 22 Apr 2020 16:16:49 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFCBDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 16:16:46 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07103C00AD;
 Wed, 22 Apr 2020 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587572204; bh=+odkonGKh8I/uNQEv1xU5FnB0KjU1G7BDRAj8u//EW0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=evkl7pVHgJ9mlGVZytScDfkR5WBWESXcr0uW7IQEYRLOwQx9MTCICOf2o9M9CmV+6
 HBzXbKA/BnUx3qp8WpxS/4CbIF0UXIIQdP9E6VrsWCtyi1mBB8FCFPoDuFzzjvM6my
 +cEBOyb6WAhsPsvf7CIrsv6yuCPKo8rvgEWAw3tNv8Pyli1+b/QK3OBo5n/j4um661
 8+ZRLoxa3zKHGjmkd13L3r/XQ2lFsSfuScw5Oa2Rf8F5fTgSOhn6+5z7m+qi8KE9k2
 mqPhVRq8LDVlWBTr5T9GIXrhiCwMYxgLWJn7cjzvJGVysZT8H3SRki93uKfwpwnCba
 z3FTazkAqPCrA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DFED9A0069;
 Wed, 22 Apr 2020 16:16:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 22 Apr 2020 09:16:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 22 Apr 2020 09:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQAnMFAH41SMxykGd8/95fF3Ke/6vKqOmtcw0QmUjZkFBfBNMdft20bZc1SrqNW6udPqKHaE/WYf35YLH/QMhOM8vSLs4931jm58TonGPMdjDycOoUdZ9SjmWu9/xsTsF4pZSLWvevZQvWQMF8L4Bx+HSXpEBxtrc9touV262KI+LHK/8g3Dy/vZeN9ovNaQe7MyWL5tECykzYXVM1hP5xo/MRxJ8INxIXf08aZaxbZc++kWdytiLHX5pJp6jx3qYadPPCIMqxxKtIIqYcnHdo6hfHd/teFQyOhuWYRGoAXxSg3/qqJmyjUqU6hMwSJmBoJ4a2QRjZb2v8vnzQLUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+odkonGKh8I/uNQEv1xU5FnB0KjU1G7BDRAj8u//EW0=;
 b=l/CZhFVwK5sPfUVYO2+mvTEQMPmf0YA8PFlykpju/NVtO0Y0U2cpF0M4/+gd9O3Gq/7zIJpHfk0etu2vweFio7Q1B9H9S3iD5lGtAL1zDD8hO3oY1Ew/f9cAoFsUwBIvO0jmlFo/nirkXGU5Eo276IJFjAevFeMdVPZupDnOFtgfDUFKEW9m2n8aL5tF+7mcGm7hgVHAnNhfaPlxXhmNYxOuhAVQKGKF8oXKWajww6yvG3swzHJJSPVmi9s7AaUgmP/PlXyGRivtrLFRJKlv5aPU7WUoscL0JFqeO5lDwVU/yDka4LBNvr8C+Cd5CwxZGg3m6olDLob0kWsRSOME0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+odkonGKh8I/uNQEv1xU5FnB0KjU1G7BDRAj8u//EW0=;
 b=TDJ0xKxZv9s/rgtHanqpsD8GBn6TJU1fSN7UIwXPPnUSLE0g9Azua12lkCKIMGv7ANDJKf2zAjQeTSCfePgBRCABuQgy+RxZOuAE404sEl+dVgNapjo6QKYOE07uONq8x1ZaZvZf1jL6eF8Dqn4sBWrkagjRKRmEXp4LZqUhzOE=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 16:16:41 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 16:16:41 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 "balbi@kernel.org" <balbi@kernel.org>
Thread-Topic: [PATCH 1/4] usb: dwc2: gadget: move gadget resume after the core
 is in L0 state
Thread-Index: AQHWF9kltb5ivodInUCMhTw1JrJADqiFOpOAgAATFACAAAV1AA==
Date: Wed, 22 Apr 2020 16:16:40 +0000
Message-ID: <13a35aac-a3c9-df9f-a2b7-64abdbf9463c@synopsys.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
 <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
 <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
 <ba525953-fbab-c2cf-beba-8755846cd27e@st.com>
In-Reply-To: <ba525953-fbab-c2cf-beba-8755846cd27e@st.com>
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
x-ms-office365-filtering-correlation-id: 87b8c1f9-f86d-4b19-57bf-08d7e6d88aba
x-ms-traffictypediagnostic: SN1PR12MB2349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB23496CB6081B4DAF9D473A19A7D20@SN1PR12MB2349.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39860400002)(76116006)(5660300002)(6486002)(2616005)(91956017)(2906002)(66476007)(66556008)(6512007)(86362001)(66446008)(66946007)(4326008)(81156014)(31696002)(8936002)(64756008)(8676002)(110136005)(36756003)(478600001)(186003)(71200400001)(53546011)(316002)(31686004)(26005)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CebWBRcl+Ozjs6fKFWCSBx43FOn9tngMSACq2nkQkQCZkEeek46klbuhQErBr57gK+7Ui/GszcE3PJ+kLMlKdiwlrLJHJhVE6UNjVzNBL/grI0mtVA29JaqONfYRAH6neGV7XcWib6Xwch9i+2N8HQrVCO3cC2nhpFuB+MUalV3emItEJddHRdoRsMKuY+PLExBWiITMYQOPx1e/LGo3gxVVZJ0K6cOthOb2b9k8BlyfKNKaNwHZ5sqPqdDRW2AAoAnvUqKEEiFctIn5rLRxYNqDnzP84UgM54ezV7M9PI4bGvOWB/Zj/c9VDsv94HapCF1CJ+Zkg8ANYIBpDED0AlUJQi6C/WPwGku3oB+YjhLaH89SsfvcQm3aDetncVcY3bWamxrUgBoU+aimY9czulzFsh8lngeL8mS/rMXWAxo+KXsuWWFF+2juSMktKefI
x-ms-exchange-antispam-messagedata: SDpZ/v4rci1l1JFQhzRIzlOgYYCom8LROMPOzhHqGd6YOf2eRdR5Vm3RmoO7Yc9naTuKEC5LR0WFJJthS+3zJ0QmdzaX64xMhvQAU2NMrTYK4jm1c4UWk69vNJDaqiBSkaUpmM/dl+UcWym4gNH/ug==
Content-ID: <5E2A93375C477A42BAD7FD3E53CAF114@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b8c1f9-f86d-4b19-57bf-08d7e6d88aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 16:16:40.9897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9p8ebPUtx3Vd66Rh6miGyh6q4R9vyGZsfnztsz3Nv5F9MWjpw5bU8Oz7oTAYB//ygOmmqwv1e8Ogl6iQ5+bbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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

On 4/22/2020 7:57 PM, Fabrice Gasnier wrote:
> On 4/22/20 4:48 PM, Minas Harutyunyan wrote:
>> Hi Fabrice,
>>
>> On 4/21/2020 4:32 PM, Fabrice Gasnier wrote:
>>> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
>>> to L0 state. But when the gadget resume is called, lx_state is still L2.
>>> This prevents the resume callback to queue any request. Any attempt
>>> to queue a request from resume callback will result in:
>>> - "submit request only in active state" debug message to be issued
>>> - dwc2_hsotg_ep_queue() returns -EAGAIN
>>>
>>> Move the call to resume gadget after the core is put in DWC2_L0 state.
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>>> ---
>>>    drivers/usb/dwc2/core_intr.c | 10 +++++++---
>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>> index 876ff31..b8ebda5 100644
>>> --- a/drivers/usb/dwc2/core_intr.c
>>> +++ b/drivers/usb/dwc2/core_intr.c
>>> @@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>    	}
>>>    
>>>    	if (dwc2_is_device_mode(hsotg)) {
>>> +		enum dwc2_lx_state lx_state = hsotg->lx_state;
>>> +
>>>    		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
>>>    			dwc2_readl(hsotg, DSTS));
>>> -		if (hsotg->lx_state == DWC2_L2) {
>>> +		if (lx_state == DWC2_L2) {
>>>    			u32 dctl = dwc2_readl(hsotg, DCTL);
>>>    
>>>    			/* Clear Remote Wakeup Signaling */
>>> @@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>    			ret = dwc2_exit_partial_power_down(hsotg, true);
>>>    			if (ret && (ret != -ENOTSUPP))
>>>    				dev_err(hsotg->dev, "exit power_down failed\n");
>>> -
>>> -			call_gadget(hsotg, resume);
>>>    		}
>>>    		/* Change to L0 state */
>>>    		hsotg->lx_state = DWC2_L0;
>>> +
>>> +		/* Gadget may queue new requests upon resume to L0 state */
>>> +		if (lx_state == DWC2_L2)
>>> +			call_gadget(hsotg, resume);
>>>    	} else {
>>>    		if (hsotg->params.power_down)
>>>    			return;
>>>
>>
>> What about below patch without introducing additional variable.
>>
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>> index 876ff31261d5..543865e31c72 100644
>> --- a/drivers/usb/dwc2/core_intr.c
>> +++ b/drivers/usb/dwc2/core_intr.c
>> @@ -416,6 +416,8 @@ static void dwc2_handle_wakeup_detected_intr(struct
>> dwc2_hsotg *hsotg)
>>                           if (ret && (ret != -ENOTSUPP))
>>                                   dev_err(hsotg->dev, "exit power_down
>> failed\n");
>>
>> +                       /* Change to L0 state */
>> +                       hsotg->lx_state = DWC2_L0;
> 
> Hi Minas,
> 
> That was my first approach locally, but I added a variable to avoid do
> it twice... few lines after.
> 
> But if you prefer, I can change in V2 ?
> 
> Please let me know.
> 
> Thanks,
> Fabrice
> 
>>                           call_gadget(hsotg, resume);
>>                   }
>>                   /* Change to L0 state */
>>
>>
>> Thanks,
>> Minas
>>
To avoid twice setting lx_state you can add 'else' before second setting.

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 876ff31261d5..f59dabd46e60 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -416,10 +416,14 @@ static void 
dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
                         if (ret && (ret != -ENOTSUPP))
                                 dev_err(hsotg->dev, "exit power_down 
failed\n");

+                       /* Change to L0 state */
+                       hsotg->lx_state = DWC2_L0;
                         call_gadget(hsotg, resume);
                 }
-               /* Change to L0 state */
-               hsotg->lx_state = DWC2_L0;
+               else {
+                       /* Change to L0 state */
+                       hsotg->lx_state = DWC2_L0;
+               }
         } else {
                 if (hsotg->params.power_down)
                         return;



Am I missed something?

Thanks,
Minas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
