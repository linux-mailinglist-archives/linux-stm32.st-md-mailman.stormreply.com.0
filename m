Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BAB73C1BC
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 23:05:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59659C65E42;
	Fri, 23 Jun 2023 21:05:02 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2116.outbound.protection.outlook.com [40.107.237.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C87CC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 21:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ9UYfoSAwzIZpCbRGYb9k5pRhTZCuq6lnPDvAQNIfZ5fdDuDR8HBXmDwB1O4QHdDMaidG+n1inLtgjG7geS71B4qLvcrWXOui5zDF791mAfb6rpR9jjc9bsavg4AOadttX/+JFhQ467algP1Bklo3r8UEMsaVTYpfZ/D92pf0Za1UOY5QWA6sEPUV8vJK3q0pqZielAMIQweGaIEksegJbfYqqp7pPt+zFSXJEgoO78Jrl3r05Jx8BYckGCocKMfNXfNbh8Iv5EPi5aYf4KkmqXoZtB1v8M3Pjq4fL6Dv7vBkPYDPA1LTVWtIerf+9t68noAyqDj4cfxVvVTHNrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5VUATHUV8JMpf9Ml289LhAb9oN4xFCAtJCj51k/dvE=;
 b=VlLTSQEbsz9jL+AzgeXhGhWre6udi9JkWGUs86yuaIaJFrSqAp+w15NTfs/J4qfAGQyzPhHanlUNp0aI+Jy04yhae7+kPO0Yls1+jKasEQ2dEFa1XWF+xZvqxHMwePw8DHrzsEnnJ99EAH5E3K8oN7s601HzhSXjrUkAxGP1DsFR7CI7crQnLLdsSvcwR2bKUHRcznojkCk2aQBqXIHm+gpwfhkBFzKyyT4qSeVYNjRbdmgfZx6JuVAesiOgCTYvrKchhA1xfadj/mipXjezm1M0szyYdmk4BpBvnZogJp9C37o+lKt25xZ7N9mSvp1QVH7f+ci6pl7D0BbKtuB4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5VUATHUV8JMpf9Ml289LhAb9oN4xFCAtJCj51k/dvE=;
 b=d8g81BE/+Rz+3Fep9o1MBcdB8YyKV5kQduHjPbZh4D8JKt6WuF/QAuEHnqs6agjLZymOB+4lxyN3uAOXBcTVO+scXuJiGZz/NwNDz/Znga2o/fSV6PYBHeON68biht6Pv7GSHcxn9mhZXtvbsd2OkfRJvLiGk2sYd60DEwu/sS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by MN2PR13MB4104.namprd13.prod.outlook.com (2603:10b6:208:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 21:04:57 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 21:04:57 +0000
Date: Fri, 23 Jun 2023 23:04:48 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZJYI8HNJ3o2h3++a@corigine.com>
References: <20230623100845.114085-1-brgl@bgdev.pl>
 <20230623100845.114085-3-brgl@bgdev.pl>
 <ZJXw+92ee7CGtnCS@corigine.com>
 <CAMRc=MeXtK8kNbNo0u7onz3vmKS1eHWdok7vGFRMr41S2Aehvg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAMRc=MeXtK8kNbNo0u7onz3vmKS1eHWdok7vGFRMr41S2Aehvg@mail.gmail.com>
X-ClientProxiedBy: AS4P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::6) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|MN2PR13MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: a66bc8e5-426a-4d3d-85e1-08db742d7fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iphmnWZG0Zopi3Yd9chaaL0rdaWjyq2rvje6yxjTy3sNZ8veojXFTKqf3D8SB2FaFGwMr7TAZrj42JUzoVGirmw3oebE3Lfg+pCKLeBmBAw8iFtZ0y47RkYXhw/eKV2r1sBVZBb9aGjquABjAVBsMytL5o4AGH+zFDrKoxVRqo/PhyNlfV99Q2ysC+yBETuXvZ7YRQKzY+j2yJmJOk71oFiaFKCE8lXCflRIBmDUQt7iAhbxM39ERpu+y7C5CLmFUTYL8cpAiV33wTKwvjUWMwDIzPLX9SaCAzwxVAq9E4YeARssm/7ddyfaHBzztAz27rzsx46spmqu5QazAUNfGTk3y/ICTW67dT57mancam/Jwh9LaEOeCeOkxy0NZz7JpC4kuEX4hYUmtGCezkatuaZg+PUdrTr97p9Wo7S5XopT4dBczpYLyDlkId9UxmsV3zHmfiELGWkHyoxbZ7T5VBf/3bDkiaW1Sp3ypaq13WaWu7KzwHpWwNHiGAxfePSHo96/1hk2MT7NbswO3dzF8G+ROVyhKPJRn7ZJiO/KZdE3uo5dncx/cAU9saJkyQGcJsVZN8uYQ9DE8Cp0Jsz7P6sX0ww6PzcCnKuJEOOAer8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(451199021)(66556008)(66946007)(4326008)(6916009)(66476007)(8936002)(8676002)(478600001)(36756003)(316002)(5660300002)(44832011)(7416002)(54906003)(41300700001)(6486002)(2906002)(53546011)(186003)(6512007)(6506007)(86362001)(6666004)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtSQ0Q4UzhKZkRtTnQ4ancrLzY0Mi9GUngxYjdjSWpqejZLTEE1anhlWDVk?=
 =?utf-8?B?dmNEMHNmM2crQ0Vvais4TXYveHZPTTJkQzY4SkFPT003Wi94M25VT1BFOWN0?=
 =?utf-8?B?YUM4eUpneFdOWVd5VjFWRUdlOEtUOCtkVk0yYUo2QVA5aHArOUk2UHRObDJH?=
 =?utf-8?B?TTkzT0JSOXpsWGFhVVBzZWpXTjRHZEFCdE84RkFPelpwMFEza0g1VlRuUkhK?=
 =?utf-8?B?QWR0NlM2bmZ1UWhNY2U0bGowYklpb2dJUGxLaGMzeTM2VFhJNGIvUDhJZWND?=
 =?utf-8?B?WHhUZTRRbFU5T2RCZXRjdzljYjc5SmJJUXdoWHZJcStiVmJHWVI1ajg0K1l5?=
 =?utf-8?B?YVYvN1E0TCtOL3FZRkJ4cEdpbUNDVVVXZm9Sdy9mMGUwSFVPbUxIZVB1eXZU?=
 =?utf-8?B?V1ZLYm1HK3c5Y21Rd2VTdkRpVVdrZUNXcFdKdlYvZDJIQ0sxK0xkNmdQWmQx?=
 =?utf-8?B?RnVRRFo3ay82b2g3OHJrZDRMb28zTDF4QmRoQWx1cHpjMlo5dXZCNzlacWo0?=
 =?utf-8?B?OWcvbDMwbi85dHVwc0NucEt3YWdaMjZRTEVrbWEwaFRCYTdYdkFNRXNEaXpq?=
 =?utf-8?B?RVlGYnJHanUrMFZCTjFLVVdJWHJXdldxLytNcm1UMlBPVlhOeVlpTjkzUG53?=
 =?utf-8?B?VHZ3OWx0N25qTCs2eWxLVmVvb2hwL1V1Vjd1MlJWSG9PcUJJcmxMNjBKSlQ1?=
 =?utf-8?B?THYxRnBzZFNqYXNkTkRXQVNvZ1FSeU9WOGtxODE4M2VKS05iSk05cFVPYWhy?=
 =?utf-8?B?YmlSVEYrdTljTDF0TVJXSDJpQStYTzNMbU5iTFQ2YWNzQkRXRW94cGtLaWN6?=
 =?utf-8?B?amlKVkQ4M2NacXc0WHpmRWtUalR4UG5YazBuek11TEJYMVliN2phQ0VMS1B0?=
 =?utf-8?B?K3pjd2xFR2xMR3ExUWhjODI5ZnBIY0JnN1NtRmtxaUYwNGRwdEpoQVdCZUZt?=
 =?utf-8?B?L09aU3NFdDBCQUd5L1kvWm9aSlRuZ2l5cHd5MVpQT0N3V1g2MlUzOUVPQUFK?=
 =?utf-8?B?b0FBcHJxaHorTVZUd1Z1bWhRb2ExclB0ZjZtN3dXaGRXK0xHZnlpdHl6cUsy?=
 =?utf-8?B?TVYrWVQ3Q21aZmdqV05PeG1lRDg5aHhqV0xLM3krWFZNVEMvdi9nblFXa3V3?=
 =?utf-8?B?SjZRODhCWEc2dzdZaHVsSHBMYnZOSEQ1THBYdmc4cXlJNTNqazhPUDU2YUE1?=
 =?utf-8?B?emNGaFd1MHBRNmtkaWxudnltQi9qZm9QL3IwaXR4ME41MkZIdDBkbm9WdWUv?=
 =?utf-8?B?VW5VY2paUmxRUTdybDR2M3h6WWRzbUI3dTJMd05MMSt6cjhNdDFmSlBwT3Nm?=
 =?utf-8?B?MW9oeHZpUEhOU2p2bmRmS3NkTEN1WEI2QUJIczRMbFNYVE81TnRxTHovQU51?=
 =?utf-8?B?TFFtNGd3WHV5RXJIa2xycGUzVXBCL09NdGMyLzJMeUNrcTZTbnkzeXZLL3FC?=
 =?utf-8?B?MklCQW9YQlQ0ZmlFdmsvem1YWmlSeXR1QTF6Q0tCNUE1dEQyRDRMbFovR3Uy?=
 =?utf-8?B?bkNDL1dNSWRMSzdESkJ5NGlFdUxnSEx4Ykg3OGo1bEd1NDh0UW91bUFUNVB1?=
 =?utf-8?B?UUlETnhzOWlKZjRhampDdGNHSzcxc2dBL0FkMGJ1Q1UrVWh1OUJaQnRENExa?=
 =?utf-8?B?eGlTTmFWc3c5Rnhra0FTRkFoUEtvcHRlS0pVeGJKd1Rvak00aDRTZnh6QXdq?=
 =?utf-8?B?YTUzZVhwK09nNXhBQkNFdGxaYjRLN3NuemJ0YVU3VUNtbmtJOWlyTEovY1g0?=
 =?utf-8?B?UkdJSENkbVdreWsvZytoTlBhUlVVNWN1OU1idmRHV1ZqT2FHL2YyMmNKMGNT?=
 =?utf-8?B?dWEwbXpOQjgrcmUySmgzRFgyUEhRWHd1S3hxVGNPTkZFS1hmLzVuQnhlN01r?=
 =?utf-8?B?YzA0WVlXaXBmQ3VuTVVlK2o3Yk5ZRnpKQURxMlpTdXY5MHl5WlMxa3RZTGtQ?=
 =?utf-8?B?MDUzVmFQUDA4eDdLMGp0dnRUTGhBMVlCNjNRS2R3UzRTRi9tcnR0T0Q5WUhY?=
 =?utf-8?B?RmdoV09zUllGMDhqSXNFWW9tL3dvQ1Z6c0NwUldTb0tpQUk1Y2xaYTBDNnBI?=
 =?utf-8?B?SFVYTjQzZDg5ekxjRzFCS2xhVnJvM0lOZGVFWDlHcnFsaWk1UWgxemdaU0tn?=
 =?utf-8?B?YTJRVVo5dUtlMkk4R0V6OWlZNzFhdjFUNkI0T3JURGNCSGlWSnJYcmFtVnFh?=
 =?utf-8?B?dDc0cEpWUFpZb2pHUllZejc3ZzMzUXZPN3d4b2FtQm1UNTJjT1JtVGRBSzB1?=
 =?utf-8?B?NklXZnA5cUJkd0t3UXNTTVlFODFnPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66bc8e5-426a-4d3d-85e1-08db742d7fdd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 21:04:57.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzAY7c6BCVjblAQXWF6KzMF5n5h4elCC356wDp6TSt+0EGZEe6qsCKY7x+0Mr4ifsjzMVdmhGqvIDemF6boDZenVmGYQMQ56MSlp2S2/mcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB4104
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/12] net: stmmac: replace
 the sph_disable field with a flag
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgMTA6MDA6MThQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBGcmksIEp1biAyMywgMjAyMyBhdCA5OjIy4oCvUE0gU2ltb24gSG9y
bWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1
biAyMywgMjAyMyBhdCAxMjowODozNVBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3Rl
Ogo+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxp
bmFyby5vcmc+Cj4gPiA+Cj4gPiA+IERyb3AgdGhlIGJvb2xlYW4gZmllbGQgb2YgdGhlIHBsYXRf
c3RtbWFjZW5ldF9kYXRhIHN0cnVjdHVyZSBpbiBmYXZvciBvZiBhCj4gPiA+IHNpbXBsZSBiaXRm
aWVsZCBmbGFnLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+ID4gLi4uCj4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50
ZWwuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMK
PiA+ID4gaW5kZXggYWI5Zjg3NmI2ZGY3Li43MGU5MWJiZWYyYTYgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMKPiA+ID4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50ZWwuYwo+
ID4gPiBAQCAtNDU5LDcgKzQ1OSw3IEBAIHN0YXRpYyBpbnQgaW50ZWxfbWdiZV9jb21tb25fZGF0
YShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiA+ID4gICAgICAgcGxhdC0+aGFzX2dtYWM0ID0gMTsK
PiA+ID4gICAgICAgcGxhdC0+Zm9yY2Vfc2ZfZG1hX21vZGUgPSAwOwo+ID4gPiAgICAgICBwbGF0
LT50c29fZW4gPSAxOwo+ID4gPiAtICAgICBwbGF0LT5zcGhfZGlzYWJsZSA9IDE7Cj4gPiA+ICsg
ICAgIGRhdGEtPmZsYWdzIHw9IFNUTU1BQ19GTEFHX1NQSF9ESVNBQkxFOwo+ID4KPiA+IEhpIEJh
cnRvc3osCj4gPgo+ID4gSSB0aGluayBzb21ldGhpbmcgbXVzdCBoYXZlIGdvdCBtaXhlZC11cCBo
ZXJlLgo+ID4gQW4geDg2XzY0IGFsbG1vZGNvbmZpZyByZXBvcnRzIHRoYXQgZGF0YSBpcyB1bmRl
Y2xhcmVkIGhlcmUuCj4gPgo+IAo+IENyKnAsIEkgdGhvdWdodCBJIGJ1aWxkLXRlc3RlZCBldmVy
eXRoaW5nLi4uCj4gCj4gTXkgYmFkLCBJJ2xsIHJlc2VuZCBhIHYzIGFmdGVyIHRoZSBtZXJnZSB3
aW5kb3cuCgpTb3JyeSB0byBoYXZlIGJlZW4gdGhlIGJlYXJlciBvZiBiYWQgbmV3cyA6KApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
