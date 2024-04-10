Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660B89FA54
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 16:46:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03887C6C820;
	Wed, 10 Apr 2024 14:46:43 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2139.outbound.protection.outlook.com [40.107.93.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0A78C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 14:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdSaHXjmNdk4JyTGf6c2j7OCl7zxjP7wjM7/5uTu+IsdjAz8Il9ia2lhXT9BVJoBIlDGg5eebqmoYDak8w7U3+zpVO5tate0QupuO4BSX8qc5e3H4CMf5I37RNFN9zDLgNW8+71AFkIc6CeckI5BObOsD3Vwf3n7McKCxsNSBHbScdSVibV+1UueXB3ytBF4XjK5mZ68pG6T38s73ro8E/tfVqnJBkxUmNy1GshuBzotuUpxMzcc2Xt2xmhS+fRiafj5o/TQwtcgvJUTcdmYUhc0cM0J9z/Kd3t/wtBhkIq0umkKphnpGDbOY1ToDMG8JtIsrZFB/A4ITcT+Ox5UqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RfVlzdFzN8i+18FIBKX07+NCWk7tgSt1gUevMNGWhE=;
 b=iscAebQwZLwq8RQRYHM1yIVacZqPbH6rWiRI1cyTy7eJSPDmKUlDyjh9TV7+KBIW+HRQ0dwoQarNekZpAwRhj4npJ3cKhpIq+Z/Uzc0ZhCe/dr2mbXw3BAO12c4bmjWvF7ROc9t1IuaNLdqiNEh1RY6N7iJDIEjpYm+9UjNHcCPGiksRAAG8mhobCRjYy9p6eqsiv8y8jO64igRCip3rXF8dd4aR1PdG+6ibN7JGelQ/ZuRPYvgR9HNn5te63XzXFdAIYRT2bvlgcRz8Jc792tcYR8u//hjOqQSbt5U0CcZimwNRPIeaw42KPc3as7ETxJsewc+v7YPAaK+tDQ73ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RfVlzdFzN8i+18FIBKX07+NCWk7tgSt1gUevMNGWhE=;
 b=Aq7ta9wmu6O/0u3DLcLp0ImPH7DX6m35t18aUdIPIvVkrrgdIDK8kTYrTC5Ya6+V5V8mnKlQun9205rmYphLMYNfyUMDn4iia1yJJyKgg2nY2yDpBOphhhe5bigko/TFKS7MkYS86NrVG1a9YfdoOmJFE7/CsGgY+rsVVGMXbkEzfdUME4Oqk/Mtkm6ic2Y0zwM3QOlN+atcL2MslDSge1kKVXzwlUkvEe8vYhV8qSubjKkE2yQeRxbZic60Mbr2jOamZnD6rHI1BDd21cmHr/LvevT6At8P3SIZwBwAkn43YGFnRzu5t+qDDAIGs2pTf+WJZ6MyrLckArDcGXFEkw==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by SA1PR22MB5468.namprd22.prod.outlook.com (2603:10b6:806:3e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:46:39 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7%7]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 14:46:39 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Krzysztof Kozlowski' <krzk@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Thread-Topic: EXTERNAL: Re: [PATCH 1/6] dt-bindings: net: snps,dwmac: remove
 tx-sched-sp property
Thread-Index: AQHah3ELhJkq/tiJlEK+M1aiHLun07FgAKbA
Date: Wed, 10 Apr 2024 14:46:39 +0000
Message-ID: <PH0PR22MB3789D5548A3D53311BB67F44F9062@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240405152800.638461-1-f.suligoi@asem.it>
 <20240405152800.638461-2-f.suligoi@asem.it>
 <c599d2cd-2871-4f84-94bb-00656c1a9395@kernel.org>
In-Reply-To: <c599d2cd-2871-4f84-94bb-00656c1a9395@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|SA1PR22MB5468:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qYDAAZMCCvq/rJnQODzYji7biL4HAIEuLFx0PGV/EyQyLDtAI13fgN4fWaG+dAL4DfJBO9GcfZHvc4oulAPhvSlBmIHPHjjloQW3h/PxdaVh8oSZVUElBge7HkizXnlJOxXF83tSLFHotTJdtzpEI/PjwQMF/rbb9VEmVPSk3gbNRI0WoEzZEzhaPjxSuf17DiMBPs3mXnjYcjbNO08v4Pdypbr662SRd+KI9zX8EuYO/FDpw53akPwZakeojsBt8F7ERmErNY1gsAtE4pKx9dvXxsuFqd1YXyLLTBpptiQFPit+OkJvUsRs9PbSjl/oF/7RlXX/84genqulkw15cw3gZ3VqqHVlywaeonCM3FWu5egr7YqLmtr+2cRB1z4exQ01Pk/HoWJ/XiDVumDxz7ApOpVzwZ/e/4ypEAfPr64EWNE/KbbAjkadZ10OTfY/9BhuMMn2g9feG7l1ReBXIrF7YFvMufV0kkXS7vAdqHkgoucrXxpPge+Wj19FKbEVf34CT3ue99qULQsIaf/7JwPWG7+T9ieToI0SboDlrIeAsA5dWw0Nww+XFEMHBM30smMAgkrTERI3cfMPjQX7IL3lbEdUuj1rlITb9OsS9XPpGVS3Z4P82dDkLQW8JJVIg+Kgblx27jtfHwvZSKYIBCX+SgXm1zzIbHjahsKdrFlPrMZflMCafjLNk5szhKfMV3K+Svl9CXYbpqQDqfnb9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUFqVm1POHhDbk8ySy9lc3FmcWEzTFQyU2dyZlhIL1dhSWtjcDhDd2QxWjBJ?=
 =?utf-8?B?WVJQVk55YUZ6bTdLNUZhYkVka3VnLzIzU2YvVkUwM3IwZk5IajdSQUs3UW1n?=
 =?utf-8?B?U1FMaHNuNTRJMG9PZjdyUUs0dkVNVTBTUSsxZGpuMWd1RUNLaFdZSCtuK0hn?=
 =?utf-8?B?WlJTSkxrRU9MeVp2VEk2QzRTYWxIOStpWXNOV0N5UWlwbEp5Vk1MeWJPanJk?=
 =?utf-8?B?RDR3T0tVTi95OGdYM0RSWjllbWxWSERINHFTelY1eEliR2dMd2tkb0h2N0Ew?=
 =?utf-8?B?cnd0VC9QcWJGRWRwUXpUNCtMdVVRVWxzY05HZmpXQUhCSmU1dkRzSmxQdzhX?=
 =?utf-8?B?YlpVMjZDUHdDWXMrTjdmelZER00vZW1VZGdFYXg4dXYrRWZVV3kwaVQzZ0c3?=
 =?utf-8?B?V1ZSOTlrSmkwOGRRYUtjcHpFaHg3U0lXY3hDUXFLNEZpNUNoeHJyRmN1MkQ3?=
 =?utf-8?B?SmJUdkw4bFBFTkFmd1ZiL3BkQ1dXRERhT1ZMeVVxMGcrUkpGODlhbjlxd29S?=
 =?utf-8?B?ZURITi9KWEM0allnWXJmWm1GamZJMUZKZExwbzhiK28yMTMvRzc1M2Y3WEZZ?=
 =?utf-8?B?a1Z5eGl3TVh2NWtqWTBSREY0Tk54eGFFeXpCSFFuWUJUdkt6aEppMWJSTk5l?=
 =?utf-8?B?bjM2ZDFGbnVaZWNsUFBTVDk4bUpRQ1dZQzZnTVM0Sk5FdGFOY1hZaHc1bXpv?=
 =?utf-8?B?S3k0ZXpML01LY2RtRUx2R0FRSDl6QklQZFhEc0tzaEY5czdBTE1USFQrb1Bo?=
 =?utf-8?B?c2NyYU5YWjRKUDdLdXR2OWhpRW1zSnBGVG53VWlvZWVUSEFIM3F2UlJQK2Vx?=
 =?utf-8?B?THhVRFZDbmVzK3d5RG9ZZVlJb3c5RTB1NVZsbGJCM1MzUHRmc0lqSFBzRldX?=
 =?utf-8?B?UUpwK05YR0gvQVM2dVZtQTVoTURqR0pZYlB6MVd2bkNjU3F1eDdnOVNPSjZ1?=
 =?utf-8?B?ckQzd3REV2ZhenpXeTRGNWd1dGpjMEVGOHpaSk1nUkZSM1F6VXBoSXFIRDRC?=
 =?utf-8?B?MTJCc3REREl3ZEJoaDArZGNPOXFxUExvUE1UYlR3ZVVyaEt0MjVTeXZGREQ1?=
 =?utf-8?B?NGNqeEVsN09tNFJLSFRKbmZScXh2ZUxJUFExV1cwWWcwUmZJa2RWZnZjMmh3?=
 =?utf-8?B?TFdWdjBscU05d1lEMGNyVWxod1M4L1J3ZjVMSXZMdTI3L25UeitoaHhEc3VG?=
 =?utf-8?B?MjdaOExNMWFSZFNFN2lKdkNYK1RpNmF6ME1pY3JpYVlONVYzUmlRMUN3S1lD?=
 =?utf-8?B?TE8wK3hyVlRNaVQwMFp4RUtZTnZDT2g1SkVKbk53bllhazNaT2x0TzVDZmdz?=
 =?utf-8?B?cnladjFFMmVsVG1tUXFHVlp3dXF6LzZrSUkwcVVYbUdGNE1mT1pEcTAwQTB0?=
 =?utf-8?B?cUpqdDc0a1gxeXovbmpUeWFjc01heHczdkVnVEVhRXJqT2ExaDYyOXpoS2pr?=
 =?utf-8?B?YzhNZi9odEMyTk5WWFFXa05ITlFJQ2NWd0J1YUJmYVNnSHBpMGxyVUx3SUVK?=
 =?utf-8?B?eTM5cWxLbTMyTHVBRmhmUmludVAxVi9SbTE3YkJNRUFycmF1dEhLR0h4bWYr?=
 =?utf-8?B?ZytwUitIWEFpdEJPOENEUWtXV0FCYy9PeXZDTTBwcURGQ2RLN3NkMHlTcGRk?=
 =?utf-8?B?Q0tWUk9ycTJ0M0tjWVNsT2pPS3JKSWdmSzBWMlFDeGtrMmVyMitUdDJ1OFhk?=
 =?utf-8?B?cEVxOVFmMVhnTWZPM3RUQzg1cmxpdjg3VEVWOXZET2xLUHFXRkcwZ3NrQXNr?=
 =?utf-8?B?eGhhelZ4d2U0ZEZJUmpiYjJJL1ptTUJGamtobXJFWlJ0L1piWE9BaWVCN1lJ?=
 =?utf-8?B?YjlyQ0ttb2ZxWXByM2gvb3ZUejZyU29TYTRpS3puYm5XdmJVNkNYWVJwb1F3?=
 =?utf-8?B?M2paWU9jWG45TUZ3QmM1cUViTEVnU1k0RzJTU1p5ckxOZTlKaFp4b2VSaEhM?=
 =?utf-8?B?YXFtSnlKc0pTTXhpc1FWUkdtMW5xZ25Hd1JOcDE4STFVNWt5VmdDNTcvQ0x2?=
 =?utf-8?B?WExRd09KWmZ5MjNoTC9nakJSSEI1bG44eHZjVC92NmxQNm9vTHBJMDkxNnc2?=
 =?utf-8?B?dTRudExucHl6TjBVcmxNQTl3MmZReUNHOXF6cDkySXV0Z1A5N1VJckcwVkFi?=
 =?utf-8?B?dXdxMENsc29uaE1SdVpGV3FtcDhrdTF0cDBuOVZoNHQ2TlUzdlVWMUlBcWFh?=
 =?utf-8?Q?mqFurKac9s/PiRGnSLkS9PQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62dbf1f-da0d-4ef7-f5db-08dc596d0791
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 14:46:39.2560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: So4KTPyqw5gPIQk6biCoIXGNjOlA7ulIy7AtkGrVD12Sl5l+W8lkfggC9TslzxzTSjshTDx2rOvsdHdZgMfqM3YO/hw1r+g4+fO8dVpo1dH+wfKHJ99WHds7AvN7aQW6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5468
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] EXTERNAL: Re: [PATCH 1/6] dt-bindings: net: snps,
 dwmac: remove tx-sched-sp property
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

Hi Krzysztof,

...

> On 05/04/2024 17:27, Flavio Suligoi wrote:
> > The property "tx-sched-sp" no longer exists, as it was removed from
> the
> > file:
> >
> > drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> >
> > by the commit:
> >
> > commit aed6864035b1 ("net: stmmac: platform: Delete a redundant
> condition
> > branch")
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml        | 14 -------------
> -
> >  1 file changed, 14 deletions(-)
> 
> One more thought though:
> 1. Missing net-next patch annotation,
> 2. Please split DTS from net. DTS goes via separate trees.

Thanks for all your suggestions.
I'll resend the patches, with your suggested changes and
splitting the DTS-related patches in a separate series.

> 
> Best regards,
> Krzysztof

Best regards,
Flavio

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
