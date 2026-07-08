Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mAwQCCo/TmpyJgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:14:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6737726305
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=cirrus.com header.s=PODMain02222019 header.b=GdN8G+dv;
	dkim=fail ("body hash did not verify") header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=A8tGPN1B;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=cirrus.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 727F4C8F283;
	Wed,  8 Jul 2026 12:14:33 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECFFC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:14:32 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6684tBtR1640144; Wed, 8 Jul 2026 07:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=te7EbLb9BA3oC+3hNLrpd3dOn6P0tddh1HsciJPcNfk=; b=
 GdN8G+dvArDp4YfwHeBgD6mNaq0FxOwYZZe1UDZXBr+CyH7Q6MsngbTKZr9QoflN
 DFsyj7HOSw7aGRU/piA5zBVWfIy2j0tPBEjRdmLIjmIW322XJbq9IUgrfkBwP6WK
 2SSxqKxO5xzgfnSNzcxl7vRc8pzELZf9zAcHbnQuqOZ/IF1O8mItAwbxy90zNSQb
 XNYE8mW3UIObJksfK/Kz5tW6g/m97UhxEs3jtaC+p5qhJds/EmgTrbfwXeqA8S0p
 hBeBtK6pmg8btMBeJJg5fsettcmOVkVrQ0EcP0kR7MdQwLcReAgo2b3kMBL9L/iP
 WwQ/7KLhA+junOV3Kh8rSA==
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11022142.outbound.protection.outlook.com [52.101.43.142])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp6ae-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2026 07:14:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRaqKhcfCxjqVVP7sN2HZniOfYuvhqtiPX3fpBnzVGYVjeoZjzBVC5E1BBARNcEU72nBUzI863u5znbtw4QXOz7Elp/qrHYdUlzvm+87e+m4vKLOG6oLxiFH6O4dGExbtzqcQQIN9iZy9YaoxfLDEp9q1eSii3l1NQ0PzCeX1fEPze/AmaewSsfKwvlQhHaUYmsaEfsFjaJ6mYqv5ZejEIZ/rBtMVW++sWQ+l8B8E2+HEPqRCv3rU9MjBnR/7W1tm7A83qF1dywK7fNR5VtsIyCHI8iqUxRwOS9jNyFXc3grXFMtKrhHbAkxkuhYcEMvVw4J+Y++Hh4NA99/6RVFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYYjrxddVRmKVT72cxR0Ro2YY6QJ9n2D7UwJQ/zRqa4=;
 b=H2nHNE4CGp87ifd591xZwVAGnoY31PZ3RYujdJOjrUUvD2xBRmr/U2qze71LRi2ZHONnEGiYn65B22oVDqygscK0isse6vc6TeymDErv8bWLdi3hEUGceAVWvlvBgxynP0y1XL5Kx0rCguBc/BY126Kg9KbOTWN3San7doaZNuaSQMKElbOMu0d6VOYT+BItI+jarNwL2RIi/30KEOCuk8DOVtjZxoG+sKjtQbjmD6HS95Rq8juJQhECi9IAPEPPB1M3za8IMsUFwGuS3nLRx/cZFQWyP/a5x9Rwx19S81+tk+x/3FELORktY2PLLtMBFLc3G4p5dDJhkHB6Mf0KIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYYjrxddVRmKVT72cxR0Ro2YY6QJ9n2D7UwJQ/zRqa4=;
 b=A8tGPN1BNvMRBD3HU5/W9G9Pib+g5Z/9cT/UJCsPVDXFvcHD+BHd8mabZa+624bAXrh/TNImJ6xczq1ur8eSIRU4dtRf166erCn50XgWQpH6IrtE/xqg1Gwj6dz6XQzHTCnqxej3FB6/QdX3XqXdzvTTLz3N2LCNOHezqrZpoCY=
Received: from BL1PR13CA0193.namprd13.prod.outlook.com (2603:10b6:208:2be::18)
 by BLAPR19MB4274.namprd19.prod.outlook.com (2603:10b6:208:27a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 12:14:06 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::7d) by BL1PR13CA0193.outlook.office365.com
 (2603:10b6:208:2be::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 12:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:14:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
 by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0B53406541;
 Wed,  8 Jul 2026 12:14:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E49482025A;
 Wed,  8 Jul 2026 12:14:04 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:14:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Message-ID: <ak4/C9MGcGa/FC0F@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BLAPR19MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c66d69-cff4-4099-e5a8-08dedcea6855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|7416014|36860700016|61400799027|5023799004|56012099006|4143699003|11063799006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2ji0UCxmV4VTnNXDLv2qsmBS4V66WSfYjDGQ+Tg9l1wRfSpBz+qnCnbMUtgOAh4uFmimLi5WC+LrUlVklCqFn+FXkCrTUIb2k/nQFal7DQxAy2bMahpQ2kDAz4kWRlDb4KTuiDhISO44RIYw9KYhqe3Ua6gDppjNtkHz/u2NLEB5/hB7zB+ET1la0ax16h1tCSErT9taCbdfRM6OAcql3TtWn4O9YQDqUJJL7eX6DCtHzpUHXxW5xhPPLDWwgM0uQJrGp70rMufdGN0YK4J4DwYARtjQ3ifoUOm3PNkwnUPqhagb9pYHAFzWeNTaHeYdo1jp1l42bY/AluHSOfehJtWbZpTIkXjbua0yrQOfKdBh9WGRVrPg/FNdOT9frWvAS/on4SaZ78Ju2MPusw6EoDVapTXKBYQKxnqJc9kXpzqhBJdgUy9A0xI+DznpokDXc+hu4k53qZERM6Hw3SJipMm/NZEHTw3Viv02Y1/geM2vRghLx9lr1+f4tB/Jw7fazcwTUx2iea1Q+F6toyOxAwe46jM+T9VbOoP1IV2ovR5njpSMyfKibiISd0W6mKDjjVMl7BsHj/luEGegOAPgc/vxBdSSGf0Gd9uBPbHmD60SSS/RjU2qylvrz7puxV/9CGxuz+o8/ZoIVloc2RrFefIzaOZX6yjC7qp8aEqhWXRRTs7VQjOhw1qLBSH6VUl/ZwqYcap455l7uLZHg0rHZA==
X-Forefront-Antispam-Report: CIP:84.19.233.75; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edirelay1.ad.cirrus.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(7416014)(36860700016)(61400799027)(5023799004)(56012099006)(4143699003)(11063799006)(18002099003)(16102099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MTzb3D/jFuhI7IKH2oNXLyzdkYQVTh5rsRIlossPJy+IPujUp4QcxOm901Ca8+YtUBFi8fg5LzP4PR/8OWmb2/rCQDH2E1kgFpatP1wv/GDpPL6EroLIAsb+VE9+Hyi0keZ2W9f25OARw/gMpIC2YjlSC2kNtR8pNsvcOMu5rnb4TkgbLz3BnbYGWdH6uy/gbU6VVRcjUoT7HjS73UL27r16tHjMY4MMSNCeScErmn6waxlAh+uxkzsVnGCuQdB0/fqQMv+hrH/IN0fak0UDkkq861SLytqxO4/z//6Msox2VFx1x52CQjMaVjSp9WSh8SaLdefOj9No7Bvco2c2e+ZylOavXSmPV94c2VM8fEKvY7bhYdkjtmkXdJ/X166n6FGVFs/V3gbVbWjberQ3hCcldi6Hsw/IpKSoJLGcOjB7lZOaxRyUUqPxgum0wc+2
X-Exchange-RoutingPolicyChecked: a/8lq3kjBZkjkGu65fsTYHdEZD2JvCfRhm+7ckrYHnT1r70Ejvi+rUGcGS/VMuJO3QqnNq68gY29LLZP/TChLUc01CGVwEVKQWCsctWydwwIANbZG2q+HCibydCwpoFjTpvw99ALr3CrsyULBQIJ76jZ/OWr9aPOncu/QzqneVGtugEck8w4Da7EqqQZNIr6+VzBga/Gq1ZNCEWel0MQ8JDhwyOoU4GmBvKbyUGgdgdbSp1NsYpcR/AeaGwFdeIIemQBS3Ucw3ekLLo250OhMBbFIDD/TMtiRPL/GUJnk3irNYAKfrQxL8zDBQjTQHvIM+IZnJbzMwNdkpcWrWQKkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:14:06.2054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c66d69-cff4-4099-e5a8-08dedcea6855
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8; Ip=[84.19.233.75];
 Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4274
X-Proofpoint-ORIG-GUID: D0Xg9GUYER2VClQVrpnnULGVSarjfMqs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX+RJQdCOuGbio
 +9Xx+rZZcq+TM1Z5UoHy31g9wGOX5ZOq+mANd+PyaMZTTh8PbtaeMm3SEPWliXXdSUPtPuPsUxU
 4c29EAnXdKr16vw9P+OxxmP6fMbM9XA=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e3f12 cx=c_pps
 a=BvJXZHzsSGOlYntt73USfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=DbYNsBR8Dkk3uGWwsP0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX/9Em2V2VxGgY
 zyIrh9H/5RHaPKUy4hI8QBxGpw8DJHyZYy8OZ77Sp8UuS0iRolZj0sR4ekCSUjnhR/2R9/k8jQy
 VcZJhsN6DBhQE89ljxYScTTDGBRLKjF/XWVX4GG48bAE+wnhz2aHWn2WoUvSqIg+hA+DqSgQ88K
 R5Q04kPfWVOqlft1hsJF7N/4KN1CQXfPsaK3pFOT/MLGg27/j5A5sa6J09JpoZ4IC7oW3acpJM9
 iL002PTrh8lAVCjLmgV36Okhnntcapc7Eq91mRdiPTyPROATKXW4gaae9zg2Tb2j2Xvd0UsS87o
 OEjbWf/R20uhz2Q40WXDQ7MOGuNc1SlZXACRp/Fiefqcn4Cf6PFZ9tYfgl4fR9GGXq7GXGtSdrv
 RFqXPvDsj8r3efNWrlNs3eUQhEcBjuS/PA8L7aehg0aPxyLjSGmFyFrix/5Ys8WCeipQoQxOD3c
 CaOIOZ8iV6sX3bJWSVg==
X-Proofpoint-GUID: D0Xg9GUYER2VClQVrpnnULGVSarjfMqs
X-Proofpoint-Spam-Reason: safe
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev, linux-sound@vger.kernel.org,
 Colin Foster <colin.foster@in-advantage.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 Xu Yilun <yilun.xu@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 17/23] mfd: Use named initializers for
 arrays of spi_device_id
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[cirrus.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:jogletre@opensource.cirrus.com,m:support.opensource@diasemi.com,m:trix@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:lee@kernel.org,m:mfd@lists.linux.dev,m:linux-sound@vger.kernel.org,m:colin.foster@in-advantage.com,m:rf@opensource.cirrus.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:patches@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:yilun.xu@intel.com,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:-,cirrus4.onmicrosoft.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,diasemi.com,redhat.com,st-md-mailman.stormreply.com,kernel.org,lists.linux.dev,vger.kernel.org,in-advantage.com,lists.infradead.org,gmail.com,cirrus.com,intel.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6737726305
X-Spam: Yes

On Wed, Jul 08, 2026 at 01:15:24PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> =

> The mentioned robustness is relevant for a planned change to struct
> spi_device_id that replaces .driver_data by an anonymous union.
> =

> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
> =

> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  drivers/mfd/arizona-spi.c       | 10 +++++-----
>  drivers/mfd/cs40l50-spi.c       |  2 +-
>  drivers/mfd/madera-spi.c        | 18 +++++++++---------
>  drivers/mfd/wm831x-spi.c        | 14 +++++++-------

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
