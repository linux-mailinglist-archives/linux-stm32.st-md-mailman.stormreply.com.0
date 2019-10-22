Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40420DFDF4
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2019 09:02:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC89AC36B0B;
	Tue, 22 Oct 2019 07:02:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23EA1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 06:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=48Dk3GduP5rAStkaH/Cpl3hBEo1VmF6KfJq9HHMzqZeECb72lp+VF7M6PHkLkZTQIUK06q1rxEsP1l0w4eV7MBPq3b8C+zCocVs8p6uwht+PS6WqXGo/6Mc+7cnR+mHDzNojhoCBAswUPgBimeV/aBVfvQ0N5+iwC/zoVPQSQpY=
Received: from HE1PR0802CA0006.eurprd08.prod.outlook.com (2603:10a6:3:bd::16)
 by DB8PR08MB5498.eurprd08.prod.outlook.com (2603:10a6:10:11c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Tue, 22 Oct
 2019 06:13:36 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by HE1PR0802CA0006.outlook.office365.com
 (2603:10a6:3:bd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Tue, 22 Oct 2019 06:13:36 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; st-md-mailman.stormreply.com; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;st-md-mailman.stormreply.com;
 dmarc=none action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 06:13:35 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 22 Oct 2019 06:13:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d10b8234bfbb20e1
X-CR-MTA-TID: 64aa7808
Received: from 085b599e7582.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89BA12D9-596E-4F6A-BB45-80FAB1D18CB5.1; 
 Tue, 22 Oct 2019 06:13:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 085b599e7582.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 06:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTx+VYAtivY24J/22E1o2PHl7uExK1u91IUGKElszT/1PK537hUTYdqu5OusznsTaD3RHbgPoNcIb5yNQGYPelcKTSr3QpIx30p8dQyPdJqrwCca5rhJ79JDnRwDM1rgZ9LIW0c63W+gfObhdwJZs6OxrjbPOe1LvQGk1QhAhb1p8DZjlAbBQeh73hq/rjR0V7+KhnWBBz3vA8k2OM9Dx8qSS0vjZ4l9AWgPDwow9asH3jzP55IaBT8tfdmuGi9k54M88fAjfJxcRQ6Bdi2XkACxqX/loybZUtp3IUwlJ7lO6k8U1fpnxPlqufsZAQL+1XlFGxW89u1i4C53BXEuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=XMHavPQyETiT2E/l9Xa0gXr+MAjVZGLzGFDcy0kBOJ0WhKNZVr7fluKKOlR5upeu0xryCZZ7gGKwLAH1Tv37vHMheheqOHZfEcWiYV6AklOYfB2puC0CN3j5yRw1YXCKeelveOx+ltR8mWCsfLV94bUDAQ/vRRvBKe6j/DeNuOryIWqtleJTjqBgZsKpzuPRrRiFG7GKnks0PQU0DWcCvyh2uiT8+WDQJ24UeDAi/AlFD0yMIWp9excUMfkslGqzQmAHg/1uRKeVAPA8ttFrKRbzv7VyDe5J4qIifgJ7nN6E6zZiytrQt8nfbP0KhrQAk73MONjqyrfIouFrWPwRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=48Dk3GduP5rAStkaH/Cpl3hBEo1VmF6KfJq9HHMzqZeECb72lp+VF7M6PHkLkZTQIUK06q1rxEsP1l0w4eV7MBPq3b8C+zCocVs8p6uwht+PS6WqXGo/6Mc+7cnR+mHDzNojhoCBAswUPgBimeV/aBVfvQ0N5+iwC/zoVPQSQpY=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5215.eurprd08.prod.outlook.com (20.179.30.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 06:13:05 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 06:13:05 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Thread-Index: AQHViFjvrI6TSZ8K9kmI2e7gEmpbY6dmLsqA
Date: Tue, 22 Oct 2019 06:13:05 +0000
Message-ID: <20191022061255.GA7512@jamwan02-TSP300>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
In-Reply-To: <20191021214550.1461-5-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0004.apcprd04.prod.outlook.com
 (2603:1096:202:2::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9be87b9-df5b-499f-fd54-08d756b6f8ae
X-MS-TrafficTypeDiagnostic: VE1PR08MB5215:|VE1PR08MB5215:|DB8PR08MB5498:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5498C8B3A038AF26DFD78549B3680@DB8PR08MB5498.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:52;OLM:52;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(256004)(14444005)(186003)(26005)(446003)(66066001)(102836004)(55236004)(11346002)(6506007)(76176011)(386003)(486006)(476003)(1076003)(52116002)(66574012)(5660300002)(316002)(58126008)(54906003)(478600001)(14454004)(71190400001)(71200400001)(25786009)(305945005)(7416002)(7406005)(6486002)(81166006)(33716001)(8936002)(8676002)(86362001)(7736002)(81156014)(229853002)(4326008)(6246003)(99286004)(2906002)(9686003)(6512007)(6116002)(66446008)(6916009)(66946007)(66476007)(66556008)(6436002)(64756008)(3846002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5215;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2lTtwbyEp136krTq0bT+VLjZ5ll/UXigxmmO5NbJPHW47JzbTiw5U5doGSu2k2uSCG5klXdwjQXppOzX15qpSIbx2ewfpTlhB0YCy6Byq8fbm2tKUFDdRKCJex6Qlxj+enc9VYZ/S2BQwecA4zjKjl1Iqv8jhonr8aIYsE07iFm5yutsOIoqiN8IY8rN/VLmYG+kN8ocbSqChvGoXDln/Wq7BGZ2qzVuqfMcpX6DEoUctzrY06N3uuVsegLXi2shqTRa51ZMRw5+WDtIo8ma8QI8CWEkMFN8B1+2PVSr+XdtA4b9bDGll7lP+W7T/sImmMa6U02L4AJXnhKA/OnrPGb0yk4q7vYdZUVhTKWib4PTspsjE4JJaMmtItoKkErpvDBN1l2vfz7DPFK49kD6MLR2aIEoyEdFhfA+Ggw2X5rK9m74x/hYGL3hx9SU03w+
Content-ID: <68B64C555405DD408B961B43E6BC14EA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(136003)(346002)(396003)(199004)(189003)(7736002)(6116002)(305945005)(22756006)(6862004)(3846002)(99286004)(6246003)(47776003)(76176011)(4326008)(6486002)(58126008)(23756003)(54906003)(316002)(229853002)(9686003)(6512007)(33716001)(2906002)(50466002)(33656002)(25786009)(66574012)(356004)(81156014)(478600001)(8676002)(8746002)(81166006)(8936002)(86362001)(446003)(14454004)(26826003)(1076003)(5660300002)(386003)(6506007)(102836004)(26005)(126002)(336012)(14444005)(476003)(63350400001)(486006)(70586007)(70206006)(76130400001)(66066001)(11346002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5498;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a71d29fd-6417-46b7-a849-08d756b6e6b7
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Hd6b294ZXIbvsazZpJlRt9qp+c/rFpjEkXmIH8P1rN3q5yeufvNZa1tXugSdJ9DkqyjGZ2wCuo00pMxDdPSnbdM0rF6SHLco9JpLEEESdwfnvAbZBpQORJihl9xkl2lfC11cmfaRqwE1XGz5iX1Gn8dQf2VIJCPvX0EJ10iScRpuW8FUi7duzP1hUodicQwcR7Wv9ze8M6nYv27skbnCvIXjlqwHqZemNOCiAASlOBqZqHfZkPuqBlr8v+zkASzQqBacqWZx8r/y5aaUr1HZWTiCdlnUwahfrME1NGY1/C7KWJylHI3WdhDbaHkPALnCoiurBRAXljOONMghd391uLYp117T2V7146tFBGpPfRIdAfQuak49WgPoEzWZc7rrXzOx+T1PFBPiao0280YqjSp9Zst0b7v1vKpHx75R13RkvS2viJJwXjyVU5Q2Ve/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 06:13:35.1798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9be87b9-df5b-499f-fd54-08d756b6f8ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:02:57 +0000
Cc: =?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?iso-8859-1?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>,
 CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>, Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [Linux-stm32] [PATCH 4/6] drm/cma-helper: Support
	DRM_MODE_DUMB_KERNEL_MAP flag
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

On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
> Add support in CMA helpers to handle callers specifying
> DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
> change. drm_gem_cma_dumb_create() always creates a kernel mapping as
> before. drm_gem_cma_dumb_create_internal() lets the caller set the flags
> as desired. Therefore, update all the existing callers of
> drm_gem_cma_dumb_create_internal() to also set the
> DRM_MODE_DUMB_KERNEL_MAP flag.
> =

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c              |  1 +
>  drivers/gpu/drm/drm_gem_cma_helper.c          | 48 +++++++++++--------
>  drivers/gpu/drm/meson/meson_drv.c             |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  1 +
>  drivers/gpu/drm/stm/drv.c                     |  1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
>  8 files changed, 36 insertions(+), 19 deletions(-)
> =

> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gp=
u/drm/arm/display/komeda/komeda_kms.c
> index d49772de93e0..7cf0dc4cbfc1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -31,6 +31,7 @@ static int komeda_gem_cma_dumb_create(struct drm_file *=
file,
>  	u32 pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
>  =

>  	args->pitch =3D ALIGN(pitch, mdev->chip.bus_width);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>

Hi Rob:

komeda doesn't need the kernel map either, so you can del this line for kom=
eda.
and with this.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.co=
m>


>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malid=
p_drv.c
> index 8a76315aaa0f..aeb1a779ecc1 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -465,6 +465,7 @@ static int malidp_dumb_create(struct drm_file *file_p=
riv,
>  	u8 alignment =3D malidp_hw_get_pitch_align(malidp->dev, 1);
>  =

>  	args->pitch =3D ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignme=
nt);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_g=
em_cma_helper.c
> index 4cebfe01e6ea..f91e9e8adeaf 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -78,21 +78,8 @@ __drm_gem_cma_create(struct drm_device *drm, size_t si=
ze)
>  	return ERR_PTR(ret);
>  }
>  =

> -/**
> - * drm_gem_cma_create - allocate an object with the given size
> - * @drm: DRM device
> - * @size: size of the object to allocate
> - *
> - * This function creates a CMA GEM object and allocates a contiguous chu=
nk of
> - * memory as backing store. The backing memory has the writecombine attr=
ibute
> - * set.
> - *
> - * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded nega=
tive
> - * error code on failure.
> - */
> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> -					      size_t size)
> +static struct drm_gem_cma_object *
> +drm_gem_cma_create_flags(struct drm_device *drm, size_t size, u32 flags)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	int ret;
> @@ -103,6 +90,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct d=
rm_device *drm,
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  =

> +	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
> +		cma_obj->dma_attrs |=3D DMA_ATTR_NO_KERNEL_MAPPING;
> +
>  	cma_obj->vaddr =3D dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
>  					 GFP_KERNEL | __GFP_NOWARN,
>  					 cma_obj->dma_attrs);
> @@ -119,6 +109,25 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct=
 drm_device *drm,
>  	drm_gem_object_put_unlocked(&cma_obj->base);
>  	return ERR_PTR(ret);
>  }
> +
> +/**
> + * drm_gem_cma_create - allocate an object with the given size
> + * @drm: DRM device
> + * @size: size of the object to allocate
> + *
> + * This function creates a CMA GEM object and allocates a contiguous chu=
nk of
> + * memory as backing store. The backing memory has the writecombine attr=
ibute
> + * set.
> + *
> + * Returns:
> + * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded nega=
tive
> + * error code on failure.
> + */
> +struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> +					      size_t size)
> +{
> +	return drm_gem_cma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>  =

>  /**
> @@ -139,14 +148,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>   */
>  static struct drm_gem_cma_object *
>  drm_gem_cma_create_with_handle(struct drm_file *file_priv,
> -			       struct drm_device *drm, size_t size,
> +			       struct drm_device *drm, size_t size, u32 flags,
>  			       uint32_t *handle)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	struct drm_gem_object *gem_obj;
>  	int ret;
>  =

> -	cma_obj =3D drm_gem_cma_create(drm, size);
> +	cma_obj =3D drm_gem_cma_create_flags(drm, size, flags);
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  =

> @@ -225,7 +234,7 @@ int drm_gem_cma_dumb_create_internal(struct drm_file =
*file_priv,
>  		args->size =3D args->pitch * args->height;
>  =

>  	cma_obj =3D drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
> @@ -256,9 +265,10 @@ int drm_gem_cma_dumb_create(struct drm_file *file_pr=
iv,
>  =

>  	args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
>  	args->size =3D args->pitch * args->height;
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	cma_obj =3D drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 397c33182f4f..1593518dcbe4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -81,6 +81,7 @@ static int meson_dumb_create(struct drm_file *file, str=
uct drm_device *dev,
>  	 */
>  	args->pitch =3D ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
>  	args->size =3D PAGE_ALIGN(args->pitch * args->height);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar=
-du/rcar_du_kms.c
> index 2dc9caee8767..c9b1f298ce7e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -299,6 +299,7 @@ int rcar_du_dumb_create(struct drm_file *file, struct=
 drm_device *dev,
>  		align =3D 16 * args->bpp / 8;
>  =

>  	args->pitch =3D roundup(min_pitch, align);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.c
> index 7582d0e6a60a..f09b9a035376 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_pr=
iv,
>  	 * align to 64 bytes since Mali requires it.
>  	 */
>  	args->pitch =3D ALIGN(min_pitch, 64);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  	args->size =3D args->pitch * args->height;
>  =

>  	rk_obj =3D rockchip_gem_create_with_handle(file_priv, dev, args->size,
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 5a9f9aca8bc2..0f76a4ac95b3 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -47,6 +47,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *fil=
e,
>  	 */
>  	args->pitch =3D roundup(min_pitch, 128);
>  	args->height =3D roundup(args->height, 4);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index a5757b11b730..f653a5d1e2d6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -34,6 +34,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *f=
ile_priv,
>  {
>  	/* The hardware only allows even pitches for YUV buffers. */
>  	args->pitch =3D ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 2);
> +	args->flags =3D DRM_MODE_DUMB_KERNEL_MAP;
>  =

>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }
> -- =

> 2.20.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
