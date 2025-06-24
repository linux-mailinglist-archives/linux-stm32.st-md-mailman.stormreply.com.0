Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4723AE6F32
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jun 2025 21:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D43DC32E8E;
	Tue, 24 Jun 2025 19:09:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44184C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jun 2025 19:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn+MKNSAuYh0IgjGls0GtW66iRPYV4P/D3Ni0SPKKLdCCCJx3Vm9QXB2AOKgRloEwfZed2Gj+NrpGXNuh4gMwebrACK7ETN1HraBG/RPcRdIjD/yWJmzEUu8Y2KLx6xFA21ViAZs/jvCcv7TTCIrpa5mU9TtspsflT9at33lMDkxDZtI/8oDnMZzww4JtNMLdDjHizzEMZ13ibN+9bggmr4bFvxoyB3fRY7dAADsFvB6b0SxNDG7twiizOaPWQxKw+W8lG5gBjCKVLmfRuDHjOSo/nmH+RWdX+nlZ2uc0NjuDrHOc8t03avvFAOOSpLb8rqEQpZ00Nez3ZP34s6meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlIx5AmdqlBIc+sRJz0Oj4zxfA1ww5cl2SOphLxbOfc=;
 b=LlS/mkVKPzFSAegkxekzqX2x22SErdnklkfmDb1dMW6Ac20aMWiAZOE3ivjcejOXVdqaTAJs5LYaD2vqylcI5mymOW12G1N+goajaCkhRGiqyQCi9Yrmfq+15LN7LqaW5gK6Wzh4lHcGX5H6nqpewOnUTUAL4IghyUDmbZEuiCDl65S3U1euSXRyruLEUJqnErj/SIiojemNoaTtcygXGJ3ywH345E2OEau9DziKjPqiTwnCpT4DFnOqKvaZpAMc46RxQXw1EqLm0vFfipft+vIoE57u6ew+OOl4ef0dhIvAwKghAijru63tsgs7QObqMh8xocMzomrsfe2UKenUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlIx5AmdqlBIc+sRJz0Oj4zxfA1ww5cl2SOphLxbOfc=;
 b=SP6g4Abvl4ak2DobeFh6hE58hreKrR2eKqXVDAmrE35PkDxVmsSN1wsIUZdEGEhpBLOAJhMLNgm1JQv3NxIyNiIzIxXiZwKnYf/RJMkD0SHhkR+vnZgOO1eMSFuFcqcqZoCC/Koy9rsG7CIksTu14diOiSKLmiEE37167ug4lgeBTsiJO5B+AZsxl4X+X+nf5/dmv/vmpNmDWdqlC7Jdmeb7kuUqk+t9ZRz7qMeMeQJocH6uwHjb63d2Uo47DNGJRNfFtcyyy9aN1dOCxbt32g+NDxyB3j18wkWUGJbNo2CnUI58Y2dT7Mb4j8lsyyjb3WWsXasy73veSUakQhFMYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 19:09:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:09:04 +0000
Date: Tue, 24 Jun 2025 15:08:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <aFr3yExb6vObn5W4@lizhi-Precision-Tower-5810>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
 <20250623095732.2139853-3-joy.zou@nxp.com>
 <urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26>
 <aFq7WJ3Fqe9p0EhA@lizhi-Precision-Tower-5810>
 <e32c3a47-e32e-4f93-becb-ebad31065b73@kernel.org>
Content-Disposition: inline
In-Reply-To: <e32c3a47-e32e-4f93-becb-ebad31065b73@kernel.org>
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 84963957-1526-4203-ab00-08ddb35295dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?167X0bXzVt4ZJmq69i/ncG8p7uE5Lmw/iT4zXBxFn/4f9ej6kpAHSaqrIww0?=
 =?us-ascii?Q?Pe6b/vONNmHNw26ZDyayCGvwQqK6VX6qmrkVh7JebQZsBe5Cv+Jp0esttBbz?=
 =?us-ascii?Q?IvRYqu2/GPbws56ThG6za4rHs0r3ayD50vpkmOJaRvjXnRVUz+BR4iTMiGeQ?=
 =?us-ascii?Q?vFXn3o5cUnaJsagiR9FqPER8iW6RZHh25ueZ5mvnWtLAXNIKEO6ctCJgKbdx?=
 =?us-ascii?Q?DawVuSa/vMRWrumq9GHfOCoLA/iMvIDSEMt21Gd/EEdUSDa0KdLi44bHTOjV?=
 =?us-ascii?Q?2TGnS/uSFv/riQ0pn1jiGT5qNkHnmLg3Wlr3ygC3vBHgT9ezlTZSyO1fNi5R?=
 =?us-ascii?Q?jxrgDVCIIQbb0mtrJgrh62I6h9wmMkROHtQ/c1m1drgv5l19EgRfbOI1vSA8?=
 =?us-ascii?Q?KkOLG5ommZc07qtxpnBTmFr5EP9w/I6gKWR6lfHMtH5yp0hn/Sb5kJ1Fz/wt?=
 =?us-ascii?Q?makw+AajMh2AKLREKbdLvzCCKJyuZp5whWJKrYlFv8tKbSW//2a7L7fw7/Bb?=
 =?us-ascii?Q?+G4pXxXaFFwEmf9ctpiHEFmq7OufvDPio4tuwmCoCG4ReeZ23rRQtS1XAbRD?=
 =?us-ascii?Q?bf4ED3H6WE9P6IP9dEvhWPFGbNkSfRVDvk3m/OVD44jG3vMlHImra8FBANA7?=
 =?us-ascii?Q?Oh2Dmg0ga7o7SU5F1qkALE3pGZZynkkZjNLuhmHQ+p28MmfcNKLvbA7WljXK?=
 =?us-ascii?Q?SWIP3oGKFoqrRVTJIIdbFThOM1BUL1P60bS1mNGiIQBv0GWjuuazqCKxIMkx?=
 =?us-ascii?Q?JaoP9TZKlXzvBw4TFmqDmrD59CH8LX04Nv2jtv6YRbpz6ChrGBMQwKSJJvQM?=
 =?us-ascii?Q?W5m8ZQ4TVIaMvdKLTt/enOvZhIC0SZ+H4mr75liK9ejzdx82c/FgUjE1gvXi?=
 =?us-ascii?Q?zyEro25TmdU75PQhGRbPN3pSoUX3fHrWxt5AWdN0on7UL/yT9IB50Ujy1zbp?=
 =?us-ascii?Q?v0/92Vfn0j1hFcNOBiCuLPYkXj4CYkMryDNW/bVyWg1B180EDOUF5aKCtduk?=
 =?us-ascii?Q?8TMTOKjGku8Wg3WavrDf8dnX0Ka8yfbYC1T4xvCp3Lqqp3byD9QjgtMGHZTo?=
 =?us-ascii?Q?PLBEh3BAugPtk44FEfhul/j+m+hFBDfaijApZgCJOCI7g65xxoU5mYiPe2t4?=
 =?us-ascii?Q?Dj8lY57KKqo8vQDYxkjc4XUt0QsX6e84383CkCgpgTLDQEFo2oh1yXhiFsnq?=
 =?us-ascii?Q?1g4kNIZE/LFFlWS6zfgRGdfXgXcmwu4zlnwnwVY5blLgh82ejJCNmevw6kzf?=
 =?us-ascii?Q?wM9BVvXJrx1phSL9hTqTyK2iiMBr8dx0/Hdjz+fcQla/GSLjsQR0cfoYeuJF?=
 =?us-ascii?Q?b1Q9dTA28BTI6pN8Exj+8TJsHqXFwZ0nVL0/K1dcDgZyu98ZjUnpbYpj5D4y?=
 =?us-ascii?Q?dXRKwZnpy9ljbR2Zev0IaWppA0YLJYxy7xMTySQC2wY2obv8kLOezC7s84CE?=
 =?us-ascii?Q?AfkixK2m2ZKcm3mAX5tM5MwUY+b40iHiSxdY8YjqNyqMbSH5tNVgOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kp8LdZDOFa14F9BYoVItbT5y4J7iBuwgqF4VdAW2zQolLYTpdOGNGmbvDWEn?=
 =?us-ascii?Q?hQd1vaJT5RRnuBO8oBVLl4LWOA+6gt35Jm0RD9x/2SMk5WyLC6vWt6UP/LJh?=
 =?us-ascii?Q?gxznUhIolf5v2px8bQK5cpJ1l4JVWvb6CxMgAQpdexgMRkRlmnhJLqP3LLRR?=
 =?us-ascii?Q?q1S7pDVtn9/1XvSh/bAgUZOuaSdnjenv/JVJxeY6hRHm/B0BwcvZbx1jLmuC?=
 =?us-ascii?Q?awXuc6ZmPnreCp340t2OzFNeFIt/vkR5ZlTfMhspqvpmR/+Y7Bz5JfVOM+x8?=
 =?us-ascii?Q?ndCuVYlguAmkhVRyqjJyIoJlqAF76q/HFLsjmgyTKoRLihmEtJkLiZ4vvEJj?=
 =?us-ascii?Q?ULRVPu2xP4Bs7DnzK+HbeBv6NmRxy38IRq7E0F6YqIRiFASibm70+C9s24rO?=
 =?us-ascii?Q?pwNFPt3C0eUyljztDeEUpfM96Nf4Rt0LmxALSLncw61Vnka+Ckco80M9YJp7?=
 =?us-ascii?Q?o1kUtC8iyvM9TvTglMnkOT/BgyHeStt5zpYq/d0MCkJL5QMk0enXhOkExl5e?=
 =?us-ascii?Q?dR1dJ7tMZkaSHA3ixM6e8Tz0WTv8pDYaT917iyo+IHpe6+oKXptPxqN9Cz8Z?=
 =?us-ascii?Q?1ASB3QU3FRwUNZuEOBWuEgAK2MAEMs5izD/Xz+qJLIHlk/mLw2BQXpxJUn1m?=
 =?us-ascii?Q?5+ipQYJE5Ql+c8XoXZmhUDTVS+IQZ0YSEQ0HcDH6AELOnWz4uvCfmwsUGu+y?=
 =?us-ascii?Q?+bWUtjgLXRrwAoI6+W+GMCUEanwDC7CdEzMf5oYraoScEHXMXzYQla9zfhc+?=
 =?us-ascii?Q?wIR2rn4BTLZ3rDd44mxnSoo7dXVbN6ESYeKYcWetHvXwr1DkF0r2I2nSRFcR?=
 =?us-ascii?Q?Opfzo6MyjNrJdtrt1FMjDoOmMfT0pBiIhc2Bl2151kVNZJ5B5cpOalphUUAF?=
 =?us-ascii?Q?m1EWDEwMNptCcFdike6U61RTrZRx2g7Q6Su+0G8TDXZukh7nQkVtkU/2rMUq?=
 =?us-ascii?Q?XQnwS4sz8BLM8ABkVwnnktp1v8S2blRL0IovOmv/vsiroWfk1ob62R3gEYYL?=
 =?us-ascii?Q?RFFz25Y7tuGmBvUrjleWEeSUsLp00SZFICujtnDco//t6KCXirSXY0wPQFCi?=
 =?us-ascii?Q?Tpd1VvGIiSz/b5BsFrGuePXayGKHa8oPdBRvld8EFnKEMjQlEK4HH1Md9/aV?=
 =?us-ascii?Q?rgSARZYJwb3phhY2L4+8o2kbtWCn8eb8v7hrg5jZPuCxW1VdM1XgttLXxkgm?=
 =?us-ascii?Q?G7CsK8yFMUdyOn3KNzDvOprePr27Ba2TVNFJUVlwpyfsURVd04GnUYcWkgnD?=
 =?us-ascii?Q?NdfVxp3DMY2InMazm4ukkOefaee+TBBcI5v3KCeVNgtZP6vl1ySmLCjTXmsf?=
 =?us-ascii?Q?qJYqpJu77E+PwpGzVqrWWsQQFY8DyzsUioV4+CFC9NGqNbWEe10RlhLzg0xy?=
 =?us-ascii?Q?xC25dgMdqQTGoIlKmqb+M2XVnWT4yUnrMQoEJU0QzUBaTEY0Jua/9X4y+KVU?=
 =?us-ascii?Q?iPEXww1Cg+/y6fGDi92wyXIIw3aBejCRKyAptTN4i1/MVUSTsyeF2yxU+NgJ?=
 =?us-ascii?Q?GqqGynf0ePVNFVdSSogpkBekyotoJJpyX2/QXtWs0/eOlR3+1S4++3c+E9+e?=
 =?us-ascii?Q?ans/JaTp1CHP59AjsubF3Nx6ReIysmzNLKeDV4EY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84963957-1526-4203-ab00-08ddb35295dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:09:04.1598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS7zHoy7A9UA1z8dUWMNHwbvYgWDi1FDG40lBEvhDuNaGdiDrbFEEQYVRoy9XQJpdNlPXYnscga34dAFp/MHPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, will@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 Joy Zou <joy.zou@nxp.com>, devicetree@vger.kernel.org, conor+dt@kernel.org,
 ye.li@nxp.com, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux-pm@vger.kernel.or
Subject: Re: [Linux-stm32] [PATCH v6 2/9] dt-bindings: soc: imx-blk-ctrl:
 add i.MX91 blk-ctrl compatible
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

On Tue, Jun 24, 2025 at 05:39:43PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2025 16:51, Frank Li wrote:
> >>
> >> Why imx91 now has 10 clocks?
> >>
> >> v6 and this has basic issues. The quality of NXP patches decreases :/
> >>
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: apb
> >>> +            - const: axi
> >>> +            - const: nic
> >>> +            - const: disp
> >>> +            - const: cam
> >>> +            - const: lcdif
> >>> +            - const: isi
> >>> +            - const: csi
> >>
> >> No, look at other bindings how they share clock lists.
> >
> > Sorry, this method is what I suggested. becuase there are pxp between cam
> > and lcdif, can't use simple minItems/maxItems to limit list.
>
> The point is to put new items, so pxp, at the end.

There are already a list for imx93. If change list order, it will break
ABI. This was rejected at other binding doc review.

Frank

>
> >
> > If put two lists at top, clock-names list have to dupliate at both top and
> > if-else branch.
> >
> > If there are better solution, please point me which file have good method
> > to share two totally difference list.
> >
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
