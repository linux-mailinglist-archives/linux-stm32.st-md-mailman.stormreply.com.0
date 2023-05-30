Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AA715909
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 10:51:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61F3AC6A616;
	Tue, 30 May 2023 08:51:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC091C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:51:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U8Ri5T011756; Tue, 30 May 2023 10:51:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6flDvi1Y0AFB+cZpdp7NI+0XBDXPqCyHeu7Ns3rPiPg=;
 b=LSxzmniU34hvChe688KfAwgBIlo9Kct20XfTV0Vuubw99dx2ayX26rpUNnDaUKoqXoFz
 p1QYyYU508ssfC7ZaQoy6n6VjB7rIo4JUmej8Vhfqxl8FLlrG6Vztmg6lEH9Hswq1lMh
 0ATfert86dX791K7SuAmWTI8/huex8IEzwk5300o9NsP1bpb3X8BMXN4NqFSlSkFhLsG
 9aTWbCYoGkhl7e2epLJkfZ7Y5Byxx79tCYOBKHwpjg7N6ufIvk188DQ+LzSJYNT+ie41
 0MoaPwLVK2GaLKvCDsh0w33gN8QnSWy63MTRSEOfxDTWpCEc+OjT7hHPk7XG0EaFA11h xQ== 
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnp0v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 10:51:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9vo/URYcAtD4vOT0zaqzbeiuyc7CxzhiKhIdPET5OVcayOaCrN1tLcIX2VUCsLzDQCzSZYGAaaY+mw8/hZFW7h7Nrf510FU5I5gGbtZhJY/nE0rTSQ5RBZwq9ZjW8jUtLWrqs3pS/RfMYux2H/6HagJu8izOeVAYlTiXcA4tISPSguknIG+npY1Ymrzt+B4vldv0Sxg0TixW79XazTorSiBdaFa94gR6tIZO3lamnV9IDLDkcAttYQbd2FeKBjEpihYZ3CBI4F7f3orO2VT+2NMKOGpCTFXX0LJQR9N0+O0WlxTyDSG7+yX0eFDcBrM7ycb+JjSQEW/x012JvxWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6flDvi1Y0AFB+cZpdp7NI+0XBDXPqCyHeu7Ns3rPiPg=;
 b=oR0VQfT4OgrNashQRJ6Su7KSJ3OCoMn0ZiIyA/m4osMoIdqCFn2w8I8BxuCVBaFdirhBlodrFAGD5bl8i3AECVXwC6WKR60YZKPelgbG8Khzf2H9zKzFwyP46FUNslQ1B63dNX/OMzFyIWitY10jFgcln5/IhIV15jTvimEWKaBuwi8tMcT2urE5t89gBUJSWNxFV/fGT18zV9j3mmi4yz2vAdNVfFkOiFz8nfRVKvnNFUG/HeJssoEBpmpNA5iIjKSbBKH2WlbJ7eb2VXBMo2RdhOPw5clToBS81F9mAF/sH/nSkp2LBQymolN9LusYv3gPxcPZO7maxkd4nPC2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:158::12)
 by VI1PR10MB3568.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:51:02 +0000
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb]) by PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:51:02 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: Deduplicate rproc
 mboxes	and IRQs
Thread-Index: AQHZiSXwQLNObuUSr06H+VgqzIHePK9yk6WA
Date: Tue, 30 May 2023 08:51:02 +0000
Message-ID: <PAXPR10MB471830FF1FAC9498BC4CAB69F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
References: <20230518011246.438097-1-marex@denx.de>
 <20230518011246.438097-5-marex@denx.de>
In-Reply-To: <20230518011246.438097-5-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-05-30T08:51:00Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=25d30357-18dc-435a-8a5e-467f68493c35;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4718:EE_|VI1PR10MB3568:EE_
x-ms-office365-filtering-correlation-id: 0dfde4e7-0d89-49b2-dfbd-08db60eaff63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ieMKY82hMvl4bsOM+w24Ujw0oPKkzPKy45rvcmRNj1smm0VvpwkVJh6yKwcNEJuaqqnyAsgYvrl93or0wBxJ0XViOKVmqsanrgNregHtrQh2RvD6rXkLJvrVmCdUFgKepyhTmMnziGy0PygC7FbMr3wvdck2NGhPQcXU+WrUmyP4I/hsed+/cfNBcvZ9Cv4enrpY3HXOeAUhVKtNMHV6rfPx5SMT14xDGlFGIJ0Fp44nnLC026dUDYc4Z3h46ccVWdbCySmA/vSp/fpyzCeJVqJVETULC87Wf9kH6GVlEn70Y/v5URr/MnA2K6myo8KzsO9FhhzcQG2jTyBR8mx93sIiBfW2F4NkOcQRh+pn+zhBD02Z3ojiOu+WKevQ8Py73bnwzGSLfiSNIpRWD3yEyzgTmyzonOrYdEULZ/K5U18LAISzb/JOGRplXHmavMOdCqhkyRtmqHMvAu7GLkci9hlOdwyO9kddiJFYXRzX+UqIZjoR0DKxwVAS0deR+8jP1O9v8flwhj7nxi97VFyEk2MQVwnBLv+gW95BU9tXTr/NZzxOK2NdT2L0eKzIhLM3jvMXEOqdttsEU3WCvkvxWXydLWpSz7x6oWY0fRBtDLE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(966005)(186003)(38100700002)(41300700001)(83380400001)(9686003)(53546011)(55236004)(6506007)(26005)(7696005)(478600001)(110136005)(54906003)(71200400001)(4326008)(64756008)(66446008)(76116006)(66946007)(66476007)(66556008)(122000001)(55016003)(316002)(52536014)(5660300002)(8936002)(7416002)(2906002)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4YvY0uax+ga9otsiLl/HsVMyHoerS58OOgP/vymk4IrqtvhdEvYbDAjVajtc?=
 =?us-ascii?Q?d4P+FbhfhcBvRy/WOsIc6maYZi5cBIV3UYPBxIGYkB1omb5O9FXHVCyOhN/1?=
 =?us-ascii?Q?kw33rtf/syScYb9YQw5JBWY+KAUWbcnOU0WZZlcyaHPnQJdhZCa+0VHnfjB2?=
 =?us-ascii?Q?K4PJTKPvBOr95Her8ybKUTC/AvKdTMX+x8mtPiJTmMbjjFO6VNtomRfLGJhp?=
 =?us-ascii?Q?n8k3QkQAzMZU/aCo37mbE9rhPFS+VD440M7Kcxx1bbgLW21FNlBsPH4gPCQM?=
 =?us-ascii?Q?TrBqjwmVrLYArx+3zEKarQl21rlivo9oYijOXTG+kYCfangvWcLP+VMq1Q+4?=
 =?us-ascii?Q?ohIfBlyBcFukKrCI62kylPzEZhQgHhgnq803bEnslovla3Vbck6c7mpbG/Nb?=
 =?us-ascii?Q?0r2aDNjXxoulMkS0qieNcLEuxNmdAcVwwQArbVNHG1Wnv7nRqcjttEEAw86C?=
 =?us-ascii?Q?K1lZhOMqNj8fffzySgQCsKhw0CSpiU8GDgz0NlbuT6+xik1MQIE3qtXRs7og?=
 =?us-ascii?Q?JI/1BUm6tckC935ZVL035MtajMr8jQkPgdpOue5+nL+m369xOOVHz1mQuSmU?=
 =?us-ascii?Q?Qu1ppuM70I7Kxpehu9LwCKcXmO9F25dBIMAalKugeO5bLa3O5o6GZ2mWwNT6?=
 =?us-ascii?Q?0FPxk9nxQLvC7zExoc1Ovq0pWsbvpmQzgTyZlVStz2+xzBMhECaxub8YIUkE?=
 =?us-ascii?Q?fa9jU5ceDwrgR0Sk4S4orFJVNJSOpJjV+IU+xqB0rO9NwVuf6jHFywgOUOnO?=
 =?us-ascii?Q?ZJoqC8RnyqszNAM9nEMusH9yh0sDNMvLvRnGg4ILDHy/lC+2Lf4fSE4+HFpW?=
 =?us-ascii?Q?jwfEn7K/tFQxfS9sSpOZTkvrcK6yZbqG7Mjz4jTg1N+ToOuZz91iS5N8gVdk?=
 =?us-ascii?Q?Gc/NzZPAsU1NssFYkpia78dPrys0h/MdQow6Z7RLgo6xjw6Jzw+aiwnVHYnP?=
 =?us-ascii?Q?rpsRiNxwTFOnzY0JAtJY+8vdw0uRLbX/3ow3GShy2wOc2rQ++MPpJPIUJT08?=
 =?us-ascii?Q?TJ0KIY0O5385qSPkCnSqdD2H7IAOATI8s8rpXgbqKndjJm7ndQFioIb8+obv?=
 =?us-ascii?Q?IriQd22tVuDFDbHdGYTBA+eZu2Bbrwh9gXER2st+1gpalYHuQRpVbPhofBel?=
 =?us-ascii?Q?3e+mGA00QqX1exIOmN1VGJ0N3lhEiOlt/GzXDjPdfMZdGJE7C089jgqehAqN?=
 =?us-ascii?Q?6IITaIZZc7xLQkccrE21q8EdzvsdmXFlqta5IocVzWLwkO3wBZpvtFNw4oTq?=
 =?us-ascii?Q?N1CMW3HJ2O9+fXexWR92BIX2dfXBln91Y11PIaOycexjs4akUWp1VrKqEH+l?=
 =?us-ascii?Q?pq8JXu4cmrgvpBmJDLl7p3B8BDRu/JWAqWyN0fQowqP1muwGtfAeRhaHpXl/?=
 =?us-ascii?Q?y9i8QyjBJkVVB0OvEIT0RxR122WlL3KgNKTQG9bw01bWhwZ1okiUpzuoMZhP?=
 =?us-ascii?Q?ZC56viYlH0K6Mw4REQaEPhe4frosRSg5V9jvj36ygJumRtJrsc+g8mrIVZt3?=
 =?us-ascii?Q?5rGONtdA/nDEB+2jrVXiedsYGUYsYfjRbNl0gAo/jj4+1ZfskC8GPoCoWnt6?=
 =?us-ascii?Q?c+cDiC3dVf94u8qkNzrR8eLKXb/yt6hpMlaklS5z?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfde4e7-0d89-49b2-dfbd-08db60eaff63
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 08:51:02.6072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWRZoi7MeJImluGRYomAyiMdpyAb4YXieiEwF/fSVNrLecO6EBB64xswHVtmTLssuDjd6SHLVfcpJwKbCb/sVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3568
X-Proofpoint-GUID: qxL3MsOyt4oYShQS3Vw9muJzEe_QzIXn
X-Proofpoint-ORIG-GUID: qxL3MsOyt4oYShQS3Vw9muJzEe_QzIXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_06,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=739
 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300073
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: Deduplicate rproc
 mboxes	and IRQs
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
> Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: Deduplicate rproc
> mboxes and IRQs
> 
> Pull mboxes, mbox-names, interrupt-parent, interrupts properties of the
> m4_rproc into stm32mp151.dtsi to deduplicate multiple copies of the same
> in multiple board files. Worse, those copies were starting to get out of sync,
> so this should prevent any such issues in the future.


Theses declarations depend on the coprocessor firmware more than the board itself.
All are optional:
- The IRQ is used for the Coprocessor Watchdog
- The mailboxes for the RPMsg communication and a graceful shutdown of the
coprocessor

So, except for the "detach" mailbox this proposal seems reasonable to me.

Thanks,
Arnaud


> 
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
>  arch/arm/boot/dts/stm32mp151.dtsi                        | 4 ++++
>  arch/arm/boot/dts/stm32mp157c-ed1.dts                    | 4 ----
>  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi         | 4 ----
>  arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi           | 4 ----
>  arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi | 4 ----
>  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi             | 4 ----
>  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi             | 4 ----
>  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                   | 4 ----
>  arch/arm/boot/dts/stm32mp15xx-osd32.dtsi                 | 4 ----
>  9 files changed, 4 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
> b/arch/arm/boot/dts/stm32mp151.dtsi
> index accbeef4df6da..97d54bf0dcc30 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1824,6 +1824,10 @@ m4_rproc: m4@10000000 {
>  			reg = <0x10000000 0x40000>,
>  			      <0x30000000 0x40000>,
>  			      <0x38000000 0x10000>;
> +			interrupt-parent = <&exti>;
> +			interrupts = <68 IRQ_TYPE_EDGE_RISING>;
> +			mbox-names = "vq0", "vq1", "shutdown", "detach";
> +			mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc
> 3>;
>  			resets = <&rcc MCU_R>;
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>  			st,syscfg-tz = <&rcc 0x000 0x1>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index 8beb901be5065..3b40c2d8c3d9e 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -304,10 +304,6 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> index 82061c9186338..a5c86bba46aea 100644
> --- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> @@ -366,10 +366,6 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	interrupt-names = "wdg";
>  	recovery;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> index cf74852514906..31d7bfe8bf8c9 100644
> --- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> @@ -230,10 +230,6 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> index 4e8b2d2b30c7a..f68aaf6aa9fb5 100644
> --- a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> @@ -405,10 +405,6 @@ &m_can2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 7bf13183437c5..a38009f8456b8 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -414,10 +414,6 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index f0351f599a508..8c30cecacaf86 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -227,10 +227,6 @@ &iwdg2 {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 0f1110e42c939..cc3eb755663fd 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -467,10 +467,6 @@ ltdc_ep0_out: endpoint@0 {  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> index a43965c86fe8b..6532726502c32 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> @@ -210,10 +210,6 @@ &ipcc {
>  &m4_rproc {
>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
>  			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> -	mbox-names = "vq0", "vq1", "shutdown", "detach";
> -	interrupt-parent = <&exti>;
> -	interrupts = <68 1>;
>  	status = "okay";
>  };
> 
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
