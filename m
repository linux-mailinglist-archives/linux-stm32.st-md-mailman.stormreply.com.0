Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4F58AAAC2
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 10:45:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D77AC6DD66;
	Fri, 19 Apr 2024 08:45:08 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98571C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 08:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjwYjmvh9PUQ/hmG4TjHwlbN9U8gd1dlWSPeHExMQT1idNlEYRxdcOSWyUyJrPg6HZdptL8WtbUARAp3PWAh0IBeMVKAkZ02VGQkyXCQEQf61aR7V3WLm5KVCKj3z/GGvJymz0poaHJx9Kw/uF0Oa3v1orzypOpolZXLHPBMS2e7vSIl/uc7aGOtFO8qo4yXDvoqRreV8dvnEu0mLXu98MSHM41obVzPAdh+XabE4xq/ucRRFy1I15XSVAgTrd+Bu6+kiOIRUp4G2kNAaYXtgJMfjd2HrXa8MAVJ8eEqd1jQ3r+sxKe9deBRB5KHz3it8Bc2tI3SHbwbjL3oGi2Xxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suAYzNRENGG/3atgJwDIczPDN7INle5GVqHqsVucDc4=;
 b=HmFyhbG4uIi70aKk6NNRGxKjo+lx28ePA86TtZFzuhgCbAEpmgIYeAgbHZGspwlQpK8NiBShKCTU8OC/Wyq5vV7ATJPvpm/8Tw/8vwVTFgFEgFv9ExKZG8HSsQZ874//7w/eV0ZwzXLtZRYTsJeSc1Bwkq4RL1gN7fd2yWtu8P0W+1L9BWLb1j/0xJXeln2VUyEqResXH+TA78l5sqifJJ+RUdIEZIZFVxRMwmOioTUyE8YkGFbNT3qeKNgzJEM1bKnm+q8Ikl0RTS11ijLkoNN0xkxnevn6xxcWgdBjNlBFIrrpWAhLKG2KSuGuzQfOMXO54EI0GgSYa2qGuw59BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suAYzNRENGG/3atgJwDIczPDN7INle5GVqHqsVucDc4=;
 b=oN+oXPHyTuPNBKHJ0q3vVbJf/Rw5Ox6SQEQdYB4RbuG3gQ/JKw8iqbGPfmYpufm3ftIzlIjssyUmM0ozTed/IFQE8W1v4qVQmt5A/DyAmAL7RCHYgs1yTlTnELUxNDORHmS7KR7IruGX5bUZJ2DCNCm3qrU/DRkBvVQxUSRf4fiK3AG9RgdMDIJ7PmXLWW80kdcYn057xlTB5Cl3ptqrmJWz1pWLzX+o4+GzXr/18b3NdAsIPputdXTbGv65SacAboaodUGDMeTS+zdHYLtRKCL//vICQDJhcANjFP+vtvpDxzGwctSPereF7cK8dGVYX93HxmGzx6cfz6uh0ejnEg==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by EA2PR22MB5172.namprd22.prod.outlook.com (2603:10b6:303:25c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 08:45:05 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::ab96:139a:5601:de5a]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::ab96:139a:5601:de5a%3]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 08:45:03 +0000
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
Thread-Topic: EXTERNAL: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride:
 remove tx-sched-sp property
Thread-Index: AQHakbHTV2pqPIccg0ma6wukYozNRLFvQF7g
Date: Fri, 19 Apr 2024 08:45:03 +0000
Message-ID: <PH0PR22MB3789D39990E952F4947C04C1FA0D2@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
 <20240418122859.2079099-6-f.suligoi@asem.it>
 <4a06b79b-b1b4-4b25-bf36-ba23d3418b8b@kernel.org>
In-Reply-To: <4a06b79b-b1b4-4b25-bf36-ba23d3418b8b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|EA2PR22MB5172:EE_
x-ms-office365-filtering-correlation-id: eff51829-76db-417c-ffb2-08dc604d01a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YaU0AjLqM3Nur3jsXXzNa04Zo8nxdz8zsXckJrir/Uy7Ty0lqZ87qDhdZn2tsQe0fdvLcKQKDjXIpZg3m5sqMoTycOpSGr7AiQ62FxDGO/nd4RwNSQpjcMAC7FTeiu9Jt2uMvrVta8MQ2QMfYaEd36MbTV+3cQqKeCx/No7s9S6Nls8WnnJLSTajvnVCrNmZdoNV781TEXRLO9104S7sqZACJauQAHOtmLHPrT9xbqVCaWkn4uhm62xZ+0yiluR5BX8lCNGIVhcAsHJVACrbPk6t8FTdPDfVNL9rLnI7VNpJ0N1853kI73+JBYC2Y/CFJfOkYxH9bLtY1I4Doqt9zmlUVUJuTVKoOcMWRuuNG2nXJjkDaFJsaxAqGrgdVCTPSenGbxOo4jdZ8/fzvY+dnBPhYnomTDJo3y97zZtsC3AWksSbLFPrms3lq/hWtWTVYMaiRaVBkWN/uk8k4TVBUPCKhkWy1m3g+dLTf+0xj0fji3F/VW2fTreqFvfnpBvbByAWIuVi3fKE5xDspnjxW/pvYlbMePKu9Vc0QxQxHPk6V4K2zHBAbT7riQ9G/Y9Vm+7J2WJEH9S/edh1AYvxg0N56EN7hrz9syNyA2YWnwH9izGTEAgPTLtuMjV2BkHhAKPxhw9Ma3xzuAatMQiMUZBMboYYkZDthka6fg7pMN5h5PpQaHcFD+6c4IPkoF8AQatwOXYgo/FrcAJCrIsitmiSNnkZt4OLOi0NiLualwE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1Fnd2Y5eEk0Y3ZMTkJCc29mLzY0Y3hqZjBWMURCdkFQRFFmSEo4aW95bVUx?=
 =?utf-8?B?WENKbk5yNjRLcEpXRjVNWHhIa09YVFFrU1RnLzNWNkkzejdwMnp3RWdOMklH?=
 =?utf-8?B?VUJXSUduNDJlb1RTV2orQjZIRnUwWlVMekFnZGJjczdSTHkrdWwzdGJRb0dz?=
 =?utf-8?B?ZkFjMU54alhlbzBnZU5GM2lVZjR1M083M0V5VUQrOURtaGF4aCtRTWFvVjBV?=
 =?utf-8?B?UGR2MlJpRGlBM2xEVEpYQmd4ODRURnFmS1A2TlR4d0pKYVVMRGsrSER4MGxy?=
 =?utf-8?B?ZjJJc1UydTVBdW85b3pkSHFXUDAvSEEveE50cUhKYlJCc2RDM1FUMmxMdkpj?=
 =?utf-8?B?Q0tzQmpHT01lM0hCYzhhQ0tyN2k1SE9sazFtSDJTbzY0M2N3OHZsNXJtdVNs?=
 =?utf-8?B?ZENvV1dweUNhRHM0dWlIUXhlcWhBQnA5OW1jNS9sRFpMSlVJZjBzcytrSitm?=
 =?utf-8?B?OThVSy8xdlN0cHRaVlNwVGlJYU9QNUtTOEhVOVZjMEVGeTVuay9naTdNVkxh?=
 =?utf-8?B?UDRNbTBjZkJrL2Z5S3R2RERJUURSVkp4K0NZV3JleWZuVGxIQmhya2RVZFhD?=
 =?utf-8?B?d1FuTEVXcFBrL204WDJQenNaVGlXWjhEWmdUUFNaOWwyT3ZlZ1d4MWVpSG9D?=
 =?utf-8?B?SzZnZGg0R0JvTW5yTFl2eStpcjc0R3lMdWdjNnkzWEZUQk4vSzhDUStzOTEr?=
 =?utf-8?B?RVNwWG5tUC8zbG0yRVFEbGcwNU5pbXdHR3ZmRlZOUGNFRjhXWmNjMzEzWHVW?=
 =?utf-8?B?STlyekFrbGNjeTluNXRqZk1RNG92U1FoblFiQnQ5Y0xuZEhmNVhmQ2YyZDhI?=
 =?utf-8?B?MlpyZ0YxbjFEZG1XYzVXUncxM1kxRkdWZ0RyTUVZZTNLRkplaTFpZnI0eVJ5?=
 =?utf-8?B?Q1k0djVLd0FaUmNzUlY2NHNnYmVVWEoyVm5lNmk3NFc5c1EzaXhzdHB2Ynor?=
 =?utf-8?B?TXRWZ3k1c0h3aFdIY1ZONXdCRUpVTnhPWG82bHBZcTNxUUxJMjV6ZUR1ODdn?=
 =?utf-8?B?YmlOSXl2c0hRcnZIc0hkVmNueThPb3U5ZlpGWURmZWhFZm00TlFFR3ptMFhF?=
 =?utf-8?B?S2xGZzJ6WnBEZVkrVXpHMCtUTnI5S0htRlVDKzFEOGhQQ2srUWZINlM4WHNK?=
 =?utf-8?B?d2x2NXJ1VE9kekZxZHNvM0p3MFAzNWFTUmdnZkNLTTdna0VXdm0wNVkvTHJv?=
 =?utf-8?B?OStET2hreit6bERHdGpjdS9hMjNGbG8wTmRxd0Job0pMSU95ZUlHTFNXcCtz?=
 =?utf-8?B?QkJPZm96dTJkL1l5N3JNdy9aNFpiMFZIVlViODlUYWEyMDNhYUJ1SW82Qm55?=
 =?utf-8?B?ejF3VGV1eUErcVNMOWdWelRHS05wcFh3dTJQK1ZPNUwvRXM2S3dTWlFTM1JK?=
 =?utf-8?B?VkhqSkxCbzNNd0l6Y2NveC96Z3pVRWxJTVd4KzlZQkpuL3VFM1YxMUNnVjdV?=
 =?utf-8?B?MVlHVEh0M0dYL3hvK292YTdMSnlHSE9DaWlmWHo2SXgrWWE2RDlDQi9qRGRu?=
 =?utf-8?B?dWh6anJPZWJuUlkvYi9jU1JUNU45d0U0a0ZIeDRDNXdmcXErWVhyVkYxT2pK?=
 =?utf-8?B?dmdaK3ZmVDJEa1F0U1NuSG4xcjNBRVlxT1V0N2JBaXppM1QwT0hhL2hwYnBR?=
 =?utf-8?B?UE1jR3crY3hReFl6VVljQnhOYndya1VLbi8rRUtuTzRITE80ZUg5eVF2eWZi?=
 =?utf-8?B?R2I2SWg3VUU4Rzhha1BOUVBzdGRjSXozWmZodWJxb01qTExrT2ZZTlVqNmJM?=
 =?utf-8?B?VTV6N1NiQ1QrazdOSlBjMkpPQktuNForL0pJbm52eFBaUjFWSUhKc0YyMXVv?=
 =?utf-8?B?ZGh2d2x5VU4xYVFHb0IxV0lNcGFlQ1gvaGJqZXRLbXoyS1V3bWQxWk4yekc0?=
 =?utf-8?B?Q1dMWVdrRkhvMHRlR1dvdGNlUDlxcVdaSnpHdEdjZklzdjZIa1BnMkFtNlVi?=
 =?utf-8?B?dytFRUYzVE1UVUM5bHBDZkpubEZrMURBR0VmN3JEV1hCblRMTGFEdExXS0Ur?=
 =?utf-8?B?U2J3MEVxYVBWVGtsS1p4eWhxYVRZeWQvamUvM3ZHcENqOTlBYXl4TGh4blFM?=
 =?utf-8?B?cmNDZUZyNFZPSW9PeWsvVE8wektxbU16KzM2OWNwUE5tSloxTkJDZ0lDQytY?=
 =?utf-8?B?eU9XcWR6eS85NE5UUExEdmVPOWpzRzYyOUgwYjdxU3pNam40b3lKYko5UlFD?=
 =?utf-8?Q?pMOWQkFvbv5tztJGZAbv1yE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff51829-76db-417c-ffb2-08dc604d01a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 08:45:03.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZ0NvGrWZ9uLkBEcPOdCgqJtyXDsW0udTYlf9UD3chI6hXSPhd3C/R9O0YK0IzwpUPDeqR+b2rE4fEpz0v9ig4B29akmpsirvu69+jU2y70KeTtCLonorTcSmX+F+hXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5172
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] EXTERNAL: Re: [PATCH v2 5/5] arm64: dts: qcom:
 sa8775p-ride: remove tx-sched-sp property
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

> On 18/04/2024 14:28, Flavio Suligoi wrote:
> > Strict priority for the tx scheduler is by default in Linux driver, so
> > the tx-sched-sp property was removed in commit aed6864035b1 ("net:
> stmmac:
> > platform: Delete a redundant condition branch").
> >
> > So we can safely remove this property from this device-tree.
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> NAK. Not true. Please point me to my review for this patch.

I'm very sorry for the misunderstanding, I saw your reply in:

https://lore.kernel.org/netdev/010d67c7-ca71-43fc-a3e3-ec3e5cd8b149@kernel.org/

and thought it might be okay for all the other patches.

Do you want me to resend a v3 version of the patches without the
"Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>" ?

> 
> Best regards,
> Krzysztof

Thanks and best regards,
Flavio
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
