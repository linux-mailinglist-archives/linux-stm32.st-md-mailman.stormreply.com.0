Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECA24CB51
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:22:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10433C32E8F;
	Fri, 21 Aug 2020 03:22:17 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3526FC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9obGZlwptm47gYhr44j+h9JyMSU0i5J2pRb0n7mIer9cz+UlOEhFg0rAZV3bAR7kwG+1Z0BhDv61uP/48bJLcxMHjVLV47M85eSKJM3+XHCM7KostBCk0YDfT/jSaRRbxkfQmutjS9an6fBVd1J1/RbhA6aOwsytxFg0FGbUzcFxutKcHCh2TAJX2MguSuVui/Gt8pARRxQoP0qJllISpQeQ79JU1ev7tz6Z4SfxCNWpcOOgK95e40JkKbIfruHoNFOLwJUMHkkHOIqgRZt3HjkfHnZq4KPG6LJnYgn0gifCJQAgpLtOo7IbVHZsfl/W0gHmIkZcqk4JIGFGH5xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTmvjlVtgfq1yK2IitGGD8aYtPi75tv4zJFYz3/H+Ug=;
 b=meT+x6AJlrofhtrR9UPLVCj0IenXUmGQzX+yAcukBCaj69FxQnQf8tdQefiOcZut9dpl2Udxl2xownAe3PxrC9qMmcpRPceU7bpd6sNt+VlD/WOIHbBvxJRQt+qBsaefnBUIBzHixxsO56WmvZkHqe8L7jwVLkHF4K4FjFMNMCbQ4FenvbDCMiEINCXNtV2aKQhY/+mpU74gJXiKlhzFGFpmlV1rDC5eiNwRMQmXirod0lm3qSr5vAl3xxMrylV58V/V7ZF9RnAsXvFy1czv18CMvomql1G6m+ktnczKOufxS3R9BvdgecuZ+cvu3Ba2LxgDaatb+cz8hS7dg3Zh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTmvjlVtgfq1yK2IitGGD8aYtPi75tv4zJFYz3/H+Ug=;
 b=OJ42hnMzzdtYhMyBS8+x5iPtcJ/ikvmIaZ5P84Bw/2w1M0xVgd//eXcf4dMxXCJ3BTwS2nvjyld5NJ/+9roBlsFnOpRfNa0RM48cl2iD3S4gYGtfI4uPveLFSppD4mMvJndeci5OUSSM2INvI+C7eAYWIvDJb8fPXDUcTHlrJks=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:14 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:14 +0000
Date: Fri, 21 Aug 2020 11:12:35 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111235.14473a88@xhacker.debian>
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:10 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23f29cc4-406b-4063-b2ef-08d845816636
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB461782B28B5549B1ACDA01F0ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VeQqKZdW4QaoyzP1jfXdBHeYt/9MuDvoiO1ikCcGU3JDJlNBarrM4Bk4GQYxIvIUtqeCLwqWZEz8DRy15+eudHfYMCp1WT36lKw/bn9Bo5IHKT6crGozOXN83xKSS8I9a5BXrfCgEVIKWVv91UYev+0QWNig0jk6cpZEcalbrve/jIKbkWlpdlboMp1932UzYHCsClc3YgmjLgg3pn7atCNYFtNBTXE3A4EVVAMoCwBSKBkbzZHq6oL20yfXsrjE2Or+StAzSi414Bz/YkswptlvW0BUvHcBYvlMT7YDhOdHpwYtZtGTL/lRtzzoYFCTr0c6u1hj8X87zjnRY442nLIiCwVvoPMjPHyjri388l78W7tW2jfCI1T9Wkv/0+UD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KHCHJuOXlakqF2+bK69ydyD27i5DzpcONE6hHHVWWh4RSKuhEerhJ4LWIns02nBF8QMjeJ5fADeUhYYANrStTPAE+gOLf3MNmgofjrodoqNo0++YRPdnOUkBYwftkZtQ3f2lHNmSEd6yzKzR/QoYSeJpNS0sqgiSnDaGz14DzVweruRI3Q0+nHZhZh3+zXqiF+ITDDwQdL8hOTnMYV2MfXsDv+7uGv0k8lhTchzKWhUb21o8D6ywtoAWcEzXBhvwb+/9PuFKg9F9TeQH1bT4SEWsNbbTauiUPrhN0v99t/MMA9gB4g1aXOSx2P/t23wUKxkD3/4ahlcW5oWULwiN0yk6WC5VNdXJ1xFlk6iKPRnZ7nrELJGHnilCbN+J4/VylSIz74j+1Xi9yRFDwZmPpzvkjkKDCvPVNLvJPuNWSXbltosCXQIEBfmd86Gztm/0lJaaywoG3bGEsakoWQdavnN+VwdXkUIqJliaqFUC3X1YLMUXjxUpLeFznloRHvIswucumUqrE6AJIG8zB2s9j1E59aArprtFz3xFH701sMpdOX7LSY0BROe+7RIvroSeri+bbCUzO/w8HCk6DPJSQQx8AAST0XftovPMiNEbLyMbvTJGnMER/hf5VFxi/dCI3ui4IPLwnRgQDBxV9msq0g==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f29cc4-406b-4063-b2ef-08d845816636
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:14.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOflTQWWlL3g18qIyxRMpvZ2MGn22M/plAzYV4RB7fGnQrtq3GSapcY/hQM9XAj7vnw3wxxhQZ7GNYn7fSwTWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 02/15] regulator: da9210: Fix W=1 build
 warning when CONFIG_OF=n
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL2Rh
OTIxMC1yZWd1bGF0b3IuYzoxMjg6MzQ6IHdhcm5pbmc6IOKAmGRhOTIxMF9kdF9pZHPigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAxMjggfCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkYTkyMTBfZHRfaWRzW10gPSB7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRy
aXZlcnMvcmVndWxhdG9yL2RhOTIxMC1yZWd1bGF0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVn
dWxhdG9yL2RhOTIxMC1yZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVndWxhdG9yL2RhOTIxMC1yZWd1
bGF0b3IuYwppbmRleCAwY2RlYjYxODY1MjkuLjJhZWE0NDJiNjJmZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9yZWd1bGF0b3IvZGE5MjEwLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZlcnMvcmVndWxhdG9y
L2RhOTIxMC1yZWd1bGF0b3IuYwpAQCAtMTI1LDcgKzEyNSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBkYTkyMTBfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKICAqIEkyQyBkcml2ZXIg
aW50ZXJmYWNlIGZ1bmN0aW9ucwogICovCiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGRhOTIxMF9kdF9pZHNbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IF9fbWF5YmVfdW51c2VkIGRhOTIxMF9kdF9pZHNbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImRs
ZyxkYTkyMTAiLCB9LAogCXsgfQogfTsKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
