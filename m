Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD8F476EBD
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 11:20:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B12C6C5E2C6;
	Thu, 16 Dec 2021 10:20:08 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 754C6C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 10:20:06 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25392C51A8;
 Thu, 16 Dec 2021 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639650005; bh=zuEw75zBjWC1ECOblm+zfws8rn32dUdlyFZkHbWlRpo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MtudyjsrONvOpHTH+a/rxt8+N934vIdcAw+cUn8kF7qop5z7xjOrdX8hNedXJvO38
 LdAdcz7ccvlWA8IjTIyLdwIJJxbXroub7Imt9jy/QNybBCs5nWQou9LpKPv/8hyMGt
 3pM3Vfk8ikS1Ak+XiR3eEDjNGjACx8P72W3ll90Ij1I90YTfsL7h9I6/oyEEoAsUgS
 GIvZxDI4MSHbzFwRJK4vnC1lVrPhJkEYESDD1f8poKUL+jyU/Ff51yZZni2LzpzCTI
 ap3Ifb1zq7/t62vBtDd4Kk1FLkCopioJTW2Z4BWxrz+zSISVbYTMz0gHJrZYpxx5mN
 hwNe6qGt0FN7Q==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A11D7A0084;
 Thu, 16 Dec 2021 10:20:04 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 06967801D6;
 Thu, 16 Dec 2021 10:20:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NvlhSI/c";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvHR3PdZcqFofn6fBPXm+Z6IRKX+3QyMbJ6f/uyOq2GaesfkorSCfwIuXr3kNPtEzfdTk1Z85vqP3VE8PysxOYjEjLSloj/INp4zB8jYEkS25c1+38UtuPBDl9frJW8TQNO4t7xopW2+BddR2Zqo3nC4xUpmKLGYDeCfUVUUNODjqis/8ZSR7LAk5XzeJsoztkpYyeEHCu7yZFjnjfZXm6z4/XnPg+UTmndUcLwZbPxdA/ytqap5+rlojDSP7jKtF9JTkyHdv9L72HNrgZ7AjJinXuX38bhXI+sdzKQnytToETph+9C9EG1QNiGWb3b2WqRy7vVptyMNmcxVb+25Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuEw75zBjWC1ECOblm+zfws8rn32dUdlyFZkHbWlRpo=;
 b=mmS57VYiIuQc5kc4cqfCdcHAvauwBeyl/dEWNForzHIu/0rbtCx6/hzHTGWF7VU0jn4ssFyz0fobIFF7S23MFPHxkT4c6z3q4OGXjcGexTZF5qtpegfqZJOzZmHHafX1vsxt9yr8uNTY3zRoOo7CDNDwFOJCoDyxu4HRaEXovnrF5tA4vop6wjFHP+t5FuyTOpgjREJd9BCs8TyB5Rn0NsGVcaBorI5Dm5H2y/MUVE9kGCwWZWvQSG8WoyzCYQk7U9mhFnaaWmMsiAw6zpuxAIR1lEm1NE5O3QdsiNJAJL/SPTvHUw0ba6r02wgdfWDKMKuU1jYy6vbkxPDv592nJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuEw75zBjWC1ECOblm+zfws8rn32dUdlyFZkHbWlRpo=;
 b=NvlhSI/cEhH84gc6dlShRKUGU5uQJDekR9CvyO1fI1r0j5Z6WwY7YgMDvZGws02qeQQgWwPt9nfXgqQvPg9ZL2ios4A847ApzxWQCgZpdbty9BNVX4pcpBLveVEm2TlglWi8hMdWg7OT9BfSa4xHQtTXOXJNgb9JUZ8vidMMC9s=
Received: from BYAPR12MB3413.namprd12.prod.outlook.com (2603:10b6:a03:ab::15)
 by BYAPR12MB2968.namprd12.prod.outlook.com (2603:10b6:a03:ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 16 Dec
 2021 10:20:01 +0000
Received: from BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1]) by BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 10:20:01 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] usb: dwc2: gadget: don't try to disable ep0 in
 dwc2_hsotg_suspend
Thread-Index: AQHX62qCxCNUA/jq7kGn/hM1/5MI16w09iEA
Date: Thu, 16 Dec 2021 10:20:01 +0000
Message-ID: <39694435-d44b-64f8-9614-6082f9c22443@synopsys.com>
References: <20211207130101.270314-1-amelie.delaunay@foss.st.com>
In-Reply-To: <20211207130101.270314-1-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fbaa949-9b08-4673-8b66-08d9c07d9ea4
x-ms-traffictypediagnostic: BYAPR12MB2968:EE_
x-microsoft-antispam-prvs: <BYAPR12MB296896E764C6E0CB03171E58A7779@BYAPR12MB2968.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CItAliX1JpHSdcEgCT6z91t/dgofK8gp2mHJENuVV+TsfoubxxWvZr4+yG+3sYDazNema1r9p4PxRELNBwXCM9Yzoj85efMhRqEsiozG1Sxi84aVJ4LQlXOBnWGPjw9gWHoldsSKE0zYBTJlOQ883asxBVBWu0FcvOZap2mLhZhdiOZc8iZivjc3O2QvUx12dLNxK7Xv+2Yyx/0wo+PbosnWqouKMrf3WaoYpUJVC65qi9frV+VgG1rYI/Wd4d/RAovLuIaHJ2mpxb3rW1UJAj4HKvpCGulFanCR8YtNjrUWfMcV1dEkRN0yx+hGyS9ytoJQUEjemh8rS8KY14Sa2fxFMVya9AFf9W9AtvMcKa1adN0EWZVZ5QDhvl/K8RhVOUEXnQWGJgXDBU/I3cG5ybeUiwxcJjyatiyj104zxxe+susN0hOvjF+ba22Tao7oTZBTH6kQH1U7DgPVsRxtriMIbIXvU5ueVVwT7h6vfBqv6ohkHwFw+1xwpi/3oNGNR7MmAnudVmbw8QF0e5+2pyLCfl9LxMcygKdODJ2uSHiGFn/dGnM/jsiHyF0BsTL/yUA6HX/RiWZKuCaUhhG/qe9GjmR1eGIY4lHHPDfPznpPXOrjcdyTWUh8H4UxtOr4uwywPn6vvBfOgr/i/RfEk5Or0Ryd8aDIT1U78l3ltcRd+FpC3jntGJBBADF5Ec4LEGxHKgJNKnOsN8kycGPDMQETFRXOVSXqjvzK8HJCPQQMWVanwOMEVLV6gSQ1pJjZGzhITYTH9A/6UCyeJnr6rA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(2906002)(122000001)(31696002)(38100700002)(36756003)(86362001)(6512007)(31686004)(83380400001)(6506007)(66476007)(71200400001)(64756008)(4326008)(8936002)(316002)(6486002)(2616005)(76116006)(66446008)(38070700005)(53546011)(66946007)(91956017)(54906003)(26005)(508600001)(8676002)(110136005)(66556008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXJ0clkxd1hLalh2ait5RHBQSUpPTitVd3hHanoxelhWOWRHR3pBZzZaZUJp?=
 =?utf-8?B?aUVnN3BlM1FKSWloUnhJZGU5VCs5eE83Szh3cDJKajhlUS9hcVZnRU9PY1Ry?=
 =?utf-8?B?YzVsOU9Sb1FmYmpaN3ZvZ0R0cFZleHdJaUJjMG5yY21Ec2I3TU1PU1docnU0?=
 =?utf-8?B?dGNHQitIelQrbWZRc1R6RXErZmpQVERDbnE0bzgyaFdsVks5cktVVEJ2bGsx?=
 =?utf-8?B?cE9kOGZ1MExGVktjWnNDTjRSM0h2cXNIcjJDMlIvU05PZlpYU0ZXbXMxNkQ5?=
 =?utf-8?B?T0E0K09kZDl5dVZ0R3dWTTVxK3VrOVNBckF0cFV5dG1mVEFEWVNXRzhvSnpw?=
 =?utf-8?B?UjFQMjBUQ0Q1VVNTZ2NhMzA4QktTN1MzVVAzVEY0dXhnSGRxNE9qalErQ29P?=
 =?utf-8?B?dVQ2VU9Tb1VPRjRYTVZMRnpDbEorVE53QjZRcllpMkdUcExFZTVhQlhOSEFx?=
 =?utf-8?B?ZVRkbDBQa1RYWURiV01QODhXVExndEkzTGJhYmVCRFViYTcydURhN3FrNVgz?=
 =?utf-8?B?MFVaQ2V0dVdyMStCdGFJNnh4Y21IcGNPbmN4RlJsQWRXTUZVVnFsZ1Y3d3hK?=
 =?utf-8?B?QkRaN3BtbHN5c0lRYi9GUHRaT0pjNGlPdVBQMkZlNWFON3NzUVJwSVBYZXd3?=
 =?utf-8?B?aDRUM3d6M053bUVKdGgzbkI5R01kcTBpc3VZUVBSNDlFbmJXdkNCays0WEI4?=
 =?utf-8?B?RVYxZCtEVG5NMnB2Vm5FUGlJQnVkSit6U0NFSXJXL01yZ01UbHlPeXNzNDhh?=
 =?utf-8?B?UjFiT2dRWkVZdEhqTG5VbFB0YldUM2dqZWE5MmRXYlIvWlUvVzh4VVN4MXlK?=
 =?utf-8?B?bXJJeElMRGJmSzJ2R3ZUTmVEbVRQaVAxK3B4YVF2ejR3dXlBOU9HSURUN2tv?=
 =?utf-8?B?NXhzR29Sc2hsSkpMK0RBN2NlN2pvVCtQeTdZRlZ4RmgyUXdtTHA2aHIxd09Y?=
 =?utf-8?B?WndCVm5nVVJkK3g0SXM1MWdZcEpLQjJGNVY1RXd6VXBwR1pKbnRYMmNOeWNB?=
 =?utf-8?B?bjhJL2dmZ0phZzRMeWxmS0MyNGQxVG5tQVVuNjd5dTdmOXRsdFJ4eEtiM1ZH?=
 =?utf-8?B?RTRYMUhzUGVZMFl5RktFekw0NmI2ZFZIU1p3Sk9XOWw3OG5uajdkeUFnQlZ6?=
 =?utf-8?B?d1FRaU5yR09DY2luK0N4Ykw1Ykg1K0F0K3kzeWFNZWh6TE1FOWJuNWx4Q29T?=
 =?utf-8?B?VEh5dmEyd0lLRk51OXd0enIxZ1lQeWpjMHpwRzZiMFd6SVRxc0E1RDBLYnc3?=
 =?utf-8?B?NVVWRzNDMitTcTZKS0d3MWhWcnl6Ynk3dnE0K0JUMm16enJ2OXhLdGo5QzJ4?=
 =?utf-8?B?dzJySXZIUW1xM0VMci9ZR2dBNjZoY3lWamNmeEhlZituSXJwMW45QTBjUFhZ?=
 =?utf-8?B?UllNaExEbGh4UXd4cG5QTGFUQko4N1QxeFJqT0FOZjJRazl1bWtSa3VhZm9E?=
 =?utf-8?B?SmRDUVh6UkRMWkt4WmpMWVRySTR2OHFoS0JKTnNXWVZiL1VSQXZLeXI3VWJk?=
 =?utf-8?B?QWJHUDlQRS9XM2JaVmxsaXhnTE1kei9qSnUzdkJBS1J5WWpwazdFdjNYZDFJ?=
 =?utf-8?B?dW43aXF1Um5GVXlsamtBTklrUjFRZWxnVTFxZUpDSGpRYm5CdDN5SExyRnFV?=
 =?utf-8?B?S1hEaWZmUjNWbGJ0SEdPRXQ4Q0RnaksxM2I0L0dxM0NVZm55MzJLTHVQUHVx?=
 =?utf-8?B?V3FYeTJpK0hoNCtoRW53VGlJNUp3WmJXR2NyQUppMTBHR3hCY2Rab0lkQXZE?=
 =?utf-8?B?QUI3aXBZQVJiTDJYWHZ6MnhhdFVPSVVjY2xGb1BGc0wxQUI2Q1hHWjR4NkpH?=
 =?utf-8?B?SERmNUlVNzBPNEtxOEcrSDlXQnIzMFBzVzlXR0srS2o3RFQ2USs3WkxKT1RN?=
 =?utf-8?B?ZXV4aEJLcC9pajZubktFcyt6aUFXTE94NTZKa1hZSVZOR0N6eHlkS2F2SGVY?=
 =?utf-8?B?ZThPcFdSREdQKzNJVSsxR3FtNWtMelF4QndaOWNCOW5wSjNETFZDSjI4dzhR?=
 =?utf-8?B?UVJVN252ZFV4YlFucnpvbUVPWTUzZXdDQytscnF0YjlsYUorc0JIRFZyMUQ3?=
 =?utf-8?B?T2E3ajFMYjZtVGp1ajNkcFAxYVJEUGNEZmtyb1NubHZjVlN6MWgrK0lQS0Zm?=
 =?utf-8?B?KzFXaTBhSWFsRkdQZFM2ZExTUGNMQ2hoL0FNcmJpYzdNSkUyY2FObHZrNWxW?=
 =?utf-8?B?cnc9PQ==?=
Content-ID: <CD9CC1107F1DD94A9F22682465F2FAC4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbaa949-9b08-4673-8b66-08d9c07d9ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:20:01.1695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltybtxkjIZIpPufGebTeiA8x9wxWwYW9TBY5XGC8xVUZuucNJdWE1Qjm7jN3z6OkXtKtRGSZhGs4YXtsSsYzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2968
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: dwc2: gadget: don't try to
 disable ep0 in dwc2_hsotg_suspend
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

On 12/7/2021 5:01 PM, Amelie Delaunay wrote:
> Calling dwc2_hsotg_ep_disable on ep0 (in/out) will lead to the following
> logs before returning -EINVAL:
> dwc2 49000000.usb-otg: dwc2_hsotg_ep_disable: called for ep0
> dwc2 49000000.usb-otg: dwc2_hsotg_ep_disable: called for ep0
> 
> To avoid these two logs while suspending, start disabling the endpoint
> from the index 1, as done in dwc2_hsotg_udc_stop:
> 
> 	/* all endpoints should be shutdown */
> 	for (ep = 1; ep < hsotg->num_of_eps; ep++) {
> 		if (hsotg->eps_in[ep])
> 			dwc2_hsotg_ep_disable_lock(&hsotg->eps_in[ep]->ep);
> 		if (hsotg->eps_out[ep])
> 			dwc2_hsotg_ep_disable_lock(&hsotg->eps_out[ep]->ep);
> 	}
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/gadget.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index b884a83b26a6..ee31f9a328da 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5086,7 +5086,7 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
>   		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>   		spin_unlock_irqrestore(&hsotg->lock, flags);
>   
> -		for (ep = 0; ep < hsotg->num_of_eps; ep++) {
> +		for (ep = 1; ep < hsotg->num_of_eps; ep++) {
>   			if (hsotg->eps_in[ep])
>   				dwc2_hsotg_ep_disable_lock(&hsotg->eps_in[ep]->ep);
>   			if (hsotg->eps_out[ep])

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
