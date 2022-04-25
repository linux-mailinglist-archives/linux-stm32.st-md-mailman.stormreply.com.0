Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C150E490
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 17:38:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5868CC60462;
	Mon, 25 Apr 2022 15:38:32 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A06A0C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 15:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/zS5kz+6qkkxYImuFRluyx8AqjnFL4K9c1kPM3kh+Lwz2gUFd+/V30i/cTU2lZs/GI3gd8J/eInVIzkOQSUUCi9ITg7m9WREXDrpzJKvNhQQ2E0Tx4wKVSMyrvPPJsbHkFWLEd4Bb1Po4RlmWwzmNLagEld71PhanbMkL2KhAn98q/Nv7CUBmCjynYsfjwu7XPer8CycG6e0efVBejuYFozk91mL2mI4oTnrXlpVQvdsz7wObSWZAbgbBSg9/3HIG17116/7qyIQgZX+FBt9VztQWH0GwzXNXtGn23JJDJxcwKQg6bc5jHCchheHGvIYszQ3zlq2jBCXbDIxJvuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmZSuflsf8g7vJ6OGhRmEgjuCkq4swunPSMsQ9Q9cw0=;
 b=J3DEk4Ocjzt9wl9Fe2hnR5VYALWtpvxiHp8rckc1uzbLPyamZzLmklJ5CIwK12uCmjq1k2GklzO+zKKTTTCW0coivUzJt9rwNu5CNENB1kWbULVRxtl3vOyg/ipHSmMVD1ihVvQr6H2kBI8jDtUq+/12jjVhBo77Td3ZmA/mlxcJr5Eao875dDfrOgH9XE3hWObds1vOl386mzUJ8IwNz4RmiQIVucriDmmOJbRgZEsjB/b2URSQ4xE1IETh4gD7TfdzIfBqvwtyRK4iYJiRdDoKnp6pxI6DMX2hMFMZymu0y5TtEpaxCFb1ENtpplDzHlZNsb7SwQ/tA5n+5BL+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmZSuflsf8g7vJ6OGhRmEgjuCkq4swunPSMsQ9Q9cw0=;
 b=Qg8aqhw6bY8LWT9drInzRxgUsVpWQpIWNYvJc52MmsakD2EWdXMVpFGm9yCFBQut5GPIkr/RjYFeKpOJtWw+cbOsEw2WOnflukKQXnaclA9Bnx4OpMpxMP2urBc9slsMSg9iLmkbnkEWhvzGXkO94VbzDKwwYUYYsDgleN1hDk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by BN7PR11MB2739.namprd11.prod.outlook.com (2603:10b6:406:a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Mon, 25 Apr
 2022 15:38:27 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::89b8:2d6e:d075:527]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::89b8:2d6e:d075:527%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 15:38:27 +0000
From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de
Date: Mon, 25 Apr 2022 17:38:20 +0200
Message-ID: <14881918.tv2OnDr8pf@pc-42>
Organization: Silicon Labs
In-Reply-To: <20220425132844.866743-3-o.rempel@pengutronix.de>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <20220425132844.866743-3-o.rempel@pengutronix.de>
X-ClientProxiedBy: PAZP264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::14) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d86218ce-cdf9-489c-cda1-08da26d1a428
X-MS-TrafficTypeDiagnostic: BN7PR11MB2739:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB2739D877C19DC8BD8B81D3B393F89@BN7PR11MB2739.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfs7nXYaqjeOubb0/gke4O33OpiE/c7+uJz5E18+JmGuDQ0t1aV4BCk4ZtF47w6cvp2D9lhDolyv7LGY231GxtN1gEwA9UpZPu1i2D1DYKx6HfdnkCtikN7oFWpk3Fh1kXohVUrDUyqFQ1HaDSrdxqB1Kgkwj3ckXf3mah/zUjKU3MKWD3O2we7AMSpPRDWH+5Mssc0kBkm5InbgN/HOOu3I7cYPSgxo+0ZxFLaQFLGoh33RWBuEuXYhvLPbJaVUqMbgIBj/qx4NTO0e35G7R2ukyf5FpKy9IqQMh18Ikqvl9TGmHAKGYOu9Sken1ZcVtxXONK9X4kAZ1swt/MnxukwZOJNC39C6ahsjCQ93JT6w/XLz4fBwajJXL+gbYoPq0z5udJ+fOabXfYvf2wF2CqgPC+mLQomFrV9ZV6ePPXE3VDuZn7VNE8H6Q68bR5K9v21P2hPZbq2/CwTg5Kfy6JIRjtm7Tw3pQTFlVjGGsKbKxIFSLC0Pw/gMMSkowQ2Wd+bGJ/e7HW/yubjs+7hqJ3IeMiB4Bk/JYgMR6mlRkvL+30ZqAH1lkyKNVKglppucBaLr9IidI8eu9iPfC/fG5QmK/oVVI4FwTC21Yn9OvEAyQ9VK93V4Ub1xdiQ3QGpqmu8Uqy/oDd3hXGz0W6kRCYgxv9EaSkz95+ZT+lEfkdAmHF3JAr1FO0t1M8Zy3oaVKop4c9dkXMyaBYiR+xzstvaEIzwOEh97qT1Sg7hxUKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5657.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(508600001)(8936002)(5660300002)(186003)(6486002)(316002)(9686003)(66556008)(66476007)(66946007)(6666004)(2906002)(38100700002)(52116002)(38350700002)(36916002)(86362001)(26005)(110136005)(6512007)(33716001)(6506007)(8676002)(4326008)(39026012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6OLfSPZm2RDE2mhjQ8duEHsxIknytFNN8SxxlCEWDIFnTVmD0ng2r2IDOW?=
 =?iso-8859-1?Q?C3ESdv5pAlIubv7yFNTR1sDq9NL6/Ww6FdtejIqVhLDIXdCFfwZoFG3fdt?=
 =?iso-8859-1?Q?Exfm4Xa7Iqvfxf0+UAaU3bX/7iq2a38xSOO3QxGV6nFZDk7QryuvJEykd6?=
 =?iso-8859-1?Q?9ovRh1cQbfNNIWs+4R6iJ29fREMoyG4LN7nwZQ+2WebGj8JfwbHVkDNuza?=
 =?iso-8859-1?Q?LQ7l9PEAF1qq7lEeajkFGz0gKFrCIo4Mjse9vWPCDt6pmcEiKU5y0Vh5wH?=
 =?iso-8859-1?Q?mOb9iweUYIO3jeUVmN0VQW5UvnrlrnHn9+wYmZvQdRPi7GCyopG2ulR1MK?=
 =?iso-8859-1?Q?V7hiONPVis5+915yCyEMu3XdFSo2w1AJi1S22h2ybomcfEZq01fFhKUx2N?=
 =?iso-8859-1?Q?NlxH06dHkf2NIxHEyTpJKIUQs8lSJQIrBNEQSvuPhKXYEvtBfq1YuKuFXB?=
 =?iso-8859-1?Q?6RTF59aOvzSDriv6X7laW2yAYqCD2a+IZ87lUeRcjkMgZ4DohPcM99xlem?=
 =?iso-8859-1?Q?/vJINfE0kGRAkZhh8q/Io9SHUK365IwFAsYFGrTjxWsPJ/X92rhT6ba77l?=
 =?iso-8859-1?Q?yf302/n/rgNHPYJ1sxNuvA0wOAtmziq5T8XOPtFDQMDfzJ8G/SS5ZQhY8C?=
 =?iso-8859-1?Q?hTYpmK26xoj+tzmv4yHiOJp36J4M0V8xxFAPB2ed50RaOFnBig1Wakx+87?=
 =?iso-8859-1?Q?H+PinfByWWFsohLn+FXU1nc4PSR0AOTu052bhRkWzbMEMOCvx8ZgTLFxPv?=
 =?iso-8859-1?Q?c8EGOcD+VTUfiX7dlh8kjCxGqreObB5Q2j8vyZkGcPCmSnhrK94c2uujca?=
 =?iso-8859-1?Q?yivrutk2fNjkZdzgy6BCvrQguWCpt92dUjZuYcIS/QYVtQLxu58BVNIOz0?=
 =?iso-8859-1?Q?HjOwrxH1fCPzCHvrPI3il7IrIuR7gBX0kHTrwl7NlZBnFNsQfqJ0p7vzI6?=
 =?iso-8859-1?Q?2sohFCNy9LRJXSP/Zw08C2lQJ/hl3+jQFqQ5x6kQL6WKTaO1uuLymg8+/e?=
 =?iso-8859-1?Q?JKVimCVlyFzfcW9pJLhqCTncJRWBajpjOUOi4dCXfik95rXXtMdizaWbbB?=
 =?iso-8859-1?Q?AGjeV5VvcakHU9ztY9uQHdw5B5AgOdCukXF0bWYTApLjv+FRC5RPD2tpDw?=
 =?iso-8859-1?Q?OegtwDlLaE68ODtLQIY7n/Lo+AVehGlbyhzYwiUAy9pbHdI9v2yMKSgXrO?=
 =?iso-8859-1?Q?9O0RvtnmW6qw84A1PcLO8AqUpxg6jge/tqElIw/ccCFXKoovzcYdXGmEn0?=
 =?iso-8859-1?Q?gKqupv59mWpN6Sscnt9j16YHOWh0j5QVWVQJjEmAchLA9/vLPgruEH1uzw?=
 =?iso-8859-1?Q?pFPWMjmemNR9cNUmMFmeezlti3fzAD8GNrDVlred4FeQHn0XrX9M5QShAk?=
 =?iso-8859-1?Q?meYLuNDKiR7Hnwy0zHt+6h+sVGDIXj1BO4Q3U2fl5F+mdWKf44PB5wThxf?=
 =?iso-8859-1?Q?MjC5DbnIeoGB1x1xhtS+c6kZ5AsNgIMzRJtdxIqoyi2KGX5v7LGR05VH5/?=
 =?iso-8859-1?Q?ePYvZjqSxz10TBADUacgtzgsqcbsUzeAklt1HRgLtrjseH96R02hnKnXB3?=
 =?iso-8859-1?Q?U9+qFQJs9WiBBX88l3KXMs9tMSao/3cm1xXX4vR++T4/PNCm4BWEiW/QNA?=
 =?iso-8859-1?Q?rOoTcoF1Hh/nwqdQT7yNw6AsLGAKs8RUS5vFypXHOoKsfLrf3N/2YIU31M?=
 =?iso-8859-1?Q?1rJZLdET8dAwtROjWRPjpx4fCCtP+l5IggNtBB23w+aqJtm8YZtNy7uQDR?=
 =?iso-8859-1?Q?U5uCoaDDA6Ol9tRvzs7EAbT5B16tvxPWHd04BFiIljQlDRFyCmzCNToR4T?=
 =?iso-8859-1?Q?yt1LYCHS+w=3D=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86218ce-cdf9-489c-cda1-08da26d1a428
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 15:38:27.3160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNz23Zn/c8O9TCo6XnDvhEel30SQ30WgyxnnGPnPCXwBbVFFbqcyTFBqatKP5lsRXEUVXNSyfg8fQuzOsaxPOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2739
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Monday 25 April 2022 15:28:42 CEST Oleksij Rempel wrote:
> Add compatible for wfm200 antenna configuration variant for Protonic PRTT=
1C
> board.
> =

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/staging/net/wireless/silabs,wfx.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/devicetree/bindings/staging/net/wireless/silab=
s,wfx.yaml b/Documentation/devicetree/bindings/staging/net/wireless/silabs,=
wfx.yaml
> index 105725a127ab..ce107fe45d7c 100644
> --- a/Documentation/devicetree/bindings/staging/net/wireless/silabs,wfx.y=
aml
> +++ b/Documentation/devicetree/bindings/staging/net/wireless/silabs,wfx.y=
aml
> @@ -39,6 +39,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - prt,prtt1c-wfm200 # Protonic PRTT1C Board
>            - silabs,brd4001a # WGM160P Evaluation Board
>            - silabs,brd8022a # WF200 Evaluation Board
>            - silabs,brd8023a # WFM200 Evaluation Board

I think you also have to declare this new entry in wfx_sdio_of_match,
and/or wfx_spi_of_match and wfx_spi_id.

On the WFM200 variant, the antenna is built in the chip. So I think you
can point on the same configuration than the brd8023a.


-- =

J=E9r=F4me Pouiller


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
