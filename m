Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F22C7E0E
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Nov 2020 07:16:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0FA6C424BF;
	Mon, 30 Nov 2020 06:16:18 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67906C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 06:16:16 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B32FCC0119;
 Mon, 30 Nov 2020 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1606716975; bh=a9e+XExR4neOd+D4KoRKJev1DhkT3kIGSHIap217VRM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QC1SZY5anQd4xzCbFQ3PNpAIjdd1wS8YqC3e61FN0rrKY5m5ZJuzonJkN2cKAc/T9
 j03wUGKhNilDndzpKAmTr1TThCoeNH8tNegnavtQaFwNovlEZCOrEQKcPb45jguSQu
 6TNVUrLHaYep/2CjGuuqryPd8ZE3MYCPHCv9XSJmjRzbo6kJjPLMwag9AGugUu6f5k
 iWehDE7oesbVWMK7nAh6KX5mzVipDnKPK/Fn3Gzc0x5o/xXWa1QtGQdi6KSKq6CEyS
 M/sUZ+gwU5jpdOOeulTrNFOG8LeaHO/TQZ7woZfrDcq55J1cNztEws3ugN+g5SoHhf
 BXeYaKgBGceUQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D0DC1A006F;
 Mon, 30 Nov 2020 06:16:13 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 44DAD80214;
 Mon, 30 Nov 2020 06:16:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="D/vdQuUr";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVY/hLh6ezwe8BrVyE2zfclSlaHgCFvfXhvJOPFss/IhMOMt/kCVOhqbYX+JLCnCNx6K+TSK7pYqN7JVj/eW36AeGVXSSGBEubR7keGhKkxFezSzi7q8pBq8hAt/WOY4J7/rYR1Ed3Dhp9xdmt/Al3ZiYQJY9E1lbtkSY3E2WVx3o3fyRDr5ntJncwPljsqUSxk6A36Own4a3roFoB6u6PDWxPTfDTjZ2TaOZpQsdw6XRdBUAjP82/QcxZaUSbugqmgkTBkOABncT8fXvhOcU+47YxApvLMkMcFYqu6Mzc1dNbLsx8nRXgWWB70ZK/UiCGSuRCtk+siqnoPTmcdjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9e+XExR4neOd+D4KoRKJev1DhkT3kIGSHIap217VRM=;
 b=F0GwNb5tTVkXaljeflY347WeSTGgBfNyrSZ7OK2YKnsyQN/I+/hyFBQbK8ElAh6p0G30pIpYzfYj7/76QRw4I6DfJP35voImy2jqn06rHYB87GsyhtkkSCTpf2NMv7CQx0OHxds+gkDG7JLwj6Kz0vHJXh1x7ZTi/lR//WbMm3sGF4OqZPo1PIMTn21wU5C6hGHmLYzDCsoneW2wRzWdgXQ0NxC3e9JGhgpH7EjE8uBkhUBRmSBV0314f2LozsMR6v/2FIygRtJuyBb6nvDTufCkDHObctmFQiIp1LIRqyZFLDwpq7T+kS3fiF5x5ahV7ZY0MgnWknJpdjwh7CwlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9e+XExR4neOd+D4KoRKJev1DhkT3kIGSHIap217VRM=;
 b=D/vdQuUrLEjmxB0UUkcr+PSeX7s7bIAV2gkbfLliKDGBpy2xEffx9rEcNTcdKYuXAjA4RpPfI0wb8ZhkgqQdqTpQ29vi/xasETkr5qfpyA3EOIfOvfbYUwMz1lEWA2akO1WSzwKuiPVTjZ0FO0JtxvYat/dc9FrxzEElKQouJ4g=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 06:16:09 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::f90b:950d:63c:37c2]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::f90b:950d:63c:37c2%7]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 06:16:09 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@st.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/3] usb: dwc2: set ahbcfg parameter for STM32MP15 OTG HS
 and FS
Thread-Index: AQHWwXdaFMe2+oRc70i5cWxSkuJD26ngPaWA
Date: Mon, 30 Nov 2020 06:16:09 +0000
Message-ID: <6c67ae2f-a172-e82a-1891-ec8e3c548491@synopsys.com>
References: <20201123090114.12641-1-amelie.delaunay@st.com>
 <20201123090114.12641-2-amelie.delaunay@st.com>
In-Reply-To: <20201123090114.12641-2-amelie.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.92.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66025a4-f256-44b9-def5-08d894f76dd6
x-ms-traffictypediagnostic: BY5PR12MB4997:
x-microsoft-antispam-prvs: <BY5PR12MB4997F08D40D8903384780198A7F50@BY5PR12MB4997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /BGaP5Qr/AX2xbiH+tut1dcdkOD4U8JE6HjYXCrRV3IeiF6/agNP+nMNcIHCB/R3f9iMm88/AQsH6Qzyr1UHlgwAFQqGkYh3soXzbc4gEUTIZS5ltdGyBveAB6loYrmkbcLtCkdKt60BSCiUSQlGwkOdWMSv6NodQZ91ZEER9zihAw3dwVGVFsRzt04ymMxB95XX47VWxFlpLUDbHOWp1l2TxTZcIFppq7COMtOR7iZgWMHaCbEouKUBSusnVd6cYne9l1Ei1VzYMKUcikkGMOHF6Y3hHMfP84Q/yAISF9jf/OWSIL9nFjWW3kk+4kT99EPSADVVubXi+gZoSgC1gSd+5VAE/2GACWbZyBF9j/5YZgSPTjRVizodge95JCeNMujycP3yfEvulrWk0JOisvbdvNH5uN0XE80ubhNQvQ9Ze9QdQIUakj1va1nySg1PlCdOgIeV4PeOw1nOwVgQJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3777.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(966005)(54906003)(76116006)(91956017)(86362001)(5660300002)(4326008)(66476007)(83380400001)(110136005)(316002)(66946007)(66556008)(478600001)(64756008)(66446008)(8676002)(71200400001)(8936002)(31686004)(26005)(53546011)(6512007)(2616005)(36756003)(186003)(2906002)(6506007)(31696002)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cjFXTHNsVndmTGYwSTdZK1N6ZDczRnRZZXphNmxrYWt0RGdzMmkyYzd6WDFV?=
 =?utf-8?B?WU5vNzZlSXNLSXlTMEZaNGFCUFhjSlJoNTFHTmg1TkVXeEdPb0F2Qyt6YWNH?=
 =?utf-8?B?RXViR0tSU051aWJMbGc1bERvTlVDWnZUMFZMYURSZmhYYmdNbEh0VWFnblhB?=
 =?utf-8?B?aWttbS90UXZOQjErdXo1dVlJT01wMWVuM1lSSlJIbFB5L2hyREJka2tQUkZw?=
 =?utf-8?B?VS9YdFFiMkU1eStOZG1GNkxlY0NVUXFFdTl3SXFIOWVlZ3czSTRscTM0S2hU?=
 =?utf-8?B?bUNKbDZGQ1NsTjYwSnNsRThUTUZ5SjZUVU85ai9wSStjRDJwMlgxSmFmNkNL?=
 =?utf-8?B?eDVjclBaK2hHWVZ4ZjVTN3hIaGtrbGRHQUh5K0xHUFA0N3VicGtLL0JWL2M2?=
 =?utf-8?B?dWFza2VlV2k0eHR3cllQL2RqSHVEQ3laaHhkTUthVGpCbzl6RHJSMHh4YW5r?=
 =?utf-8?B?dTRJVXVVUFhXWkJSYTMvSUJOaXkzT00vaE9wWEhFYnF6dmJ0NnNSL1lHNHFj?=
 =?utf-8?B?K0NDSzhPais0dGQ4SlFUUi9ZVkhIU2hCRE51UWYzdmhRMHJpZFh3LzladlNC?=
 =?utf-8?B?V3oybmJKQnRYTzZ2bGpSTVViU3cwL3BGN3JFZ3pGTElESzhMWWJmUTBvellG?=
 =?utf-8?B?LytKQWZOaXFVRVU4U1hKVmd0U0xKOTNSL0tWc3pIcUxxcVl6MTFCV3hzZ3Nv?=
 =?utf-8?B?NE1FSE9hL3d6ODNXK08xRC8rWTNIOGduK0U5UVRHbS9LZ1g0cUxPUkxHa2Ev?=
 =?utf-8?B?RVRQeUlRM0Jldm9jbU10VW53ekxObnVaaGUzdFZSWHFpQitHczB4Y3RzRE1Z?=
 =?utf-8?B?MWFZVU9ncWFZVzRIR1owdTdxS3dQbFJUQldyYVpnWkxHZ1JHODdjY3RaNERt?=
 =?utf-8?B?MDMrbUwwY1hFdzIrMVh5a3BLNW1VeXN5cVcyNzBnbWZxTlA0RU9kdWwvY2Vw?=
 =?utf-8?B?a0h5NlBmaUlyMGcwVEdGMWRuZTdwdWFIeng3Q1I5dlFBbnVZQzIzOWthRVNk?=
 =?utf-8?B?alQ2b1VhMDhMVWxmYzJqdldWVWRYMEFYN29JNDBObDdtaVoxMGRhMnh6Um1I?=
 =?utf-8?B?NnhKdEJUUk01RDU3ZmNDQmNWV096SHExSm5ueEZmSUcyVzcxNXRYTzlkZi9S?=
 =?utf-8?B?ZlJka2ZGZGY4b05LQlpqSUNNQmJjYzFUcVUvTWYwSWZwNW4xVlFJZ3ZEYzFM?=
 =?utf-8?B?VGFMaGZRR2RySXpENzZ6cTZzd0dReEZya1hjTEMwYWlaUTI1K1pHZ2JWeW42?=
 =?utf-8?B?VDE3OCt5QWVTRzJXVU1yU1Fxalh5Tyt2dDdFd08rSFpmNjFES0ZhTDdDNWJh?=
 =?utf-8?Q?pmp9CU9BBOuko=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <298AFD7379C3CC4BB61D735F2E447F15@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66025a4-f256-44b9-def5-08d894f76dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 06:16:09.2597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AH2K2GkDz8lcD+q6qnz1M9KWt4MtAXmq+3leBRUwU8OQD+rFXB0sVIMXaHWYqY0cLh7YvtUX3PjplZAsGlZ60w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: set ahbcfg parameter for
 STM32MP15 OTG HS and FS
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

On 11/23/2020 1:01 PM, Amelie Delaunay wrote:
> STM32MP15 ahbcfg register default value sets Burst length/type (HBSTLEN)
> to Single (32-bit accesses on AHB), which is not recommended, according
> to STM32MP157 Reference manual [1].
> This patch sets Burst length/type (HBSTLEN) so that bus transactions
> target 16x32 bit accesses. This improves OTG controller performance.
> 
> [1] https://urldefense.com/v3/__https://www.st.com/resource/en/reference_manual/dm00327659.pdf__;!!A4F2R9G_pg!J1HTs3kobvYfS453htoIdnxhej4_os5Y5xwMfRtfhptE_QSeVw3O1mozY-v4AvE$ , p.3149
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/params.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 267543c3dc38..0df693319f0a 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -177,6 +177,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
>   	p->i2c_enable = false;
>   	p->activate_stm_fs_transceiver = true;
>   	p->activate_stm_id_vb_detection = true;
> +	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
>   	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>   }
>   
> @@ -189,6 +190,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
>   	p->host_rx_fifo_size = 440;
>   	p->host_nperio_tx_fifo_size = 256;
>   	p->host_perio_tx_fifo_size = 256;
> +	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
>   	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>   }
>   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
