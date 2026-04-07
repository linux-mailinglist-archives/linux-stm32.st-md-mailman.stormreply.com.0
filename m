Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKSlNUE91mlZBwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 13:34:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951C3BB523
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 13:34:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C11AC87EC5;
	Wed,  8 Apr 2026 11:34:25 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 551F5C8F280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 08:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSnKhfbqsczGWkVaIRkX1npQKA2RMwSsC5I2MtuK5ulUYXQt1l7lihjZYztp6kJjgxb+ES6XMTK612vhntl2M7tCJlw5rsLmSnm2XJaU4DuToBfZy2xtQJkAPi2HK4OTYZdz9GjRT9wmEibUENDp4G4aoYeEWczE8JiuIfIw4KJR7/Ygd5McR1iUNudqnPKTPhOkN0TrUdgWzHz1TyPVXUb+0hOowMKwxcLqaIXe0fSCzCmUUWGnvdXtLwjETVLLnVHa/4c1z2q3H/hV+VWi2MBr4596XbPdMGRVi8VuYy7/WBUIgr0TWijcffnOsbWl2X0dfDkuuInIn9OT1emynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8oveT8erI+TbsiJYfsPNVO5HTmobGZJ+gPB+u7DpGs=;
 b=w9Fp/NYaoFeUwUHTmTXAMVY6B/saIyX8UN/vxBnlb/X59cS+v+15el/wswcsfpMZ+H9GMZFq6B0maBCzSHltZn3MNFX7tZuAOBVQVXVV6M+NEL9wL25+7DMefCbtR/ZlxjDi/b0gxKqmfVlSA1Ai07MMTIzowTbm30meSGMgbEyTpBY5DPGaT3WE5AtjUXWgSGlqiW02YWKZ2PdsUt35uzjHZ7sgtbbFgejSMtKBBzpg326LyeqHTmNMFp9C7gWNqRFzxc5/Zafa80M9DZMSQRB8p0QU1ttEoV81hkNTQ18ORCaq8OoPFVVhBS2tmNwkafX/tPr/WlkYnF6wBkJzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.209.35.28) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=arrow.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=arrow.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arrow.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8oveT8erI+TbsiJYfsPNVO5HTmobGZJ+gPB+u7DpGs=;
 b=j9Z9MbYFl51l69x/tCsqnRmTwIUUKIiJU1HGljaQOx0QpZ+6ijd0AhfZzJOMSEHe4FSXn2oAQKXBcyOGOR23vhMyy26LyycNMD7o/MJA+6J7HDblMwFa3o2iEkmKGWZlGUPdOAA9XKFooANMxwEfxndUAiSbS3hMjkvq1JPaOWk=
Received: from CH0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::23)
 by SA0PR04MB7450.namprd04.prod.outlook.com (2603:10b6:806:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 08:06:11 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::b) by CH0P220CA0009.outlook.office365.com
 (2603:10b6:610:ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 08:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.209.35.28)
 smtp.mailfrom=arrow.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arrow.com;
Received-SPF: Pass (protection.outlook.com: domain of arrow.com designates
 104.209.35.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.209.35.28; helo=us2.smtp.exclaimer.net; pr=C
Received: from us2.smtp.exclaimer.net (104.209.35.28) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 08:06:06 +0000
Received: from DM2PR04CU003.outbound.protection.outlook.com (40.93.13.56) by
 us2.smtp.exclaimer.net (104.209.35.28) with Exclaimer Signature Manager
 ESMTP Proxy us2.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Tue, 7 Apr 2026 08:06:08
 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 29245543
X-ExclaimerImprintLatency: 4102290
X-ExclaimerImprintAction: dfff8001944049e9a1b51475db04b131
Received: from SA1PR04MB8467.namprd04.prod.outlook.com (2603:10b6:806:325::20)
 by CH3PR04MB9055.namprd04.prod.outlook.com (2603:10b6:610:169::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 08:06:02 +0000
Received: from SA1PR04MB8467.namprd04.prod.outlook.com
 ([fe80::c83d:94f6:3db4:b578]) by SA1PR04MB8467.namprd04.prod.outlook.com
 ([fe80::c83d:94f6:3db4:b578%5]) with mapi id 15.20.9769.015; Tue, 7 Apr 2026
 08:06:02 +0000
From: Tomasz Merta <Tomasz.Merta@arrow.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
 DSP_A/B, LEFT_J
Thread-Index: AdzGZVC4qIPPf2M+RiOWkMZiITjWKA==
Date: Tue, 7 Apr 2026 08:06:01 +0000
Message-ID: <SA1PR04MB8467F5A56C565316DC5C1EF2935AA@SA1PR04MB8467.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=90453b47-5ba5-4aad-96e1-cb05bb00593b;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-04-07T07:56:30Z;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10, 3, 0, 1;
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arrow.com;
x-ms-traffictypediagnostic: SA1PR04MB8467:EE_|CH3PR04MB9055:EE_|CH1PEPF0000AD7D:EE_|SA0PR04MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 191dbcdd-f937-4c46-65d6-08de947c8694
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|55112099003|38070700021|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: G7FdIPSJ4QCh4kWLOxNp3wDw/7RwRmdEEZsMmCjuFj1Fyvb7QlGvdcidmTLwvzYH1VXq1OaOPoKb//e2BlEVJcg4nN0wBfv4lk09uapgbyZj2Cq+n5zPjOcQzOmB/HxWmA41OfY0x0iSEXW3ZIPIgs8HUqz//2hEW7w+DIhgHJQgcx46oBf6s3lHUG4O9FdN/avuozB85iYxnbKHvn4Up9F9ezOqOxz00SkgPDiskJDm6H5hQwxIEiRa1ZSLaPw/iaceccMvaw4fKGHM5Oa7Ziah5cXjJnor6ORdBqGDdwD/bPiqJzPdyqJwjA9H+zgBoxxCN+ivTNXD9uE777QPErOpn4b94iVxnEJdu22ksoTDqoXfJzOFMthL4Xmh9S1sjhqmwuqNOpA0s0PocQFdurTlnyOAxUfa6sU/ns5cG1MM55J2RbgHiMF/ylj1fMNA4SBWgI9DldWnNnDcbzqqK3A6xxf5S+VojleC4zyto8OC8kzYyTjp0HDQodnA3OwZUs2rolwso3jhH10RRcmIwfuUCo21ZLHbhH3lV1KlgykMOHMIYSfT7dyXh13QwWqzPq8LdFfndz2iwSn+o8F6+XgU/el8KmTLnJlLAfaC9iKISo6q/y8gdseGYRWjoJXojHtt/v4DOdQRPAgGuALxGtJE7e1cWYh4cxbwAKmBaaderekKd4KNwjeuksQw7V5tCZ/gtWRlkZcL3YGcm6ZaY7rwM4Jh4Uw8SDYfrMydIRV23D4adk5G/VUs6AazNp+zIp8NRi37Wq9wRXK2efH8VNu+Fp8pVYS+VilT3Bye+cY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SA1PR04MB8467.namprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(55112099003)(38070700021)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nsIdWuSzYFtK9HL3kFCejrhrsM9JT+Rik1Q8lKrayh0dz/+YhtqBAvWbDiUuQUSyxWUhIihLrGqeBh+QE5n2TcCIy1rkmmKXxyCKY63jy6NXgls4Yk0PIB9e+L8uEx0xapm8lwSVjCsa5jdysEma20VtVlizMjqGgnBO3hHAXUW1hRouVy7gRxF1OaHsHsdj7Ji9tRkK06bUDYkD0jnbXGQYAlzNAOF0EiZkvJfhsFyFgPEeEW3x3WZ//gzMLpv9R0JKVGF1wk726U3L5d5YvKYY4K9URRqIIx/IaWf2p1zZ++1thl7u4YIbfLIQQBL+cbTGtmgwokICbsrhFVGrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB9055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4253c063-1b0e-4025-2e1a-08de947c8295
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700016|376014|7416014|35042699022|7149299003|1800799024|6049299003|82310400026|8096899003|4076899003|55112099003|56012099003|13003099007|18002099003|4053099003;
X-Microsoft-Antispam-Message-Info: mhe4XPLE4xLT/+D7es88/njcI4ac5hgTco0c9qpVRMUNNif7Yf9MBzHNwi7XcGXmGOyh84o/WA43USo7/DF5BNkzg6cKnIQh8j9JWVuRy1XhPNE13n0BSUlL+UaPggACY+l8D9Ae/IWe+xaHZ8jxNJk6FpSXbNZNm6KPIPKFPlJvPKVz0H/CTPywvsL5Ssj8JPv3oZdUxvdyks0/JAXYt6kfqVLGQIN1wfZyGey5ShQPkY5hEBMeTmnNUjch0GK/bjRD62uzhXJ1C6t04ADuzgQK6iv77X5rmgINwS16SHAAT9Bh55t8EMa2prYaHCT4JaypeSpxc0oDJvEDYLy8//MmSK70PB8Gtgm+AJrYSjkCCGot7piMRfFpa0n8EqujmbalpxoBv/gMsYLFNDkVqS74c9vPyuR4MBGwTHgUtM1u1RysfA1qpo9xZ6RbvnH3O0kRQMpS63buz9/bfZNz/+s/ikLOwrACgAb5Q31Ai+wQFwzClOEAmPFButTzbKV5UkYmJ+ifFgc2iS3HmvAaIJDasuNycmAeQwPGeVrD2gfNcFGUOl6yVZ2Xc13sbXK753fp1tj8oXzu6dRQ5LitoE21UDv5eX3HHZt1ZGXhOj4oc3rhnq05RwHi3XjF4a/krdEMGHndnDFsBbiXs5d5f7i9uGxBcle2LxjcK/nnPmQjubbtlx+Eay0BC6e9EtVYEMYPvERfjCNTdlV6HGunt3MuRbe7THVWZY4G9Hkr9cY=
X-Forefront-Antispam-Report: CIP:104.209.35.28; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:us2.smtp.exclaimer.net; PTR:us2.smtp.exclaimer.net;
 CAT:NONE;
 SFS:(13230040)(14060799003)(36860700016)(376014)(7416014)(35042699022)(7149299003)(1800799024)(6049299003)(82310400026)(8096899003)(4076899003)(55112099003)(56012099003)(13003099007)(18002099003)(4053099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nL8QuytiSf1pJ9jdsM4lfgMoHMS1Y9cT8orQI0f5HrrrXxu+OUwiC9MU/Kf6TusL2JtzAJOW6E+XeV9HOlSf0bSpaRYSezg+AeCvAG+SEm8xHafW5GQWtygF1xIsD6xbLnsxTeHzHR2/eKTuqexuEYXTy9FaHO4t9ZpG64e2Ju9kFbkMPnxRKYEmPeVZcIWNaE5OVSvMUoo4Il1O8e/eqwhkN7bOTBR4a1wKi/OMYbO95bHRnksND4jQuEGm3mYnfr3RWeGZGbiZMPQWkw+SJKRPm/6gZxqJ+Pu0A5sZ6LIrTuKKBVOGIcf1Q/eMwihSv/cH3ZFrIzHqWGcMukQ42GKI6sSjpQ+LCsEdQumNBGGUqWdK7Seh+7iKMAdfLh0m8Ok431d2ICoV6Wp44/DpOg6E3QYQ1NtqxXPB/2166BYIryusQsKz6JJWbaf5eebz
X-OriginatorOrg: arrow.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:06:06.3621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191dbcdd-f937-4c46-65d6-08de947c8694
X-MS-Exchange-CrossTenant-Id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0beb0c35-9cbb-4feb-99e5-589e415c7944; Ip=[104.209.35.28];
 Helo=[us2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7450
X-Mailman-Approved-At: Wed, 08 Apr 2026 11:34:23 +0000
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK
 polarity for DSP_A/B, LEFT_J
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
Content-Type: multipart/mixed; boundary="===============6634956517332995120=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [6.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[arrow.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[arrow.com:s=selector1];
	DATE_IN_PAST(1.00)[27];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MANY_INVISIBLE_PARTS(0.20)[3];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,multipart/related];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alsa-devel@alsa-project.org,m:mcoquelin.stm32@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~,6:+];
	FORGED_SENDER(0.00)[Tomasz.Merta@arrow.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arrow.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Tomasz.Merta@arrow.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,kernel.org,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[1.000];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6951C3BB523
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--===============6634956517332995120==
Content-Type: multipart/alternative; boundary="=-3GWhCtjqO+4CfCOxYMXJZw=="

--=-3GWhCtjqO+4CfCOxYMXJZw==
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From 553c09cfa84fa801fbd8dcd5c9ae96e94a54ee31 Mon Sep 17 00:00:00 2001

Tomasz Merta
Software Engineer
E: Tomasz.Merta@arrow.com
Arrow Electronics | arrow.com
From: Tomasz Merta <tomasz.merta@arrow.com>
Date: Fri, 3 Apr 2026 10:33:11 +0200
Subject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
DSP_A/B, LEFT_J

The STM32 SAI driver do not set the clock strobing bit (CKSTR) for DSP_A,
DSP_B and LEFT_J formats, causing data to be sampled on the wrong BCLK
edge when SND_SOC_DAIFMT_NB_NF is used.

Per ALSA convention, NB_NF requires sampling on the rising BCLK edge.
The STM32MP25 SAI reference manual states that CKSTR=3D1 is required for
signals received by the SAI to be sampled on the SCK rising edge.
Without setting CKSTR=3D1, the SAI samples on the falling edge, violating
the NB_NF convention. For comparison, the NXP FSL SAI driver correctly
sets FSL_SAI_CR2_BCP for DSP_A, DSP_B and LEFT_J, consistent with its
I2S handling.

This patch adds SAI_XCR1_CKSTR for DSP_A, DSP_B and LEFT_J in
stm32_sai_set_dai_fmt which was verified empirically with a cs47l35 codec.
RIGHT_J (LSB) is not investigated and addressed by this patch.

Note: the STM32 I2S driver (stm32_i2s_set_dai_fmt) may have the same issue
for DSP_A mode, as I2S_CGFR_CKPOL is not set. This has not been verified
and is left for a separate investigation.

Signed-off-by: Tomasz Merta <tomasz.merta@arrow.com>
---
 sound/soc/stm/stm32_sai_sub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 450e1585edee..3e82fa90e719 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -802,6 +802,7 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cp=
u_dai, unsigned int fmt)
 		break;
 	/* Left justified */
 	case SND_SOC_DAIFMT_MSB:
+		cr1 |=3D SAI_XCR1_CKSTR;
 		frcr |=3D SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	/* Right justified */
@@ -809,9 +810,11 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *c=
pu_dai, unsigned int fmt)
 		frcr |=3D SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		cr1 |=3D SAI_XCR1_CKSTR;
 		frcr |=3D SAI_XFRCR_FSPOL | SAI_XFRCR_FSOFF;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
+		cr1 |=3D SAI_XCR1_CKSTR;
 		frcr |=3D SAI_XFRCR_FSPOL;
 		break;
 	default:
--=20
2.34.1


--=-3GWhCtjqO+4CfCOxYMXJZw==
Content-Type: multipart/related; boundary="=-c+3o0ZmeT3w+WyfPTslTGg=="

--=-c+3o0ZmeT3w+WyfPTslTGg==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>From 553c09cfa84fa801fbd8dcd5c9ae96e94a54ee31=
 Mon Sep 17 00:00:00 2001<div dir=3D"ltr" style=3D"mso-line-height-rule:exa=
ctly;-webkit-text-size-adjust:100%;font-size:1px;direction:ltr;"><table dir=
=3D"ltr" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:10=
0%;direction:ltr;border-collapse:collapse;font-size:1px;"><tr style=3D"font=
-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddi=
ng=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;f=
ont-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding=
:10px 0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"border-collapse:collapse;font-size:0;line-height:normal;=
"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0 10px 0 0=
;vertical-align:middle;"><a href=3D"https://www.arrow.com/" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"cid:image=
936329.png@0C50D27C.A5E46946" width=3D"100" height=3D"46" border=3D"0" titl=
e=3D"Arrow Logo" alt=3D"Arrow Logo" style=3D"width:100px;min-width:100px;ma=
x-width:100px;height:46px;min-height:46px;max-height:46px;font-size:12px;" =
/></a></td><td align=3D"left" style=3D"padding:0 0 0 10px;border-top:none;b=
order-right:none;border-bottom:none;border-left:solid 1px #000001;vertical-=
align:middle;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" styl=
e=3D"width:100%;border-collapse:collapse;font-size:0;"><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"padding:0 0 0 5px;vertical-align:middle;=
"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:10=
0%;border-collapse:collapse;font-size:0;"><tr style=3D"font-size:0;"><td al=
ign=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"width:100%;border-collapse:collapse;font-s=
ize:0;color:#000001;font-style:italic;font-weight:400;white-space:normal;">=
<tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"=
><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-co=
llapse:collapse;font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"border-collapse:collapse;font-size:0;color:#000001;fon=
t-style:normal;font-weight:700;white-space:nowrap;"><tr style=3D"font-size:=
13.33px;"><td align=3D"left" style=3D"padding:1px 0 0;vertical-align:top;fo=
nt-family:Arial;">Tomasz&nbsp;Merta</td></tr></table></td><td><span style=3D=
"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#=
8203;<span style=3D"font-family:&#39;template-yWcA0IdBEe-EcwAiSCkyTw&#39;;"=
>&#8203;</span><span style=3D"font-family:&#39;zone-1&#39;;">&#8203;</span>=
<span style=3D"font-family:&#39;zones-AQ&#39;;">&#8203;</span></span></td><=
/tr></table></td></tr><tr style=3D"font-size:13.33px;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Arial;">Software Engineer</td></tr><=
tr style=3D"font-size:13.33px;font-style:normal;font-weight:700;white-space=
:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;=
"><a href=3D"mailto:Tomasz.Merta@arrow.com" target=3D"_blank" id=3D"LPlnk68=
9713" style=3D"text-decoration:none;color:#000001;">E:&nbsp;<span style=3D"=
font-weight:400;">Tomasz.Merta@arrow.com</span></a><br /></td></tr></table>=
</td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-a=
lign:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D=
"border-collapse:collapse;font-size:0;color:#000001;font-style:normal;font-=
weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D=
"left" style=3D"vertical-align:top;font-family:Arial;font-weight:700;">Arro=
w&nbsp;Electronics</td><td align=3D"left" style=3D"vertical-align:top;font-=
family:Arial;">&nbsp;|&nbsp;</td><td align=3D"left" style=3D"vertical-align=
:top;font-family:Arial;"><a href=3D"https://www.arrow.com/" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#000001;">arrow.c=
om</a></td></tr></table></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr></table></td></tr></table></div><br />From: Tomasz Merta &lt;t=
omasz.merta@arrow.com&gt;<br />Date: Fri, 3 Apr 2026 10:33:11 +0200<br />Su=
bject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for<br =
/>DSP_A/B, LEFT_J<br /><br />The STM32 SAI driver do not set the clock stro=
bing bit (CKSTR) for DSP_A,<br />DSP_B and LEFT_J formats, causing data to =
be sampled on the wrong BCLK<br />edge when SND_SOC_DAIFMT_NB_NF is used.<b=
r /><br />Per ALSA convention, NB_NF requires sampling on the rising BCLK e=
dge.<br />The STM32MP25 SAI reference manual states that CKSTR=3D1 is requi=
red for<br />signals received by the SAI to be sampled on the SCK rising ed=
ge.<br />Without setting CKSTR=3D1, the SAI samples on the falling edge, vi=
olating<br />the NB_NF convention. For comparison, the NXP FSL SAI driver c=
orrectly<br />sets FSL_SAI_CR2_BCP for DSP_A, DSP_B and LEFT_J, consistent =
with its<br />I2S handling.<br /><br />This patch adds SAI_XCR1_CKSTR for D=
SP_A, DSP_B and LEFT_J in<br />stm32_sai_set_dai_fmt which was verified emp=
irically with a cs47l35 codec.<br />RIGHT_J (LSB) is not investigated and a=
ddressed by this patch.<br /><br />Note: the STM32 I2S driver (stm32_i2s_se=
t_dai_fmt) may have the same issue<br />for DSP_A mode, as I2S_CGFR_CKPOL i=
s not set. This has not been verified<br />and is left for a separate inves=
tigation.<br /><br />Signed-off-by: Tomasz Merta &lt;tomasz.merta@arrow.com=
&gt;<br />---<br /> sound/soc/stm/stm32_sai_sub.c | 3 +++<br /> 1 file chan=
ged, 3 insertions(+)<br /><br />diff --git a/sound/soc/stm/stm32_sai_sub.c =
b/sound/soc/stm/stm32_sai_sub.c<br />index 450e1585edee..3e82fa90e719 10064=
4<br />--- a/sound/soc/stm/stm32_sai_sub.c<br />+++ b/sound/soc/stm/stm32_s=
ai_sub.c<br />@@ -802,6 +802,7 @@ static int stm32_sai_set_dai_fmt(struct s=
nd_soc_dai *cpu_dai, unsigned int fmt)<br /> 		break;<br /> 	/* Left justif=
ied */<br /> 	case SND_SOC_DAIFMT_MSB:<br />+		cr1 |=3D SAI_XCR1_CKSTR;<br =
/> 		frcr |=3D SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;<br /> 		break;<br /> 	/* =
Right justified */<br />@@ -809,9 +810,11 @@ static int stm32_sai_set_dai_f=
mt(struct snd_soc_dai *cpu_dai, unsigned int fmt)<br /> 		frcr |=3D SAI_XFR=
CR_FSPOL | SAI_XFRCR_FSDEF;<br /> 		break;<br /> 	case SND_SOC_DAIFMT_DSP_A=
:<br />+		cr1 |=3D SAI_XCR1_CKSTR;<br /> 		frcr |=3D SAI_XFRCR_FSPOL | SAI_=
XFRCR_FSOFF;<br /> 		break;<br /> 	case SND_SOC_DAIFMT_DSP_B:<br />+		cr1 |=
=3D SAI_XCR1_CKSTR;<br /> 		frcr |=3D SAI_XFRCR_FSPOL;<br /> 		break;<br />=
 	default:<br />-- <br />2.34.1<br /><br /></div></body></html>=

--=-c+3o0ZmeT3w+WyfPTslTGg==
Content-Type: image/png; name=image936329.png
Content-Transfer-Encoding: base64
Content-ID: <image936329.png@0C50D27C.A5E46946>
Content-Description: image936329.png
Content-Disposition: inline; creation-date="Tue, 07 Apr 2026 08:06:08 +0000";
	filename=image936329.png;
	modification-date="Tue, 07 Apr 2026 08:06:08 +0000"; size=7783

iVBORw0KGgoAAAANSUhEUgAAAGQAAAAuCAYAAADeIbxeAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAABB9pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2
NDQ4OCwgMjAyMC8wNy8xMC0yMjowNjo1MyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5z
OmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1
bWVudElEPSJ1dWlkOjVEMjA4OTI0OTNCRkRCMTE5MTRBODU5MEQzMTUwOEM4IiB4bXBNTTpEb2N1
bWVudElEPSJ4bXAuZGlkOjM0RUNBRTg0MTI0MjExRUJCNzIyOTlCRjlEMDM3MkIzIiB4bXBNTTpJ
bnN0YW5jZUlEPSJ4bXAuaWlkOjM0RUNBRTgzMTI0MjExRUJCNzIyOTlCRjlEMDM3MkIzIiB4bXA6
Q3JlYXRvclRvb2w9IkFkb2JlIElsbHVzdHJhdG9yIENDIDIwMTUgKE1hY2ludG9zaCkiPiA8eG1w
TU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyYjM0ZGY3YS02MmM3LTQ5
YWUtOTk2Zi0wNmU3YTBkMmY2MDMiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rv
c2hvcDozYjdmYWNkOC1kYTE3LTQzNGItYTA5Yi01ZDVhZDdhMGM3OWEiLz4gPGRjOnRpdGxlPiA8
cmRmOkFsdD4gPHJkZjpsaSB4bWw6bGFuZz0ieC1kZWZhdWx0Ij5BcnJvd193b3JtXzVZT19Mb2Nr
VXBfYmxhY2tfcmdiPC9yZGY6bGk+IDwvcmRmOkFsdD4gPC9kYzp0aXRsZT4gPC9yZGY6RGVzY3Jp
cHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6uGrvlAAAZ
3klEQVR42sRcC1yUVdqfgYFhAAEBkZsKAgpe8Y6aleYl866ra1aWtvbpz0rTray2tq1Ns9q1zG6W
XdxqdytZNsu8lKaZ+pViimJm3EFA7pfhOjDf/3n3OfjwOjOg9X3f/H7nN8z7vuc5z3nul/NiNOg+
drvdiC83HkaD448do5WHwWg02nmenNuZTzs4/Pn/gNHRR8G3014FnVyt42wOPesu5tC9lrZnHTDD
hGHG8MLwcLAYAbBhNPCw8TV3Mc+zE8RQcOoZTgtvkOZa+Nu9kzAaGY6N1zUzDI9fgSlEqCaG3ygY
7+5iHXqmWdCoRcyh532YTkZ+zopRR3+bdIu78YQgjGCe6O4AQVqkAuMSRg1fM/O8bhi+PM/YwUZp
k2UYJYwQ4dOVYfjx745gEJHKGRcFI/Aq8OgMw2sYx3Leu9EBnSQtbYxLKY86vu7Fz4dh+DNuxIxi
jEJax+RAO7pgRKampiY8+uijM+vq6ixQubYN4U/bbbfddnjZsmXHmLuNjAAhFZqVldV39erVsysq
KgLkPP3HZDI1L1++/Mv58+cf5002M8Ld6uvrY5YuXTqvoKCguysYhMvs2bOPYb3DLMUtDEPD4/77
759TVVXl7wqGS27gExISUvLuu+8m+/r6uvNem1lwidnh58+fj3/ggQdm1dbW+hrZdvv4+Fg3bNjw
aWJi4jneWxMz1xsjJC0trf+8efNWVVZWdl2zZs3f1q1btwfXqwXjtMXdMHwx4jHmJiQknGEgVwwv
Ly9rYWHhEjw3DCMIwxujJ8bk6667br+zefoREBBQSmthxGH4Y4RhXL9o0aL3OwvDw8Oj8aeffroL
8wZidMPoRXiMHTu203h0NEC8HYA5hfdoIZpjxGLMHDp06HeO5gwePPgE7s/ivfnwPJo/Zc6cOSnq
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

--=-c+3o0ZmeT3w+WyfPTslTGg==--

--=-3GWhCtjqO+4CfCOxYMXJZw==--

--===============6634956517332995120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6634956517332995120==--
