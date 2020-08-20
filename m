Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9824B07E
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:52:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514ACC3FAD8;
	Thu, 20 Aug 2020 07:52:49 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBC27C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwIvihp/QXca7zUxiLRHTkF9SlWE0SMqpVHYEkAK8syrrjMMU7uzDSc7geSltKDabRuMhNQYy4hyWiVMdsrDQsibm9/yXOvvO97B43sJCZmDnkXGhs4fp19KI9zN79LSFHtw6fjgiw5O56DZDdlTuGevxZtcFlTchVXKwPEmjncuaMoXmHffAaLR4Z6TgJqIiRPUP6V8BIqlXCDzr9w4I/1B9tMHfm+WUjSmCY9DA+fXef7rH6Z1OJpji3fO4nkqzLGWQg/4g+bFE2dWm7JydPOxLyWHqEVtrrYtfGu9ckmM8sp/hTgkyW9VQplX09VArcJ4tadRPxigJLok5PQwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRi3V6FNJkkTIWaeuZ1/4YbTh9G8sffk/HVDfxbdOmU=;
 b=IKmhP8Hn8AzKWVaDTj/NRg90zKrXbYXvqz37PLAdABcCiaSxl7QNspcAgSPuqYktokjdD1B5cXk0j5ey1+nhuKnoPkuJ4/eX+VVrXP4PBeWt7P/OD0gm5AOd00/iH4UA2k+qw070wz+8VXOKts9HI1ScFLvrKmDsZam4ouPMZBtcUcXiAwAjMyXheySmaQkh//nIKNKsDw5X3lpd7iamBaWZ0YbMzU/kogsKr5k3EzVoHnemugo4Kbp6gfF3j0Uiyu+4IrGrmBIQetMuJ6m/b9KWb6jhOem6JKsm/aRcuQd1orIi1dNXMyPyGGliQdrDGxdTCMRQOzu2WJsudOXzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRi3V6FNJkkTIWaeuZ1/4YbTh9G8sffk/HVDfxbdOmU=;
 b=lUFx4LtdEJRh04bEicQI8zEZ3R1Cqw0X/FWQsT0GtzToy6xytMxybHqokHjfHXTSELj2QCDESyapZNq8EdKy/bzVtN0Su8kG3v/XisSHCmeZxenKgkM/XxhhHrgbzn+fxtsvxI467PkbZZVx4MT4E/8RRq6L1K/sEUg/ahp+KZM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:52:45 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:52:45 +0000
Date: Thu, 20 Aug 2020 15:48:55 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820154855.46881c8a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To BN7PR03MB4547.namprd03.prod.outlook.com
 (2603:10b6:408:9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:52:42 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f4b5e31-caa7-454b-c5f9-08d844de062f
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4563ABDADC7B593F2F7D7097ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktaDe+ueVbDfddZNt7E988Ne7koaqgzzEmXUeTqTrludGbH+DWhQ/0uNsa/xxCsYvglFUvIf1HaYfuoFcOMPBfCSq3f8z/mFNL4PQ8zDSUmGy/fYiW/G5fwfRXyU7MlH/ocKNLUuJv7x3MkIVJzKgt12YnaPSbAInuvbT7L3czSh19Kj5I+9hE2BwSW3lQw6UyEWzvzrz2zKNWycu3ZpJBW9djitId5GCWdS8r8Fx1vzYbFRI8UgCrado5rLvH753K9dFS++zNVF8UgfuIw4sYzAj+q7W2ToeK5u18mG0OzfTuiwSK17FC7R0MKdQK1TmaN9SQ6xIb3vo2jlZLABpoyhQzYuw1wR9IRCT0mxaEo60zgmxGKihvWf67jTzYKb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZC5DCiUXK6U1isQmVa9P8s6DKrBFNcwTgx4jMItlmsLKql8MJ5Am2BA3JJnfdKzKO7A7C2/Z0sL9US/Uz4MxEWVAuNJI4Liv0fmPeZEPsfHgm6LFcefWD4eP6FwCb7zQn13+r0SvaHK7WTHV6iGFknOQgppw/9+G6kLDnieC58IKVXOOsRVDP1b6EVxVgVppcyBg9sAtgtMKyJ5mwceyzRAbnBkn5t1vsSBdP/EeD78BDEhqtQlnfHkSb5Hc+QFA2u3MlHU13k5Hbh2qesIvMTeXaDxohwDz7FQMovus2hM9okBaTL2tZH19bnSQnhoRYZ4cmk0xDbsY8xiPE+BebOacSXq3azL+U4NFtecUC9przi44+0XFV/JBhdBCCQWXEfg9pF6RjziyojQLLAstiqqqnwUNgrUVQfIOcjtqBv2SigNHCkGRcaglr/Cp9kGcdhKl/jBKB5A2zlEvxfDhbrotRhq6lqrVsskcChCdH7c2hPhEly5K0cmwnP3t5+X1De6FUVICoPmQQT9/nOBuHPpKbR5iSijZrC9bIZ3traJ0XNbu7zxYnR2VP1EfeTRD7XMZqrlMrpqvC3heTi1M1t4v1+kSdrC2c9Ryf9NZZaFvAg7701+w33NRZlwDTwe06sjGrW8UPzXKYEp3cNQS6A==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4b5e31-caa7-454b-c5f9-08d844de062f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:52:45.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OG03/5xRyVzMENtl3uH3uLRJ0mYcm1U2LzsUoF+x6M/5ZZTWm03L/vzrWG70xkGgfyMf5EVuqBIQKkWKBCxCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/12] regulator: Fix W=1 build warning when
	CONFIG_OF=n
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

Fixing W=1 build warning when no support for device tree is there.

Jisheng Zhang (12):
  regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
  regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
  regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
  regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
  regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
  regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
  regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
  regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
  regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
  regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
  regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
  regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n

 drivers/regulator/88pg86x.c            |  2 ++
 drivers/regulator/da9210-regulator.c   |  2 ++
 drivers/regulator/fan53555.c           |  2 ++
 drivers/regulator/fixed.c              | 16 ++++++++--------
 drivers/regulator/ltc3589.c            |  2 ++
 drivers/regulator/ltc3676.c            |  2 ++
 drivers/regulator/max1586.c            |  2 ++
 drivers/regulator/max77826-regulator.c |  2 ++
 drivers/regulator/pwm-regulator.c      |  2 ++
 drivers/regulator/stm32-pwr.c          |  2 ++
 drivers/regulator/stm32-vrefbuf.c      |  2 ++
 drivers/regulator/sy8106a-regulator.c  |  2 ++
 12 files changed, 30 insertions(+), 8 deletions(-)

-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
