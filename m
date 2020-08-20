Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2124B093
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 09:55:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FD8AC3FAD8;
	Thu, 20 Aug 2020 07:55:37 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D9D4C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 07:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsNOZw3eItSyeWBMEc3tfat2Ihd3G85n7L1TZXH6/ophHx2EootJD/jZ2jCob/slfn+dBXxXNWBJ1TRDFDea+t7CYbZGBtgFpr5DjigXEXMUpq7Fq5jwuAloWH3WEuhp6Gb8CGlgbsq/3zkj04MYaZYIpsgl6MWbKwh/Xa64qEkQ1r1yeTJsBudYkVdpbVNwIh2RCtXm/xN5HwnHyM4HmQ09mFsmfvkCcbd8p90+m8hJw+1gfO4jSIwehzUOeemqpkkTUwFDRwTDOCkLYh23KzhF3onuVRn1jT/w4E11joSs38zszKi7aaN1zSFCuFfMgNDSs5mdmKcs7seblFjlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kanzZz1aFkEpsO38Xf9fvG+FLxN0hTM8qu+uLoFHXI=;
 b=JVu+H4zEOb3thscMklQgpYcsGYRdx0JWpTvXTHEi60jyiBSVnDWX03BEYPd/vY6V8YcsZuJTXJ3peJjv/MEP+iNz6bEt0ySA/7CF7MbMi477AGVYyXkYp4aIn1ZWzXsuCl7dPB+O/DXmGIOLsZuBUNczyQTyn2ZgGRmoKmKLFPf3o95UOYhi2X4XgtcQmoIexCfihfmo9/jpOx03uHweSvWFvQ5T3ci9Yea90waPilGQgnZrFxg+HMt7u/0Cbp5gyen1sn40xbsV88MeSgAtrJTWD4z40VDFlpVCg0IDEZbPbQUSYsRSCYob+n7HXk2W549mgeICtOIUkfC2x1QL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kanzZz1aFkEpsO38Xf9fvG+FLxN0hTM8qu+uLoFHXI=;
 b=TJf2C65va6FweqIWsZAf8VGJaysW8bNYB2eu4wJWJiM773weLwGaUxTUae1tLFgEroWy+1uixJxZKOr7sxH8om27n9ZvPmj9pQShj4OZmo/0mWB+vQq7MA/m+V5eLkMlDDVnw94TYtrG63Cmx9hbRjABIAHwOiDfES4hW/Z23mE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4563.namprd03.prod.outlook.com (2603:10b6:408:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:55:32 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 07:55:32 +0000
Date: Thu, 20 Aug 2020 15:46:26 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
Message-ID: <20200820154626.79d83157@xhacker.debian>
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
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:55:29 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f47b96f-e2d9-496e-71e6-08d844de69ee
X-MS-TrafficTypeDiagnostic: BN7PR03MB4563:
X-Microsoft-Antispam-PRVS: <BN7PR03MB456332EB3C4BBFD20C13CD7BED5A0@BN7PR03MB4563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SL3fq435P5DMu+vnDOPIHovKEtBUHiJDf8MHuDIvU54BzNMr8wXvRzeTDoFnwasQQAe8bklSDHniZyBH/IxieuXgKyfAVmq8JJnpMZFeLdcnFgW//a10Bxp1HNh+G0VmZnG/YSWcq54C2P+y5cSn7N/+E8+umJJ0RHMtXbb75WeFc2pG3fkFeNO04CiSy07LO7kPjAnbf+q+FfCc7+t8XZyAlEwPytSgaqhF7VXKLwsNDm2L3qfxuaMltp7C1Cq+uHDW7N2a/088+sUaHFCNSsElSUFo+D9vSRYI/ZIP6S+nxQxik+fqMEq0a7+d73le7Z8UMVtGIjv8uPdIONXnzx54hicdpnqYgf7uV7lEIPeICG+ltw9gTjUCojLfyJoD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(4744005)(4326008)(2906002)(5660300002)(6666004)(478600001)(956004)(9686003)(83380400001)(26005)(316002)(86362001)(52116002)(8676002)(66946007)(16576012)(66556008)(6486002)(110011004)(8936002)(66476007)(110136005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TN+waXo8hfC7kS4ggs5cd7Yq8P74Wx2QMm0LF6pcStDx1v6sAQ/znKWIkoLnM712ulCf8iMq6k0DcCZCepS10S9CoOPGteAKYb2EbOb9iHmOsnU+0/cOoTpBLtuPR16g+Dq4eeZ9CuIHEo9u3fkiLFAlL40c5mDm9FRPztQeOVxN0PwzSNj6BSfeS9IN50W/PNr0IjSDxaeTxD1CByDV0ddnEG4u7JsPbi9QicLwL3mANuKSsIZjnm75IckIl3mLWM2YSdqjA1EOShlk9tQWSAWSh6Vmg1ATwQx5rIPvmUFthSkLOKsAr1N/ImaH/4xKMxKg7mbjyL1NaVxmkWuwjrVhOUBpqWYC5Wm68CVmvlEPsNUEOsAXrfZX5HmN6PYHfebUhnVvAJ8e8WofB/L/xE+DFGhLv5HtYe4VPc0j4noetmvhRg+nYRlZhaPgyn4e5RyuYhOqnSa09bHfl24vhX7DZUbVwON7lkrdsbO8EgXnY9cN9yr8xbEJE+D2h8eZZL+CeSgb7rmnpXf5bGrKktah5Py2zag7SqiL6BYF9m/QHAcAUYppf0HRtbsMutABCPhsUy+J+2Gzcafu0O+2HCzG44tfIk3mXc/AHOOwPS2/spkKyXFX2sC15cmopOnL2STjoJCYyq8kAT1wh1SUCA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f47b96f-e2d9-496e-71e6-08d844de69ee
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:55:32.6336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cL/OqZ6p8gsW/yfyey4RFu5tQhBwlv+Na5IAL8KzM+ggjFjN0TCFy/YCg4fAk/ak1CtVcHMiISq3mA7RVlSX5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4563
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 11/12] regulator: stm32-vrefbuf: Fix W=1 build
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

Rml4IGJlbG93IHdhcm5pbmcgd2hlbiBDT05GSUdfT0Y9bjoKCmRyaXZlcnMvcmVndWxhdG9yL3N0
bTMyLXZyZWZidWYuYzoyODc6MzQ6IHdhcm5pbmc6IOKAmHN0bTMyX3ZyZWZidWZfb2ZfbWF0Y2ji
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KICAyODcg
fCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl92cmVmYnVmX29mX21hdGNo
W10gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8SmlzaGVuZy5aaGFu
Z0BzeW5hcHRpY3MuY29tPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3JlZ3VsYXRvci9zdG0zMi12cmVmYnVmLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9zdG0zMi12
cmVmYnVmLmMKaW5kZXggOTkyYmMxODEwMWVmLi41YTVjMTJkOWVhMjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9z
dG0zMi12cmVmYnVmLmMKQEAgLTI4NCwxMSArMjg0LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGV2X3BtX29wcyBzdG0zMl92cmVmYnVmX3BtX29wcyA9IHsKIAkJCSAgIE5VTEwpCiB9OwogCisj
aWZkZWYgQ09ORklHX09GCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl92
cmVmYnVmX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi12cmVmYnVm
IiwgfSwKIAl7fSwKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl92cmVmYnVmX29m
X21hdGNoKTsKKyNlbmRpZgogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl92
cmVmYnVmX2RyaXZlciA9IHsKIAkucHJvYmUgPSBzdG0zMl92cmVmYnVmX3Byb2JlLAotLSAKMi4y
OC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
