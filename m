Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A042EF2B
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 12:54:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96226C5C841;
	Fri, 15 Oct 2021 10:54:27 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F7EDC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 10:54:26 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B531E45FEA;
 Fri, 15 Oct 2021 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1634295264; bh=e7urXS15HQJIxRP8octZYV+zY9ZOqBMXFTyhqUc6RLk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CVLaHd4FXiMGrX0Wb4kSLNKuRcSDyFe6vPXi7eZYSZ1JzJNydvFmi+d9NlUpWTDa/
 nOM1Gn3xxOZ+FrnvgM/SBlgCUYnVQJcmTLd5N5ZvKIr2F3ooi1wW0puYo6set/GUXy
 7iYoTlVNOPnqJB5pz+Ebo2P29rYSlOK12s9n8D8Bn6x0QvLZY6BVdHG6bjnUrlFVCp
 VjwCrv7jn6E0bNjPOljQoUL6tFC9rqD2z/HlqJh4j1De/+1W0aDqo3ZcV+OCvn9klW
 VpgjMhfJ2uQbkGeBrrTmzE+ORj2xdm8lc24GuxiBhG7Z96Mm7iuKnkV1M1F0zZuCDZ
 NXeRLAHrzluPA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 20EDFA00F0;
 Fri, 15 Oct 2021 10:54:23 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id AB40780037;
 Fri, 15 Oct 2021 10:54:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XnlmORzZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqYw7eKDAhHjuz+5x9C4kaJu1RyN16vlSeeZrgN1lIPwQjnHdpx+FIKmaLj7plUy5k4Dec2nX03DEAZaJ1YUS++c9iPnAFnVtC/XuA9pXknfKuNMpQUj0jAEHJinzQP3xmBjIjZf9PS+UXFdhaD/ElJuNVwUuAr39vUX+T0eBM3KnqYJj9fD86uylWPpi+42IjaITOP9Plm/k0B5k7M//yOvGkQdTb4CjwYro7fm0S/EkawWRZUlfiH9ABsbEOirOF8QaMdC6jk6qtVu+T8JGLNSHvhMD35uCbOSRsyZ3onChCfrlRDUWPNDierNDIqyRm+PyNuy6It7nIMimFnXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7urXS15HQJIxRP8octZYV+zY9ZOqBMXFTyhqUc6RLk=;
 b=kKHL+juM1OTIIFqGfp0O+79FOKMv4Hzjw7rrZ00Ili2LZDxSpj1QXaWDMT+e8toicKle5g594gq6/drFsuodvtGnAg9YaottNZx36O2WAAP+V+DSODt5SsjgPH+ASd/y0kczlNIi0rcwTm2NBASY31Q75iTjhq8Fi+Bte7KId0Rc/iwUy8YUqEnUxWWhisSX1VQugwn3dJRyeKJuXagKDXeXIEXr/HPm18gpUbuGMPcVcofOGCsYKsCMCVFCXRXVGcCukXZanRAHDvCFDAnX0xe+wb2ih9HR2xuTn/SmgVyp+IBFGBU9gBWpIUE7TE7AacCsrp+EuJ16LblEOgl9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7urXS15HQJIxRP8octZYV+zY9ZOqBMXFTyhqUc6RLk=;
 b=XnlmORzZnzMUp/iCVhCAsQheJ5bBnAeBrm7PXJNXG4RDVx2EYyVDPmi6dTIRtX7L4BUkuKPCOvOvS54ArvQcvYnx25bAP52oO6fGc3VA9Z/dm2IY4WHervn8q/Aii5z9rWarVCsOojD+bJS60n+lFvVPtUgRh2wEt2HD0VhNVnE=
Received: from BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Fri, 15 Oct
 2021 10:54:21 +0000
Received: from BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363]) by BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363%3]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:54:21 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 2/3] usb: dwc2: drd: fix dwc2_drd_role_sw_set when clock
 could be disabled
Thread-Index: AQHXuc7dEoBUFnaIxEm0g/FBJLukdKvT8maA
Date: Fri, 15 Oct 2021 10:54:21 +0000
Message-ID: <a864af26-c4c1-786a-bf4d-1b8d92d4d035@synopsys.com>
References: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
 <20211005095305.66397-3-amelie.delaunay@foss.st.com>
In-Reply-To: <20211005095305.66397-3-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: foss.st.com; dkim=none (message not signed)
 header.d=none;foss.st.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d55b407-559f-41aa-2788-08d98fca2515
x-ms-traffictypediagnostic: BN9PR12MB5226:
x-microsoft-antispam-prvs: <BN9PR12MB5226CAA012DC3D48D6B41B91A7B99@BN9PR12MB5226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RVIsNLLszJXj3rLOd9HHD4/9NUSugJZsaSUChSfLGTu/oTVUMh5moMEAnWElLOoHU7nBtVzoxM0FF9FDWrUHQb4gsPzR/SSqxH2UybSlCYm0NpZt8gSS0/xBx5yF1L3twzLK0Rr/KlJdf8GmrXXYDoNkQeAIUl+Pap4S5v5yuXVS99MY+u068P8dWQpS++xRe1959mqRtpBihm+JlMAr02o2Gkl9xDkmc23mcgooHqgasM6vjb0CBrgGcbofBRefc5k1sPSlGmgBw9Rouw+/vJlApXlcI4G4Mftbh8mRJyrW/0gJjyvzauqF78ujsxazOpLY95czfOHv4FM3Dcmvnm2Ug+JTACL3Vyxh2PlJFC7rABCU4YzeYq2S0CpyQC5rLTfJ4T+DzT7S7y1/v3F2oEt4L3GxMfFyWb/k11uqsWsXetWJQgv3gv+BuuxjUT4u98Kgh2c3nOhpUInxtregaZbYPBtfkmMsguVNRV1qe4fHXZj6O7ZDzf7OYYPevybQ4g+pnqDfL5crG8uLHewgCB6/fAUyQPG7/1znrwr1s1MIsDMKwzhGb2VGWZTRO1g9I9t0B7g60/ncwJktdjXoB/Dd8w9M09hzrdqSS53hfx4JJdlSasWtqoLBiEJ8n1bVF+0n3lzB7uDvQvB2gobalRb2vzIZxSQhzHB7wos4UoikqEk+U/hNRiWvMtUi6hNvBny59Kz7VphRqhE3gWFXdsHfkQkbP3n5I9Ly5Ak4IjK0wN+2xnYEfjG73JYzyN6xxNaNIBYZjvictIGUrb4y8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5383.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(36756003)(316002)(66556008)(86362001)(54906003)(38070700005)(110136005)(71200400001)(8676002)(6486002)(66476007)(66446008)(64756008)(2616005)(2906002)(76116006)(26005)(5660300002)(66946007)(91956017)(53546011)(508600001)(6506007)(31696002)(122000001)(4326008)(83380400001)(38100700002)(6512007)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vmszb3JHNWk5Z1R2TkZva1MvbzBKOG14R1M1emhJZkNnN1YvNVplZ3drOWty?=
 =?utf-8?B?OVRWYTFxUitkOXF3SCt2N2NDSHNKZ2lMK0RRWnY1Qmd3R0xVZWNXa3M1RGxz?=
 =?utf-8?B?UUNIUnE0V1Y5MG5VaTlmSlk4dE1tWUZMUk5CL0hqSmVLaVVNSDlSK3BPMERW?=
 =?utf-8?B?SktZMThFbGVLblJoWVJYZXJqaGxpZDZJSm9naXVZaWFOQktGMWxBblI0cW9N?=
 =?utf-8?B?aGVOQk1LNUw1eG03bG02akFBWkRsQ2R1TUdTNVRBckNrZTcybHJaazFmSldY?=
 =?utf-8?B?aWRZYWdubGZpUVN0MElQT29ZZnZxWW1GUmtuakU2YldTZTJlSWRGNUdCOGNu?=
 =?utf-8?B?ZXZVaFQ3cG4wQWwwb0ZmNUx1T3NoaHh4SHRBKys0MGYzN2J4TSsyTHg5Yk0v?=
 =?utf-8?B?L29pTGtkYWhRRjRMZFNpRUt4dGFZWGRhdjZOb05Fb0VSRjhzbU9MTFJlZFJ4?=
 =?utf-8?B?eE5hU1d5K0U4SzJKclRKYVhHaVhrRlpBRFdQbWZYMmZGUzVJRmRPaFhlN2Iz?=
 =?utf-8?B?VnFJMGduaXVnNW9ZUVFxVHpVSGR3VFoxZ3RLLzJzTGJ6UWhuV0lMWkJrbFQ4?=
 =?utf-8?B?RVVZcTV6RkRJUGI0UmZIZUN3SDdpWUtaMVBxSE1BQ0ZUckV0U3FnZyt0ZG9o?=
 =?utf-8?B?ZDVoL05EK1ZuempmNjZ5SmwzVnBGb20vd2h5MHI0Mno5Tm9LZC9nWkcyOWJs?=
 =?utf-8?B?MUxXSkYrWTl3WlRMekI4MzhMbjU1aWtCUFBWelBsdWtIK1VUQlY5S2dsUVN2?=
 =?utf-8?B?RVgreTZhUHBwbDlsYjhwR1FJSTFuVWZ4c2Nmd1NqVjkxdEpweU1vQ2M1ZXpx?=
 =?utf-8?B?Wnl2Wkd5QVZtTGtCRE5WUG03bEhiWU1LR3ZhZHR3d2pxRzFwK0ZSd3I0aEdi?=
 =?utf-8?B?Q25UYmpQajJodndCcTBCTFN5N3BUY3FRZW9nOC90bVBydWg4aVkxejQzdjBW?=
 =?utf-8?B?RzM1NUhVUzlBaXl0NnZrUytrNHI0bmF2N0ZXRmZFWTJiZVB0SFFnUk9iOGhr?=
 =?utf-8?B?QWd4SS9RQ1FJcTc0TUoyMjMvVytCeisvTVFScU5md2VhUE5PNGcxRThHekZr?=
 =?utf-8?B?TXMybzhTbTZJWCtzRnRBL2tlaWNkNVlFS2pNLzhOQ09UQlNkbTdEc1kxV0s5?=
 =?utf-8?B?Uy9iOUF1VVBvOUlKK3FUTmRudGFodEVRSytvZG9rSEJYd210b3ZlMHNXVEpV?=
 =?utf-8?B?ck9ac1IwQzdGSnF5QjlzQ2d2ODdOV0FDbHhRUUFacXdPbUg2KzBOTUNadEJm?=
 =?utf-8?B?UjBmTW5RV2JUUUwrNjA0ZTFObjBwK29FNVhYRFVIYlhhOEV3bXppcDhucHNH?=
 =?utf-8?B?R2Q0RFhIL2h2U2Y0WVN0UzV5T2R6QkN3MlFYSFRhVUJuelZoWVg4R0IvalBl?=
 =?utf-8?B?Wlo4SHR3RjNQY21nb3ZFamtsVVduMHozL0VVSytiSTJTOTRWdnJYbWZORFFi?=
 =?utf-8?B?cWcrKzVyckE5VjBvRkFmVUFqYlRubnRhRVdRYnhEemtROTYvWXl0Ym5NcDRu?=
 =?utf-8?B?OFZuTXdaZHRyS2tCaVM0NVBpRkRIUXFOckg1QkJqaVpPNGRac1o3R0oyVUZX?=
 =?utf-8?B?T0p4SGJzYTZURFYxVGw0VFNwQUtVZk5EM3BWOVlWVXBhY3NnM1hiUHZ5b0RC?=
 =?utf-8?B?WjkvRWFGTDU0aEY1UXdaaGt5amRlYnVWcVJncEhiRFpDODd1dnJybXZicHRz?=
 =?utf-8?B?UytabDdMMzdkZXNGZDFRWkdxWHZyamZ3cHNtdUFiT2RDc1N5SG1OcllyUEcx?=
 =?utf-8?Q?BJHD3wYvNsu5RW1yTY=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F4BB6B95E6A2E04CACE4099C460AD7F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5383.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d55b407-559f-41aa-2788-08d98fca2515
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 10:54:21.7108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/xNqMaZkVWaePA5oGKj+QSiTjke5M0OfwU49dkZ2LCCDmOhjRZIKkCvZ+E8pxgOmfD1XhQviNaioeD7iiUiHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 2/3] usb: dwc2: drd: fix
 dwc2_drd_role_sw_set when clock could be disabled
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

On 10/5/2021 1:53 PM, Amelie Delaunay wrote:
> In case of USB_DR_MODE_PERIPHERAL, the OTG clock is disabled at the end of
> the probe (it is not the case if USB_DR_MODE_HOST or USB_DR_MODE_OTG).
> The clock is then enabled on udc_start.
> If dwc2_drd_role_sw_set is called before udc_start (it is the case if the
> usb cable is plugged at boot), GOTGCTL and GUSBCFG registers cannot be
> read/written, so session cannot be overridden.
> To avoid this case, check the ll_hw_enabled value and enable the clock if
> it is available, and disable it after the override.
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/drd.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 80eae88d76dd..99672360f34b 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -7,6 +7,7 @@
>    * Author(s): Amelie Delaunay <amelie.delaunay@st.com>
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/iopoll.h>
>   #include <linux/platform_device.h>
>   #include <linux/usb/role.h>
> @@ -86,6 +87,20 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   	}
>   #endif
>   
> +	/*
> +	 * In case of USB_DR_MODE_PERIPHERAL, clock is disabled at the end of
> +	 * the probe and enabled on udc_start.
> +	 * If role-switch set is called before the udc_start, we need to enable
> +	 * the clock to read/write GOTGCTL and GUSBCFG registers to override
> +	 * mode and sessions. It is the case if cable is plugged at boot.
> +	 */
> +	if (!hsotg->ll_hw_enabled && hsotg->clk) {
> +		int ret = clk_prepare_enable(hsotg->clk);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
>   	spin_lock_irqsave(&hsotg->lock, flags);
>   
>   	if (role == USB_ROLE_HOST) {
> @@ -110,6 +125,9 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   		/* This will raise a Connector ID Status Change Interrupt */
>   		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
>   
> +	if (!hsotg->ll_hw_enabled && hsotg->clk)
> +		clk_disable_unprepare(hsotg->clk);
> +
>   	dev_dbg(hsotg->dev, "%s-session valid\n",
>   		role == USB_ROLE_NONE ? "No" :
>   		role == USB_ROLE_HOST ? "A" : "B");
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
