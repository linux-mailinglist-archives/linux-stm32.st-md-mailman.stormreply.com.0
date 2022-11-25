Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B96387ED
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 11:53:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAF8DC65E4B;
	Fri, 25 Nov 2022 10:53:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E702CC65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 10:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9739MAFypZOWhszxvK7wA0P8jtGzA+gLiuR5890WkOmOXauC0WP+/lZbtmcdyEMKl+d4tklWsug+ahxFdm529xmDEbQVKejmsUF31Pl0HBs8RQKHdFzZ5Iq/R3VAFUk+TbhiSjca+gEjEgMYEDor96NxNhnGowt9JbPgyy/Ziq+0CD0YeAW2C4HH1HHdoHsFRV3a9keIq8JvhWdpPUttKaM5pHpZpF0HK1MtlbAMY104rrxwidpdnb4FTZhZerEt7zeeUz5Iv5PtWboqglkbPu9K2VwTurI+snUj0DxVXopVTIyflIMxi1poFKcntsngZDCGopDbQW0MnKOdayNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96UVIKS9iwrJwzzqr8dtCXovSzCH/aKgT0f0uz/BaRs=;
 b=XgRs+UTs8xaEcDKe416JKJRsDhx7nlCLM4HmaNig2OFLARNUuv4A4aWp8s0TpqVQxa4JG41S6QJGgdfo+i0jxYnWbybXmGm9Uasb7KXGJ1Qq0PFEQSNnKafgcdooXKnQBA7cDl3d4r5YyFDXwggSOFCtoZRx2hQ1rfnbf7q0UkMjGudlmShzYpGxcjNRAulL5S6/wRvqyT2WGtY57xsS1P2kjeWy4IZi2BGLRmfIqgchz/rWQ+YrBoNKY4rxNAK0HgtR/HYvL5eWxPMA8E0jCjz2RLvxISUX5QP+B5/jh5aiHNy4re7yzqHe97RgH6gYwalJAyp4NCVRCDH3DTyecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96UVIKS9iwrJwzzqr8dtCXovSzCH/aKgT0f0uz/BaRs=;
 b=C+uCNXZoytLYVn05XLeDl5VlwUGJOJFWapUTrkxxQ73WyXYDbvsAKblUzSL8U9x4B7oJpyDneiu4sOuqIFRUS9KFPD61rdIneriwE+cV2/hId5zWEBHg28mUricaZE7P1ALHmeCe2JJ9DfFaYjjEN2+FZM5HPfbH0/dC+m5JjZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 10:53:17 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::9317:77dc:9be2:63b]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::9317:77dc:9be2:63b%7]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 10:53:17 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Date: Fri, 25 Nov 2022 12:53:04 +0200
Message-Id: <20221125105304.3012153-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BEXP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::20)
 To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5136:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7b418c-bfe9-430d-dce7-08daced341ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1c/tPiIWBbgApMwVFuqQYpN1cG8Sh47NSv61bL8nMrrSuhul/aIBp2xJdylBVx4mkdrbNIO4z2ILWlD6n98z0bnlZWvwRy9L4F9TNm9acRmP/WCg1CCWaVfxt1JHkZ1NbJRGS0x6U235Xu6V3UEVxKcMj/b6vWRT4pbIMnM9F5PLElPCsRu419tIF2EPOxg8eKGjbbQxO/W5NavKs9nZIzczzG5EaA4tluKhx6dJ3SPf1QZii6qNE001IAQmLVyqLlz2yfW2xfuRfXPo6V+kXWRUPJZZxn/5IhD2W2UmJIRYvBA+aAf1i/FTDcJBH3LUJ7z7MacrnkFg7GiYyDxgZ5l2Ux8PaR/8EJhG5WljiAuJSw9xMfTlRVG1zG1Zm3jU4arHCCl3k7plBngwmMBKRID/aQ0JhT2wwnoyheOoYM5YSTLD80+U55Z98kwGrgRua1ep5ZB5eoW+2JZ2nD0N6BVWG8p9M6/c7IKDQRElJ4ncDPINkvujwdpEaal1muGFgsRRjeJocXqpSglfHNEQe0y7xe9509/mxnY3QfVN+wQ6/tX+WnZbcHRks8Dk6qyVLo2zRIy9jehbTJ8x4EaT+RuuQF8MyO8IGLHVQjovLro0Ra/PJWvd15/K5iwCCEyLmOkDNP+P5zwTsFHxv8WSsf61ZQA6QmeHTVeCTQEkYfxsaVKTsHnTs/0MV7CjTGb3nVchF9Sf6pkaa966i9Fmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(36756003)(86362001)(66946007)(6486002)(6916009)(316002)(38350700002)(38100700002)(54906003)(6666004)(83380400001)(2616005)(478600001)(66556008)(6506007)(6512007)(52116002)(26005)(2906002)(66476007)(8676002)(4326008)(5660300002)(44832011)(7416002)(1076003)(186003)(41300700001)(8936002)(133343001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejJISllMSGpENE14d1hURkJMMHRNMlA3RTdBNGphWmQyVXA5c1JzbGg0Z0d3?=
 =?utf-8?B?S0h1eEYyMnExeHNqeDByT0V6NElUdkhxQVFEVEE5TXpuRmpHWW0xRis1NmpL?=
 =?utf-8?B?amlPaWJGaWpXTWdyOTJRcVRDQVFycE1aaHExdHhib1gyVFZSWG10ZHRCZjRj?=
 =?utf-8?B?TFRRTHlWY3d0Q2hXbXhTTWVwQUNBVEZiemIrZmVFeEhTeVFxTHppUE1QOXls?=
 =?utf-8?B?Q1cvT2FBbExWNWZtTDE0Z0t5dUExNkJMRW1FNG5xakJodnk4R0hlZmZEbGM0?=
 =?utf-8?B?VjBhOVFmbnNjZ1h3WldSYkFvd0V4YURoZHhxc1JWNTgxWTc4U2YxRzVGTW5K?=
 =?utf-8?B?ZjZMQ3pBSG9FR3EwK0JNRDFCd3U5b0lFejBxTWtnRVZKWXRZS1JRREpkVGFV?=
 =?utf-8?B?US84OEpzQ21leS93ZzJJd2RHY09WMkZvRGlTaW9LSi9VdjdsKzk2NDVMOVJZ?=
 =?utf-8?B?Z3BaUHQ0cS9MdjI5cmJ4TXRkS0lLZ3Fldm8xejkyd2Q0QzB5YlE1Q2JNdURq?=
 =?utf-8?B?U09zQmZRQXV5SkFYQmd5Wm9rM0RMdFNNaGJZaVYxc0toU2V1VE1qbzNQWDdO?=
 =?utf-8?B?SXU2YmpEUmJLV21aSTR4ZFpiWm5aV1dqMCtOc3FEU3Q4OGFqL2hjMkUzTk9I?=
 =?utf-8?B?NUtpQ3FnbVBEU2dBYlo5ZXoxTUJPWml1WC9WTTFBRWNnRERBd1F5azhySGhj?=
 =?utf-8?B?NlRSN2U1dnJSc0ViTDFmb3BpQm1wSTAvT2NUYTZGVnordjdjdXhldnJwSmRF?=
 =?utf-8?B?eVl0cEpvVDNzcWRXRXl0SG5leGp3c1pmdFdFMW02N3JDUmNaR0pTT3NER2k4?=
 =?utf-8?B?RXpYeVRVeVIyTTJHaXJTdVBWVTZRbHNBK0UrVWdlMkFqN0ZoVWMzUGtlU2VS?=
 =?utf-8?B?bGpEZWovd0UwUEF2dVJJcU1EVEdvMzFEN0lPZDNvelVkZWRTQ0xpTTFYVksx?=
 =?utf-8?B?Q3RNNlR2cmhZcncxa3VKTGozM0xKbU9VUTV6UnlQWk10dzV4ak45Q3VBa0Q5?=
 =?utf-8?B?YVcrdnYyRU8yTUxRaWpMZlVQdUJCUnhKeDg5Z1ZtaDVkVTV3a29CM2JPUENK?=
 =?utf-8?B?UDE3YUtERW1rRE94MG9yOGcwclZMVFFaOStzdk5ZRGdMcFVYd3BDeDlCMjQ2?=
 =?utf-8?B?UzQ2N1RiN1RqTEIzUVMyL25RaUo0VzlEMFdTemJDeEZuK2dXOWxMYXlCV0Vi?=
 =?utf-8?B?Y2lCcFBXYW5tL1UzMTlUZng3eHcrUVlyY2RlV1Q1MUdrdFVHWCswb1RHcjdz?=
 =?utf-8?B?RU9KQ1pCU0l5dXRyak9EQUplZFYwMmFhUHJjZTFVOFc3aDVrdllYNWtvc1Ux?=
 =?utf-8?B?NTV5NG5tWWVxM2Z4ZS91L2RqSm9uQW1HMS84bmwxbUlTTXk4VFdLMG9ISDcx?=
 =?utf-8?B?SlZDWmdzeWhQQXRZRE03ZEljU0xYZzhkTUVFUTFZR29ZVHRXOHcrU0Z2WTAz?=
 =?utf-8?B?YVNxaDJpTnBSNXJWeUljWDZ0REhqZXNSeTVKZW5tR09TSkgyUU4rTXg4TEFP?=
 =?utf-8?B?bHB6b3VDUGU0K0VhZENMblJaWHdNN05lUWZpNG90a0UvdVdBNmI3eXJTYzBN?=
 =?utf-8?B?OGloTGkyWitxYkorWHRRWkdNVzRsczRFdjdhcjh6aHFZeGRyQUMyU3dGUHVt?=
 =?utf-8?B?YUZYNjdrdDE0OGRWYkZKTk84c0E5NUo3Y1U4K2hVdmlYckNrdFBVZEZWaXJJ?=
 =?utf-8?B?YTlCOWNKcW9KV0JWM0hGSUZMNjBURjJ0eE84WEVXazcwNUhEMkxTSFhlS1pE?=
 =?utf-8?B?OU94WjRuRloveU5pQm8wOG5xQU9EN1RUSDNXTXFnN3hBQkdpQ282Yy9Dalpq?=
 =?utf-8?B?L1J6NlpiUGE4cWRoWjRGQm9vTFNrNU9IMDUzNXFhejBEb015ZDdHVnIyWmFm?=
 =?utf-8?B?dEJoaEc1U2Q5VnI2NzRyRFdMS0tLYUtZbjhOM3FRYWRLMjNNVmZ3ZTVQdnFp?=
 =?utf-8?B?V094MHljalR5WWwxS0xOaVgvcGNscnppQld6a01OU2l6YjNQM2I1cW03STQz?=
 =?utf-8?B?eTNxWko3U3dYWWJuck9JK2trSkFFY1kxUTNqcUFITzBLZzBLTWxQMTArdis3?=
 =?utf-8?B?MDNnTkkrek16Z0M4cVA0WjAwNVppbUZOeENHRW00cFZEQldrQllHQVVMSk1J?=
 =?utf-8?B?eEU4TTB1OHZCQXNPNWZUTnNYZXdUdm5wVExXY24rdHZNZXNnbGhpSFZsYUdi?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7b418c-bfe9-430d-dce7-08daced341ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 10:53:17.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv+VYZp1VQIC0lkpwmtC6nFaVD7Cqf6Ww6IUJK/u8CT7GbOU3CCShb1Zr4jL1epe6oiQLDqBgATU9fsNhnJ4WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902
Cc: linux-kernel@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Yang Yang <yang.yang29@zte.com>
Subject: [Linux-stm32] [PATCH net-next] Revert "net: stmmac: use
	sysfs_streq() instead of strncmp()"
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

VGhpcyByZXZlcnRzIGNvbW1pdCBmNzJjZDc2YjA1ZWExY2U5MjU4NDg0ZTgxMjc5MzJkMGVhOTI4
ZjIyLgpUaGlzIHBhdGNoIGlzIHNvIGJyb2tlbiwgaXQgaHVydHMuIEFwcGFyZW50bHkgbm8gb25l
IHJldmlld2VkIGl0IGFuZCBpdApwYXNzZWQgdGhlIGJ1aWxkIHRlc3RpbmcgKGJlY2F1c2UgdGhl
IGNvZGUgd2FzIGNvbXBpbGVkIG91dCksIGJ1dCBpdCB3YXMKb2J2aW91c2x5IG5ldmVyIGNvbXBp
bGUtdGVzdGVkLCBzaW5jZSBpdCBwcm9kdWNlcyB0aGUgZm9sbG93aW5nIGJ1aWxkCmVycm9yLCBk
dWUgdG8gYW4gaW5jb21wbGV0ZSBjb252ZXJzaW9uIHdoZXJlIGFuIGV4dHJhIGFyZ3VtZW50IHdh
cyBsZWZ0LAphbHRob3VnaCB0aGUgZnVuY3Rpb24gYmVpbmcgY2FsbGVkIHdhcyBsZWZ0OgoKc3Rt
bWFjX21haW4uYzogSW4gZnVuY3Rpb24g4oCYc3RtbWFjX2NtZGxpbmVfb3B04oCZOgpzdG1tYWNf
bWFpbi5jOjc1ODY6Mjg6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCY
c3lzZnNfc3RyZXHigJkKIDc1ODYgfCAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChzeXNmc19z
dHJlcShvcHQsICJwYXVzZToiLCA2KSkgewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2Jp
dG1hcC5oOjExLAogICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9saW51eC9jcHVtYXNr
Lmg6MTIsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3NtcC5oOjEzLAog
ICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9saW51eC9sb2NrZGVwLmg6MTQsCiAgICAg
ICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L211dGV4Lmg6MTcsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmg6MTQsCiAgICAgICAgICAgICAg
ICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2Nsay5oOjE0LAogICAgICAgICAgICAgICAgIGZyb20g
Li4vZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYzoxNzoK
Li4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDoxODU6MTM6IG5vdGU6IGRlY2xhcmVkIGhlcmUKICAx
ODUgfCBleHRlcm4gYm9vbCBzeXNmc19zdHJlcShjb25zdCBjaGFyICpzMSwgY29uc3QgY2hhciAq
czIpOwogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+CgpXaGF0J3MgZXZlbiB3b3JzZSBp
cyB0aGF0IHRoZSBwYXRjaCBpcyBmbGF0IG91dCB3cm9uZy4gVGhlIHN0bW1hY19jbWRsaW5lX29w
dCgpCmZ1bmN0aW9uIGRvZXMgbm90IHBhcnNlIHN5c2ZzIGlucHV0LCBidXQgY21kbGluZSBpbnB1
dCBzdWNoIGFzCiJzdG1tYWNldGg9dGM6MSxwYXVzZToxIi4gVGhlIHBhdHRlcm4gb2YgdXNpbmcg
c3Ryc2VwKCkgZm9sbG93ZWQgYnkKc3RybmNtcCgpIGZvciBzdWNoIHN0cmluZ3MgaXMgbm90IHVu
aXF1ZSB0byBzdG1tYWMsIGl0IGNhbiBhbHNvIGJlIGZvdW5kCm1haW5seSBpbiBkcml2ZXJzIHVu
ZGVyIGRyaXZlcnMvdmlkZW8vZmJkZXYvLgoKV2l0aCBzdHJuY21wKCJ0YzoiLCAzKSwgdGhlIGNv
ZGUgbWF0Y2hlcyBvbiB0aGUgInRjOjEiIHRva2VuIHByb3Blcmx5LgpXaXRoIHN5c2ZzX3N0cmVx
KCJ0YzoiKSwgaXQgZG9lc24ndC4KCkZpeGVzOiBmNzJjZDc2YjA1ZWEgKCJuZXQ6IHN0bW1hYzog
dXNlIHN5c2ZzX3N0cmVxKCkgaW5zdGVhZCBvZiBzdHJuY21wKCkiKQpTaWduZWQtb2ZmLWJ5OiBW
bGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgotLS0KIC4uLi9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyAgfCAxOCArKysrKysrKystLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKaW5k
ZXggMWE4NmU2NmU0NTYwLi4zYWZmYjdkM2EwMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwpAQCAtNzU2NSwzMSArNzU2NSwzMSBA
QCBzdGF0aWMgaW50IF9faW5pdCBzdG1tYWNfY21kbGluZV9vcHQoY2hhciAqc3RyKQogCWlmICgh
c3RyIHx8ICEqc3RyKQogCQlyZXR1cm4gMTsKIAl3aGlsZSAoKG9wdCA9IHN0cnNlcCgmc3RyLCAi
LCIpKSAhPSBOVUxMKSB7Ci0JCWlmIChzeXNmc19zdHJlcShvcHQsICJkZWJ1ZzoiKSkgeworCQlp
ZiAoIXN0cm5jbXAob3B0LCAiZGVidWc6IiwgNikpIHsKIAkJCWlmIChrc3RydG9pbnQob3B0ICsg
NiwgMCwgJmRlYnVnKSkKIAkJCQlnb3RvIGVycjsKLQkJfSBlbHNlIGlmIChzeXNmc19zdHJlcShv
cHQsICJwaHlhZGRyOiIpKSB7CisJCX0gZWxzZSBpZiAoIXN0cm5jbXAob3B0LCAicGh5YWRkcjoi
LCA4KSkgewogCQkJaWYgKGtzdHJ0b2ludChvcHQgKyA4LCAwLCAmcGh5YWRkcikpCiAJCQkJZ290
byBlcnI7Ci0JCX0gZWxzZSBpZiAoc3lzZnNfc3RyZXEob3B0LCAiYnVmX3N6OiIpKSB7CisJCX0g
ZWxzZSBpZiAoIXN0cm5jbXAob3B0LCAiYnVmX3N6OiIsIDcpKSB7CiAJCQlpZiAoa3N0cnRvaW50
KG9wdCArIDcsIDAsICZidWZfc3opKQogCQkJCWdvdG8gZXJyOwotCQl9IGVsc2UgaWYgKHN5c2Zz
X3N0cmVxKG9wdCwgInRjOiIpKSB7CisJCX0gZWxzZSBpZiAoIXN0cm5jbXAob3B0LCAidGM6Iiwg
MykpIHsKIAkJCWlmIChrc3RydG9pbnQob3B0ICsgMywgMCwgJnRjKSkKIAkJCQlnb3RvIGVycjsK
LQkJfSBlbHNlIGlmIChzeXNmc19zdHJlcShvcHQsICJ3YXRjaGRvZzoiKSkgeworCQl9IGVsc2Ug
aWYgKCFzdHJuY21wKG9wdCwgIndhdGNoZG9nOiIsIDkpKSB7CiAJCQlpZiAoa3N0cnRvaW50KG9w
dCArIDksIDAsICZ3YXRjaGRvZykpCiAJCQkJZ290byBlcnI7Ci0JCX0gZWxzZSBpZiAoc3lzZnNf
c3RyZXEob3B0LCAiZmxvd19jdHJsOiIpKSB7CisJCX0gZWxzZSBpZiAoIXN0cm5jbXAob3B0LCAi
Zmxvd19jdHJsOiIsIDEwKSkgewogCQkJaWYgKGtzdHJ0b2ludChvcHQgKyAxMCwgMCwgJmZsb3df
Y3RybCkpCiAJCQkJZ290byBlcnI7Ci0JCX0gZWxzZSBpZiAoc3lzZnNfc3RyZXEob3B0LCAicGF1
c2U6IiwgNikpIHsKKwkJfSBlbHNlIGlmICghc3RybmNtcChvcHQsICJwYXVzZToiLCA2KSkgewog
CQkJaWYgKGtzdHJ0b2ludChvcHQgKyA2LCAwLCAmcGF1c2UpKQogCQkJCWdvdG8gZXJyOwotCQl9
IGVsc2UgaWYgKHN5c2ZzX3N0cmVxKG9wdCwgImVlZV90aW1lcjoiKSkgeworCQl9IGVsc2UgaWYg
KCFzdHJuY21wKG9wdCwgImVlZV90aW1lcjoiLCAxMCkpIHsKIAkJCWlmIChrc3RydG9pbnQob3B0
ICsgMTAsIDAsICZlZWVfdGltZXIpKQogCQkJCWdvdG8gZXJyOwotCQl9IGVsc2UgaWYgKHN5c2Zz
X3N0cmVxKG9wdCwgImNoYWluX21vZGU6IikpIHsKKwkJfSBlbHNlIGlmICghc3RybmNtcChvcHQs
ICJjaGFpbl9tb2RlOiIsIDExKSkgewogCQkJaWYgKGtzdHJ0b2ludChvcHQgKyAxMSwgMCwgJmNo
YWluX21vZGUpKQogCQkJCWdvdG8gZXJyOwogCQl9Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
