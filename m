Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F34D5B62
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 07:12:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 483C3C628A6;
	Fri, 11 Mar 2022 06:12:49 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01785C628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 06:12:46 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EBE4AC010E;
 Fri, 11 Mar 2022 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1646979165; bh=Ctw0mFtwfKRw+L7eaXkMlXF8PWPgioczE9n0KL1QqDU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lq2N9Eng0bvqoM3jTQ88fvfkIn+LFBfZCP4OF1ZxC/iiDfyY0rSSPqWNP0fyzHdUF
 GzU5Ov9OIQcR85guQVACQhRAXNDHzoGwLyuBsn6lQNpAVKTg7BgIl6bbmJ8vhd7x1x
 XtMqmd/d8ODppWn5tCLlGJ8GchFq2cyDUbP54lR8MZw6vdBRS9wdMS9MAtvGxWTF2A
 PLb49R+6sGbID6OsJBS36KISbprnkKUqf0FLkK1AkVfZkHbF272lBRqczeT1B9UsbD
 LSuUS516mZmIPWO3YR0xCArM0geJK5+j1KWfDV1oUfIqkslw1nhVM3akr377spPsF2
 L7nFITXrjJxyA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4FB71A0079;
 Fri, 11 Mar 2022 06:12:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C07654006B;
 Fri, 11 Mar 2022 06:12:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oH5OPd/j";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8lq9+NVT/w2l8jBb/iDJTHP5TzRFo5VesNYjVPR/9YWRQrm4ktcrBpaRbl1BJzR0PQJDOY2TiboUe8L98Hs2as9ZeKz7qf6G1fK2Aw4zE1RKBnB1bRZEoCcDy3j6XBZfftUsryL0ZPt+6HrLe3+MY2/78FVFf/LasESE+W3AV17TwyLCWMY02w5OfmiYWv1Ryi5FCATx7UUW+eC0rDOWp+kZ5yoVc0Rdk94/g/ITD2+XZSUNLe73uggT8lUKEpYyB867pNeMFVRG68BrEwNDNrBaGhSHpln99GxnznIHnTfBCRvTdikOYrzDYF8c0O6vVnU3URWHcaNvIWEruA94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctw0mFtwfKRw+L7eaXkMlXF8PWPgioczE9n0KL1QqDU=;
 b=bTsDjxJBHaHaoGFXn34r3Grsf/w4nt/SFexex3APRBIvqq+MQqW2//U285h7N9m9BFORRLyaDdgR38iHcXQd7eTsxyTTIxi6TwdH8KCZXorN9jmLcJQuoD3unyCw8qJJhPdLSl6bi0eD2Fc1Ykl7YcIWLzLb2MyqMcFwe2GLckZDz+NoX+svpy5ev0sdHKtyz6TOIxMIjpp21atlKCWHKWXllBMje3Fi4jTIotT3ac698wCoV8Wo58kaPWpt2jx6TL2MkrEnwsFaMV7FHD1d3oUX0j3x1xrsKaf+jpWQetnc/Adh37hZlCECwx92fgQ1Z4qHIXU2lvA+vRuD/98yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctw0mFtwfKRw+L7eaXkMlXF8PWPgioczE9n0KL1QqDU=;
 b=oH5OPd/jP69JCld7/o6N9c0hAcpRyBLtPRVy+nBMNxZP/VaAZZgRlI9JgaVlUMERNe7QftI0h+LffMHa3nMSK9zx+sIBH8AleH3hkrYSwBt1q/7JzbNawrSh9+S0nHajwnRWVT8oIOqfp6uuQA2AU82NUFLhCCE+7iGyYvW2qXA=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CY4PR12MB1382.namprd12.prod.outlook.com (2603:10b6:903:40::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Fri, 11 Mar
 2022 06:12:39 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::3db4:25a0:68a4:c946]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::3db4:25a0:68a4:c946%6]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 06:12:38 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH v3] usb: dwc2: drd: fix soft connect when gadget is
 unconfigured
Thread-Index: AQHYIw1S89R4Hh4nVEmQ6a8NfJpkuKy51+eA
Date: Fri, 11 Mar 2022 06:12:38 +0000
Message-ID: <5b33ecc2-be50-1320-9bb1-8c7a2966f835@synopsys.com>
References: <1644999135-13478-1-git-send-email-fabrice.gasnier@foss.st.com>
In-Reply-To: <1644999135-13478-1-git-send-email-fabrice.gasnier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ec97554-5ed5-4484-a154-08da032624d5
x-ms-traffictypediagnostic: CY4PR12MB1382:EE_
x-microsoft-antispam-prvs: <CY4PR12MB13820FE71A580FD882472FFAA70C9@CY4PR12MB1382.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWgHPxN8PZB4PvpPoHOn6Moev3DI4H14SfiRI3zc+DmParppa5o8FSsEv3WGBgFEAq+YUgzY2RBufCgb4Lr6ZifCae8as1ckLSe4OauMktpJfyhFdFl7o0Fq1D48tvhjEdK3QlQpg0Nec1fAbrcKwVWOHK9LPGRLESbE8vukXKPqZQORS5BkSQo7OGRgA04Smi6uBUih9tGetyMfznLbDJFP0IMpnPiF7QSePVRkmfl49eHei5IK1WBcPKqBwu443loakyVr7va8lOOldYhJlq8HXtODa5BzLsMRFLmsDBrNPccKceQFLFzbrAlTWbHCSnkaxYOZVcZUqU3MBde8IrtWfTCmKCjCyEFM/pQO56Ccsn5fOJinqBGrgsOwgxXhLLibsi/Tl9exGXWR15BRUE14cV95DnKLZvu0RosUKuCdmWsnKHOi9O710lNXsEi0ypPbN7PSoG4KkmxvoABePpqJ+ZYh+uGxYuafIShDEtvR4jMMEyZ8Q3on5GZ4IASV5+bSYgzET/6/m9L17nANVo0hBuCbGDaJ5vXIrqhVXTOVNYno0J1Jtiyrnz1B9t2ZTy+ejV/hQabK3yxClFB4p8m5euU6L1/us0mYWLSDv1xVvwRR2M5R8pNDNrgims8BSBZF80pOj7FqVGPZ8I29qPf5pwavOlt1GbZgWQpp+IqjaBaHDxIhtTzezFf8vD4gDMbECUD78pcZNtyFiM+jywHAH4TYlutkLa88ZrFKB3uXZTtW0O3rMtxM5j0btUP0vP/4qxAHq/yAxj+nvmWVqU2EOQlgHxMlGRyH1GNPMr2xgtEbX6+VR7yn7NJLapZQ8tG5kdjkujX0+9s6wJHEHoD8nmQ0gaNO/dGP1skKV8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(6512007)(54906003)(36756003)(31686004)(53546011)(508600001)(26005)(71200400001)(316002)(2616005)(76116006)(83380400001)(6506007)(6486002)(966005)(2906002)(86362001)(110136005)(64756008)(122000001)(8676002)(31696002)(66476007)(66556008)(66446008)(4326008)(91956017)(66946007)(5660300002)(8936002)(38070700005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlM4cGZManBrUlNsa2NMc0xsc05OYlRuSTJSWHhYWTdyd1ROSXovb1AxUm9r?=
 =?utf-8?B?RjZBQk8yS010RkdHdW9aT3N6YUhwRGdGNUlPVk0zNEsyM0FFNElyZDNWcDJI?=
 =?utf-8?B?SS9zekIwdlV5dFRLeVoyNTZnZ1ZYVXd1K2pOOENWaVlWSHlCM2wxOEE0MGZK?=
 =?utf-8?B?Zko3UjBJU3E1WTFJQjB1ckwrZS9xbDZSQmQyUTg4aTVDclBRWlBuRm9XRERw?=
 =?utf-8?B?K2JpWGVzSGFRdTJpN3g3eUZwWnNOdk05UDk4WVhPOGlINFZLK20rbVlESTRE?=
 =?utf-8?B?dnYyTmo4REdJWFRSZU0wQVdMVnZHSjNVczFPWjZBKy9lZTI3d3RjT01EUEtO?=
 =?utf-8?B?WWY4NUsrS2ZBK3JVU25VdUFRYU1mcWYyeGFwTW9oWWw2MnVMRnZwSXZESDhv?=
 =?utf-8?B?RjZxc0hsQ0NucThoRVVmNExYRHVGZXlqWG1vY3NXekVnRXEyT1oycXVsK2I0?=
 =?utf-8?B?Wk9rSTh0QTNHeGRlYWhzMnVvQThGSWRyY1I1SkFqSzk1ZmtTK1JXUUZIdlNh?=
 =?utf-8?B?d0tPZVB4d3NVWWp6MlM1dkk4c2xVSjl1QWdnZ1FyNHI1SHZOWHZuWFppK2hG?=
 =?utf-8?B?d0RPL0NXSEFaSE1peGdZb04wa3M5M0tlUGNNUUt0UDRnYU5pTVU4NTJoekVl?=
 =?utf-8?B?ZHY5TUVuWUdCY2c0eE9iR3MxOXhKNmZkbzQxaGJYTjdSdVN5ell5TkpYdkk5?=
 =?utf-8?B?Q0JlQjBtUkFBMGdGQnhGdEtaVUVWM3JiZFZmY0piTjJTbHUwYUxvbWNFTUJZ?=
 =?utf-8?B?VlRWMy8vWXlFZUp0S1VqdW5vYjh2RlR6bmZWQXRSSEt5QVE1MVpXOEMxOWsv?=
 =?utf-8?B?cVk3d1BMMkhod3Foc1JDSzgzYTg3bFB3d1dRWm8zdUxOdkNxMktzSDNsZENC?=
 =?utf-8?B?bi9rRm42MGphYXJWNHlqNFVqWmxCUS9COEtqZE9ZbUZmOHdKaUhQczRMVWVz?=
 =?utf-8?B?RURxVWhMTWkvc3VxT3pmb2hLNmlEcDdPWHE2N3hhOFBkUFVrTmRrYzh1Y1gv?=
 =?utf-8?B?eDVKZllsN1d4OE12dVBRb3loczk4WUVYdk5VZU9IZlQrNitvbVg4d25NeEx4?=
 =?utf-8?B?dzBCZ1RFRjl6U1A3L2F1YlZ5Q0drTVZ3a0ZhcFJrQ3lWQzR3eU4yaFg1d2o3?=
 =?utf-8?B?Y3ZwdVg3Y3V3ZmNVd2FHenFadlBCdTAwRWJVWVhrZEsvWXFtVHRHYUtNejdZ?=
 =?utf-8?B?eE5ETzI3dC9IM2MwWE1UZjFtR3hXdFVSUFA2Y2tiQTVBU2F6SXJKejdka3N1?=
 =?utf-8?B?ZzEvUWRQZ0dZRVNTeVowS3J1TDFNUE5IcklUVEN5SEUzVGZ2c1kxNi9WVWRh?=
 =?utf-8?B?OStQMTNOZlRHMGI3MisyUmpkZG56NjltMDVMdGVUYTNiQUdrcUhmVjFmUFp1?=
 =?utf-8?B?T1lmWitrQmUyYjhqcHdydThIbElhbzNnU2RmUnJvU01QaG9PbjhqWUpZMGRE?=
 =?utf-8?B?RXRrYmQ3cEtJRXNCb09DREh3ZEdyNmtTVWhYK2NzRzZzQWZDVXREOG1Ea3dP?=
 =?utf-8?B?bjlaOTRSNjRMKzFSNForMGJ5dEk3UGVkRkZNUEMzZGMyUVQvbVdjQm5jVjdu?=
 =?utf-8?B?emVybUhOa0RaYldLaVdMVEFxWkdRSUlpazVTWi9CSEZLVFZvZjZQMXFVeTA1?=
 =?utf-8?B?MnBUZ1RIYmNDSXVYWnErTGdzZmRJMC9ZUHJaSGlHVTZ1b21VWUdmVDcyREht?=
 =?utf-8?B?aExGMnJKQnhNTWtYMys2RFFGeTgyVG8xU3hJVXdZcWgzRWN3QkprZUV0bXdL?=
 =?utf-8?B?YWphaXYvWjhjdDkzM3dZOHZWdmdtd0RXOWdmVEc5OFZvZS9GVi9WdFlYanJC?=
 =?utf-8?B?Y29LcDl1bGpvNzV6bzBXb3M3c0wvQWlWczVFVkFZNUdFL1R1aUN1bzJmS2FX?=
 =?utf-8?B?bERTK2Q2S3l5Njh5bHlsN1JFaDhuM1MwSkl2ZXQrR2l5SDJqV2dFdVovTW8v?=
 =?utf-8?B?NzhYU29KUlBweStHR2lENCtWMXhneUpjWHI5MnFrUFVMZlRzNFBLOXBJQngz?=
 =?utf-8?B?cUROejlXYmIvNEZVRTJYTm1HSzBvNG9BUWxCcTlpVzBaT25ZYzJxSjc4MW1S?=
 =?utf-8?B?NllieDZLYlBHRnBHUnhnSTNuSFRnV2FjTHlTZCt1Nm10dVp2TVVkSHRjcGhk?=
 =?utf-8?B?QjJMbUhZTDJ3S01qSTNlYythVFRYQXE1R0R6VkxZQmdjY1BtZkEydEhEckli?=
 =?utf-8?B?dmc9PQ==?=
Content-ID: <44EBFA1E30204A4EA890AB043CC9DDB9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec97554-5ed5-4484-a154-08da032624d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 06:12:38.4217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBwMXKNgb5bGAwVXKNGV7ROJOb+5LPp2zS20GsyqJHFdC6hngVUrQehrXaZyLUYToUw9+fYwzH5xmQWnv/IsmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1382
Cc: "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v3] usb: dwc2: drd: fix soft connect when
 gadget is unconfigured
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

On 2/16/2022 12:12 PM, Fabrice Gasnier wrote:
> When the gadget driver hasn't been (yet) configured, and the cable is
> connected to a HOST, the SFTDISCON gets cleared unconditionally, so the
> HOST tries to enumerate it.
> At the host side, this can result in a stuck USB port or worse. When
> getting lucky, some dmesg can be observed at the host side:
>   new high-speed USB device number ...
>   device descriptor read/64, error -110
> 
> Fix it in drd, by checking the enabled flag before calling
> dwc2_hsotg_core_connect(). It will be called later, once configured,
> by the normal flow:
> - udc_bind_to_driver
>   - usb_gadget_connect
>     - dwc2_hsotg_pullup
>       - dwc2_hsotg_core_connect
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
> Changes in v3:
> - remove extra () in dwc2_is_device_enabled() macro.
> Changes in v2:
> - Fix build error: 'struct dwc2_hsotg' has no member named 'enabled';
>    as reported by the kernel test robot.
>    https://urldefense.com/v3/__https://lore.kernel.org/all/202202112236.AwoOTtHO-lkp@intel.com/__;!!A4F2R9G_pg!KxYqv4z1NDZM9yu_eZO1eEo1ZARNbT10DdREGmrUOJvH3Jh9soyw9Hd5lckEWwA$
>    Add dwc2_is_device_enabled() macro to handle this.
> ---
>   drivers/usb/dwc2/core.h | 2 ++
>   drivers/usb/dwc2/drd.c  | 6 ++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 8a63da3..88c337b 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -1418,6 +1418,7 @@ void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg);
>   void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2);
>   int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg, int testmode);
>   #define dwc2_is_device_connected(hsotg) (hsotg->connected)
> +#define dwc2_is_device_enabled(hsotg) (hsotg->enabled)
>   int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg);
>   int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup);
>   int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg);
> @@ -1454,6 +1455,7 @@ static inline int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg,
>   					   int testmode)
>   { return 0; }
>   #define dwc2_is_device_connected(hsotg) (0)
> +#define dwc2_is_device_enabled(hsotg) (0)
>   static inline int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg)
>   { return 0; }
>   static inline int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg,
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1b39c47..d8d6493 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -130,8 +130,10 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   		already = dwc2_ovr_avalid(hsotg, true);
>   	} else if (role == USB_ROLE_DEVICE) {
>   		already = dwc2_ovr_bvalid(hsotg, true);
> -		/* This clear DCTL.SFTDISCON bit */
> -		dwc2_hsotg_core_connect(hsotg);
> +		if (dwc2_is_device_enabled(hsotg)) {
> +			/* This clear DCTL.SFTDISCON bit */
> +			dwc2_hsotg_core_connect(hsotg);
> +		}
>   	} else {
>   		if (dwc2_is_device_mode(hsotg)) {
>   			if (!dwc2_ovr_bvalid(hsotg, false))

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
