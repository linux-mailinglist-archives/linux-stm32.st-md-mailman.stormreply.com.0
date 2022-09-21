Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF15BF9D9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 10:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85994C62D6D;
	Wed, 21 Sep 2022 08:54:38 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34F45C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 08:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxgxdITpe2AmWH7zGfFIg3SmHxbg6oiZdtFrl5XvtJeuIzvK+eb/t1xyhuY+yDa9oNT9Y95kD7GVeRZrOLboi77LSvAU2PglH/lU+L8lJKR+8J+TjLnQRIm8mfFGr3I/a/e6nbq/hlcv2dMWZjRso4d5ix9tzcnM+Jm1dwkb0vJn7LCwHxKiIR9TQGzDzrJiFhCcRc+Spk0PDFrrCFrGVIMW0mMcig5dBajQ90bJzCVlF3KSTVxu+sKrx08FEvJ+lg1rKYc0wxjvJuEnFCbYep9QDLzO7fIKxC7jlkH7yVSUEVv+vnfCG8/CeAcDXKI4Y7mBUaJdqQJg4S8XPcj42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH/yDjDyjezgHafcm4ewqLj1UnQPZZrODOHneejChvE=;
 b=WbKni7NcWxnPyUzc5x7/Nmi2lQYwL5IPIuuhgvmsrXRpr2ndLCsw1ZJi6uft4woq1i46jPhZw6jNSy1ft6uFcFHvHbErhtZXX9XP8n9Z3wXoO1z13EAour3XbTAY03MD+PHzjAuO3jr3EtBFUGgS5o/wd5hO7FFEEHYiN0zZVY12ozFi8ZJzRy3zURd4L8KnFahoOoiRqvf7aGG7AcPQVPl4yORxrJDLn9dzbjV9tn9mHOwaCBBaiN/Z6QaXndcZlfoH6iQke4af521zMd49Dnkp1zzYW/9cd6KgR3PSYOR3v2gCGpyq3N7/sXwX2SpM/p45yiFeV4UXdIpLwi1E5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH/yDjDyjezgHafcm4ewqLj1UnQPZZrODOHneejChvE=;
 b=dCM7Bn96CV9PRHobDf5hGwjgwu3240beVsMc80V6jYUIFu8/UvxWLBni76gqYefy+UVxlbo0VS9QjAi6RfokKiTxXEwe+mL0mB6jG8g12b6FkZJzVcUChXp1JY7IlpPKBjzTvdRYbHc4V0cfPZNSJA0AErhAUQNyD9chkmHx9hI=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB7185.eurprd04.prod.outlook.com (2603:10a6:208:19d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 08:54:35 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867%5]) with mapi id 15.20.5632.018; Wed, 21 Sep 2022
 08:54:35 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Thread-Topic: [PATCH v8 0/4] remoteproc: restructure the remoteproc VirtIO
 device
Thread-Index: AQHYuUJ7PUmHIPxwNE++nUAZwqhxoq3puwPQ
Date: Wed, 21 Sep 2022 08:54:35 +0000
Message-ID: <DU0PR04MB9417BE00D9CA0185660A4EB9884F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM0PR04MB7185:EE_
x-ms-office365-filtering-correlation-id: 5c110705-f1f6-4b8a-c7b9-08da9baee8ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6b0W0zfi0JHgVCyhUgqu474TBMac3mZWXKmkd1bUYtNp+AEY0mM5ra/cRFBUuo6adrZ3rX4GGJjLuv8pu+FU7eoo5wMyQ6/VoGvZsjqDoO4UKZjDweKnnSCBmZExH4x2Fu2TCu4tnZ7dZ3VktRQEroCvwarbnwhfG0y9A7mJd9wF79as2z6dd2zTMrXCFeb5E4LpNc9HMDLcsdkLVUhEtCbzPqE7HVEZsoIXUga/vKz0mzvXNWulFtpXCr1nxyaoBtz7VAAMlgRu9Xo6BKjx3+TgS2ZaI1kxuoQ8AzJT2nET5rASRMxRu8HW5nVc6LsnK+B1SNet1+81CSfRAGZPHE0evOZn4eKPpZoC0RIQQuaAeLmBpXMVaOrrnSWddBME1mDYtVO9+ExpvhUnMUcuTKFmWYIZpGG5KvAZX7OGWoT+gk9AcceOYFW7qb/Xk8G9R2vyVX1bYt7OomHuiwteTyowbrSUsCS6AFdRfug1qn3iTlQgC6ZhLtyaHTLfNHpP4zk2U2qBQ7PUecKGbYyo5BQROjG/K4Q31b6seacrFOLiWr2ImOZZNQTUl1nmhQYsLnqdIN1QAgkvsmvkaWg/Sda23zX7suWXglJhlO/9BXEr0W1X9x0EkqvoSF7AJVnQwySVMJ+a47lA6uq/fGxN359UUD+B13nbBRxGVSV0S0BCNSbatjQIe4xwTwtMGZeoWaHVaGMVHX9NK0eeidL3qLnrN7syU+UdMWTJsxwAt8lubbvhpwHvrwPUjVux4CxoUAD5cL3m+c0LC5jc5qz/32nGlRglVr+qT5K+ldd2Zkv+KQg16w7DKlOpta7cKj8Mzri3HmXU6HISFDrk6d3JsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(52536014)(478600001)(66446008)(45080400002)(66556008)(54906003)(76116006)(66946007)(110136005)(966005)(8676002)(33656002)(71200400001)(64756008)(4326008)(86362001)(6506007)(7696005)(66476007)(38070700005)(8936002)(41300700001)(26005)(122000001)(316002)(5660300002)(55016003)(38100700002)(83380400001)(7416002)(9686003)(186003)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KFA58m84d0JGwdwJzraZNZiXg3RWVU0rUJOGFonsTXZmXYeZYOTU1DPSWNua?=
 =?us-ascii?Q?BsEtSD3zKjVyJVTqdM1dHXnFuFx2M9pds9DsE8vFcZTmtunbsCwfeTCA3vdJ?=
 =?us-ascii?Q?d+kYEfi6rwl2nc5PYICaWXqoAHv6g8LKrPqwqL/dez+4cH2ov8xcXcHtAGbl?=
 =?us-ascii?Q?DPJDoDhSoXJy5oQhVy9Lm17tUpnK7iDB3a1e9bn75twRzb8kDASykECPEoZ9?=
 =?us-ascii?Q?RkVCvhgUJ42/J8khJmjvGNoS0XIY/F8B3LdY5gtH9654lo/nvLA4QZW6t8Sn?=
 =?us-ascii?Q?w8lz1o1DZn+XpNf9e6wdLgNvfExDvB2DGFgKmQZTbj8Gckd9HmEMaL8+9hJ8?=
 =?us-ascii?Q?BDIcyLu95JlKYTEj0n7zTojW2DlAWU1S/6+vA/CujLk6l0OZywklg4tSftjp?=
 =?us-ascii?Q?pnx8HF42Af7UbiZL3Nr6m77TM3Zj1YZFfxAOjP1gMKtuKjQPr3oIOKhO8phR?=
 =?us-ascii?Q?RYCdUYTS3WaQShbkc3Ooor99HMyB3rpBe4vuPds1EXjVMLJR7K0VQaFGjhpZ?=
 =?us-ascii?Q?BQXBkoZZoUx1CUzjRrfK6SATkOGPO++yUTm01IEG3AhSioFWHxD2FEtJfuLc?=
 =?us-ascii?Q?BMxQPRdEJTFwoaMCi0H24WD3fCLIEp6cFN2kkdv/AwomVzQ2x0wolc5CChA8?=
 =?us-ascii?Q?TKDn9zqKuSIygnujr1XQCiIlkvveViD/49yQtyRlofhzZtxgMNqVS5EIFdvK?=
 =?us-ascii?Q?HTqxGua2cqrwEz7qZJctjsWcLh4SJQk234n/wrq37Q8w2GRUW+gVX0EzhFdc?=
 =?us-ascii?Q?SyvCCT3XVIfVLXNvUBXp+lQqdUdk7vT1rHlxNwf2oJZb+vgWftO6YazKdEA3?=
 =?us-ascii?Q?nYyXhgJq/jW1IzMIHazRtVuiFhteM3CKWg0K/05JG2AOTjupF9d9R7Dsw5Bo?=
 =?us-ascii?Q?jN+oxqKLrm1c74pa4Po6evx0DyUBeyxOK/izAdQY0BKe4WpcUyLNuCXsSs8B?=
 =?us-ascii?Q?FZKBFTKkAG4Bq6qnP9xo2+iU9L//eYptP/j3v2bbuJ1E9q4NOqrH8HMqPc2q?=
 =?us-ascii?Q?Lk5cr8qBEUYetX41LWBtez/7lWMKo1iuJ56hpbslkvbh7fAxoQoGH/2RT6L6?=
 =?us-ascii?Q?dK7x2SljIVOgtao9/1bE0zv6SlDP5Y7kgQ4fxPxcMRTAKPRag0iQN6vGDQcy?=
 =?us-ascii?Q?58bIJ5jjJQ9Hd6RLRfOcdcpRTGqS7yk6zuaV7kmPjcUSgOAaynuhdcepYdRu?=
 =?us-ascii?Q?tmnUYaY8c6EEakXJexFvtNKPCcP9rjT+rTgdJI2eWqAXihAuhrW4l2BTZ98K?=
 =?us-ascii?Q?+8rYguxD3WRl/dfwOtaJoLLOuuiTrdDC72XwdU7Wn15FV7tWv3bpzi4AMj5I?=
 =?us-ascii?Q?2RYvHHD5DY0jYYSNIBJnF7RA9bGD2Qc5droffnfVUVrzE5jznoIBUc2iOPSo?=
 =?us-ascii?Q?J0xqvDWFwZSDgEOFx3Q6FS/GmGTbUxg/pg+JTNGkiSsti7o0Uhbj+uMzs3co?=
 =?us-ascii?Q?P/LuOArtaRjYNR7lwX+xdgX5wITBkqmLpnfennXXsYIea0MnHXMTLaVvwA0U?=
 =?us-ascii?Q?6y/WlTE6pdJRYzuBjjz6uAFwAX9lgpMpQ7Gd+kVtJ+FyPuJdxG5Z2gJV0CgC?=
 =?us-ascii?Q?2NGLzYpFHN/GUIyZTjw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c110705-f1f6-4b8a-c7b9-08da9baee8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 08:54:35.7203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ifj2czsApxPTZBSRzIiBa3K9d8uOYCmFMJZTKGfs0c8CrlqO2DIf7FWqMh2m4J/K1xuhEPhiAyeYpMz7A2Ng0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7185
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [PATCH v8 0/4] remoteproc: restructure the
 remoteproc VirtIO device
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

Hi Arnaud,

> Subject: [PATCH v8 0/4] remoteproc: restructure the remoteproc VirtIO
> device

Sorry to get in at this late time, just try to catch up.
Not reviewing comments, just have a question,
Does remote core firmware requires changes to use this new feature?
Does your 4 branches listed below still work with linux-6.x?
Could the multiple vdev still share same mbox channel?

I not own i.MX remote core firmware development, so if no need
firmware change, I would like give a try and see how it works.

Thanks,
Peng.

> 
> 1) Update from V7 [1]:
> 
> - rebase on rproc-next branch [2], commit 729c16326b7f ("remoteproc:
> imx_dsp_rproc: fix argument 2 of rproc_mem_entry_init")
>   The updates take into account the integration of the
>   commit 1404acbb7f68 ("remoteproc: Fix dma_mem leak after
> rproc_shutdown")
> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> according
> to reviews on V7
> 
> 
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.
> org%2Flkml%2F2022%2F7%2F13%2F663&amp;data=05%7C01%7Cpeng.fan%
> 40nxp.com%7Ce0e5200d739a48e7439508da87599d14%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C637971116202643149%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=77pEuwAI7Lh61hx1%2B
> Hs79Cu0G5KOa6mzQ0PnTC5r8Xk%3D&amp;reserved=0
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.ke
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fremoteproc%2Flinux.g
> it%2Flog%2F%3Fh%3Dfor-
> next&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Ce0e5200d739a48e7
> 439508da87599d14%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C637971116202643149%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> C%7C&amp;sdata=iWUSzKkN9BpHwqbO62awIcyVf9PXcftcdt2kytWVR78%3D
> &amp;reserved=0
> 
> 2) Patchset description:
> 
> This series is a part of the work initiated a long time ago in the series
> "remoteproc: Decorelate virtio from core"[3]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT
>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.
> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing
> [4][5]
> 
> [3]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.
> org%2Flkml%2F2020%2F4%2F16%2F1817&amp;data=05%7C01%7Cpeng.fan
> %40nxp.com%7Ce0e5200d739a48e7439508da87599d14%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C637971116202643149%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw
> iLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=oPWSfUweLdhUFK5X9
> 2YcGHem8s%2Bfelcr%2FHx9JAlKG%2BI%3D&amp;reserved=0
> [4]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.
> org%2Flkml%2F2021%2F6%2F23%2F607&amp;data=05%7C01%7Cpeng.fan%
> 40nxp.com%7Ce0e5200d739a48e7439508da87599d14%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C637971116202643149%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=HPpnlaykes8R1Kz1dEN
> nirEHkDNr7JvRs%2FcsaDPuLdI%3D&amp;reserved=0
> [5]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> hwork.kernel.org%2Fproject%2Flinux-
> remoteproc%2Fpatch%2FAOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E
> %40cp7-web-
> 042.plabs.ch%2F&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Ce0e520
> 0d739a48e7439508da87599d14%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0%7C637971116202643149%7CUnknown%7CTWFpbGZsb3d8eyJWIj
> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 3000%7C%7C%7C&amp;sdata=GtNruefDreOoogL%2BlntAC7GBfk6E1Goq4j%
> 2BYXt36RdI%3D&amp;reserved=0
> 
> In term of device tree this would result in such hierarchy (stm32mp1
> example with 2 virtio RPMSG):
> 
> 	m4_rproc: m4@10000000 {
> 		compatible = "st,stm32mp1-m4";
> 		reg = <0x10000000 0x40000>,
> 		      <0x30000000 0x40000>,
> 		      <0x38000000 0x10000>;
>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>         mboxes = <&ipcc 2>, <&ipcc 3>;
>         mbox-names = "shutdown", "detach";
>         status = "okay";
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         vdev@0 {
> 		compatible = "rproc-virtio";
> 		reg = <0>;
> 		virtio,id = <7>;  /* RPMSG */
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>,
> <&vdev0buffer>;
> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> 
>         vdev@1 {
> 		compatible = "rproc-virtio";
> 		reg = <1>;
> 		virtio,id = <7>;  /*RPMSG */
> 		memory-region = <&vdev1vring0>, <&vdev1vring1>,
> <&vdev1buffer>;
> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> };
> 
> I have divided the work in 4 steps to simplify the review, This series
> implements only the step 1:
> step 1: Redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not
> use VirtIO IPC.
> step 2: Add possibility to declare and probe a VirtIO sub node
>   - VirtIO bindings declaration,
>   - multi DT VirtIO devices support,
>   - introduction of a remote proc virtio bind device mechanism , =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithu
> b.com%2Farnopo%2Flinux%2Fcommits%2Fstep2-virtio-in-
> DT&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Ce0e5200d739a48e74
> 39508da87599d14%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> 637971116202643149%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> %7C&amp;sdata=XtF%2FQnml3QXFL7rgqST1Z2FotUzoj%2FD57WfiuAVMnr8
> %3D&amp;reserved=0
> step 3: Add memory declaration in VirtIO subnode =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithu
> b.com%2Farnopo%2Flinux%2Fcommits%2Fstep3-virtio-
> memories&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Ce0e5200d739
> a48e7439508da87599d14%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C637971116202643149%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
> 7C%7C%7C&amp;sdata=6gq28c6a1TJ%2FdkvokcEjgy6FKQcKTXSz%2BNAbJPo
> mjac%3D&amp;reserved=0
> step 4: Add mailbox declaration in VirtIO subnode =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithu
> b.com%2Farnopo%2Flinux%2Fcommits%2Fstep4-virtio-
> mailboxes&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Ce0e5200d739
> a48e7439508da87599d14%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C637971116202643149%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
> 7C%7C%7C&amp;sdata=wfy2euuOPoMmBMIH3BOsGcsEYGSTWsDaRr7ENN
> QCK70%3D&amp;reserved=0
> 
> Arnaud Pouliquen (4):
>   remoteproc: core: Introduce rproc_rvdev_add_device function
>   remoteproc: core: Introduce rproc_add_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 189 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 210 insertions(+), 162 deletions(-)
> 
> --
> 2.24.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
