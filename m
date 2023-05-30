Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D67158F3
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 10:43:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C490FC6B444;
	Tue, 30 May 2023 08:43:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 973C0C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:43:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U8KJUX017624; Tue, 30 May 2023 10:43:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2d8c8O/pjh1bEKlQHcC0sQgiqQ9COSQ+088Nx6UPyfQ=;
 b=p5k7b1hUeXPXDAkdM9T9z2oLtcMIvu7Q8wmhajJTUkroE1gLgXUjt/mVCOHWxZYjnH7n
 hhMbPnvPhTgtHRG5WotRxERnNg3e1qXZxkhsS/anhuXyqK3/CC1phEMFAdSbab2L4HIr
 szybBOcKUnIKAp/LCQv/6y3uyid14nhDrzOi1m0vP5nvmTB4ticMl3caWRcufO9TUCi2
 dyQs6ycnxkNmLcVvVkHke+uaXKgCDTGm6rTf8OE6+9LAW0QvnAcxDVAwm4+XjUPEAmft
 eRLXudgLzHyX+Jpeb8Gs0UrqLn8TDCvGjRdw+6P+/P9DxZ+nCioyl4G5k2Ibl3/QbErL 3Q== 
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2044.outbound.protection.outlook.com [104.47.11.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy6ebt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 10:43:13 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaHZQ6P2Ho3GFA+81e8GxAnDYfXZj6bV6cJmoLlZ5B3BRm0NghW+ox3iW8u39lQ0jqanPEP48+M6cOeJeHyV9JtGA6reUkAGqYBW1QKcwyML2+Mw/YeMz2QBZmpMYZ6rrqtTnUHmssJec2TH6nDF1rNHYsekjx8LBwJgAaESIbHZ1AgI2CIQW7GsJGZO5pqZxvgbhLHebzdrfKEbcxS3Y96a5TSzdnt+L/NYpQXgOWBHfyWeGpJZh+WzcJKmX0mhUR+sXhpzC4+83gk3GOjCpNSOiNVpkJxB4AQxetulSGl8FYVoPt5atXF6vXqy9mTuEVMPFM5AhcSK7ntoxfR+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d8c8O/pjh1bEKlQHcC0sQgiqQ9COSQ+088Nx6UPyfQ=;
 b=bc0Atb2R7P7Z+bIPtpAk284oftaNSSj6VGftaPb3OVS3eu4VxxkN4wIsMV1YZ0ckZRx7e9emZcRmAs61yYWTu4hiCYYez6Unm364RATFp5KUFv3tcCp9+tk/g7IxsVxWRqv+4Vb6caiEg+TmM2pfLNGQv1fI0hp9vLd4iJbkmBY9sLT6uLBt696vcIoPYmjbZ8u0C7UVTQXYQ+x/cqnJdV+Z9DAuG1d7pBwBtIdGYor4gcRHS9Taec4o2WCk/ZKQi7bBr3gksADfc+vRD/gl3Srq9PHIJVwcAFZRjCRKPFDIcjNm7ytfOnrbuMjJvkyUWnNNXoP1mTbOKbUaeA4G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:158::12)
 by DU0PR10MB5169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:341::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 08:43:11 +0000
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb]) by PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:43:11 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
Thread-Index: AQHZiSXvi5SPKVF8ekCGJJKAZyVT669yi2Ug
Date: Tue, 30 May 2023 08:43:11 +0000
Message-ID: <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
References: <20230518011246.438097-1-marex@denx.de>
In-Reply-To: <20230518011246.438097-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-05-30T08:43:09Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=03b047c0-d0c9-42e2-ae42-b63d44844e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4718:EE_|DU0PR10MB5169:EE_
x-ms-office365-filtering-correlation-id: 4e23b842-4526-40e0-be47-08db60e9e686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rFYwzdcXVjnwK2MVh60m7hXofrL/CLxzqhW7bRB+xRBZJ/21E1zaQrzzyYEEidQ4m+VFTI80C/KHOQb8/1fTySYnT3B6PJWuXf3KqV0o2VD4EAtOv1Or3YIV4IF0MzBVNnLMGfVDKSnHEt/lhn1N2PchUdXaf7U7/qOTOP/TQMpth8+bx+2N0d/MM9oyOKDTktkaNbhvwyzcaXDN8T3Q8v8wdP7lO9KvOr8pgmxibxu9uKgyeWLrTjAHbTXBeysr5TvbvzYkjCA4vyHlYqURRx5bBV7w7n9FCwpiqB5bQLXJYaxbdynKGFn2NPiB0ByMiCHnC2XWSJEr8d5NTgvYUwoZ4dRvFvFCKtafjJG3rWgGErmvS3OU/roESV7Vzw6s7xPMD1MGykqqNW/yzqVSDRwNIIhljvBwaryDb9pg8uhcmkki0GLgR0N49PB+RxwC5xOpnyEi6/XwrQmsf0VjyZGJx/cB07SDhuvo7/j/zYGbVVS3aOZbHujYFT36KXCTiakoqX7+deM46jFZvzbWkVIf7Z4hQsKv5r1Vbn7RZMuX8Qm2hxZFeHyMs0wEuiE7zgl+gQFK4Cc+Qb3qzBh8nwjHR1GqeGwnRaQp1HhYrYA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199021)(33656002)(186003)(15650500001)(26005)(55236004)(53546011)(6506007)(9686003)(7696005)(316002)(2906002)(71200400001)(55016003)(52536014)(5660300002)(41300700001)(7416002)(966005)(8936002)(478600001)(122000001)(38100700002)(110136005)(54906003)(4326008)(86362001)(38070700005)(66446008)(66946007)(64756008)(66476007)(66556008)(83380400001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FfRjSKu7stqIJVDORqnKePCaJuor74/ye93EQelCvD22LdjFF0rvpAZWWmvU?=
 =?us-ascii?Q?bWew8xRTY3ovPfMdEu/4X9jWTX9GrauToeQbY7LKOnivrPlQAC7dou/q83Wm?=
 =?us-ascii?Q?fT04kKqwo20R03hCRtBN6HvhoFgiuNj1TJnxI2oKo7iP7ZYP7F+O/hrvGP+1?=
 =?us-ascii?Q?qbcLmhho6JUf2Y7ZrurHM3QbTphTaqgeD2jJFB3DmsbpcfEfuONDgHNl88c4?=
 =?us-ascii?Q?dvGtP0+xE86cETTbT8Yf/Jl2l5Us2Slp2XsJFC1zbclJ/QudmkC01189yUxE?=
 =?us-ascii?Q?4h41dUJagRpCObuyMFDHn0lBYHIXRbJJk0NkKnVZIo6SmUENsH52JKe7TpF/?=
 =?us-ascii?Q?gwUTnij9gtzJjD21I4jHStoSFtGnfur5hWo9ZvdhY7SVIU0Oc9+Wp0cc24oD?=
 =?us-ascii?Q?zxAthLlzX8gFn5nFzIWuVt6/E8c5I1gOWIPW2RzxXM9PA14t/Y9aXR0/Rmmv?=
 =?us-ascii?Q?DXrxrGjdWZdGj3MEa8fGIpeMekA//50MEPhnYpLmVQKhqcFpi7OpsJ2oiyVx?=
 =?us-ascii?Q?lFRsTwt1PjH4BPjsomBgzWkaSFm1L1KHrOMmYqC2nF/YWvAFwO7F4kRnBvH+?=
 =?us-ascii?Q?n7EjbOvIc2P+YYN7iYtA5SXrvt8iPDluYTBNIhAYXNorBjISKm7SIR+8X1lO?=
 =?us-ascii?Q?smSg5sdIov3LdE36hXflFI85Qn8uKtbmL5l6a7cnJPMX6Sx6Nv9hSfW6GoVP?=
 =?us-ascii?Q?EfSP1cxw9bomAjOSWbZ24dMTlAuBJgx/vO+6XOJxX26t5Sz/Mwt9jpNQHE+S?=
 =?us-ascii?Q?T/XwWXcP1DZdeOWqMcHdfuLIQ3tQJaEDlibBKrstpQFN5AuGpn6yrNTibnE9?=
 =?us-ascii?Q?JU8qKxvBYD+jytNQ2nxCLUqRTtNqXSkGaaau1Hk6e/o5c3gGP4HGDfYX5to9?=
 =?us-ascii?Q?70F7vns/J0CM3W70dVLCycvA9HoY2MuE6RGojcLGF6k1owmjAwX+Ui/pyryJ?=
 =?us-ascii?Q?PGEmHl/AAed147boiB7rT1Gbvfpki3Ek8w2Ob+u5qBYE+H26zHnzhD26GzIK?=
 =?us-ascii?Q?FulNfSav+NS1eo7h3QtdK5vXLqJYZTYl2NH/D5d0I8NcqiA79oBnS9CPMHsT?=
 =?us-ascii?Q?AY0o8DqcpE8hIS7otgxPOH9vU8XYnvGQZDHlve5q26TjkSrD1pvq9BJczxR4?=
 =?us-ascii?Q?wVi+pdsaRWuZqejBCZTBohRZ02Xk4o4uVmXTzlYSj3n7dw3moebOAJiNuX6R?=
 =?us-ascii?Q?gdmd/3ugcHbedmDD9M3+A2p/s5pTXgFhgwSI8LlYE61F5+j9FzWo3QuetO0b?=
 =?us-ascii?Q?fIFwKbP3i6zfHAUUfV5lowXw6lQBY7BlbczB6BiMwyIkL1Pgu3q5hAB43b2B?=
 =?us-ascii?Q?oDn0Ok0T05BLAfRGiEOnO9VVF7KHG0LyZVld3Ba7TcAo86sGFAddX+wTxjfu?=
 =?us-ascii?Q?zb0zs4uLx7AcVkuyjtwg6eNotNKjtIrB1qPeBGcxhoBqlAKpuupTb706D7Kp?=
 =?us-ascii?Q?wiuqgZiPedo3/9nUK2gOo2+MMV28aMTTaa8bdwy4H2sVp+OtUw+S3pizi5Y7?=
 =?us-ascii?Q?+UMHrnHAWu8JQJ8basLS7hVJ5aC48ABRooWsXDxVZhGcrRBIq/L0+sBzKE5g?=
 =?us-ascii?Q?dyPx7pxyy+jytOUHF+n7++DWcrbylqUMS/iY499k?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e23b842-4526-40e0-be47-08db60e9e686
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 08:43:11.4228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Svsuh3C1xHWQi6B9QXt8Qf0Mtb9DPoVRHOMvlAAj3BUJ8GJO1joa/t4Y9SoCmxqgnLaLSR6uAEuL78VMmJyqRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5169
X-Proofpoint-ORIG-GUID: d5lN89YuOPmT72zFgjohOgTSOKeUj2dS
X-Proofpoint-GUID: d5lN89YuOPmT72zFgjohOgTSOKeUj2dS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_06,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=471
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305300072
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing
	detach	mailbox for emtrion emSBC-Argon
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

Hello Marek,


ST Restricted

> -----Original Message-----
> From: Linux-stm32 <linux-stm32-bounces@st-md-mailman.stormreply.com>
> On Behalf Of Marek Vasut
> Sent: Thursday, May 18, 2023 3:13 AM
> To: linux-arm-kernel@lists.infradead.org
> Cc: Marek Vasut <marex@denx.de>; devicetree@vger.kernel.org; Conor
> Dooley <conor+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Richard Cochran
> <richardcochran@gmail.com>; Rob Herring <robh+dt@kernel.org>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; linux-stm32@st-md-
> mailman.stormreply.com; kernel@dh-electronics.com
> Subject: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
> mailbox for emtrion emSBC-Argon
> 
> Add missing "detach" mailbox to this board to permit the CPU to inform the
> remote processor on a detach. This signal allows the remote processor
> firmware to stop IPC communication and to reinitialize the resources for a
> re-attach.
> 
> Without this mailbox, detach is not possible and kernel log contains the
> following warning to, so make sure all the STM32MP15xx platform DTs are in
> sync regarding the mailboxes to fix the detach issue and the warning:
> "
> stm32-rproc 10000000.m4: mbox_request_channel_byname() could not
> locate channel named "detach"
> "
> 
> Fixes: 6257dfc1c412 ("ARM: dts: stm32: Add coprocessor detach mbox on
> stm32mp15x-dkx boards")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> index b01470a9a3d53..82061c9186338 100644
> --- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> @@ -366,8 +366,8 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> -	mbox-names = "vq0", "vq1", "shutdown";
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";

Why do you want to add the detach mailbox? 
It looks to me here that you want to clean the warning message, right?

The detach is used in a particular usecase where the main processor
is  shutdown while the coprocessor is still running.
I would prefer to not enable it by default as it need a specific
coprocessor Firmware.

Rather than adding unused optional mailbox, I will more in favor
of having a mbox_request_channel_byname_optional helper or
something similar

Regards
Arnaud 

 

>  	interrupt-parent = <&exti>;
>  	interrupts = <68 1>;
>  	interrupt-names = "wdg";
> --
> 2.39.2
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
