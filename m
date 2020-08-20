Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4724B11C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 10:33:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989D0C3FAD7;
	Thu, 20 Aug 2020 08:33:17 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9454C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 08:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiE1SvDYzFsvdnUN13s90T75pu4tEGuw0LwI1H107jLisrX5R4XbXz4VyP9YAcCRASRvIn903gYUWFW9PkGYPc+HS6bePDo0wvr/ZAJusstiWM3+QY5nBSKqFlCYR4OoNprRUMOboKMqust9gRGPYStYpfNWSMcFYRz+tqok4WzkLnkZg/km2troCAwX+AqcZfjdDQ90j8j1cPH+joNgzYHHF1s7iVUzetXv0PjgZS58neDTy3TTrPNZCONdbI4pOimADp5nPnSlmJAvqT4YrLeT2flMIdh1nV4lKawHUOegdIF1CdtdNKi8q0zwljvf9wfKZiZCfMaOzKOFhFMp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNq1FKkyApQ4pUJRVVvTf3LGi/RUv0NEH/cpVqwzyuE=;
 b=n5LjlhRLVNm2Wg3j4su83gWYKmIR0dZ1x4DmYqhm+PJXsRFKueFA49MZ4iRzlEDOeHR+2UkARmT5TaNWQB3tBi8dKiyOwOUsl5DfPzUx6/dIDL9cibgi4G/W9KLKHDabRc/9rMUyl5MqJzim/Rdnd8n2Vm4zschasXlxFFk1L9Sj3LqQ+kZxWzPSlJlXeDJrA/oLmObpU8px9otXpN2CwVYDwpG424F2VjJVmuh5Emcpr+X/CHbABUGi+qid66QNrEfDp+Rx+pMN3irmUsMCW0YVPTGQ1cqBXCSJRbBznuLrjKKpiB+1nNxGESAO+4A2wPz3yY0l7mvg9Px6oaSRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNq1FKkyApQ4pUJRVVvTf3LGi/RUv0NEH/cpVqwzyuE=;
 b=YRH9wwwxQGsGL1grTqvw6eNWE9Yokx1qtrigXSW4c/OXW4dE7ZNAng022THxB1iCxQfZTxM6L/9uupwvxm8WJg2q+4a0HymP2d0EncFI9Lh+odTJG3hi9JPoLHwP4MUu4DG/lz1R3DAapGVgQYVrzD0HpKwDGLklC0qEfgBnRak=
Authentication-Results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synaptics.com;
Received: from BN7PR03MB4547.namprd03.prod.outlook.com (2603:10b6:408:9::22)
 by BN7PR03MB4546.namprd03.prod.outlook.com (2603:10b6:408:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 08:33:14 +0000
Received: from BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f]) by BN7PR03MB4547.namprd03.prod.outlook.com
 ([fe80::3cda:7634:5802:df5f%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 08:33:14 +0000
Date: Thu, 20 Aug 2020 16:32:32 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200820163232.54b59e1d@xhacker.debian>
In-Reply-To: <20fc45ab-4daf-3855-5817-1898d50c9efc@st.com>
References: <20200820152926.42c48840@xhacker.debian>
 <20200820154626.79d83157@xhacker.debian>
 <20fc45ab-4daf-3855-5817-1898d50c9efc@st.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TYAPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:404:28::15) To BN7PR03MB4547.namprd03.prod.outlook.com
 (2603:10b6:408:9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 TYAPR01CA0027.jpnprd01.prod.outlook.com (2603:1096:404:28::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 08:33:11 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3fb0b14-946d-4978-ab03-08d844e3ae11
X-MS-TrafficTypeDiagnostic: BN7PR03MB4546:
X-Microsoft-Antispam-PRVS: <BN7PR03MB4546C6AFC32AB012C368FDDAED5A0@BN7PR03MB4546.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:59;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VAkl2IUuEtjIJSnxdjlpYccMoOaUc6xRrtXu3wxE092jY92DBbBmoIuNy7dDnUKQNh1a1prEdslgoeJVeA1RJMlO1zKsPywEI6n280ubjjZ0LeIdMPrxeoNldqrCdACsEtbvvKvtOkmZgtYgDrvsgRvBIurmE3wq8NLeBoTGcCxUHmcQjUzZjm/D4ML4iXg8s09gSDJmo/yr/4JrYh59P/0lVbXOFH6CAo92ZNNG/2YJFr1FFuH0L8c5jbengDpxQVqyS3vGkO+RqLBo6vJ88jVPNs5fhjLLswIiO1Jl5v5BMBHXRkTUoEsKPjwuhr9FrsyIAg1c0BYpQfydp3mm/G+M5mAqUzzaBo3TyjyN0nOQeqD0ToTlSMCeTgNlcYF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR03MB4547.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(366004)(136003)(39860400002)(66476007)(66946007)(8676002)(1076003)(26005)(5660300002)(478600001)(66556008)(16576012)(86362001)(83380400001)(316002)(6486002)(110011004)(2906002)(6916009)(6666004)(9686003)(8936002)(54906003)(956004)(53546011)(4326008)(186003)(52116002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RGKnKh+FNHKP9mHYinfs50r8ILfynt2ISUfz6qzZPYjBqBEvGb2PTJ2fJo53p0dmpODH5sV2rZVW9HdP2eeoIgWs19RZaXZi6jvyOMAhmLNvowNNHEn0zMzMNh+c58HebhFYpGPWF4J1z0KeuMY5rmD+8mnmVWKpcQsliVWsawdOa0u9ZqQD9RGjMPwVoIbHyULUPmDTEKtWh9sXhR42pnF02BX7yFEd5+BysDIYocIQ8QucP7WmQcrTCDy826UZYTKhK0DXpz28zBGHEHeoJy3jvOTzmKFaWRtGbnZyYaI9Okp/o09FFop95CMLxxJFwVLaq0jiZkSL3v0myzRWjy4D9GoKLvlQunx/rMDYkOKDF178diU0/h30ZbmdnyJRKhJgT+bdtmqOX9K4G4tdAXUzOvveMUnMZxfJUy6wH8CsguAuF8JVMFAm5cMAvPbYLQL7795srC6QKJv0ey6skpDMLy+SHAFnPDu2C0M30DNh9DzI2EXL48cejYgKN4tSxTCmEPa4ftey8oPcjsSbKatUqDd12O7DQRA2stbZgCSHqMZ7HLMDl4CSrL1muCV6BOuDG9He1Jf1ElbvucajMzyFJi7a+7ApnqGnJY4wbgF/vD7XQ7/kkYjBPtPv0uzJoSPxn+w5H8Lt7bAaiYczrQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fb0b14-946d-4978-ab03-08d844e3ae11
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB4547.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 08:33:14.4691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEbl++hyYoOYesAZO1m7ai/c/rtsikGHAkVKj3zjn34osGu9i57crLhZ0YlzAfiLqKeyvpXxkBAEox8+45SEVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4546
Cc: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [Linux-stm32] [PATCH 11/12] regulator: stm32-vrefbuf: Fix W=1
 build warning when CONFIG_OF=n
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

T24gVGh1LCAyMCBBdWcgMjAyMCAxMDoxMzoxMiArMDIwMCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6
Cgo+IAo+IAo+IE9uIDgvMjAvMjAgOTo0NiBBTSwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+IEZp
eCBiZWxvdyB3YXJuaW5nIHdoZW4gQ09ORklHX09GPW46Cj4gPgo+ID4gZHJpdmVycy9yZWd1bGF0
b3Ivc3RtMzItdnJlZmJ1Zi5jOjI4NzozNDogd2FybmluZzog4oCYc3RtMzJfdnJlZmJ1Zl9vZl9t
YXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+
ID4gICAyODcgfCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl92cmVmYnVm
X29mX21hdGNoW10gPSB7Cj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5n
IFpoYW5nIDxKaXNoZW5nLlpoYW5nQHN5bmFwdGljcy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L3JlZ3VsYXRvci9zdG0zMi12cmVmYnVmLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9zdG0z
Mi12cmVmYnVmLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9zdG0zMi12cmVmYnVmLmMKPiA+IGluZGV4
IDk5MmJjMTgxMDFlZi4uNWE1YzEyZDllYTIyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9yZWd1
bGF0b3Ivc3RtMzItdnJlZmJ1Zi5jCj4gPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9zdG0zMi12
cmVmYnVmLmMKPiA+IEBAIC0yODQsMTEgKzI4NCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgc3RtMzJfdnJlZmJ1Zl9wbV9vcHMgPSB7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgTlVMTCkKPiA+ICB9Owo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX09GICAKPiAKPiBIaSBK
aXNoZW5nLAoKSGksCgo+IAo+IFlvdSBjb3VsZCBwcm9iYWJseSBhZG9wdCAiX19tYXliZV91bnVz
ZWQiIGhlcmUgPyBFLmcuIGxpa2U6CgpfX21heWJlX3VudXNlZCBhbHNvIGZpeGVzIHRoZSB3YXJu
aW5nLiBJJ20gbm90IHN1cmUgdGhlIG1haW50YWluZXJzJyBwcmVmZXJlbmNlLgoKSGkgTWFyaywK
CndoaWNoIHNvbHV0aW9uIGRvIHlvdSBwcmVmZXI/CgpUaGFua3MgaW4gYWR2YW5jZQoKPiAKPiBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCBzdG0zMl92cmVm
YnVmX29mX21hdGNoW10gPSB7Cj4gCj4gSSBjYW4gc2VlIG90aGVyIGRyaXZlcnMgdXNlIHRoaXMg
YWxyZWFkeSBmb3IgdGhlIHNhbWUuCj4gCj4gVGhhbmtzLAo+IEJlc3QgcmVnYXJkcywKPiBGYWJy
aWNlCj4gCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfdnJlZmJ1
Zl9vZl9tYXRjaFtdID0gewo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi12cmVm
YnVmIiwgfSwKPiA+ICAgICAgIHt9LAo+ID4gIH07Cj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShv
Ziwgc3RtMzJfdnJlZmJ1Zl9vZl9tYXRjaCk7Cj4gPiArI2VuZGlmCj4gPgo+ID4gIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3ZyZWZidWZfZHJpdmVyID0gewo+ID4gICAgICAg
LnByb2JlID0gc3RtMzJfdnJlZmJ1Zl9wcm9iZSwKPiA+ICAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
