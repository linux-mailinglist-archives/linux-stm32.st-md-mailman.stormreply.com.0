Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D193550F38A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 10:19:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8945EC60466;
	Tue, 26 Apr 2022 08:19:40 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D40C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 08:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG/94gGsU49fSNeow45pCLy86g5VAL61On9evT0LWAjFFi5ejPIILbiDpDDNF5YJXt4/bKjOBVTa6O4Pj+5L2lK70MWiDilJiFseqwO9me4tMCP4vvkd554ldnmOVtKulV98V2w561IjBunljF6rgN3oWJKSMWexZWcf6IZjumjtLBpaiuiikoZO4CiH8HYMdpPfas8rbVmo+aNVmjmh+xWG7c6X6MvkzMPZjRxF31FEDbbLsYwX8aenuyqRh0aYOyImFOloVfAu3cB7HfSv3J2V5ZPces+j09XdXMo6/3eiGPxyQlTtf8XDpQCRUV7hz6vzw5h8JiA4dYjQfEoYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezS9Vg9m/ZZndnK7GUOfqDwmRg1UJ6lpfN0CXux+yB8=;
 b=SeOmHcKiPj+ZHvAs4n9EQwpJ7vmdsf+nByQ9EO6jQWYRUlxTAQeitTf0Mie1j9rDvYyM9OZY4FAz/hvSBxUUc/jDb0BbdAl3FPALC30emfcBz562MKXIjohcz8fuKQdHFlk0m4f86rg7wVWtwnpXQuUXNqQ5Nb6uuaNhz7JiyT+3V1pza8sREazBlISydkqy2IYoUtS8pkIOcHBBup5OAXVtcfaY0WB4eUbnXu9uWSa3D4yCNL7FiqUicDFGKJ45aP467ufULw+hC3wENnoQaRmGXEhgOZkx6WUQSnit8z+slDmPRaiCim/P1eAi2SjQjcmK9P7+yZC6Xf11ihPh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezS9Vg9m/ZZndnK7GUOfqDwmRg1UJ6lpfN0CXux+yB8=;
 b=L+3xH1H/xZKGlQBQI4SNE2J7qkS7G9G60i2MhzQdndBRzW+QBtQd4KwE64FcNbHQxF22IjVh/ihLfW48I3pXdJZyq3eriuLCv59AZCOq7Vhh9Z+IYbLvpmc6PtFcGg44E4dXRpo0Fg+xuoa8aGfI25/RqSUb1pbCIfTbCeB+bns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 08:19:36 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::89b8:2d6e:d075:527]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::89b8:2d6e:d075:527%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:19:36 +0000
From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 26 Apr 2022 10:19:29 +0200
Message-ID: <4686508.cEBGB3zze1@pc-42>
Organization: Silicon Labs
In-Reply-To: <20220426072113.GC3419@pengutronix.de>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <14881918.tv2OnDr8pf@pc-42> <20220426072113.GC3419@pengutronix.de>
X-ClientProxiedBy: PR3PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::16) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b946f6-2b6b-42ca-ea44-08da275d8046
X-MS-TrafficTypeDiagnostic: MN2PR11MB4448:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB44484AA381BEAD83088D735C93FB9@MN2PR11MB4448.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29qOo4dU+NMRmSdgXZdk8K+ZkrRsGOo7q4nSDf74UImc17GG3P/1buK44DMPH97hca+saIOVYgCanl99y6puW2HyXPzpXgbjakQ9RTj+dH9tes3xz2o5ugTA5AvRH9wrl85Ormnt+aKInPdw3QjYlTgTBfMjWYDka7wcMaVlNTJpkt0cILXUhtrO17iJfiRMH8hKGXw1DBcwgwPmvw1rtubFMEMSdcCKleyk+UoiXGiiVnoSKvXnBU80bb6DpBGL3B/qmqpt3qkSh5R92MNwqVnP3qfXgcbbQ1vCQn6idwi5ePvtHvs8N4nleoc3g0T6WsOU9g1nW2ih9r9c/X2nk0ocWtkD7AFVSMOedn1A0YYkl72ZD/JMsYKE3OQT+zIRk18/iek5Sca/VK5Fx4HeNa89LlslLZ8ndveZvx7w8jDID5bhPgha7HpwJflygfILK0iiBR+X1/q0VB1gI6rMC8OGumn20SPVbdevCTSyo3nKt4GF0GolPU8k8DF3/fy5/PHofW8e3o+m0U93XtDiD3BbfYzCYK0H7GTrOTOg6uw1ICHBnZxz+vAAKZ4cF52bsWMOspNKXYI7uLeS6fd5WCNKj9ibMMzBgA/47a8vOTxTiUcxxN+jD6dSLQJMEmePpgOvY3vHtvpiK1QqHFlyslObfKvllD0BJbsvRY6tiN3aks6Bw+i1P7A01KzlRZtXKT7C2X3AKsS5Eq4pPoQtz//vWrmEdI73RkiY5p/CdFodbWmFbTpQqPhq7rdyvIxq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5657.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(54906003)(186003)(316002)(38100700002)(6916009)(6666004)(66574015)(66556008)(66946007)(66476007)(9686003)(6512007)(8676002)(4326008)(26005)(52116002)(36916002)(6506007)(86362001)(8936002)(5660300002)(2906002)(33716001)(508600001)(38350700002)(83380400001)(6486002)(39026012)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0GlAZwmyyr34CbvxOsdN6uu/8awwriPgwZgBkzkjOQGL/X7wiNUqdULbyw?=
 =?iso-8859-1?Q?7wI/tFJLoO3Hu3K0+Dr1EbOcGd7i6D945oh1/w0YpHwrPrKdiLSKb2KwwB?=
 =?iso-8859-1?Q?GGUfXgEeGOlZKoUYYLCjbnpn3MYmIlvld4/UWj8VvhvqoABhLOy8Yy22gx?=
 =?iso-8859-1?Q?rx1FfOJy1J/kOAloTqzfwfdPmzz2vA4KqTmkNI5O1Ld3qhHK3Uze7EgJj4?=
 =?iso-8859-1?Q?rcPAQWhFaDf/HdSQpc2KMvqNXMMaR1Z9jsSVfjK983bSBMI6JDXuf9+by/?=
 =?iso-8859-1?Q?36vQR3PSxZH9cXWxCey5pzC3wTfSQq/K9/ye3UTzHmfi/HHjaDXxX2ebRs?=
 =?iso-8859-1?Q?YxJORE2GzC2cL/EoBcU0xt8/1WwX7aYrH6v+ftcbzs3JhHHGYIte65O2L3?=
 =?iso-8859-1?Q?Bn2Vep/tQbdvUGnyQf5F6DtTLOl4UAAyJaZSPatoyi+uNwJeOyic+yZBYe?=
 =?iso-8859-1?Q?LIz6c3CIPs10qCyAVZLfqW+xsTSLWOGzAFB8TIyYEhTcOuPrWf/Wuig4P/?=
 =?iso-8859-1?Q?LD4hijJge6CjvfOyZue7hmbsRk5DfVZBVERvYPjea+egVPf4QNLGih3BIN?=
 =?iso-8859-1?Q?53F1T+RvUREVVRT+Hv5LuWBzRR1sa2h+UkWkplTK5KaVhsbdHurPIEdfbU?=
 =?iso-8859-1?Q?c3tWJzo2ie0bWj7ZGBzVTXx6+zivozYGsoFE5fyrERVKyR6ou/wDrXX+NN?=
 =?iso-8859-1?Q?HXvjLyapn7gVjYhkVx9NXx4jYDcpOfJ918yfsjXZ/d4ZS3+FAPGHmg4LCZ?=
 =?iso-8859-1?Q?1dXc1ZAZo9TjNi9Suz9j1sZMiznwZn80iDrpCj3KFEX2r7oFEpxwcNhFOV?=
 =?iso-8859-1?Q?n0Vn/dXeMmhMRiho4hFnUcHVPIPTc/HU1xbS6YzElSs5Ct8NFG4YIGfG1t?=
 =?iso-8859-1?Q?/h1m7b62t7xURUBTvu6XPTvamh+a8seNyPC6j8wQw6CiXXGQeBGZEEv9fp?=
 =?iso-8859-1?Q?BcK2mhUaqHV1rNqCGRB1NHIXkcDPWt2K/zzUqBBeS08ghtRh1ZL08dqp4C?=
 =?iso-8859-1?Q?TgyuNI3lyk4IL7J9P8tyFraHNSkqtPHCN2xVMxbHSokfGwEm1szzcIgdGY?=
 =?iso-8859-1?Q?yb61KKJ59LRE1DdufTdcFM88VFRPFcDQTBP/rJqAIU79mYydoSgQks2hAo?=
 =?iso-8859-1?Q?qeBfw2m+vW7kttnbVkdfdYZNbFqlSlBAugNLR6R+8PDIVhNFKmNjSn36vE?=
 =?iso-8859-1?Q?PRKbwdrzzvQ1YyiPmWRhpt0yc9J/SAT8B4GOyvGReex7Ia+WRGJ7FRWJML?=
 =?iso-8859-1?Q?OnGo9/Cr5YgwylyYmzx1R5Im1JHg6QDPL3FYBe6KqhqwlnRhF/5iaSb7GB?=
 =?iso-8859-1?Q?J3tfpbmK0ImhiUPsTevXu0FZj0jDgDcQ5NniHbQV3VK6uwOUU3Bk2WkahR?=
 =?iso-8859-1?Q?1EpS8LajxsWuogmpWArI6laWJGhMsgVmsSkEmrKJmybtB0XsXyoFsA/9T8?=
 =?iso-8859-1?Q?e3UfR4X6XJKlF5/L9gSSc41H/pN+DB7WojKtDmj6s4XbQFWSrOXMBwyd2K?=
 =?iso-8859-1?Q?KqFd6PvL9Ac3hkc6RGbP3Ty5Pi/CS5dSJsU8p9b/vpdVe9PRJCrgWckYrY?=
 =?iso-8859-1?Q?XCjPkzmVWOmbQiC5BLh5kAGQ4sKkvkwhIo6JgDgWa5CdNzZoSz0QUBLmk9?=
 =?iso-8859-1?Q?3eU/AAQS81jllJ/fDFKrIVQLib+tvdQpn7Nd/1uTkfmXwjMTQHvdafQQjG?=
 =?iso-8859-1?Q?XL+CCdf8dPS5ZUk/BCKcyfD1arNTQoxHPz8w7S+SbLfq7RVmJlhxmqB3lt?=
 =?iso-8859-1?Q?6DJ3kaHjhoylx3MP0BSq54QUg3DOzNPBzWw9ynBkMh5pNyM4AEFeja1uOH?=
 =?iso-8859-1?Q?CB9AF5BpIw=3D=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b946f6-2b6b-42ca-ea44-08da275d8046
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:19:36.5169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iV5q+UvQQiPDG8WKYxIMX7pfph+x+XStKICBdL7LNsnuu81zq3AqLcvFLkPTBcjgyF9kzp9QEbFbSGcywmC7Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4448
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: net: silabs,
	wfx: add prt, prtt1c-wfm200 antenna variant
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tuesday 26 April 2022 09:21:13 CEST Oleksij Rempel wrote:
> On Mon, Apr 25, 2022 at 05:38:20PM +0200, J=E9r=F4me Pouiller wrote:
> > On Monday 25 April 2022 15:28:42 CEST Oleksij Rempel wrote:
> > > Add compatible for wfm200 antenna configuration variant for Protonic =
PRTT1C
> > > board.
> > >
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  .../devicetree/bindings/staging/net/wireless/silabs,wfx.yaml     | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/staging/net/wireless/s=
ilabs,wfx.yaml b/Documentation/devicetree/bindings/staging/net/wireless/sil=
abs,wfx.yaml
> > > index 105725a127ab..ce107fe45d7c 100644
> > > --- a/Documentation/devicetree/bindings/staging/net/wireless/silabs,w=
fx.yaml
> > > +++ b/Documentation/devicetree/bindings/staging/net/wireless/silabs,w=
fx.yaml
> > > @@ -39,6 +39,7 @@ properties:
> > >    compatible:
> > >      items:
> > >        - enum:
> > > +          - prt,prtt1c-wfm200 # Protonic PRTT1C Board
> > >            - silabs,brd4001a # WGM160P Evaluation Board
> > >            - silabs,brd8022a # WF200 Evaluation Board
> > >            - silabs,brd8023a # WFM200 Evaluation Board
> >
> > I think you also have to declare this new entry in wfx_sdio_of_match,
> > and/or wfx_spi_of_match and wfx_spi_id.
> >
> > On the WFM200 variant, the antenna is built in the chip. So I think you
> > can point on the same configuration than the brd8023a.
> =

> I assume driver update can be made in a separate patch. As soon as we
> reserved compatible for this boards there should be no conflicts. This pa=
tches
> series is targeting only devicetree and needed DT schema changes.

hmmm... I am not DT specialist, but it seems a bit weird to have a new
entry in the dt schema, but no new code in any of_match table. =


-- =

J=E9r=F4me Pouiller


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
