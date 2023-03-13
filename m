Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFA6B7D75
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:28:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C7FC69053;
	Mon, 13 Mar 2023 16:28:00 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C16C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuBN9u/Dj2Mxo87lq+A3tdrDKt3dowcMJ3xqIOA1Plm9PBVJ9/8Tmjo3pVriCsmbUTKv0NTTTZ6J3g5Vn2FEuKPifnr1XJ/q7MDqDooV2+j5RczGsOusNjAXtyb1PpJEvp5itZu/Fa/zLFDPrBY6IwobiYLKfkskdMg5d4d4c9Ama+pODu+lWtOTOAV3U3XalTmjKd4b2YchjQahej9Ice3xhlGbU7KYAJTDrZlYH06IF/ze/fKq9TGt+NePV6QppZ5G30+OCp31NZOqYzYVAH8mqR3Hfac85f6keJHVo+SeL0t/GpDMNwhR0dzVPCVnxz5HAVUspHnZXK/lXjz4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOWxcOw63EyshZbsQgpEkIFIi8PtzyPYzobfNVUyz50=;
 b=VHsOB9vRAjA71EjJ5nCV7W19aNxoYMVAtpSgZN9a1M+l6/7hnxvsaJj+qMh/FXWYv0rczEFEx8yr2y5vqQ2qEPZk2YtsTxkYnO52u7qf0LoPquAwyiQBtqdm4a0lXF7EePni0e67wkF1frm2u8YjiV6Re8gFctNK1vRn1PaaOROpsaMinqQcXQv1K5Fh6i5itLzNhxZjf+8ukF/a+hj0F4D6gwbAQiJ5qorZoEqhjrs8dI0QZgGdACQIAJJZY/CmoaWiFGzYjD7CVxnHQQW02FsVuAXiXg2ZUHfXccGwR7HmSBIDloYY194dGnutAiQXwbsMS83MgVDHmJ/rfmftFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOWxcOw63EyshZbsQgpEkIFIi8PtzyPYzobfNVUyz50=;
 b=BSt4z5sAzEuevOfNHMLt4RgGk+F6bb9Eje1gOHnFGJDbpujQGaxRphIqy0fZO4yUV/QiEAp81VqCVhml6Zk6VU35sGKoogaQMK2IFL6aU/o/W1FzTc6MnXf0QKVGH6JKjy5bBdJCo+bPNaUqaTTTu5x0KTROw4jARCmQWJFlj3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BY3PR13MB4865.namprd13.prod.outlook.com (2603:10b6:a03:36c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:27:51 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:27:51 +0000
Date: Mon, 13 Mar 2023 17:27:44 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZA9PAFPV6NKBzea6@corigine.com>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
 <20230310214632.275648-2-krzysztof.kozlowski@linaro.org>
Content-Disposition: inline
In-Reply-To: <20230310214632.275648-2-krzysztof.kozlowski@linaro.org>
X-ClientProxiedBy: AS4P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::8) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BY3PR13MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: 054c63ad-acce-4212-5858-08db23dfe423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSbVs3EtMcfAT5RFAzq3Ocw6xG4DkvdINLmZ8ZJ+8wp7ChMcwDj6wrnfv+AqQikb5n+vE3iLAJMHe89d682FQdTfOcfCxhVEvSarRvGsuNHUrNYam6DV9eL0Ra6OW0R65g2JZWkanJmhv0qvJtSUHkVlpFygNOwtq3qP5yAFhMWjQ6yZZU8KRDStfW6EsDJtZ9asRwsP9TagGAXrpzM8nompmL+b4+802ST3+ONBiRY8WVQRKNq7cyVA6vZQdH8ta6zqinTdnNU1lGVQu9muvlgqSlxHClfQWi3+PldkjHgPfPlpHtfPV3cirB7LzHQNiUJrAXdtkizO6X39UHF3ld4nVX98bnu1jJQOsTLGebSrn/ePPQsh3C1I0BLpUzOcsG/WiufkfTBGbJweb2x0ILZUyk74+5KlOZgq/HubeHHLiBdFY9SmEYLHK4QIHUZ3f1UKJ7/r/rGHCfEJr++BLCSeh44IYrvoUHofCV9TqKsBJ4QbBGQTPJn2VRAGIbcNu2Bclrh9kQTLOA4aSbp7QKQ5YkamivCEZ1zmuPaB/SuukzJBp/gd2SJ6w9X9b3tnWeP1QSEgtx+WP8VbHDXUKuugKv2GtkZnZrWFpxjHfOjdljFkiwySBL+oxPAElE6LJ58WUJ678wPOa/72HI5LcjoY64WkgVKZogtAOiG6BwJeRK9VDO9rodiB1DR/0VrSpdJj7+J8Xt+Y8f4ubZKqM9CAkgmDgHtQSTI9el2Zs9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(136003)(39840400004)(396003)(451199018)(86362001)(38100700002)(36756003)(44832011)(2906002)(7416002)(8936002)(5660300002)(4744005)(4326008)(6916009)(6506007)(6512007)(54906003)(186003)(316002)(2616005)(8676002)(66556008)(478600001)(66946007)(66476007)(6666004)(6486002)(41300700001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJZTFJvZEhvbTRKbkNSTWQvRkgvV0FWLzFmSFNHUW9vMC9xSUV0WU9nQTVC?=
 =?utf-8?B?SmY5MkhjbGllOTBFc01RbGUrYnRWUDkrSzZqZHUycU9XMzRNSzkrVzI4cDQ0?=
 =?utf-8?B?dnRBdStmaHFZMlNFYTB4aGc0VlcyMGVFZzJpUU5mSkZwVzhXQUNqSWY4VDFs?=
 =?utf-8?B?SmJXd0EyWmFKTlAxOGsvd2Y2aUJMUzEwY0h4NUpYd2FGL0x0TTZwK3AzRWE1?=
 =?utf-8?B?ZGo4ZkFMaGQ3NXN4a1pNaThXVG95ZXFoWXJ4WmhxeEFPWlQycVBjNVFtYk5O?=
 =?utf-8?B?UytBU1Nyalp0NkpURFdpKzVySVNmVys1bE9iN1FXa21ZbTlTdStPR280YjVy?=
 =?utf-8?B?aEFKaG9SMWVFQm1WUmh5M283eDZSUVBOZWkxMTFzWDlvTlBSZVhxRldDWVds?=
 =?utf-8?B?RU90aVpXQjlFT3d4cG02aDk2VWJKWGkwTzFjUkEvVFl4TUJFY0ZrNjdpT1Bp?=
 =?utf-8?B?eDZEelhlKzVVMnNRSFpNZC9FYXptRldNOFdhZ09hTzlJR0RHaTVoUE1FeHdI?=
 =?utf-8?B?RU9naWVISkFBMmsvS2E5aS9CcFlIZFNGZlhqbTg2L1paZVBrZ0NSaURpak4x?=
 =?utf-8?B?bzZsbFNGR0xoOURCYU8yYWUzblRIUlE3YzIrS0dWY3BzcjVmdnRqQTNvdEV1?=
 =?utf-8?B?RkpsNmV5eUtqK2RIUjczeGhWZjhiY0w4aVk4Y0xQVG1QSHBYUDR5QWtUeGhn?=
 =?utf-8?B?SUtjNTQ1UnZaTmVNd2Rqb2NHb0krdTA4RTRueUp2T1ppS1QwR1Nvdk5iTFd6?=
 =?utf-8?B?cDNCRHF1VjRiOW5HT29XSytDR0RsOTBVenI2bFo2cnphbnplM1hFMGNsQzhF?=
 =?utf-8?B?WExzam5FRklRdnVNVlMzRFNvU2EybW9OdHhzL2R5Z3AzVmdIRE44NzRWYjY0?=
 =?utf-8?B?M1FiNVppdkt2dFRHMkM1THRQWm53ZzNpNWV4UW9pWXZLZHFmK3Zka1N3dlFp?=
 =?utf-8?B?MTQrVTlIWm1tbjlNZHVlT3hxMmE5RzlTR2IvQW15Zjc1YUU4aHNvWkRCeExL?=
 =?utf-8?B?R25XT1JHbWZNL3ZDZ3dFTzBjcTlnRzFUYU8wSDZNTW1ROE5LTTBiNklCZ0lM?=
 =?utf-8?B?RDFzVGQ4VWZ5NVcrVitCQnlWQWRSUmpTZ2VOQjVtVGFsNGVWcXFTL3RHSEZj?=
 =?utf-8?B?b1BUTjRVMWpFd2Z5dTJ3elcvSU9hbGpJMEp0SXY4cWgwcGo4aWJ3czA4eWV1?=
 =?utf-8?B?Ly9EV3lSQ3RoSWhUZG5iYStOUGQ4YWhsellCcmdwMWZMSk84a2E3RGtsY01u?=
 =?utf-8?B?VVJUUGVTdWs1emVGYWtUUGdkQ0dTYmVCMmhVTEFIVHNDOUQyd2prY2ZHeUJU?=
 =?utf-8?B?RmY1K3pyMWFwZHpMT0JVTEE0anVtVWpsVm5aQ2VSVGxQMjJPb25jeXArYUxN?=
 =?utf-8?B?ZEx3SFIwdGZNcUtrQm5Hc0pwZXNlbi8rRDg3UUZ6bFN2VEZ1M0xBbkJJOFdk?=
 =?utf-8?B?T01iQTVGM2hQdmR0WnlnYmpHR2tjYUltU1hZcUdSejJpdzJzZ2RnYksxaHJE?=
 =?utf-8?B?UzJTSmRlT04rWFpoN05kbysyZzA4NU1WOWZqaTBGREI2TXdKU0FTSGwzYm9U?=
 =?utf-8?B?TEFXUTNZejAxYmtuSWxkZWRVeXdQdEtodmVXR1hDdE9PYnF1Q1l5T09xUWVF?=
 =?utf-8?B?S256Qjc1amUrdjhNaHhrcjI4RSthaW40ekpVaEpJZ1UxVHBzSGVTTkE2OW1t?=
 =?utf-8?B?UEpSeFRGeWN5cFZVUjJHWVJISEZROHpadkN1MDdKazBLelZzMGVDWml1dnd0?=
 =?utf-8?B?Rk1RSUZheC84QVlUMzlRcURGZ243M0dBeTRpZHVHNzVPOFUrSnAzOEU4RWQ0?=
 =?utf-8?B?VmdRd1JtVTZNOU1kT0dLemRFVjhsL3JLakllOTBJTVNOQVl6OXhveHJKVEJJ?=
 =?utf-8?B?dFBwT2Q5VDRyek8vTVU5bEdsYTZPaWVYL1FURU9XUllKaTk5cFFPSGdEaldH?=
 =?utf-8?B?ZFRjWVZqZk9FeG5tdDRIaHErZnpFSXluS3FTcVE1Ymd2SFN6YzA4Q1ByZXVt?=
 =?utf-8?B?TE9Tb05wQ0pyVE83aEdLUXNVU3VzWlp2NmJRR0h1K3BRaVBtSkJhOGZ5S0JC?=
 =?utf-8?B?dWdVd29kUUZudGNualY1V2dqWFplS0s4WFlobnJNUmkvM1hlWDRPeiswampX?=
 =?utf-8?B?YlQ0UzVkQkp0NVdmZ2pRTVcxSkVtdElwWEppenV2eWNua0tESjNoTEdEM3pn?=
 =?utf-8?B?M0JGRzB3QTU2T25SZURDV2Nzamc2Vm1yemlxZEhYcy9tMUdVdXZ2VFZsT2tP?=
 =?utf-8?B?SUlpR3NxZVRWMkpVQzBQZXZJeUVRPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054c63ad-acce-4212-5858-08db23dfe423
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:27:51.7132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnFfKn95B0fESFjBG76QrMguuJtre2C61TPekAGBfrl45GyBM9u8g3LNw87Np0NfYZW9rFcKpS2Q2BefumLYpeDdsf5KNJh64ZXLe3rI8qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4865
Cc: Vinod Koul <vkoul@kernel.org>, Byungho An <bh74.an@samsung.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] net: stmmac: generic: drop
	of_match_ptr for ID table
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMTA6NDY6MjlQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZHJpdmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUg
c28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRy
IGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGlu
ZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgo+IAo+
ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jOjcy
OjM0OiBlcnJvcjog4oCYZHdtYWNfZ2VuZXJpY19tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNl
ZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+IAo+IFNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmll
d2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
