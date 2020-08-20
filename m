Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A747624B083
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:54:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D524C3FAD8;
	Thu, 20 Aug 2020 07:54:00 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7CCBC3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG9f9cE0u1sQCD7+niTvpJnC1WFP627UBRWRHK9OAB/8mSxmAKGnCyriB9URqBH2vCwDF6TQIeHfoQKaj9PXxWRl0tp5WiB8ku6PulMOl/N7vmxlnMMBLss2BLX8+dBDY2Vo+TkaphVdlQAes1xv/d1fQmCg9toxrlFkmqYjlqWUakozb7fvrqlJ73MwQSYcc3NGJOduAp9QLyKfh5NY8oV8oKe7ah1k2yrJZ9waHLTM08c0Y8BrdNUphcfCdAyJDkjm0/GiRPaR0T9NA7e6GhHoiZBxUxTSQbJmmFv4xoO0/ktEpM2SGd+F01FRlbAPSuqyQEPYO8r1bY/v6wjY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idRfbtuXcxttm8DJ5dwgdNnWSAjl1gQN3akJ3AMtUuE=;
 b=M9ghDbJo1xRVl5ZXWZxhFPklNdoosf1ILes6c9qis7tNJBFr2WKUy7ntO3KCrOuodukTCQMxZpgbiDzRDHd7th0xAKwOY4WiDQqWJ5fh4JG7at+oyyi2NBjhaYJlh2krebbo8Y7YCcIOLXbkAateBaIJyAH2CHPH1FUPGwHMBPLlNhQwqelosW1jG5SK+ITfEXmZKkS4pzjbyDyNzXL404Mhrndb69KbVKQ6Mnb8+rq3zDbDcXpzyG3OD11aN/cePb+st1WIhctK9NPOERfmQ9KjDTgt152CRdJFnZ/0PKbxmckmv9DDR2KuYniQXNcEivjt5ZiQtXP8nD8WOOfDfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idRfbtuXcxttm8DJ5dwgdNnWSAjl1gQN3akJ3AMtUuE=;
 b=leOQQCQXkNP5S5fbHy/CI4IQUjpMYLGpL1/iqqfhfzil8Vp+b/BQ/UeNZ7Va3IYmazEq6vvNCrkuZHI5/YVKn83t1TtAyIiYMGxWyfkrbje1dJEq+G7LR2KU/rYhV3zTWK0LymFVicVhPnh8+K/2Jxh1aMtusDStTOIrfKSbZ04=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:53:56 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:53:56 +0000
Date: Thu, 20 Aug 2020 15:32:13 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820153213.4d9a9666@xhacker.debian>
In-Reply-To: <20200820152926.42c48840@xhacker.debian>
References: <20200820152926.42c48840@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To BN7PR03MB4547.namprd03.prod.outlook.com
 (2603:10b6:408:9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:53:53 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be45bb7-77c4-4657-52d0-08d844de30ac
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4563E87A49C0DB997BB1E253ED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YY6kj9JjzEglhivnKaFa/6ijaAei0xoddw0Ru/QDWQmwd+YD2cf8B4/3NBnut7Fzf6Zdkeq9Y3h48kd6myS0d+CMUPW/a8slTmISQeNJWcDLl03W69lISR1cfIJ2gWdFFYikdVfNCg+YYx3h4f/rZilctCcJHvD7aHcnI9/RRiirOPIp7IgQl5fkhPcpjhQyPFQfgzhwV8Qosvg/H92jL7iSfuHY1tMM+H6wtDwdG9/lqgnAWmFWx3jEbhhx+RYgAv2tlQeWQcyVxY8G5JT8mczmXHqCU7Mp3KRzDwjBN5XznV0QVZktRYaCmEks2mbdtwX1FcpzC3Yufoui7SLrVWkby6esCmoqXAkDQT6sNGEO/MBrR0FxKjCgiXrX5XOc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RQeSPSspgDrpaiAbdpqLngAeM9m2qJZls/RLow5DK/tsIfSgesYsIN7RXNYJrPmtCMEpIQLYups4qd0Nvl/CLN2s3H393wriCuuoCZnihuc4oqlabg5nE4Pix4bLavgxuSmdbT1nDDj5aj9++E4jb8EgC4i9P/U+3QtxloSacSnWkhEUezSG6qzDgkBGYJiiWhqQy+K83iywsD+jhp2L7ZxIsXyJIb/sYRcnMWJqId2+HlcB5JhvGsD4PnMOIHvCfPfg/uyYl3m2Dcw0GwTXXh3Kt1X+ByEMgue5c5Wte3kk/7WCDlqmeyYLMcbF+c7n2VrSEARWMtBIaQ0mkMhZKViMuMUR0Bw36HQyaEq6wY9ck+T66+sscuNRXZQ4m+uKiH1c6iSA1YtxeQasaGAXc9pxo46y8hqIUiEUFLLtzkPQ6mF9uQggKO5aFRJJ8p8qv4FeY9VDTrJaTdMZR+Q73baNUAYVRUIfr8OrJfNMyzhqznnsMb1mrJoSXZ7dd0LgpSOLa68kPyn/lQHEzC5JIzrqdSwd39oqYj7LlS1i6SGLom791BspXaaiqlJwJOVUdLJpvMdNy+8LKRbGxfBxPlGlMBMAMA7EbkLLzLfrIkXAb7cXn1xJEH2+89Fdq/4nvWKHzwlnYuWJqjL0uSFZew==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be45bb7-77c4-4657-52d0-08d844de30ac
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:53:56.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kgok1vVjyRMINm3D6AY/jwYNGuZT8fWj9hU96JgPu2r5kpd8g1TAgLJPdXy7N+GpKeBK327JGJmh+aQQLket6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 01/12] regulator: 88pg86x: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yLzg4
cGc4NnguYzo4NzozNDogd2FybmluZzog4oCYcGc4NnhfZHRfaWRz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCjg3IHwgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcGc4NnhfZHRfaWRzIFtdID0gewogICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFu
ZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yLzg4
cGc4NnguYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3JlZ3VsYXRvci84OHBnODZ4LmMgYi9kcml2ZXJzL3JlZ3VsYXRvci84OHBn
ODZ4LmMKaW5kZXggNzFjZmEyYzVkZTVlLi5jNDdjMTRkMTkwZjUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcmVndWxhdG9yLzg4cGc4NnguYworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci84OHBnODZ4LmMK
QEAgLTg0LDEyICs4NCwxNCBAQCBzdGF0aWMgaW50IHBnODZ4X2kyY19wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqaTJjKQogCXJldHVybiAwOwogfQogCisjaWZkZWYgQ09ORklHX09GCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwZzg2eF9kdF9pZHMgW10gPSB7CiAJeyAuY29tcGF0
aWJsZSA9ICJtYXJ2ZWxsLDg4cGc4NjciIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJtYXJ2ZWxsLDg4
cGc4NjgiIH0sCiAJeyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcGc4NnhfZHRfaWRz
KTsKKyNlbmRpZgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgcGc4NnhfaTJj
X2lkW10gPSB7CiAJeyAiODhwZzg2NyIsIH0sCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
