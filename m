Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176E24CB63
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 05:24:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE50FC32E8F;
	Fri, 21 Aug 2020 03:24:17 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02715C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 03:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGgqyTAl0CYk4FoQckzBjk/L9QqB9sIZf/UxF9cy8gscWiDe6CKO7CHrxLC6hE2Mvp+R9oVUCinEjCvnSW+T1q2Uec6k2lZTPkmm0CTz3p+K3+aTbIy5KXfmURiNjj+jzvmtBItxNAzFc4P35zYO4FoA27gSzTkblGIRfMNdmE1T6Kip7g20h6grHG7XDgKVDM25DT2v3d4hIcoB4QIe99BNZbT7EO5AZS5xZ9zU0KImhJudJqBueaAvxSIAuA4BGlRX/bd0l8eSzSH9CoOWpvu37hqSjyMp49NDbVNfQ0km3i9XDG6uqKMIVclwTatdzsZussvZQLVrLgRq4cqQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL9/r6+ll0NF1Y/kbEJugrkxt8+RNVyCXvxply89DKw=;
 b=D8re5+twJjWFWBn6i4OY6Y8RMyX5QBgVouaafN2CriHQ1lgiNXXvihEYp0QP0tCXytQWGR5vs0Ca7W0mx2AUtINPlIBHEXyCLnDK3JjJby7rwGIc8bZYgNfV4cdrzlz7BgZgGMaPb2/7+WHtQjTrqAvuU7z1SfVy8Co8eP9eYMSwlYq92lxs94C1Q79+qpp2wXckSFyq4jWtoAKsCMahvRv6bqUcT/aJQXcsFWJHsek7cMU0zooQF5HI2cBW8Whhv1+CckZluvj+ZjxuyqA1St91B1PMQAgUoZFNh36Wu7gG1tt8vkRIvnihEbQ9ihEw045NpwLQf5ys0wN8ATOgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL9/r6+ll0NF1Y/kbEJugrkxt8+RNVyCXvxply89DKw=;
 b=TUZY2Q9UgNdO75wDbqY+CxWMY2idiv7zf9A/9CuA5qm2JmP0SRn/qXFNv6XOD3ToNbFamR5HR6KZUTET3L1ZFmKovkWbmC9rx+U73yVAnUKAJkzmx9phKQ0icj7wmda4FwuKl0E9tCyRMAW17q+GSx8WIZfj4sBIg7aYFhyIl5s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5308.namprd03.prod.outlook.com (2603:10b6:5:242::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 03:24:14 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:24:14 +0000
Date: Fri, 21 Aug 2020 11:18:20 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200821111820.5c6ddb04@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:24:10 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbffe17e-23b7-42bc-1138-08d84581ada4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5308:
X-Microsoft-Antispam-PRVS: <DM6PR03MB530826ADAE22DA2AC56E0A6FED5B0@DM6PR03MB5308.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbG1598npT3dwXkM5rNRKSkRZ9VbnqFisjrxD/9L8RG8ZLRsnMpKz61Q8ZOTNN9agySFGFvL9vea+/pEB/z08K3QI/8JEe5t7HZo9PJUWIFZXG/uQySDzj7j/OIqAhKHbvqBKz1AwBPCE5RemLA4/igJ5IIKbXUGDZe3uGXchakYjqGWPgGnAa2WJADUR0aZBKWgfI8LuSp8ryxWOYeb+M4T1g0SENMWk/XM4BUrPzjuGlsS6kGdWElf+98V5sA4U/gVIjmzinx/QW5BDIJUGyJz8eqhakIE+YXx+W7TYotIXfIDCZrosd114vbQu7SSpnOcLiFrmzPOmid6UGeYuMB9qHfT6lNVVotsAYSkLy398KmqDppezHn0rms+NEnc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(7416002)(316002)(83380400001)(16576012)(66476007)(110136005)(8676002)(86362001)(956004)(4744005)(4326008)(6486002)(6666004)(26005)(186003)(1076003)(110011004)(8936002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mVMGrK/boeQNtSQhfryT2LY8G7gt9RRCMxcp9B4RvyzEsswLW+eFtu1sKt5HOzxxeC0X5X6zY4V2Jsu+96ibe4K0rQd2qaK5/rwRpOzCzPplWKsZveGEhtR0x0ZwIzZJHdg+Eju5hABDGsIVqX8uQzADW4A49pquAW/XykCYvJmbLHJjrh06WC2WPyUSGBM+NajCKKwpjmiG403wdq2bhQAwq7t0jlt/VLlp8uh54xv9vsuIY6fAzPKn/xafBIX7pVM1I8jJllCstXIPa6fMTzRYLn3IB74cdd3yL8seor1P/f9pxBb4dm8iWrq6EXn3CV/u5h7MBGwN305ZFBpZvUksh5Iv+oYNBQJdrRylryCS8Kx40p72NpZ8wOLxyJLA3M+TJajyOA/ZthfJ1ILazYmuRFICRMocxesmu69S+RCLLG7FvcmUt0IldBAMRppyTNw7m/41nJPdQB5SMTBQ/Q2i1FBkTqXYM8iIjLBiIQ9ElGyzsruz0gK2+W1s5Q1czg8LpS3MzuUlg2g9ezgnsR+T3DruAt1+L8fe2KZansnONHrX+c5wxLHlrRiG4IDGHeADmKkwiSphiTIbL559GldkQ92Rr4Ntl4yj3cGearxTaFbnEqVtbzCZpfUAAG+8IL+9/EWkSiPQWN5e/qBA4A==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbffe17e-23b7-42bc-1138-08d84581ada4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:24:14.2521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bp2+EcRw6hhwnA3iF4j9snzpPXHQk/Vdvko5hpzoreQ8hXEQDIWbPocvwl4TRYF6DN841WbZSEZ7VTVAgfbMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5308
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 12/15] regulator: sy8106a: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3N5
ODEwNmEtcmVndWxhdG9yLmM6MTI2OjM0OiB3YXJuaW5nOiDigJhzeTgxMDZhX2kyY19vZl9tYXRj
aOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIDEy
NiB8IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN5ODEwNmFfaTJjX29mX21hdGNo
W10gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdA
c3luYXB0aWNzLmNvbT4KLS0tCiBkcml2ZXJzL3JlZ3VsYXRvci9zeTgxMDZhLXJlZ3VsYXRvci5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3Ivc3k4MTA2YS1yZWd1bGF0b3IuYyBiL2RyaXZl
cnMvcmVndWxhdG9yL3N5ODEwNmEtcmVndWxhdG9yLmMKaW5kZXggMjIyMmU3MzllNjJiLi5jMTE5
Zjg1MjU5YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL3N5ODEwNmEtcmVndWxhdG9y
LmMKKysrIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3k4MTA2YS1yZWd1bGF0b3IuYwpAQCAtMTIzLDcg
KzEyMyw3IEBAIHN0YXRpYyBpbnQgc3k4MTA2YV9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmkyYykKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
c3k4MTA2YV9pMmNfb2ZfbWF0Y2hbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIF9fbWF5YmVfdW51c2VkIHN5ODEwNmFfaTJjX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0
aWJsZSA9ICJzaWxlcmd5LHN5ODEwNmEiIH0sCiAJeyB9LAogfTsKLS0gCjIuMjguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
